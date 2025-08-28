///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsZh extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsZh _root = this; // ignore: unused_field

	@override 
	TranslationsZh $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZh(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsCommonZh common = TranslationsCommonZh._(_root);
	@override late final TranslationsLoginZh login = TranslationsLoginZh._(_root);
	@override late final TranslationsRegisterZh register = TranslationsRegisterZh._(_root);
	@override late final TranslationsPasswordResetZh passwordReset = TranslationsPasswordResetZh._(_root);
	@override late final TranslationsLanguagesZh languages = TranslationsLanguagesZh._(_root);
}

// Path: common
class TranslationsCommonZh extends TranslationsCommonEn {
	TranslationsCommonZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMessageZh message = TranslationsCommonMessageZh._(_root);
	@override late final TranslationsCommonGameZh game = TranslationsCommonGameZh._(_root);
	@override late final TranslationsCommonSocialZh social = TranslationsCommonSocialZh._(_root);
	@override late final TranslationsCommonViewsZh views = TranslationsCommonViewsZh._(_root);
	@override late final TranslationsCommonUnitsZh units = TranslationsCommonUnitsZh._(_root);
	@override late final TranslationsCommonNumbersZh numbers = TranslationsCommonNumbersZh._(_root);
	@override late final TranslationsCommonRanksZh ranks = TranslationsCommonRanksZh._(_root);
	@override late final TranslationsCommonControlZh control = TranslationsCommonControlZh._(_root);
	@override late final TranslationsCommonButtonsZh buttons = TranslationsCommonButtonsZh._(_root);
	@override late final TranslationsCommonLabelsZh labels = TranslationsCommonLabelsZh._(_root);
	@override late final TranslationsCommonResponseZh response = TranslationsCommonResponseZh._(_root);
	@override late final TranslationsCommonPriorityZh priority = TranslationsCommonPriorityZh._(_root);
	@override late final TranslationsCommonDateZh date = TranslationsCommonDateZh._(_root);
	@override late final TranslationsCommonWeekdaysZh weekdays = TranslationsCommonWeekdaysZh._(_root);
	@override late final TranslationsCommonFormRestrictionsZh formRestrictions = TranslationsCommonFormRestrictionsZh._(_root);
	@override late final TranslationsCommonTosZh tos = TranslationsCommonTosZh._(_root);
	@override late final TranslationsCommonPermissionsZh permissions = TranslationsCommonPermissionsZh._(_root);
	@override late final TranslationsCommonPromptsZh prompts = TranslationsCommonPromptsZh._(_root);
}

// Path: login
class TranslationsLoginZh extends TranslationsLoginEn {
	TranslationsLoginZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginMessageZh message = TranslationsLoginMessageZh._(_root);
	@override late final TranslationsLoginFormZh form = TranslationsLoginFormZh._(_root);
	@override late final TranslationsLoginTooltipZh tooltip = TranslationsLoginTooltipZh._(_root);
	@override late final TranslationsLoginValidationZh validation = TranslationsLoginValidationZh._(_root);
}

// Path: register
class TranslationsRegisterZh extends TranslationsRegisterEn {
	TranslationsRegisterZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterMessageZh message = TranslationsRegisterMessageZh._(_root);
	@override late final TranslationsRegisterFormZh form = TranslationsRegisterFormZh._(_root);
	@override late final TranslationsRegisterTooltipZh tooltip = TranslationsRegisterTooltipZh._(_root);
	@override late final TranslationsRegisterValidationZh validation = TranslationsRegisterValidationZh._(_root);
}

// Path: passwordReset
class TranslationsPasswordResetZh extends TranslationsPasswordResetEn {
	TranslationsPasswordResetZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetMessageZh message = TranslationsPasswordResetMessageZh._(_root);
	@override late final TranslationsPasswordResetFormZh form = TranslationsPasswordResetFormZh._(_root);
	@override late final TranslationsPasswordResetTooltipZh tooltip = TranslationsPasswordResetTooltipZh._(_root);
	@override late final TranslationsPasswordResetValidationZh validation = TranslationsPasswordResetValidationZh._(_root);
}

// Path: languages
class TranslationsLanguagesZh extends TranslationsLanguagesEn {
	TranslationsLanguagesZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLanguagesCurrentZh current = TranslationsLanguagesCurrentZh._(_root);
}

// Path: common.message
class TranslationsCommonMessageZh extends TranslationsCommonMessageEn {
	TranslationsCommonMessageZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get loading => '載入中';
	@override String get somethingWentWrong => '出了問題';
	@override String get networkProblem => '網路有問題';
	@override String get noDataFound => '未找到資料';
	@override String get noResultsFound => '未找到結果';
	@override String get unsupportedFileType => '不支援的檔案類型';
	@override String get fileTooLarge => '檔案太大';
	@override String get operationTimedOut => '操作逾時';
	@override String get sessionExpired => '會話已過期';
	@override String get unsavableChanges => '無法儲存變更';
	@override String get noServerConnect => '無法連接到伺服器';
	@override String get accessDenied => '存取被拒絕';
}

// Path: common.game
class TranslationsCommonGameZh extends TranslationsCommonGameEn {
	TranslationsCommonGameZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get start => '開始遊戲';
	@override String get pause => '暫停遊戲';
	@override String get resume => '繼續遊戲';
	@override String get end => '結束遊戲';
	@override String get levelUp => '升級';
	@override String get gameOver => '遊戲結束';
	@override String get nextLevel => '下一關';
	@override String get previousLevel => '上一關';
	@override String get restart => '重新開始遊戲';
}

// Path: common.social
class TranslationsCommonSocialZh extends TranslationsCommonSocialEn {
	TranslationsCommonSocialZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get like => '按讚';
	@override String get share => '分享';
	@override String get comment => '評論';
	@override String get follow => '追蹤';
	@override String get unfollow => '取消追蹤';
	@override String get unlike => '取消按讚';
	@override String get reply => '回覆';
	@override String get dislike => '不喜歡';
	@override String get block => '封鎖';
	@override String get blockUser => '封鎖使用者';
	@override String get report => '檢舉';
	@override String get mute => '靜音';
	@override String get uSentFriendRequest => '您發送了好友請求';
	@override String get uReceivedFriendRequest => '您收到了好友請求';
	@override String get sentFriendRequest => '發送了好友請求';
	@override String get receivedFriendRequest => '收到了好友請求';
	@override String get acceptedFriendRequest => '接受了好友請求';
	@override String get uAcceptedFriendRequest => '您接受了好友請求';
}

// Path: common.views
class TranslationsCommonViewsZh extends TranslationsCommonViewsEn {
	TranslationsCommonViewsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get list => '清單';
	@override String get grid => '網格';
	@override String get table => '表格';
	@override String get form => '表單';
}

// Path: common.units
class TranslationsCommonUnitsZh extends TranslationsCommonUnitsEn {
	TranslationsCommonUnitsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonUnitsLengthZh length = TranslationsCommonUnitsLengthZh._(_root);
	@override late final TranslationsCommonUnitsWeightZh weight = TranslationsCommonUnitsWeightZh._(_root);
	@override late final TranslationsCommonUnitsVolumeZh volume = TranslationsCommonUnitsVolumeZh._(_root);
	@override late final TranslationsCommonUnitsTimeZh time = TranslationsCommonUnitsTimeZh._(_root);
	@override late final TranslationsCommonUnitsAreaZh area = TranslationsCommonUnitsAreaZh._(_root);
}

// Path: common.numbers
class TranslationsCommonNumbersZh extends TranslationsCommonNumbersEn {
	TranslationsCommonNumbersZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get k1 => '一';
	@override String get k2 => '二';
	@override String get k3 => '三';
	@override String get k4 => '四';
	@override String get k5 => '五';
	@override String get k6 => '六';
	@override String get k7 => '七';
	@override String get k8 => '八';
	@override String get k9 => '九';
	@override String get k10 => '十';
}

// Path: common.ranks
class TranslationsCommonRanksZh extends TranslationsCommonRanksEn {
	TranslationsCommonRanksZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get k1 => '第一';
	@override String get k2 => '第二';
	@override String get k3 => '第三';
	@override String get k4 => '第四';
	@override String get k5 => '第五';
	@override String get k6 => '第六';
	@override String get k7 => '第七';
	@override String get k8 => '第八';
	@override String get k9 => '第九';
	@override String get k10 => '第十';
}

// Path: common.control
class TranslationsCommonControlZh extends TranslationsCommonControlEn {
	TranslationsCommonControlZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get on => '開';
	@override String get off => '關';
	@override String get yes => '是';
	@override String get no => '否';
	@override String get confirm => '確認';
	@override String get cancel => '取消';
	@override String get retry => '重試';
	@override String get logout => '登出';
	@override String get edit => '編輯';
	@override String get delete => '刪除';
	@override String get revert => '還原';
	@override String get save => '儲存';
}

// Path: common.buttons
class TranslationsCommonButtonsZh extends TranslationsCommonButtonsEn {
	TranslationsCommonButtonsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get submit => '提交';
	@override String get close => '關閉';
	@override String get reset => '重置';
	@override String get cancel => '取消';
	@override String get kContinue => '繼續';
	@override String get back => '返回';
	@override String get next => '下一步';
	@override String get done => '完成';
	@override String get upload => '上傳';
	@override String get choose => '選擇';
	@override String get select => '選取';
	@override String get clear => '清除';
	@override String get start => '開始';
}

// Path: common.labels
class TranslationsCommonLabelsZh extends TranslationsCommonLabelsEn {
	TranslationsCommonLabelsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get required => '必填';
	@override String get optional => '可選';
	@override String get instructions => '說明:';
	@override String get status => '狀態';
	@override String get progress => '進度';
	@override String get question => '問題';
	@override String get answer => '答案';
	@override String get response => '回覆';
	@override String get loading => '載入中...';
	@override String get error => '錯誤';
	@override String get success => '成功';
	@override String get warning => '警告';
}

// Path: common.response
class TranslationsCommonResponseZh extends TranslationsCommonResponseEn {
	TranslationsCommonResponseZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get success => '成功';
	@override String get error => '錯誤';
	@override String get info => '資訊';
	@override String get warning => '警告';
	@override String get tbd => '待定';
	@override String get wip => '進行中';
}

// Path: common.priority
class TranslationsCommonPriorityZh extends TranslationsCommonPriorityEn {
	TranslationsCommonPriorityZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get high => '高';
	@override String get medium => '中';
	@override String get low => '低';
}

// Path: common.date
class TranslationsCommonDateZh extends TranslationsCommonDateEn {
	TranslationsCommonDateZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get today => '今天';
	@override String get yesterday => '昨天';
	@override String get tomorrow => '明天';
	@override String get justNow => '剛才';
	@override String get aMomentAgo => '剛剛';
	@override String get minutesAgo => '幾分鐘前';
	@override String get hoursAgo => '幾小時前';
	@override String daysAgo({required Object days}) => '${days}天前';
	@override String get weeksAgo => '幾週前';
	@override String get thisWeek => '本週';
	@override String get lastWeek => '上週';
	@override String get thisMonth => '本月';
	@override String get lastMonth => '上月';
	@override String get thisYear => '今年';
	@override String get lastYear => '去年';
	@override String daysAhead({required Object days}) => '${days}天後';
}

// Path: common.weekdays
class TranslationsCommonWeekdaysZh extends TranslationsCommonWeekdaysEn {
	TranslationsCommonWeekdaysZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonWeekdaysFullZh full = TranslationsCommonWeekdaysFullZh._(_root);
	@override late final TranslationsCommonWeekdaysShortZh short = TranslationsCommonWeekdaysShortZh._(_root);
}

// Path: common.formRestrictions
class TranslationsCommonFormRestrictionsZh extends TranslationsCommonFormRestrictionsEn {
	TranslationsCommonFormRestrictionsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get required => '此欄位為必填。';
	@override String minLength({required Object min}) => '最小長度為${min}個字元。';
	@override String maxLength({required Object max}) => '最大長度為${max}個字元。';
	@override String get invalidFormat => '格式無效。';
	@override String pattern({required Object pattern}) => '此欄位必須遵循模式${pattern}。';
}

// Path: common.tos
class TranslationsCommonTosZh extends TranslationsCommonTosEn {
	TranslationsCommonTosZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get accept => '我接受條款與條件';
	@override String get readAccept => '請閱讀並接受我們的條款與條件';
	@override String get title => '條款與條件';
	@override String get service => '服務條款';
	@override String get privacy => '隱私政策';
	@override String get continueAgree => '繼續即表示您同意我們的條款與條件';
	@override String get mustAccept => '您必須接受條款與條件才能繼續';
	@override String get view => '查看條款與條件';
	@override String lastUpdated({required Object date}) => '最後更新：${date}';
	@override String get contactInfo => '如需了解有關我們條款與條件的更多資訊，請聯繫我們';
}

// Path: common.permissions
class TranslationsCommonPermissionsZh extends TranslationsCommonPermissionsEn {
	TranslationsCommonPermissionsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get allowLocation => '允許存取位置？';
	@override String get allowCamera => '允許存取相機？';
	@override String get allowMicrophone => '允許存取麥克風？';
	@override String get allowNotifications => '允許通知？';
	@override String get allowContacts => '允許存取聯絡人？';
	@override String get allowPhotos => '允許存取照片？';
	@override String get allowStorage => '允許存取儲存空間？';
	@override String get allowBluetooth => '允許藍牙存取？';
	@override String get needPermission => '我們需要您的許可才能繼續';
	@override String get permissionDenied => '權限被拒絕';
	@override String get permissionRequired => '此權限為必需';
	@override String get enableInSettings => '請在設定中啟用';
}

// Path: common.prompts
class TranslationsCommonPromptsZh extends TranslationsCommonPromptsEn {
	TranslationsCommonPromptsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get sessionExpired => '您的會話已過期';
	@override String get areYouSure => '您確定嗎？';
	@override String get cannotBeUndone => '此操作無法復原';
	@override String get unsavedChanges => '您有未儲存的變更';
	@override String get discardChanges => '捨棄變更？';
	@override String get locationDisabled => '位置服務已停用';
	@override String get networkRequired => '需要網路連線';
	@override String get loginRequired => '需要登入才能繼續';
	@override String get confirmDelete => '您確定要刪除此項目嗎？';
	@override String get confirmLogout => '您確定要登出嗎？';
	@override String get saveBeforeExit => '離開前要儲存嗎？';
	@override String get reloadPage => '您要重新載入頁面嗎？';
	@override String get updateAvailable => '有可用更新';
	@override String get restartRequired => '需要重新啟動以套用變更';
}

// Path: login.message
class TranslationsLoginMessageZh extends TranslationsLoginMessageEn {
	TranslationsLoginMessageZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get success => '登入成功。';
	@override String get error => '登入失敗。請重試。';
	@override String get wrongPassword => '請驗證您的憑證。';
}

// Path: login.form
class TranslationsLoginFormZh extends TranslationsLoginFormEn {
	TranslationsLoginFormZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get username => '使用者名稱';
	@override String get password => '密碼';
	@override String get submit => '登入';
	@override String get createAccount => '建立新帳戶';
	@override String get forgotPassword => '忘記密碼';
}

// Path: login.tooltip
class TranslationsLoginTooltipZh extends TranslationsLoginTooltipEn {
	TranslationsLoginTooltipZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get username => '輸入您的使用者名稱';
	@override String get password => '輸入您的密碼';
	@override String get submit => '點擊登入';
}

// Path: login.validation
class TranslationsLoginValidationZh extends TranslationsLoginValidationEn {
	TranslationsLoginValidationZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginValidationUsernameZh username = TranslationsLoginValidationUsernameZh._(_root);
	@override late final TranslationsLoginValidationPasswordZh password = TranslationsLoginValidationPasswordZh._(_root);
}

// Path: register.message
class TranslationsRegisterMessageZh extends TranslationsRegisterMessageEn {
	TranslationsRegisterMessageZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get success => '註冊成功。';
	@override String get error => '註冊失敗。請重試。';
}

// Path: register.form
class TranslationsRegisterFormZh extends TranslationsRegisterFormEn {
	TranslationsRegisterFormZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get username => '使用者名稱';
	@override String get email => '電子郵件';
	@override String get password => '密碼';
	@override String get submit => '註冊';
	@override String get acceptTos => '我接受服務條款';
}

// Path: register.tooltip
class TranslationsRegisterTooltipZh extends TranslationsRegisterTooltipEn {
	TranslationsRegisterTooltipZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get username => '輸入您的使用者名稱';
	@override String get email => '輸入您的電子郵件';
	@override String get password => '輸入您的密碼';
	@override String get submit => '點擊註冊';
}

// Path: register.validation
class TranslationsRegisterValidationZh extends TranslationsRegisterValidationEn {
	TranslationsRegisterValidationZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterValidationUsernameZh username = TranslationsRegisterValidationUsernameZh._(_root);
	@override late final TranslationsRegisterValidationEmailZh email = TranslationsRegisterValidationEmailZh._(_root);
	@override late final TranslationsRegisterValidationPasswordZh password = TranslationsRegisterValidationPasswordZh._(_root);
}

// Path: passwordReset.message
class TranslationsPasswordResetMessageZh extends TranslationsPasswordResetMessageEn {
	TranslationsPasswordResetMessageZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get success => '密碼重設郵件已發送。';
	@override String get error => '密碼重設失敗。請重試。';
}

// Path: passwordReset.form
class TranslationsPasswordResetFormZh extends TranslationsPasswordResetFormEn {
	TranslationsPasswordResetFormZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get email => '電子郵件';
	@override String get submit => '重設密碼';
}

// Path: passwordReset.tooltip
class TranslationsPasswordResetTooltipZh extends TranslationsPasswordResetTooltipEn {
	TranslationsPasswordResetTooltipZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get email => '輸入您的電子郵件';
	@override String get submit => '點擊重設密碼';
}

// Path: passwordReset.validation
class TranslationsPasswordResetValidationZh extends TranslationsPasswordResetValidationEn {
	TranslationsPasswordResetValidationZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetValidationEmailZh email = TranslationsPasswordResetValidationEmailZh._(_root);
}

// Path: languages.current
class TranslationsLanguagesCurrentZh extends TranslationsLanguagesCurrentEn {
	TranslationsLanguagesCurrentZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get en => '英語';
	@override String get da => '丹麥語';
	@override String get es => '西班牙語';
	@override String get fr => '法語';
	@override String get he => '希伯來語';
	@override String get isIS => '冰島語';
	@override String get ko => '韓語';
	@override String get nb => '挪威語 (書面語)';
	@override String get nl => '荷蘭語';
	@override String get no => '挪威語';
	@override String get sv => '瑞典語';
	@override String get zhHans => '中文 (簡體)';
	@override String get zh => '中文 (繁體)';
}

// Path: common.units.length
class TranslationsCommonUnitsLengthZh extends TranslationsCommonUnitsLengthEn {
	TranslationsCommonUnitsLengthZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get kilometer => '公里';
	@override String get meter => '公尺';
	@override String get centimeter => '公分';
	@override String get millimeter => '公釐';
	@override String get micrometer => '微米';
	@override String get nanometer => '奈米';
}

// Path: common.units.weight
class TranslationsCommonUnitsWeightZh extends TranslationsCommonUnitsWeightEn {
	TranslationsCommonUnitsWeightZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get kilogram => '公斤';
	@override String get gram => '公克';
	@override String get milligram => '毫克';
	@override String get ton => '公噸';
}

// Path: common.units.volume
class TranslationsCommonUnitsVolumeZh extends TranslationsCommonUnitsVolumeEn {
	TranslationsCommonUnitsVolumeZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get liter => '公升';
	@override String get milliliter => '毫升';
	@override String get cubicMeter => '立方公尺';
}

// Path: common.units.time
class TranslationsCommonUnitsTimeZh extends TranslationsCommonUnitsTimeEn {
	TranslationsCommonUnitsTimeZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get second => '秒';
	@override String get minute => '分鐘';
	@override String get hour => '小時';
	@override String get day => '天';
	@override String get week => '週';
	@override String get month => '月';
	@override String get year => '年';
}

// Path: common.units.area
class TranslationsCommonUnitsAreaZh extends TranslationsCommonUnitsAreaEn {
	TranslationsCommonUnitsAreaZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get squareMeter => '平方公尺';
	@override String get hectare => '公頃';
	@override String get acre => '英畝';
}

// Path: common.weekdays.full
class TranslationsCommonWeekdaysFullZh extends TranslationsCommonWeekdaysFullEn {
	TranslationsCommonWeekdaysFullZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get sunday => '星期日';
	@override String get monday => '星期一';
	@override String get tuesday => '星期二';
	@override String get wednesday => '星期三';
	@override String get thursday => '星期四';
	@override String get friday => '星期五';
	@override String get saturday => '星期六';
}

// Path: common.weekdays.short
class TranslationsCommonWeekdaysShortZh extends TranslationsCommonWeekdaysShortEn {
	TranslationsCommonWeekdaysShortZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get sunday => '日';
	@override String get monday => '一';
	@override String get tuesday => '二';
	@override String get wednesday => '三';
	@override String get thursday => '四';
	@override String get friday => '五';
	@override String get saturday => '六';
}

// Path: login.validation.username
class TranslationsLoginValidationUsernameZh extends TranslationsLoginValidationUsernameEn {
	TranslationsLoginValidationUsernameZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get required => '使用者名稱為必填。';
}

// Path: login.validation.password
class TranslationsLoginValidationPasswordZh extends TranslationsLoginValidationPasswordEn {
	TranslationsLoginValidationPasswordZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get required => '密碼為必填。';
}

// Path: register.validation.username
class TranslationsRegisterValidationUsernameZh extends TranslationsRegisterValidationUsernameEn {
	TranslationsRegisterValidationUsernameZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get required => '使用者名稱為必填。';
	@override String minLength({required Object min}) => '使用者名稱必須至少${min}個字元長。';
	@override String maxLength({required Object max}) => '使用者名稱最多${max}個字元長。';
}

// Path: register.validation.email
class TranslationsRegisterValidationEmailZh extends TranslationsRegisterValidationEmailEn {
	TranslationsRegisterValidationEmailZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get required => '電子郵件為必填。';
	@override String get invalid => '電子郵件無效。';
}

// Path: register.validation.password
class TranslationsRegisterValidationPasswordZh extends TranslationsRegisterValidationPasswordEn {
	TranslationsRegisterValidationPasswordZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get required => '密碼為必填。';
	@override String minLength({required Object min}) => '密碼必須至少${min}個字元長。';
}

// Path: passwordReset.validation.email
class TranslationsPasswordResetValidationEmailZh extends TranslationsPasswordResetValidationEmailEn {
	TranslationsPasswordResetValidationEmailZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get required => '電子郵件為必填。';
	@override String get invalid => '電子郵件無效。';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsZh {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.message.loading': return '載入中';
			case 'common.message.somethingWentWrong': return '出了問題';
			case 'common.message.networkProblem': return '網路有問題';
			case 'common.message.noDataFound': return '未找到資料';
			case 'common.message.noResultsFound': return '未找到結果';
			case 'common.message.unsupportedFileType': return '不支援的檔案類型';
			case 'common.message.fileTooLarge': return '檔案太大';
			case 'common.message.operationTimedOut': return '操作逾時';
			case 'common.message.sessionExpired': return '會話已過期';
			case 'common.message.unsavableChanges': return '無法儲存變更';
			case 'common.message.noServerConnect': return '無法連接到伺服器';
			case 'common.message.accessDenied': return '存取被拒絕';
			case 'common.game.start': return '開始遊戲';
			case 'common.game.pause': return '暫停遊戲';
			case 'common.game.resume': return '繼續遊戲';
			case 'common.game.end': return '結束遊戲';
			case 'common.game.levelUp': return '升級';
			case 'common.game.gameOver': return '遊戲結束';
			case 'common.game.nextLevel': return '下一關';
			case 'common.game.previousLevel': return '上一關';
			case 'common.game.restart': return '重新開始遊戲';
			case 'common.social.like': return '按讚';
			case 'common.social.share': return '分享';
			case 'common.social.comment': return '評論';
			case 'common.social.follow': return '追蹤';
			case 'common.social.unfollow': return '取消追蹤';
			case 'common.social.unlike': return '取消按讚';
			case 'common.social.reply': return '回覆';
			case 'common.social.dislike': return '不喜歡';
			case 'common.social.block': return '封鎖';
			case 'common.social.blockUser': return '封鎖使用者';
			case 'common.social.report': return '檢舉';
			case 'common.social.mute': return '靜音';
			case 'common.social.uSentFriendRequest': return '您發送了好友請求';
			case 'common.social.uReceivedFriendRequest': return '您收到了好友請求';
			case 'common.social.sentFriendRequest': return '發送了好友請求';
			case 'common.social.receivedFriendRequest': return '收到了好友請求';
			case 'common.social.acceptedFriendRequest': return '接受了好友請求';
			case 'common.social.uAcceptedFriendRequest': return '您接受了好友請求';
			case 'common.views.list': return '清單';
			case 'common.views.grid': return '網格';
			case 'common.views.table': return '表格';
			case 'common.views.form': return '表單';
			case 'common.units.length.kilometer': return '公里';
			case 'common.units.length.meter': return '公尺';
			case 'common.units.length.centimeter': return '公分';
			case 'common.units.length.millimeter': return '公釐';
			case 'common.units.length.micrometer': return '微米';
			case 'common.units.length.nanometer': return '奈米';
			case 'common.units.weight.kilogram': return '公斤';
			case 'common.units.weight.gram': return '公克';
			case 'common.units.weight.milligram': return '毫克';
			case 'common.units.weight.ton': return '公噸';
			case 'common.units.volume.liter': return '公升';
			case 'common.units.volume.milliliter': return '毫升';
			case 'common.units.volume.cubicMeter': return '立方公尺';
			case 'common.units.time.second': return '秒';
			case 'common.units.time.minute': return '分鐘';
			case 'common.units.time.hour': return '小時';
			case 'common.units.time.day': return '天';
			case 'common.units.time.week': return '週';
			case 'common.units.time.month': return '月';
			case 'common.units.time.year': return '年';
			case 'common.units.area.squareMeter': return '平方公尺';
			case 'common.units.area.hectare': return '公頃';
			case 'common.units.area.acre': return '英畝';
			case 'common.numbers.k1': return '一';
			case 'common.numbers.k2': return '二';
			case 'common.numbers.k3': return '三';
			case 'common.numbers.k4': return '四';
			case 'common.numbers.k5': return '五';
			case 'common.numbers.k6': return '六';
			case 'common.numbers.k7': return '七';
			case 'common.numbers.k8': return '八';
			case 'common.numbers.k9': return '九';
			case 'common.numbers.k10': return '十';
			case 'common.ranks.k1': return '第一';
			case 'common.ranks.k2': return '第二';
			case 'common.ranks.k3': return '第三';
			case 'common.ranks.k4': return '第四';
			case 'common.ranks.k5': return '第五';
			case 'common.ranks.k6': return '第六';
			case 'common.ranks.k7': return '第七';
			case 'common.ranks.k8': return '第八';
			case 'common.ranks.k9': return '第九';
			case 'common.ranks.k10': return '第十';
			case 'common.control.on': return '開';
			case 'common.control.off': return '關';
			case 'common.control.yes': return '是';
			case 'common.control.no': return '否';
			case 'common.control.confirm': return '確認';
			case 'common.control.cancel': return '取消';
			case 'common.control.retry': return '重試';
			case 'common.control.logout': return '登出';
			case 'common.control.edit': return '編輯';
			case 'common.control.delete': return '刪除';
			case 'common.control.revert': return '還原';
			case 'common.control.save': return '儲存';
			case 'common.buttons.submit': return '提交';
			case 'common.buttons.close': return '關閉';
			case 'common.buttons.reset': return '重置';
			case 'common.buttons.cancel': return '取消';
			case 'common.buttons.kContinue': return '繼續';
			case 'common.buttons.back': return '返回';
			case 'common.buttons.next': return '下一步';
			case 'common.buttons.done': return '完成';
			case 'common.buttons.upload': return '上傳';
			case 'common.buttons.choose': return '選擇';
			case 'common.buttons.select': return '選取';
			case 'common.buttons.clear': return '清除';
			case 'common.buttons.start': return '開始';
			case 'common.labels.required': return '必填';
			case 'common.labels.optional': return '可選';
			case 'common.labels.instructions': return '說明:';
			case 'common.labels.status': return '狀態';
			case 'common.labels.progress': return '進度';
			case 'common.labels.question': return '問題';
			case 'common.labels.answer': return '答案';
			case 'common.labels.response': return '回覆';
			case 'common.labels.loading': return '載入中...';
			case 'common.labels.error': return '錯誤';
			case 'common.labels.success': return '成功';
			case 'common.labels.warning': return '警告';
			case 'common.response.success': return '成功';
			case 'common.response.error': return '錯誤';
			case 'common.response.info': return '資訊';
			case 'common.response.warning': return '警告';
			case 'common.response.tbd': return '待定';
			case 'common.response.wip': return '進行中';
			case 'common.priority.high': return '高';
			case 'common.priority.medium': return '中';
			case 'common.priority.low': return '低';
			case 'common.date.today': return '今天';
			case 'common.date.yesterday': return '昨天';
			case 'common.date.tomorrow': return '明天';
			case 'common.date.justNow': return '剛才';
			case 'common.date.aMomentAgo': return '剛剛';
			case 'common.date.minutesAgo': return '幾分鐘前';
			case 'common.date.hoursAgo': return '幾小時前';
			case 'common.date.daysAgo': return ({required Object days}) => '${days}天前';
			case 'common.date.weeksAgo': return '幾週前';
			case 'common.date.thisWeek': return '本週';
			case 'common.date.lastWeek': return '上週';
			case 'common.date.thisMonth': return '本月';
			case 'common.date.lastMonth': return '上月';
			case 'common.date.thisYear': return '今年';
			case 'common.date.lastYear': return '去年';
			case 'common.date.daysAhead': return ({required Object days}) => '${days}天後';
			case 'common.weekdays.full.sunday': return '星期日';
			case 'common.weekdays.full.monday': return '星期一';
			case 'common.weekdays.full.tuesday': return '星期二';
			case 'common.weekdays.full.wednesday': return '星期三';
			case 'common.weekdays.full.thursday': return '星期四';
			case 'common.weekdays.full.friday': return '星期五';
			case 'common.weekdays.full.saturday': return '星期六';
			case 'common.weekdays.short.sunday': return '日';
			case 'common.weekdays.short.monday': return '一';
			case 'common.weekdays.short.tuesday': return '二';
			case 'common.weekdays.short.wednesday': return '三';
			case 'common.weekdays.short.thursday': return '四';
			case 'common.weekdays.short.friday': return '五';
			case 'common.weekdays.short.saturday': return '六';
			case 'common.formRestrictions.required': return '此欄位為必填。';
			case 'common.formRestrictions.minLength': return ({required Object min}) => '最小長度為${min}個字元。';
			case 'common.formRestrictions.maxLength': return ({required Object max}) => '最大長度為${max}個字元。';
			case 'common.formRestrictions.invalidFormat': return '格式無效。';
			case 'common.formRestrictions.pattern': return ({required Object pattern}) => '此欄位必須遵循模式${pattern}。';
			case 'common.tos.accept': return '我接受條款與條件';
			case 'common.tos.readAccept': return '請閱讀並接受我們的條款與條件';
			case 'common.tos.title': return '條款與條件';
			case 'common.tos.service': return '服務條款';
			case 'common.tos.privacy': return '隱私政策';
			case 'common.tos.continueAgree': return '繼續即表示您同意我們的條款與條件';
			case 'common.tos.mustAccept': return '您必須接受條款與條件才能繼續';
			case 'common.tos.view': return '查看條款與條件';
			case 'common.tos.lastUpdated': return ({required Object date}) => '最後更新：${date}';
			case 'common.tos.contactInfo': return '如需了解有關我們條款與條件的更多資訊，請聯繫我們';
			case 'common.permissions.allowLocation': return '允許存取位置？';
			case 'common.permissions.allowCamera': return '允許存取相機？';
			case 'common.permissions.allowMicrophone': return '允許存取麥克風？';
			case 'common.permissions.allowNotifications': return '允許通知？';
			case 'common.permissions.allowContacts': return '允許存取聯絡人？';
			case 'common.permissions.allowPhotos': return '允許存取照片？';
			case 'common.permissions.allowStorage': return '允許存取儲存空間？';
			case 'common.permissions.allowBluetooth': return '允許藍牙存取？';
			case 'common.permissions.needPermission': return '我們需要您的許可才能繼續';
			case 'common.permissions.permissionDenied': return '權限被拒絕';
			case 'common.permissions.permissionRequired': return '此權限為必需';
			case 'common.permissions.enableInSettings': return '請在設定中啟用';
			case 'common.prompts.sessionExpired': return '您的會話已過期';
			case 'common.prompts.areYouSure': return '您確定嗎？';
			case 'common.prompts.cannotBeUndone': return '此操作無法復原';
			case 'common.prompts.unsavedChanges': return '您有未儲存的變更';
			case 'common.prompts.discardChanges': return '捨棄變更？';
			case 'common.prompts.locationDisabled': return '位置服務已停用';
			case 'common.prompts.networkRequired': return '需要網路連線';
			case 'common.prompts.loginRequired': return '需要登入才能繼續';
			case 'common.prompts.confirmDelete': return '您確定要刪除此項目嗎？';
			case 'common.prompts.confirmLogout': return '您確定要登出嗎？';
			case 'common.prompts.saveBeforeExit': return '離開前要儲存嗎？';
			case 'common.prompts.reloadPage': return '您要重新載入頁面嗎？';
			case 'common.prompts.updateAvailable': return '有可用更新';
			case 'common.prompts.restartRequired': return '需要重新啟動以套用變更';
			case 'login.message.success': return '登入成功。';
			case 'login.message.error': return '登入失敗。請重試。';
			case 'login.message.wrongPassword': return '請驗證您的憑證。';
			case 'login.form.username': return '使用者名稱';
			case 'login.form.password': return '密碼';
			case 'login.form.submit': return '登入';
			case 'login.form.createAccount': return '建立新帳戶';
			case 'login.form.forgotPassword': return '忘記密碼';
			case 'login.tooltip.username': return '輸入您的使用者名稱';
			case 'login.tooltip.password': return '輸入您的密碼';
			case 'login.tooltip.submit': return '點擊登入';
			case 'login.validation.username.required': return '使用者名稱為必填。';
			case 'login.validation.password.required': return '密碼為必填。';
			case 'register.message.success': return '註冊成功。';
			case 'register.message.error': return '註冊失敗。請重試。';
			case 'register.form.username': return '使用者名稱';
			case 'register.form.email': return '電子郵件';
			case 'register.form.password': return '密碼';
			case 'register.form.submit': return '註冊';
			case 'register.form.acceptTos': return '我接受服務條款';
			case 'register.tooltip.username': return '輸入您的使用者名稱';
			case 'register.tooltip.email': return '輸入您的電子郵件';
			case 'register.tooltip.password': return '輸入您的密碼';
			case 'register.tooltip.submit': return '點擊註冊';
			case 'register.validation.username.required': return '使用者名稱為必填。';
			case 'register.validation.username.minLength': return ({required Object min}) => '使用者名稱必須至少${min}個字元長。';
			case 'register.validation.username.maxLength': return ({required Object max}) => '使用者名稱最多${max}個字元長。';
			case 'register.validation.email.required': return '電子郵件為必填。';
			case 'register.validation.email.invalid': return '電子郵件無效。';
			case 'register.validation.password.required': return '密碼為必填。';
			case 'register.validation.password.minLength': return ({required Object min}) => '密碼必須至少${min}個字元長。';
			case 'passwordReset.message.success': return '密碼重設郵件已發送。';
			case 'passwordReset.message.error': return '密碼重設失敗。請重試。';
			case 'passwordReset.form.email': return '電子郵件';
			case 'passwordReset.form.submit': return '重設密碼';
			case 'passwordReset.tooltip.email': return '輸入您的電子郵件';
			case 'passwordReset.tooltip.submit': return '點擊重設密碼';
			case 'passwordReset.validation.email.required': return '電子郵件為必填。';
			case 'passwordReset.validation.email.invalid': return '電子郵件無效。';
			case 'languages.current.en': return '英語';
			case 'languages.current.da': return '丹麥語';
			case 'languages.current.es': return '西班牙語';
			case 'languages.current.fr': return '法語';
			case 'languages.current.he': return '希伯來語';
			case 'languages.current.isIS': return '冰島語';
			case 'languages.current.ko': return '韓語';
			case 'languages.current.nb': return '挪威語 (書面語)';
			case 'languages.current.nl': return '荷蘭語';
			case 'languages.current.no': return '挪威語';
			case 'languages.current.sv': return '瑞典語';
			case 'languages.current.zhHans': return '中文 (簡體)';
			case 'languages.current.zh': return '中文 (繁體)';
			default: return null;
		}
	}
}

