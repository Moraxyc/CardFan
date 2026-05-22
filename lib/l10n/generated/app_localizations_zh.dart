// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'CardFan';

  @override
  String get navDashboard => '首页';

  @override
  String get navSimCards => 'SIM';

  @override
  String get navBankCards => '银行卡';

  @override
  String get navReminders => '提醒';

  @override
  String get navSettings => '设置';

  @override
  String get dashboardTitle => '首页';

  @override
  String dashboardLoadError({required String error}) {
    return '加载首页失败：$error';
  }

  @override
  String get dashboardEmptyTitle => '还没有卡片记录';

  @override
  String get dashboardEmptySubtitle => '先添加 SIM 卡或银行卡，首页会自动汇总本地数据。';

  @override
  String get dashboardAddSimCard => '添加 SIM 卡';

  @override
  String get dashboardAddBankCard => '添加银行卡';

  @override
  String get dashboardSimCardTitle => 'SIM 卡';

  @override
  String get dashboardBankCardTitle => '银行卡';

  @override
  String dashboardSimCardCount({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 张 SIM 卡',
      zero: '暂无 SIM 卡',
    );
    return '$_temp0';
  }

  @override
  String dashboardBankCardCount({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 张银行卡',
      zero: '暂无银行卡',
    );
    return '$_temp0';
  }

  @override
  String get dashboardNoBillingDay => '未设置续费日';

  @override
  String dashboardBillingDay({required int day}) {
    return '续费日：每月 $day 日';
  }

  @override
  String get dashboardNoPaymentDay => '未设置还款日';

  @override
  String dashboardPaymentDay({required int day}) {
    return '还款日：每月 $day 日';
  }

  @override
  String get simCardsTitle => 'SIM 卡';

  @override
  String simCardsLoadError({required String error}) {
    return '加载 SIM 卡失败：$error';
  }

  @override
  String get simCardsEmptyTitle => '还没有 SIM 卡';

  @override
  String get simCardsEmptySubtitle => '添加第一张 SIM 卡，记录号码、套餐和续费信息。';

  @override
  String simCardMonthlyFee({required String amount}) {
    return '¥$amount';
  }

  @override
  String simCardBillingDay({required int day}) {
    return '每月 $day 日';
  }

  @override
  String get simCardAddTitle => '新增 SIM 卡';

  @override
  String get simCardEditTitle => '编辑 SIM 卡';

  @override
  String get simCardCarrierLabel => '运营商';

  @override
  String get simCardPhoneLabel => '手机号';

  @override
  String get simCardPlanLabel => '套餐名称';

  @override
  String get simCardMonthlyFeeLabel => '月费（元）';

  @override
  String get simCardBillingDayLabel => '账单日';

  @override
  String get simCardNotesLabel => '备注';

  @override
  String get simCardCarrierRequired => '请输入运营商';

  @override
  String get simCardPhoneRequired => '请输入手机号';

  @override
  String get simCardPhoneInvalid => '请输入国际格式手机号，例如 +886912345678';

  @override
  String get simCardMonthlyFeeTooPrecise => '月费最多支持 2 位小数';

  @override
  String get simCardMonthlyFeeInvalid => '请输入有效月费';

  @override
  String get simCardMissing => 'SIM 卡不存在';

  @override
  String get simCardDeleteTitle => '删除 SIM 卡';

  @override
  String get simCardDeleteMessage => '删除后会从列表隐藏，并保留同步所需记录。';

  @override
  String get bankCardsTitle => '银行卡';

  @override
  String bankCardsLoadError({required String error}) {
    return '加载银行卡失败：$error';
  }

  @override
  String get bankCardsEmptyTitle => '还没有银行卡';

  @override
  String get bankCardsEmptySubtitle => '添加第一张银行卡，记录账单日和还款日。';

  @override
  String bankCardLastFour({required String last4}) {
    return '尾号 $last4';
  }

  @override
  String bankCardStatementDay({required int day}) {
    return '账单日 $day 日';
  }

  @override
  String bankCardPaymentDay({required int day}) {
    return '还款日 $day 日';
  }

  @override
  String bankCardCreditLimit({required String amount}) {
    return '额度 ¥$amount';
  }

  @override
  String get bankCardAddTitle => '新增银行卡';

  @override
  String get bankCardEditTitle => '编辑银行卡';

  @override
  String get bankCardBankNameLabel => '银行名称';

  @override
  String get bankCardLastFourLabel => '卡号后四位';

  @override
  String get bankCardNameLabel => '卡片名称';

  @override
  String get bankCardCreditLimitLabel => '信用额度（元）';

  @override
  String get bankCardStatementDayLabel => '账单日';

  @override
  String get bankCardPaymentDueDayLabel => '还款日';

  @override
  String get bankCardBankNameRequired => '请输入银行名称';

  @override
  String get bankCardLastFourInvalid => '请输入 4 位数字尾号';

  @override
  String get bankCardCreditLimitInvalid => '请输入有效额度';

  @override
  String get bankCardCreditLimitTooPrecise => '信用额度最多支持 2 位小数';

  @override
  String get bankCardMissing => '银行卡不存在';

  @override
  String get bankCardDeleteTitle => '删除银行卡';

  @override
  String get bankCardDeleteMessage => '删除后会从列表隐藏，并保留同步所需记录。';

  @override
  String get remindersTitle => '提醒';

  @override
  String remindersLoadError({required String error}) {
    return '加载提醒失败：$error';
  }

  @override
  String get remindersEmptyTitle => '还没有提醒';

  @override
  String get remindersEmptySubtitle => '添加一个提醒';

  @override
  String get reminderEnabled => '已开启';

  @override
  String get reminderDisabled => '已关闭';

  @override
  String get reminderAddTitle => '新增提醒';

  @override
  String get reminderEditTitle => '编辑提醒';

  @override
  String get reminderUnsupportedNotificationsTitle => '当前平台不支持通知提醒';

  @override
  String get reminderUnsupportedNotificationsSubtitle => '此平台无法发送本地通知。';

  @override
  String get reminderUnsupportedOfflineTitle => '当前平台不支持关闭应用后的通知提醒';

  @override
  String get reminderUnsupportedOfflineSubtitle => '应用运行时仍会尽量发送本地通知。';

  @override
  String get reminderTitleLabel => '提醒标题';

  @override
  String get reminderBodyLabel => '提醒内容';

  @override
  String get reminderTimeLabel => '提醒时间';

  @override
  String get reminderTimeUnselected => '未选择';

  @override
  String get reminderEnableNotifications => '启用通知';

  @override
  String get reminderEnableNotificationsSubtitle => '关闭后会取消已安排的通知';

  @override
  String get reminderTitleRequired => '请输入提醒标题';

  @override
  String get reminderTimeRequired => '请选择提醒时间';

  @override
  String get reminderMissing => '提醒不存在';

  @override
  String get reminderSavedOfflineUnsupported => '已保存；关闭应用后不会触发通知';

  @override
  String get reminderDeleteTitle => '删除提醒';

  @override
  String get reminderDeleteMessage => '删除后会从列表隐藏，并取消对应通知。';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsThemeMode => '主题模式';

  @override
  String get settingsThemeFollowsSystem => '当前跟随系统';

  @override
  String get settingsLocalAuth => '本地认证';

  @override
  String get settingsLocalAuthSubtitle => '后续支持指纹 / Face ID';

  @override
  String get settingsAbout => '关于应用';

  @override
  String get settingsAboutSubtitle => 'Phase 1 工程壳版本';

  @override
  String get settingsLanguage => '语言';

  @override
  String get settingsLanguageDialogTitle => '选择语言';

  @override
  String get settingsLanguageSystem => '跟随系统';

  @override
  String get settingsLanguageZhHans => '简体中文';

  @override
  String get settingsLanguageZhHant => '繁體中文';

  @override
  String get settingsLanguageEn => 'English';

  @override
  String get settingsLanguageSaveFailed => '语言设置保存失败，请重试。';

  @override
  String get actionSave => '保存';

  @override
  String get actionDelete => '删除';

  @override
  String get actionCancel => '取消';

  @override
  String get actionConfirmDelete => '确认删除';

  @override
  String get commonNotSet => '未设置';

  @override
  String commonDayOfMonth({required int day}) {
    return '$day 日';
  }

  @override
  String get commonDetailSeparator => ' · ';
}

/// The translations for Chinese, using the Han script (`zh_Hans`).
class AppLocalizationsZhHans extends AppLocalizationsZh {
  AppLocalizationsZhHans() : super('zh_Hans');

  @override
  String get appTitle => 'CardFan';

  @override
  String get navDashboard => '首页';

  @override
  String get navSimCards => 'SIM';

  @override
  String get navBankCards => '银行卡';

  @override
  String get navReminders => '提醒';

  @override
  String get navSettings => '设置';

  @override
  String get dashboardTitle => '首页';

  @override
  String dashboardLoadError({required String error}) {
    return '加载首页失败：$error';
  }

  @override
  String get dashboardEmptyTitle => '还没有卡片记录';

  @override
  String get dashboardEmptySubtitle => '先添加 SIM 卡或银行卡，首页会自动汇总本地数据。';

  @override
  String get dashboardAddSimCard => '添加 SIM 卡';

  @override
  String get dashboardAddBankCard => '添加银行卡';

  @override
  String get dashboardSimCardTitle => 'SIM 卡';

  @override
  String get dashboardBankCardTitle => '银行卡';

  @override
  String dashboardSimCardCount({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 张 SIM 卡',
      zero: '暂无 SIM 卡',
    );
    return '$_temp0';
  }

  @override
  String dashboardBankCardCount({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 张银行卡',
      zero: '暂无银行卡',
    );
    return '$_temp0';
  }

  @override
  String get dashboardNoBillingDay => '未设置续费日';

  @override
  String dashboardBillingDay({required int day}) {
    return '续费日：每月 $day 日';
  }

  @override
  String get dashboardNoPaymentDay => '未设置还款日';

  @override
  String dashboardPaymentDay({required int day}) {
    return '还款日：每月 $day 日';
  }

  @override
  String get simCardsTitle => 'SIM 卡';

  @override
  String simCardsLoadError({required String error}) {
    return '加载 SIM 卡失败：$error';
  }

  @override
  String get simCardsEmptyTitle => '还没有 SIM 卡';

  @override
  String get simCardsEmptySubtitle => '添加第一张 SIM 卡，记录号码、套餐和续费信息。';

  @override
  String simCardMonthlyFee({required String amount}) {
    return '¥$amount';
  }

  @override
  String simCardBillingDay({required int day}) {
    return '每月 $day 日';
  }

  @override
  String get simCardAddTitle => '新增 SIM 卡';

  @override
  String get simCardEditTitle => '编辑 SIM 卡';

  @override
  String get simCardCarrierLabel => '运营商';

  @override
  String get simCardPhoneLabel => '手机号';

  @override
  String get simCardPlanLabel => '套餐名称';

  @override
  String get simCardMonthlyFeeLabel => '月费（元）';

  @override
  String get simCardBillingDayLabel => '账单日';

  @override
  String get simCardNotesLabel => '备注';

  @override
  String get simCardCarrierRequired => '请输入运营商';

  @override
  String get simCardPhoneRequired => '请输入手机号';

  @override
  String get simCardPhoneInvalid => '请输入国际格式手机号，例如 +886912345678';

  @override
  String get simCardMonthlyFeeTooPrecise => '月费最多支持 2 位小数';

  @override
  String get simCardMonthlyFeeInvalid => '请输入有效月费';

  @override
  String get simCardMissing => 'SIM 卡不存在';

  @override
  String get simCardDeleteTitle => '删除 SIM 卡';

  @override
  String get simCardDeleteMessage => '删除后会从列表隐藏，并保留同步所需记录。';

  @override
  String get bankCardsTitle => '银行卡';

  @override
  String bankCardsLoadError({required String error}) {
    return '加载银行卡失败：$error';
  }

  @override
  String get bankCardsEmptyTitle => '还没有银行卡';

  @override
  String get bankCardsEmptySubtitle => '添加第一张银行卡，记录账单日和还款日。';

  @override
  String bankCardLastFour({required String last4}) {
    return '尾号 $last4';
  }

  @override
  String bankCardStatementDay({required int day}) {
    return '账单日 $day 日';
  }

  @override
  String bankCardPaymentDay({required int day}) {
    return '还款日 $day 日';
  }

  @override
  String bankCardCreditLimit({required String amount}) {
    return '额度 ¥$amount';
  }

  @override
  String get bankCardAddTitle => '新增银行卡';

  @override
  String get bankCardEditTitle => '编辑银行卡';

  @override
  String get bankCardBankNameLabel => '银行名称';

  @override
  String get bankCardLastFourLabel => '卡号后四位';

  @override
  String get bankCardNameLabel => '卡片名称';

  @override
  String get bankCardCreditLimitLabel => '信用额度（元）';

  @override
  String get bankCardStatementDayLabel => '账单日';

  @override
  String get bankCardPaymentDueDayLabel => '还款日';

  @override
  String get bankCardBankNameRequired => '请输入银行名称';

  @override
  String get bankCardLastFourInvalid => '请输入 4 位数字尾号';

  @override
  String get bankCardCreditLimitInvalid => '请输入有效额度';

  @override
  String get bankCardCreditLimitTooPrecise => '信用额度最多支持 2 位小数';

  @override
  String get bankCardMissing => '银行卡不存在';

  @override
  String get bankCardDeleteTitle => '删除银行卡';

  @override
  String get bankCardDeleteMessage => '删除后会从列表隐藏，并保留同步所需记录。';

  @override
  String get remindersTitle => '提醒';

  @override
  String remindersLoadError({required String error}) {
    return '加载提醒失败：$error';
  }

  @override
  String get remindersEmptyTitle => '还没有提醒';

  @override
  String get remindersEmptySubtitle => '添加一个提醒';

  @override
  String get reminderEnabled => '已开启';

  @override
  String get reminderDisabled => '已关闭';

  @override
  String get reminderAddTitle => '新增提醒';

  @override
  String get reminderEditTitle => '编辑提醒';

  @override
  String get reminderUnsupportedNotificationsTitle => '当前平台不支持通知提醒';

  @override
  String get reminderUnsupportedNotificationsSubtitle => '此平台无法发送本地通知。';

  @override
  String get reminderUnsupportedOfflineTitle => '当前平台不支持关闭应用后的通知提醒';

  @override
  String get reminderUnsupportedOfflineSubtitle => '应用运行时仍会尽量发送本地通知。';

  @override
  String get reminderTitleLabel => '提醒标题';

  @override
  String get reminderBodyLabel => '提醒内容';

  @override
  String get reminderTimeLabel => '提醒时间';

  @override
  String get reminderTimeUnselected => '未选择';

  @override
  String get reminderEnableNotifications => '启用通知';

  @override
  String get reminderEnableNotificationsSubtitle => '关闭后会取消已安排的通知';

  @override
  String get reminderTitleRequired => '请输入提醒标题';

  @override
  String get reminderTimeRequired => '请选择提醒时间';

  @override
  String get reminderMissing => '提醒不存在';

  @override
  String get reminderSavedOfflineUnsupported => '已保存；关闭应用后不会触发通知';

  @override
  String get reminderDeleteTitle => '删除提醒';

  @override
  String get reminderDeleteMessage => '删除后会从列表隐藏，并取消对应通知。';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsThemeMode => '主题模式';

  @override
  String get settingsThemeFollowsSystem => '当前跟随系统';

  @override
  String get settingsLocalAuth => '本地认证';

  @override
  String get settingsLocalAuthSubtitle => '后续支持指纹 / Face ID';

  @override
  String get settingsAbout => '关于应用';

  @override
  String get settingsAboutSubtitle => 'Phase 1 工程壳版本';

  @override
  String get settingsLanguage => '语言';

  @override
  String get settingsLanguageDialogTitle => '选择语言';

  @override
  String get settingsLanguageSystem => '跟随系统';

  @override
  String get settingsLanguageZhHans => '简体中文';

  @override
  String get settingsLanguageZhHant => '繁體中文';

  @override
  String get settingsLanguageEn => 'English';

  @override
  String get settingsLanguageSaveFailed => '语言设置保存失败，请重试。';

  @override
  String get actionSave => '保存';

  @override
  String get actionDelete => '删除';

  @override
  String get actionCancel => '取消';

  @override
  String get actionConfirmDelete => '确认删除';

  @override
  String get commonNotSet => '未设置';

  @override
  String commonDayOfMonth({required int day}) {
    return '$day 日';
  }

  @override
  String get commonDetailSeparator => ' · ';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get appTitle => 'CardFan';

  @override
  String get navDashboard => '首頁';

  @override
  String get navSimCards => 'SIM';

  @override
  String get navBankCards => '銀行卡';

  @override
  String get navReminders => '提醒';

  @override
  String get navSettings => '設定';

  @override
  String get dashboardTitle => '首頁';

  @override
  String dashboardLoadError({required String error}) {
    return '載入首頁失敗：$error';
  }

  @override
  String get dashboardEmptyTitle => '還沒有卡片記錄';

  @override
  String get dashboardEmptySubtitle => '先新增 SIM 卡或銀行卡，首頁會自動彙總本機資料。';

  @override
  String get dashboardAddSimCard => '新增 SIM 卡';

  @override
  String get dashboardAddBankCard => '新增銀行卡';

  @override
  String get dashboardSimCardTitle => 'SIM 卡';

  @override
  String get dashboardBankCardTitle => '銀行卡';

  @override
  String dashboardSimCardCount({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 張 SIM 卡',
      zero: '暫無 SIM 卡',
    );
    return '$_temp0';
  }

  @override
  String dashboardBankCardCount({required int count}) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 張銀行卡',
      zero: '暫無銀行卡',
    );
    return '$_temp0';
  }

  @override
  String get dashboardNoBillingDay => '未設定續費日';

  @override
  String dashboardBillingDay({required int day}) {
    return '續費日：每月 $day 日';
  }

  @override
  String get dashboardNoPaymentDay => '未設定還款日';

  @override
  String dashboardPaymentDay({required int day}) {
    return '還款日：每月 $day 日';
  }

  @override
  String get simCardsTitle => 'SIM 卡';

  @override
  String simCardsLoadError({required String error}) {
    return '載入 SIM 卡失敗：$error';
  }

  @override
  String get simCardsEmptyTitle => '還沒有 SIM 卡';

  @override
  String get simCardsEmptySubtitle => '新增第一張 SIM 卡，記錄號碼、資費方案和續費資訊。';

  @override
  String simCardMonthlyFee({required String amount}) {
    return '¥$amount';
  }

  @override
  String simCardBillingDay({required int day}) {
    return '每月 $day 日';
  }

  @override
  String get simCardAddTitle => '新增 SIM 卡';

  @override
  String get simCardEditTitle => '編輯 SIM 卡';

  @override
  String get simCardCarrierLabel => '電信業者';

  @override
  String get simCardPhoneLabel => '手機號碼';

  @override
  String get simCardPlanLabel => '資費方案名稱';

  @override
  String get simCardMonthlyFeeLabel => '月費（元）';

  @override
  String get simCardBillingDayLabel => '帳單日';

  @override
  String get simCardNotesLabel => '備註';

  @override
  String get simCardCarrierRequired => '請輸入電信業者';

  @override
  String get simCardPhoneRequired => '請輸入手機號碼';

  @override
  String get simCardPhoneInvalid => '請輸入國際格式手機號碼，例如 +886912345678';

  @override
  String get simCardMonthlyFeeTooPrecise => '月費最多支援 2 位小數';

  @override
  String get simCardMonthlyFeeInvalid => '請輸入有效月費';

  @override
  String get simCardMissing => 'SIM 卡不存在';

  @override
  String get simCardDeleteTitle => '刪除 SIM 卡';

  @override
  String get simCardDeleteMessage => '刪除後會從列表隱藏，並保留同步所需記錄。';

  @override
  String get bankCardsTitle => '銀行卡';

  @override
  String bankCardsLoadError({required String error}) {
    return '載入銀行卡失敗：$error';
  }

  @override
  String get bankCardsEmptyTitle => '還沒有銀行卡';

  @override
  String get bankCardsEmptySubtitle => '新增第一張銀行卡，記錄帳單日和還款日。';

  @override
  String bankCardLastFour({required String last4}) {
    return '尾號 $last4';
  }

  @override
  String bankCardStatementDay({required int day}) {
    return '帳單日 $day 日';
  }

  @override
  String bankCardPaymentDay({required int day}) {
    return '還款日 $day 日';
  }

  @override
  String bankCardCreditLimit({required String amount}) {
    return '額度 ¥$amount';
  }

  @override
  String get bankCardAddTitle => '新增銀行卡';

  @override
  String get bankCardEditTitle => '編輯銀行卡';

  @override
  String get bankCardBankNameLabel => '銀行名稱';

  @override
  String get bankCardLastFourLabel => '卡號後四位';

  @override
  String get bankCardNameLabel => '卡片名稱';

  @override
  String get bankCardCreditLimitLabel => '信用額度（元）';

  @override
  String get bankCardStatementDayLabel => '帳單日';

  @override
  String get bankCardPaymentDueDayLabel => '還款日';

  @override
  String get bankCardBankNameRequired => '請輸入銀行名稱';

  @override
  String get bankCardLastFourInvalid => '請輸入 4 位數字尾號';

  @override
  String get bankCardCreditLimitInvalid => '請輸入有效額度';

  @override
  String get bankCardCreditLimitTooPrecise => '信用額度最多支援 2 位小數';

  @override
  String get bankCardMissing => '銀行卡不存在';

  @override
  String get bankCardDeleteTitle => '刪除銀行卡';

  @override
  String get bankCardDeleteMessage => '刪除後會從列表隱藏，並保留同步所需記錄。';

  @override
  String get remindersTitle => '提醒';

  @override
  String remindersLoadError({required String error}) {
    return '載入提醒失敗：$error';
  }

  @override
  String get remindersEmptyTitle => '還沒有提醒';

  @override
  String get remindersEmptySubtitle => '新增一個提醒';

  @override
  String get reminderEnabled => '已啟用';

  @override
  String get reminderDisabled => '已停用';

  @override
  String get reminderAddTitle => '新增提醒';

  @override
  String get reminderEditTitle => '編輯提醒';

  @override
  String get reminderUnsupportedNotificationsTitle => '目前平台不支援通知提醒';

  @override
  String get reminderUnsupportedNotificationsSubtitle => '此平台無法傳送本機通知。';

  @override
  String get reminderUnsupportedOfflineTitle => '目前平台不支援關閉應用程式後的通知提醒';

  @override
  String get reminderUnsupportedOfflineSubtitle => '應用程式執行時仍會盡量傳送本機通知。';

  @override
  String get reminderTitleLabel => '提醒標題';

  @override
  String get reminderBodyLabel => '提醒內容';

  @override
  String get reminderTimeLabel => '提醒時間';

  @override
  String get reminderTimeUnselected => '未選擇';

  @override
  String get reminderEnableNotifications => '啟用通知';

  @override
  String get reminderEnableNotificationsSubtitle => '關閉後會取消已安排的通知';

  @override
  String get reminderTitleRequired => '請輸入提醒標題';

  @override
  String get reminderTimeRequired => '請選擇提醒時間';

  @override
  String get reminderMissing => '提醒不存在';

  @override
  String get reminderSavedOfflineUnsupported => '已儲存；關閉應用程式後不會觸發通知';

  @override
  String get reminderDeleteTitle => '刪除提醒';

  @override
  String get reminderDeleteMessage => '刪除後會從列表隱藏，並取消對應通知。';

  @override
  String get settingsTitle => '設定';

  @override
  String get settingsThemeMode => '主題模式';

  @override
  String get settingsThemeFollowsSystem => '目前跟隨系統';

  @override
  String get settingsLocalAuth => '本機認證';

  @override
  String get settingsLocalAuthSubtitle => '後續支援指紋 / Face ID';

  @override
  String get settingsAbout => '關於應用程式';

  @override
  String get settingsAboutSubtitle => 'Phase 1 工程殼版本';

  @override
  String get settingsLanguage => '語言';

  @override
  String get settingsLanguageDialogTitle => '選擇語言';

  @override
  String get settingsLanguageSystem => '跟隨系統';

  @override
  String get settingsLanguageZhHans => '简体中文';

  @override
  String get settingsLanguageZhHant => '繁體中文';

  @override
  String get settingsLanguageEn => 'English';

  @override
  String get settingsLanguageSaveFailed => '語言設定儲存失敗，請重試。';

  @override
  String get actionSave => '儲存';

  @override
  String get actionDelete => '刪除';

  @override
  String get actionCancel => '取消';

  @override
  String get actionConfirmDelete => '確認刪除';

  @override
  String get commonNotSet => '未設定';

  @override
  String commonDayOfMonth({required int day}) {
    return '$day 日';
  }

  @override
  String get commonDetailSeparator => ' · ';
}
