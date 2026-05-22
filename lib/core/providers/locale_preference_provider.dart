import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../localization/locale_preference.dart';
import 'database_provider.dart';

const localeOverrideSettingKey = 'localeOverride';

final localePreferenceProvider =
    AsyncNotifierProvider<LocalePreferenceNotifier, LocalePreference>(
      LocalePreferenceNotifier.new,
    );

final localeOverrideProvider = Provider<AsyncValue<LocalePreference>>((ref) {
  return ref.watch(localePreferenceProvider);
});

final materialLocaleOverrideProvider = Provider<Locale?>((ref) {
  return ref
      .watch(localePreferenceProvider)
      .maybeWhen(
        data: (preference) => preference.toLocale(),
        orElse: () => null,
      );
});

class LocalePreferenceNotifier extends AsyncNotifier<LocalePreference> {
  @override
  Future<LocalePreference> build() async {
    try {
      final setting = await ref
          .read(databaseProvider)
          .settingByKey(localeOverrideSettingKey);
      return LocalePreferenceX.parse(setting?.value);
    } catch (_) {
      return LocalePreference.system;
    }
  }

  Future<void> setPreference(LocalePreference preference) async {
    final previous = state.value ?? LocalePreference.system;
    state = AsyncData(preference);

    try {
      await ref
          .read(databaseProvider)
          .upsertSetting(
            localeOverrideSettingKey,
            preference.storageValue,
            DateTime.now().toUtc(),
          );
    } catch (error, stackTrace) {
      state = AsyncData(previous);
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
