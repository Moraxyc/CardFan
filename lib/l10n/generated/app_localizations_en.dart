// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'CardFan';

  @override
  String get navDashboard => 'Home';

  @override
  String get navSimCards => 'SIM';

  @override
  String get navBankCards => 'Bank Cards';

  @override
  String get navReminders => 'Reminders';

  @override
  String get navSettings => 'Settings';

  @override
  String get dashboardTitle => 'Home';

  @override
  String dashboardLoadError({required String error}) {
    return 'Failed to load home: $error';
  }

  @override
  String get dashboardEmptyTitle => 'No cards yet';

  @override
  String get dashboardEmptySubtitle =>
      'Add a SIM card or bank card to see local summaries here.';

  @override
  String get dashboardAddSimCard => 'Add SIM Card';

  @override
  String get dashboardAddBankCard => 'Add Bank Card';

  @override
  String get dashboardSimCardTitle => 'SIM Cards';

  @override
  String get dashboardBankCardTitle => 'Bank Cards';

  @override
  String dashboardSimCardCount({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count SIM cards',
      one: '1 SIM card',
      zero: 'No SIM cards',
    );
    return '$_temp0';
  }

  @override
  String dashboardBankCardCount({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bank cards',
      one: '1 bank card',
      zero: 'No bank cards',
    );
    return '$_temp0';
  }

  @override
  String get dashboardNoBillingDay => 'No renewal day set';

  @override
  String dashboardBillingDay({required int day}) {
    return 'Renews on day $day each month';
  }

  @override
  String get dashboardNoPaymentDay => 'No payment due day set';

  @override
  String dashboardPaymentDay({required int day}) {
    return 'Payment due on day $day each month';
  }

  @override
  String get simCardsTitle => 'SIM Cards';

  @override
  String simCardsLoadError({required String error}) {
    return 'Failed to load SIM cards: $error';
  }

  @override
  String get simCardsEmptyTitle => 'No SIM cards yet';

  @override
  String get simCardsEmptySubtitle =>
      'Add your first SIM card to track numbers, plans, and renewal info.';

  @override
  String simCardMonthlyFee({required String amount}) {
    return '\$$amount';
  }

  @override
  String simCardBillingDay({required int day}) {
    return 'Day $day each month';
  }

  @override
  String get simCardAddTitle => 'Add SIM Card';

  @override
  String get simCardEditTitle => 'Edit SIM Card';

  @override
  String get simCardCarrierLabel => 'Carrier';

  @override
  String get simCardPhoneLabel => 'Phone number';

  @override
  String get simCardPlanLabel => 'Plan name';

  @override
  String get simCardMonthlyFeeLabel => 'Monthly fee';

  @override
  String get simCardBillingDayLabel => 'Billing day';

  @override
  String get simCardNotesLabel => 'Notes';

  @override
  String get simCardCarrierRequired => 'Enter a carrier';

  @override
  String get simCardPhoneRequired => 'Enter a phone number';

  @override
  String get simCardPhoneInvalid =>
      'Enter an international phone number, such as +886912345678';

  @override
  String get simCardMonthlyFeeTooPrecise =>
      'Monthly fee supports up to 2 decimal places';

  @override
  String get simCardMonthlyFeeInvalid => 'Enter a valid monthly fee';

  @override
  String get simCardMissing => 'SIM card not found';

  @override
  String get simCardDeleteTitle => 'Delete SIM Card';

  @override
  String get simCardDeleteMessage =>
      'Deleted cards are hidden from the list and kept for sync.';

  @override
  String get bankCardsTitle => 'Bank Cards';

  @override
  String bankCardsLoadError({required String error}) {
    return 'Failed to load bank cards: $error';
  }

  @override
  String get bankCardsEmptyTitle => 'No bank cards yet';

  @override
  String get bankCardsEmptySubtitle =>
      'Add your first bank card to track statement and payment days.';

  @override
  String bankCardLastFour({required String last4}) {
    return 'Ending in $last4';
  }

  @override
  String bankCardStatementDay({required int day}) {
    return 'Statement day $day';
  }

  @override
  String bankCardPaymentDay({required int day}) {
    return 'Payment due day $day';
  }

  @override
  String bankCardCreditLimit({required String amount}) {
    return 'Limit \$$amount';
  }

  @override
  String get bankCardAddTitle => 'Add Bank Card';

  @override
  String get bankCardEditTitle => 'Edit Bank Card';

  @override
  String get bankCardBankNameLabel => 'Bank name';

  @override
  String get bankCardLastFourLabel => 'Last 4 digits';

  @override
  String get bankCardNameLabel => 'Card name';

  @override
  String get bankCardCreditLimitLabel => 'Credit limit';

  @override
  String get bankCardStatementDayLabel => 'Statement day';

  @override
  String get bankCardPaymentDueDayLabel => 'Payment due day';

  @override
  String get bankCardBankNameRequired => 'Enter a bank name';

  @override
  String get bankCardLastFourInvalid => 'Enter exactly 4 digits';

  @override
  String get bankCardCreditLimitInvalid => 'Enter a valid limit';

  @override
  String get bankCardCreditLimitTooPrecise =>
      'Credit limit supports up to 2 decimal places';

  @override
  String get bankCardMissing => 'Bank card not found';

  @override
  String get bankCardDeleteTitle => 'Delete Bank Card';

  @override
  String get bankCardDeleteMessage =>
      'Deleted cards are hidden from the list and kept for sync.';

  @override
  String get remindersTitle => 'Reminders';

  @override
  String remindersLoadError({required String error}) {
    return 'Failed to load reminders: $error';
  }

  @override
  String get remindersEmptyTitle => 'No reminders yet';

  @override
  String get remindersEmptySubtitle => 'Add a reminder';

  @override
  String get reminderEnabled => 'Enabled';

  @override
  String get reminderDisabled => 'Disabled';

  @override
  String get reminderAddTitle => 'Add Reminder';

  @override
  String get reminderEditTitle => 'Edit Reminder';

  @override
  String get reminderUnsupportedNotificationsTitle =>
      'Notifications are not supported on this platform';

  @override
  String get reminderUnsupportedNotificationsSubtitle =>
      'This platform cannot send local notifications.';

  @override
  String get reminderUnsupportedOfflineTitle =>
      'Notifications after closing the app are not supported';

  @override
  String get reminderUnsupportedOfflineSubtitle =>
      'CardFan will still try to send local notifications while the app is running.';

  @override
  String get reminderTitleLabel => 'Reminder title';

  @override
  String get reminderBodyLabel => 'Reminder body';

  @override
  String get reminderTimeLabel => 'Reminder time';

  @override
  String get reminderTimeUnselected => 'Not selected';

  @override
  String get reminderEnableNotifications => 'Enable notifications';

  @override
  String get reminderEnableNotificationsSubtitle =>
      'Turning this off cancels scheduled notifications';

  @override
  String get reminderTitleRequired => 'Enter a reminder title';

  @override
  String get reminderTimeRequired => 'Choose a reminder time';

  @override
  String get reminderMissing => 'Reminder not found';

  @override
  String get reminderSavedOfflineUnsupported =>
      'Saved; notifications will not fire after the app closes';

  @override
  String get reminderDeleteTitle => 'Delete Reminder';

  @override
  String get reminderDeleteMessage =>
      'Deleted reminders are hidden from the list and their notification is cancelled.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsThemeMode => 'Theme mode';

  @override
  String get settingsThemeFollowsSystem => 'Currently follows system';

  @override
  String get settingsLocalAuth => 'Local authentication';

  @override
  String get settingsLocalAuthSubtitle => 'Fingerprint / Face ID support later';

  @override
  String get settingsAbout => 'About';

  @override
  String get settingsAboutSubtitle => 'Phase 1 engineering shell';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsLanguageDialogTitle => 'Choose Language';

  @override
  String get settingsLanguageSystem => 'Follow system';

  @override
  String get settingsLanguageZhHans => 'Simplified Chinese';

  @override
  String get settingsLanguageZhHant => 'Traditional Chinese';

  @override
  String get settingsLanguageEn => 'English';

  @override
  String get settingsLanguageSaveFailed =>
      'Failed to save language setting. Try again.';

  @override
  String get actionSave => 'Save';

  @override
  String get actionDelete => 'Delete';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get actionConfirmDelete => 'Confirm Delete';

  @override
  String get commonNotSet => 'Not set';

  @override
  String commonDayOfMonth({required int day}) {
    return 'Day $day';
  }

  @override
  String get commonNotesLabel => 'Notes';

  @override
  String get commonDetailSeparator => ' · ';
}
