import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/localization/locale_preference.dart';
import '../../core/providers/locale_preference_provider.dart';
import '../../l10n/generated/app_localizations.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final preference =
        ref.watch(localePreferenceProvider).value ?? LocalePreference.system;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  key: const Key('languageSettingTile'),
                  leading: const Icon(Icons.language),
                  title: Text(l10n.settingsLanguage),
                  subtitle: Text(_languageLabel(l10n, preference)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showLanguagePicker(context, ref, preference),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.dark_mode_outlined),
                  title: Text(l10n.settingsThemeMode),
                  subtitle: Text(l10n.settingsThemeFollowsSystem),
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.lock_outline),
                  title: Text(l10n.settingsLocalAuth),
                  subtitle: Text(l10n.settingsLocalAuthSubtitle),
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: Text(l10n.settingsAbout),
                  subtitle: Text(l10n.settingsAboutSubtitle),
                  trailing: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showLanguagePicker(
    BuildContext context,
    WidgetRef ref,
    LocalePreference current,
  ) async {
    final l10n = AppLocalizations.of(context);
    final notifier = ref.read(localePreferenceProvider.notifier);
    final selected = await showDialog<LocalePreference>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(l10n.settingsLanguageDialogTitle),
          children: [
            for (final preference in LocalePreference.values)
              RadioListTile<LocalePreference>(
                value: preference,
                groupValue: current,
                title: Text(_languageLabel(l10n, preference)),
                onChanged: (value) => Navigator.of(context).pop(value),
              ),
          ],
        );
      },
    );

    if (!context.mounted) return;
    if (selected == null || selected == current) return;

    try {
      await notifier.setPreference(selected);
    } catch (_) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.settingsLanguageSaveFailed)));
    }
  }

  String _languageLabel(AppLocalizations l10n, LocalePreference preference) {
    return switch (preference) {
      LocalePreference.system => l10n.settingsLanguageSystem,
      LocalePreference.zhHans => l10n.settingsLanguageZhHans,
      LocalePreference.zhHant => l10n.settingsLanguageZhHant,
      LocalePreference.en => l10n.settingsLanguageEn,
    };
  }
}
