import 'package:cardfan/core/database/app_database.dart';
import 'package:cardfan/core/localization/locale_preference.dart';
import 'package:cardfan/core/providers/database_provider.dart';
import 'package:cardfan/core/providers/locale_preference_provider.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  late AppDatabase database;
  late ProviderContainer container;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    container = ProviderContainer(
      overrides: [databaseProvider.overrideWithValue(database)],
    );
  });

  tearDown(() async {
    container.dispose();
    await database.close();
  });

  test('loads persisted locale preference', () async {
    await database.upsertSetting(
      'localeOverride',
      'zh-Hant',
      DateTime.utc(2026),
    );

    final preference = await container.read(localePreferenceProvider.future);

    expect(preference, LocalePreference.zhHant);
    expect(
      container.read(localeOverrideProvider),
      const AsyncData(LocalePreference.zhHant),
    );
  });

  test('unknown values load as system', () async {
    await database.upsertSetting('localeOverride', 'zh', DateTime.utc(2026));

    final preference = await container.read(localePreferenceProvider.future);

    expect(preference, LocalePreference.system);
  });

  test('updates visible state and app_settings', () async {
    await container.read(localePreferenceProvider.future);

    await container
        .read(localePreferenceProvider.notifier)
        .setPreference(LocalePreference.en);

    expect(
      await container.read(localePreferenceProvider.future),
      LocalePreference.en,
    );
    final setting = await database.settingByKey('localeOverride');
    expect(setting?.value, 'en');
  });

  test('localeOverrideProvider exposes Locale? for MaterialApp', () async {
    await database.upsertSetting(
      'localeOverride',
      'zh-Hans',
      DateTime.utc(2026),
    );
    await container.read(localePreferenceProvider.future);

    expect(
      container.read(materialLocaleOverrideProvider),
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    );
  });

  test('rolls back visible state when saving fails', () async {
    final throwingDatabase = _ThrowingSettingsDatabase();
    final throwingContainer = ProviderContainer(
      overrides: [databaseProvider.overrideWithValue(throwingDatabase)],
    );
    addTearDown(throwingContainer.dispose);
    addTearDown(throwingDatabase.close);

    expect(
      await throwingContainer.read(localePreferenceProvider.future),
      LocalePreference.system,
    );

    await expectLater(
      throwingContainer
          .read(localePreferenceProvider.notifier)
          .setPreference(LocalePreference.en),
      throwsA(isA<StateError>()),
    );

    expect(
      throwingContainer.read(localePreferenceProvider),
      const AsyncData(LocalePreference.system),
    );
  });
}

class _ThrowingSettingsDatabase extends AppDatabase {
  _ThrowingSettingsDatabase() : super.forTesting(NativeDatabase.memory());

  @override
  Future<void> upsertSetting(String key, String value, DateTime updatedAt) {
    throw StateError('write failed');
  }
}
