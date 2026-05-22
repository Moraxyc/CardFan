import 'package:cardfan/core/localization/locale_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LocalePreference', () {
    test('parses persisted values', () {
      expect(LocalePreferenceX.parse(null), LocalePreference.system);
      expect(LocalePreferenceX.parse('system'), LocalePreference.system);
      expect(LocalePreferenceX.parse('zh-Hans'), LocalePreference.zhHans);
      expect(LocalePreferenceX.parse('zh-Hant'), LocalePreference.zhHant);
      expect(LocalePreferenceX.parse('en'), LocalePreference.en);
      expect(LocalePreferenceX.parse('zh'), LocalePreference.system);
      expect(LocalePreferenceX.parse('fr'), LocalePreference.system);
    });

    test('serializes persisted values', () {
      expect(LocalePreference.system.storageValue, 'system');
      expect(LocalePreference.zhHans.storageValue, 'zh-Hans');
      expect(LocalePreference.zhHant.storageValue, 'zh-Hant');
      expect(LocalePreference.en.storageValue, 'en');
    });

    test('converts to Flutter locale overrides', () {
      expect(LocalePreference.system.toLocale(), isNull);
      expect(
        LocalePreference.zhHans.toLocale(),
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      );
      expect(
        LocalePreference.zhHant.toLocale(),
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
      );
      expect(LocalePreference.en.toLocale(), const Locale('en'));
    });
  });
}
