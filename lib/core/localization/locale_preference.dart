import 'package:flutter/material.dart';

enum LocalePreference { system, zhHans, zhHant, en }

extension LocalePreferenceX on LocalePreference {
  static LocalePreference parse(String? value) {
    return switch (value) {
      'zh-Hans' => LocalePreference.zhHans,
      'zh-Hant' => LocalePreference.zhHant,
      'en' => LocalePreference.en,
      'system' || null => LocalePreference.system,
      _ => LocalePreference.system,
    };
  }

  String get storageValue {
    return switch (this) {
      LocalePreference.system => 'system',
      LocalePreference.zhHans => 'zh-Hans',
      LocalePreference.zhHant => 'zh-Hant',
      LocalePreference.en => 'en',
    };
  }

  Locale? toLocale() {
    return switch (this) {
      LocalePreference.system => null,
      LocalePreference.zhHans => const Locale.fromSubtags(
        languageCode: 'zh',
        scriptCode: 'Hans',
      ),
      LocalePreference.zhHant => const Locale.fromSubtags(
        languageCode: 'zh',
        scriptCode: 'Hant',
      ),
      LocalePreference.en => const Locale('en'),
    };
  }
}
