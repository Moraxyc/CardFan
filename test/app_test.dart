import 'package:cardfan/app.dart';
import 'package:cardfan/core/database/app_database.dart';
import 'package:cardfan/core/providers/database_provider.dart';
import 'package:cardfan/core/providers/notification_provider.dart';
import 'package:cardfan/core/services/runtime_reminder_service.dart';
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
