import 'package:cardfan/app.dart';
import 'package:cardfan/core/database/app_database.dart';
import 'package:cardfan/core/localization/locale_preference.dart';
import 'package:cardfan/core/providers/database_provider.dart';
import 'package:cardfan/core/providers/locale_preference_provider.dart';
import 'package:cardfan/core/providers/notification_provider.dart';
import 'package:cardfan/core/services/runtime_reminder_service.dart';
import 'package:cardfan/l10n/generated/app_localizations.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/fake_notification_service.dart';

void main() {
  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('app renders', (tester) async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(database)],
        child: const CardFanApp(),
      ),
    );

    expect(find.byType(CardFanApp), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
    await database.close();
  });

  testWidgets(
    'app uses generated localizations and follows system by default',
    (tester) async {
      final database = AppDatabase.forTesting(NativeDatabase.memory());
      tester.platformDispatcher.localeTestValue = const Locale.fromSubtags(
        languageCode: 'zh',
        scriptCode: 'Hans',
      );
      addTearDown(tester.platformDispatcher.clearLocaleTestValue);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [databaseProvider.overrideWithValue(database)],
          child: const CardFanApp(),
        ),
      );
      await tester.pump();

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.locale, isNull);
      expect(
        materialApp.localizationsDelegates,
        AppLocalizations.localizationsDelegates,
      );
      expect(materialApp.supportedLocales, AppLocalizations.supportedLocales);
      expect(materialApp.onGenerateTitle, isNotNull);

      final context = tester.element(find.text('首页').first);
      expect(AppLocalizations.of(context).appTitle, 'CardFan');
      expect(materialApp.onGenerateTitle!(context), 'CardFan');

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(const Duration(milliseconds: 1));
      await database.close();
    },
  );

  testWidgets('app applies persisted English locale override immediately', (
    tester,
  ) async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(database)],
        child: const CardFanApp(),
      ),
    );
    await tester.pump();

    final container = ProviderScope.containerOf(
      tester.element(find.byType(CardFanApp)),
    );
    await container
        .read(localePreferenceProvider.notifier)
        .setPreference(LocalePreference.en);
    await tester.pump();

    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(materialApp.locale, const Locale('en'));

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
    await database.close();
  });

  testWidgets('app supports script-specific Chinese locale override', (
    tester,
  ) async {
    final database = AppDatabase.forTesting(NativeDatabase.memory());
    await database.upsertSetting(
      'localeOverride',
      'zh-Hant',
      DateTime.utc(2026),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [databaseProvider.overrideWithValue(database)],
        child: const CardFanApp(),
      ),
    );
    await tester.pump();

    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(
      materialApp.locale,
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    );

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
    await database.close();
  });

  testWidgets(
    'runtime reminders start only when offline scheduling is missing',
    (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      var androidRuntimeServiceStarted = false;
      final androidNotificationService = FakeNotificationService()
        ..supportsOfflineScheduling = true;
      final androidDatabase = AppDatabase.forTesting(NativeDatabase.memory());

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            databaseProvider.overrideWithValue(androidDatabase),
            notificationServiceProvider.overrideWithValue(
              androidNotificationService,
            ),
            runtimeReminderServiceProvider.overrideWith((ref) {
              androidRuntimeServiceStarted = true;
              return _FakeRuntimeReminderService();
            }),
          ],
          child: const CardFanApp(),
        ),
      );

      expect(androidRuntimeServiceStarted, isFalse);

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(const Duration(milliseconds: 1));
      await androidDatabase.close();

      debugDefaultTargetPlatformOverride = TargetPlatform.linux;
      var linuxRuntimeServiceStarted = false;
      final linuxNotificationService = FakeNotificationService()
        ..supportsOfflineScheduling = false;
      final linuxDatabase = AppDatabase.forTesting(NativeDatabase.memory());

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            databaseProvider.overrideWithValue(linuxDatabase),
            notificationServiceProvider.overrideWithValue(
              linuxNotificationService,
            ),
            runtimeReminderServiceProvider.overrideWith((ref) {
              linuxRuntimeServiceStarted = true;
              return _FakeRuntimeReminderService();
            }),
          ],
          child: const CardFanApp(),
        ),
      );

      expect(linuxRuntimeServiceStarted, isTrue);

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(const Duration(milliseconds: 1));
      debugDefaultTargetPlatformOverride = null;
      await linuxDatabase.close();
    },
  );
}

class _FakeRuntimeReminderService implements RuntimeReminderService {
  bool started = false;

  @override
  void start() {
    started = true;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
