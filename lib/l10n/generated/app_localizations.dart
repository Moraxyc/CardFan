import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    Locale('en'),
    Locale('zh'),
  ];

  /// Application title
  ///
  /// In zh_Hans, this message translates to:
  /// **'CardFan'**
  String get appTitle;

  /// Bottom navigation label for dashboard
  ///
  /// In zh_Hans, this message translates to:
  /// **'首页'**
  String get navDashboard;

  /// Bottom navigation label for SIM cards
  ///
  /// In zh_Hans, this message translates to:
  /// **'SIM'**
  String get navSimCards;

  /// Bottom navigation label for bank cards
  ///
  /// In zh_Hans, this message translates to:
  /// **'银行卡'**
  String get navBankCards;

  /// Bottom navigation label for reminders
  ///
  /// In zh_Hans, this message translates to:
  /// **'提醒'**
  String get navReminders;

  /// Bottom navigation label for settings
  ///
  /// In zh_Hans, this message translates to:
  /// **'设置'**
  String get navSettings;

  /// Dashboard page app bar title
  ///
  /// In zh_Hans, this message translates to:
  /// **'首页'**
  String get dashboardTitle;

  /// Dashboard data loading error
  ///
  /// In zh_Hans, this message translates to:
  /// **'加载首页失败：{error}'**
  String dashboardLoadError({required String error});

  /// Dashboard empty state title
  ///
  /// In zh_Hans, this message translates to:
  /// **'还没有卡片记录'**
  String get dashboardEmptyTitle;

  /// Dashboard empty state subtitle
  ///
  /// In zh_Hans, this message translates to:
  /// **'先添加 SIM 卡或银行卡，首页会自动汇总本地数据。'**
  String get dashboardEmptySubtitle;

  /// Dashboard empty state add SIM card button
  ///
  /// In zh_Hans, this message translates to:
  /// **'添加 SIM 卡'**
  String get dashboardAddSimCard;

  /// Dashboard empty state add bank card button
  ///
  /// In zh_Hans, this message translates to:
  /// **'添加银行卡'**
  String get dashboardAddBankCard;

  /// Dashboard status card title for SIM cards
  ///
  /// In zh_Hans, this message translates to:
  /// **'SIM 卡'**
  String get dashboardSimCardTitle;

  /// Dashboard status card title for bank cards
  ///
  /// In zh_Hans, this message translates to:
  /// **'银行卡'**
  String get dashboardBankCardTitle;

  /// Dashboard SIM card count
  ///
  /// In zh_Hans, this message translates to:
  /// **'{count, plural, =0{暂无 SIM 卡} other{{count} 张 SIM 卡}}'**
  String dashboardSimCardCount({required int count});

  /// Dashboard bank card count
  ///
  /// In zh_Hans, this message translates to:
  /// **'{count, plural, =0{暂无银行卡} other{{count} 张银行卡}}'**
  String dashboardBankCardCount({required int count});

  /// Dashboard status when no SIM billing day exists
  ///
  /// In zh_Hans, this message translates to:
  /// **'未设置续费日'**
  String get dashboardNoBillingDay;

  /// Dashboard next SIM billing day
  ///
  /// In zh_Hans, this message translates to:
  /// **'续费日：每月 {day} 日'**
  String dashboardBillingDay({required int day});

  /// Dashboard status when no bank card payment due day exists
  ///
  /// In zh_Hans, this message translates to:
  /// **'未设置还款日'**
  String get dashboardNoPaymentDay;

  /// Dashboard next bank card payment day
  ///
  /// In zh_Hans, this message translates to:
  /// **'还款日：每月 {day} 日'**
  String dashboardPaymentDay({required int day});

  /// SIM cards page app bar title
  ///
  /// In zh_Hans, this message translates to:
  /// **'SIM 卡'**
  String get simCardsTitle;

  /// SIM cards data loading error
  ///
  /// In zh_Hans, this message translates to:
  /// **'加载 SIM 卡失败：{error}'**
  String simCardsLoadError({required String error});

  /// SIM cards empty state title
  ///
  /// In zh_Hans, this message translates to:
  /// **'还没有 SIM 卡'**
  String get simCardsEmptyTitle;

  /// SIM cards empty state subtitle
  ///
  /// In zh_Hans, this message translates to:
  /// **'添加第一张 SIM 卡，记录号码、套餐和续费信息。'**
  String get simCardsEmptySubtitle;

  /// SIM card monthly fee display
  ///
  /// In zh_Hans, this message translates to:
  /// **'¥{amount}'**
  String simCardMonthlyFee({required String amount});

  /// SIM card billing day list detail
  ///
  /// In zh_Hans, this message translates to:
  /// **'每月 {day} 日'**
  String simCardBillingDay({required int day});

  /// Add SIM card form app bar title
  ///
  /// In zh_Hans, this message translates to:
  /// **'新增 SIM 卡'**
  String get simCardAddTitle;

  /// Edit SIM card form app bar title
  ///
  /// In zh_Hans, this message translates to:
  /// **'编辑 SIM 卡'**
  String get simCardEditTitle;

  /// SIM card carrier field label
  ///
  /// In zh_Hans, this message translates to:
  /// **'运营商'**
  String get simCardCarrierLabel;

  /// SIM card phone number field label
  ///
  /// In zh_Hans, this message translates to:
  /// **'手机号'**
  String get simCardPhoneLabel;

  /// SIM card plan name field label
  ///
  /// In zh_Hans, this message translates to:
  /// **'套餐名称'**
  String get simCardPlanLabel;

  /// SIM card monthly fee field label
  ///
  /// In zh_Hans, this message translates to:
  /// **'月费（元）'**
  String get simCardMonthlyFeeLabel;

  /// SIM card billing day field label
  ///
  /// In zh_Hans, this message translates to:
  /// **'账单日'**
  String get simCardBillingDayLabel;

  /// SIM card notes field label
  ///
  /// In zh_Hans, this message translates to:
  /// **'备注'**
  String get simCardNotesLabel;

  /// Validation error when SIM card carrier is empty
  ///
  /// In zh_Hans, this message translates to:
  /// **'请输入运营商'**
  String get simCardCarrierRequired;

  /// Validation error when SIM card phone number is empty
  ///
  /// In zh_Hans, this message translates to:
  /// **'请输入手机号'**
  String get simCardPhoneRequired;

  /// Validation error when SIM card phone number is invalid
  ///
  /// In zh_Hans, this message translates to:
  /// **'请输入国际格式手机号，例如 +886912345678'**
  String get simCardPhoneInvalid;

  /// Validation error when SIM card monthly fee has too many decimal places
  ///
  /// In zh_Hans, this message translates to:
  /// **'月费最多支持 2 位小数'**
  String get simCardMonthlyFeeTooPrecise;

  /// Validation error when SIM card monthly fee cannot be parsed
  ///
  /// In zh_Hans, this message translates to:
  /// **'请输入有效月费'**
  String get simCardMonthlyFeeInvalid;

  /// SnackBar shown when editing a missing SIM card
  ///
  /// In zh_Hans, this message translates to:
  /// **'SIM 卡不存在'**
  String get simCardMissing;

  /// Delete SIM card confirmation dialog title
  ///
  /// In zh_Hans, this message translates to:
  /// **'删除 SIM 卡'**
  String get simCardDeleteTitle;

  /// Delete SIM card confirmation dialog message
  ///
  /// In zh_Hans, this message translates to:
  /// **'删除后会从列表隐藏，并保留同步所需记录。'**
  String get simCardDeleteMessage;

  /// Bank cards page app bar title
  ///
  /// In zh_Hans, this message translates to:
  /// **'银行卡'**
  String get bankCardsTitle;

  /// Bank cards data loading error
  ///
  /// In zh_Hans, this message translates to:
  /// **'加载银行卡失败：{error}'**
  String bankCardsLoadError({required String error});

  /// Bank cards empty state title
  ///
  /// In zh_Hans, this message translates to:
  /// **'还没有银行卡'**
  String get bankCardsEmptyTitle;

  /// Bank cards empty state subtitle
  ///
  /// In zh_Hans, this message translates to:
  /// **'添加第一张银行卡，记录账单日和还款日。'**
  String get bankCardsEmptySubtitle;

  /// Bank card last-four detail
  ///
  /// In zh_Hans, this message translates to:
  /// **'尾号 {last4}'**
  String bankCardLastFour({required String last4});

  /// Bank card statement day detail
  ///
  /// In zh_Hans, this message translates to:
  /// **'账单日 {day} 日'**
  String bankCardStatementDay({required int day});

  /// Bank card payment due day detail
  ///
  /// In zh_Hans, this message translates to:
  /// **'还款日 {day} 日'**
  String bankCardPaymentDay({required int day});

  /// Bank card credit limit detail
  ///
  /// In zh_Hans, this message translates to:
  /// **'额度 ¥{amount}'**
  String bankCardCreditLimit({required String amount});

  /// Add bank card form app bar title
  ///
  /// In zh_Hans, this message translates to:
  /// **'新增银行卡'**
  String get bankCardAddTitle;

  /// Edit bank card form app bar title
  ///
  /// In zh_Hans, this message translates to:
  /// **'编辑银行卡'**
  String get bankCardEditTitle;

  /// Bank card bank name field label
  ///
  /// In zh_Hans, this message translates to:
  /// **'银行名称'**
  String get bankCardBankNameLabel;

  /// Bank card last four digits field label
  ///
  /// In zh_Hans, this message translates to:
  /// **'卡号后四位'**
  String get bankCardLastFourLabel;

  /// Bank card nickname field label
  ///
  /// In zh_Hans, this message translates to:
  /// **'卡片名称'**
  String get bankCardNameLabel;

  /// Bank card credit limit field label
  ///
  /// In zh_Hans, this message translates to:
  /// **'信用额度（元）'**
  String get bankCardCreditLimitLabel;

  /// Bank card statement day field label
  ///
  /// In zh_Hans, this message translates to:
  /// **'账单日'**
  String get bankCardStatementDayLabel;

  /// Bank card payment due day field label
  ///
  /// In zh_Hans, this message translates to:
  /// **'还款日'**
  String get bankCardPaymentDueDayLabel;

  /// Validation error when bank name is empty
  ///
  /// In zh_Hans, this message translates to:
  /// **'请输入银行名称'**
  String get bankCardBankNameRequired;

  /// Validation error when bank card last four digits are invalid
  ///
  /// In zh_Hans, this message translates to:
  /// **'请输入 4 位数字尾号'**
  String get bankCardLastFourInvalid;

  /// Validation error when bank card credit limit is negative
  ///
  /// In zh_Hans, this message translates to:
  /// **'请输入有效额度'**
  String get bankCardCreditLimitInvalid;

  /// Validation error when bank card credit limit has too many decimal places
  ///
  /// In zh_Hans, this message translates to:
  /// **'信用额度最多支持 2 位小数'**
  String get bankCardCreditLimitTooPrecise;

  /// SnackBar shown when editing a missing bank card
  ///
  /// In zh_Hans, this message translates to:
  /// **'银行卡不存在'**
  String get bankCardMissing;

  /// Delete bank card confirmation dialog title
  ///
  /// In zh_Hans, this message translates to:
  /// **'删除银行卡'**
  String get bankCardDeleteTitle;

  /// Delete bank card confirmation dialog message
  ///
  /// In zh_Hans, this message translates to:
  /// **'删除后会从列表隐藏，并保留同步所需记录。'**
  String get bankCardDeleteMessage;

  /// Reminders page app bar title
  ///
  /// In zh_Hans, this message translates to:
  /// **'提醒'**
  String get remindersTitle;

  /// Reminders data loading error
  ///
  /// In zh_Hans, this message translates to:
  /// **'加载提醒失败：{error}'**
  String remindersLoadError({required String error});

  /// Reminders empty state title
  ///
  /// In zh_Hans, this message translates to:
  /// **'还没有提醒'**
  String get remindersEmptyTitle;

  /// Reminders empty state subtitle
  ///
  /// In zh_Hans, this message translates to:
  /// **'添加一个提醒'**
  String get remindersEmptySubtitle;

  /// Reminder enabled list detail
  ///
  /// In zh_Hans, this message translates to:
  /// **'已开启'**
  String get reminderEnabled;

  /// Reminder disabled list detail
  ///
  /// In zh_Hans, this message translates to:
  /// **'已关闭'**
  String get reminderDisabled;

  /// Add reminder form app bar title
  ///
  /// In zh_Hans, this message translates to:
  /// **'新增提醒'**
  String get reminderAddTitle;

  /// Edit reminder form app bar title
  ///
  /// In zh_Hans, this message translates to:
  /// **'编辑提醒'**
  String get reminderEditTitle;

  /// Message title when local notifications are unsupported
  ///
  /// In zh_Hans, this message translates to:
  /// **'当前平台不支持通知提醒'**
  String get reminderUnsupportedNotificationsTitle;

  /// Message subtitle when local notifications are unsupported
  ///
  /// In zh_Hans, this message translates to:
  /// **'此平台无法发送本地通知。'**
  String get reminderUnsupportedNotificationsSubtitle;

  /// Message title when offline notification scheduling is unsupported
  ///
  /// In zh_Hans, this message translates to:
  /// **'当前平台不支持关闭应用后的通知提醒'**
  String get reminderUnsupportedOfflineTitle;

  /// Message subtitle when offline notification scheduling is unsupported
  ///
  /// In zh_Hans, this message translates to:
  /// **'应用运行时仍会尽量发送本地通知。'**
  String get reminderUnsupportedOfflineSubtitle;

  /// Reminder title field label
  ///
  /// In zh_Hans, this message translates to:
  /// **'提醒标题'**
  String get reminderTitleLabel;

  /// Reminder body field label
  ///
  /// In zh_Hans, this message translates to:
  /// **'提醒内容'**
  String get reminderBodyLabel;

  /// Reminder scheduled time field label
  ///
  /// In zh_Hans, this message translates to:
  /// **'提醒时间'**
  String get reminderTimeLabel;

  /// Reminder scheduled time empty state
  ///
  /// In zh_Hans, this message translates to:
  /// **'未选择'**
  String get reminderTimeUnselected;

  /// Reminder enabled switch title
  ///
  /// In zh_Hans, this message translates to:
  /// **'启用通知'**
  String get reminderEnableNotifications;

  /// Reminder enabled switch subtitle
  ///
  /// In zh_Hans, this message translates to:
  /// **'关闭后会取消已安排的通知'**
  String get reminderEnableNotificationsSubtitle;

  /// Validation error when reminder title is empty
  ///
  /// In zh_Hans, this message translates to:
  /// **'请输入提醒标题'**
  String get reminderTitleRequired;

  /// Validation error when reminder time is empty
  ///
  /// In zh_Hans, this message translates to:
  /// **'请选择提醒时间'**
  String get reminderTimeRequired;

  /// SnackBar shown when editing a missing reminder
  ///
  /// In zh_Hans, this message translates to:
  /// **'提醒不存在'**
  String get reminderMissing;

  /// SnackBar shown after saving a reminder on a platform without offline scheduling
  ///
  /// In zh_Hans, this message translates to:
  /// **'已保存；关闭应用后不会触发通知'**
  String get reminderSavedOfflineUnsupported;

  /// Delete reminder confirmation dialog title
  ///
  /// In zh_Hans, this message translates to:
  /// **'删除提醒'**
  String get reminderDeleteTitle;

  /// Delete reminder confirmation dialog message
  ///
  /// In zh_Hans, this message translates to:
  /// **'删除后会从列表隐藏，并取消对应通知。'**
  String get reminderDeleteMessage;

  /// Settings page app bar title
  ///
  /// In zh_Hans, this message translates to:
  /// **'设置'**
  String get settingsTitle;

  /// Settings theme mode row title
  ///
  /// In zh_Hans, this message translates to:
  /// **'主题模式'**
  String get settingsThemeMode;

  /// Settings theme mode row subtitle
  ///
  /// In zh_Hans, this message translates to:
  /// **'当前跟随系统'**
  String get settingsThemeFollowsSystem;

  /// Settings local authentication row title
  ///
  /// In zh_Hans, this message translates to:
  /// **'本地认证'**
  String get settingsLocalAuth;

  /// Settings local authentication row subtitle
  ///
  /// In zh_Hans, this message translates to:
  /// **'后续支持指纹 / Face ID'**
  String get settingsLocalAuthSubtitle;

  /// Settings about row title
  ///
  /// In zh_Hans, this message translates to:
  /// **'关于应用'**
  String get settingsAbout;

  /// Settings about row subtitle
  ///
  /// In zh_Hans, this message translates to:
  /// **'Phase 1 工程壳版本'**
  String get settingsAboutSubtitle;

  /// Settings language row title
  ///
  /// In zh_Hans, this message translates to:
  /// **'语言'**
  String get settingsLanguage;

  /// Settings language picker dialog title
  ///
  /// In zh_Hans, this message translates to:
  /// **'选择语言'**
  String get settingsLanguageDialogTitle;

  /// Display label for system language preference
  ///
  /// In zh_Hans, this message translates to:
  /// **'跟随系统'**
  String get settingsLanguageSystem;

  /// Display label for Simplified Chinese language preference
  ///
  /// In zh_Hans, this message translates to:
  /// **'简体中文'**
  String get settingsLanguageZhHans;

  /// Display label for Traditional Chinese language preference
  ///
  /// In zh_Hans, this message translates to:
  /// **'繁體中文'**
  String get settingsLanguageZhHant;

  /// Display label for English language preference
  ///
  /// In zh_Hans, this message translates to:
  /// **'English'**
  String get settingsLanguageEn;

  /// SnackBar shown when saving language preference fails
  ///
  /// In zh_Hans, this message translates to:
  /// **'语言设置保存失败，请重试。'**
  String get settingsLanguageSaveFailed;

  /// Generic save action label
  ///
  /// In zh_Hans, this message translates to:
  /// **'保存'**
  String get actionSave;

  /// Generic delete action label
  ///
  /// In zh_Hans, this message translates to:
  /// **'删除'**
  String get actionDelete;

  /// Generic cancel action label
  ///
  /// In zh_Hans, this message translates to:
  /// **'取消'**
  String get actionCancel;

  /// Generic confirm delete action label
  ///
  /// In zh_Hans, this message translates to:
  /// **'确认删除'**
  String get actionConfirmDelete;

  /// Generic unset field label
  ///
  /// In zh_Hans, this message translates to:
  /// **'未设置'**
  String get commonNotSet;

  /// Day of month option label
  ///
  /// In zh_Hans, this message translates to:
  /// **'{day} 日'**
  String commonDayOfMonth({required int day});

  /// Separator between list detail fragments
  ///
  /// In zh_Hans, this message translates to:
  /// **' · '**
  String get commonDetailSeparator;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hans':
            return AppLocalizationsZhHans();
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
