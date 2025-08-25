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
class TranslationsZhHans extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhHans({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhHans,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-Hans>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsZhHans _root = this; // ignore: unused_field

	@override 
	TranslationsZhHans $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhHans(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsCommonZhHans common = TranslationsCommonZhHans._(_root);
	@override late final TranslationsLoginZhHans login = TranslationsLoginZhHans._(_root);
	@override late final TranslationsRegisterZhHans register = TranslationsRegisterZhHans._(_root);
	@override late final TranslationsPasswordResetZhHans passwordReset = TranslationsPasswordResetZhHans._(_root);
}

// Path: common
class TranslationsCommonZhHans extends TranslationsCommonEn {
	TranslationsCommonZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMessageZhHans message = TranslationsCommonMessageZhHans._(_root);
	@override late final TranslationsCommonGameZhHans game = TranslationsCommonGameZhHans._(_root);
	@override late final TranslationsCommonSocialZhHans social = TranslationsCommonSocialZhHans._(_root);
	@override late final TranslationsCommonViewsZhHans views = TranslationsCommonViewsZhHans._(_root);
	@override late final TranslationsCommonUnitsZhHans units = TranslationsCommonUnitsZhHans._(_root);
	@override late final TranslationsCommonNumbersZhHans numbers = TranslationsCommonNumbersZhHans._(_root);
	@override late final TranslationsCommonRanksZhHans ranks = TranslationsCommonRanksZhHans._(_root);
	@override late final TranslationsCommonControlZhHans control = TranslationsCommonControlZhHans._(_root);
	@override late final TranslationsCommonButtonsZhHans buttons = TranslationsCommonButtonsZhHans._(_root);
	@override late final TranslationsCommonLabelsZhHans labels = TranslationsCommonLabelsZhHans._(_root);
	@override late final TranslationsCommonResponseZhHans response = TranslationsCommonResponseZhHans._(_root);
	@override late final TranslationsCommonPriorityZhHans priority = TranslationsCommonPriorityZhHans._(_root);
	@override late final TranslationsCommonDateZhHans date = TranslationsCommonDateZhHans._(_root);
	@override late final TranslationsCommonWeekdaysZhHans weekdays = TranslationsCommonWeekdaysZhHans._(_root);
	@override late final TranslationsCommonFormRestrictionsZhHans formRestrictions = TranslationsCommonFormRestrictionsZhHans._(_root);
	@override late final TranslationsCommonTosZhHans tos = TranslationsCommonTosZhHans._(_root);
	@override late final TranslationsCommonPermissionsZhHans permissions = TranslationsCommonPermissionsZhHans._(_root);
	@override late final TranslationsCommonPromptsZhHans prompts = TranslationsCommonPromptsZhHans._(_root);
}

// Path: login
class TranslationsLoginZhHans extends TranslationsLoginEn {
	TranslationsLoginZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginMessageZhHans message = TranslationsLoginMessageZhHans._(_root);
	@override late final TranslationsLoginFormZhHans form = TranslationsLoginFormZhHans._(_root);
	@override late final TranslationsLoginTooltipZhHans tooltip = TranslationsLoginTooltipZhHans._(_root);
	@override late final TranslationsLoginValidationZhHans validation = TranslationsLoginValidationZhHans._(_root);
}

// Path: register
class TranslationsRegisterZhHans extends TranslationsRegisterEn {
	TranslationsRegisterZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterMessageZhHans message = TranslationsRegisterMessageZhHans._(_root);
	@override late final TranslationsRegisterFormZhHans form = TranslationsRegisterFormZhHans._(_root);
	@override late final TranslationsRegisterTooltipZhHans tooltip = TranslationsRegisterTooltipZhHans._(_root);
	@override late final TranslationsRegisterValidationZhHans validation = TranslationsRegisterValidationZhHans._(_root);
}

// Path: passwordReset
class TranslationsPasswordResetZhHans extends TranslationsPasswordResetEn {
	TranslationsPasswordResetZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetMessageZhHans message = TranslationsPasswordResetMessageZhHans._(_root);
	@override late final TranslationsPasswordResetFormZhHans form = TranslationsPasswordResetFormZhHans._(_root);
	@override late final TranslationsPasswordResetTooltipZhHans tooltip = TranslationsPasswordResetTooltipZhHans._(_root);
	@override late final TranslationsPasswordResetValidationZhHans validation = TranslationsPasswordResetValidationZhHans._(_root);
}

// Path: common.message
class TranslationsCommonMessageZhHans extends TranslationsCommonMessageEn {
	TranslationsCommonMessageZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get loading => '正在加载';
	@override String get somethingWentWrong => '出了点问题';
	@override String get networkProblem => '网络有问题';
	@override String get noDataFound => '未找到数据';
	@override String get noResultsFound => '未找到结果';
	@override String get unsupportedFileType => '不支持的文件类型';
	@override String get fileTooLarge => '文件太大';
	@override String get operationTimedOut => '操作超时';
	@override String get sessionExpired => '会话已过期';
	@override String get unsavableChanges => '无法保存更改';
	@override String get noServerConnect => '无法连接到服务器';
	@override String get accessDenied => '访问被拒绝';
}

// Path: common.game
class TranslationsCommonGameZhHans extends TranslationsCommonGameEn {
	TranslationsCommonGameZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get start => '开始游戏';
	@override String get pause => '暂停游戏';
	@override String get resume => '继续游戏';
	@override String get end => '结束游戏';
	@override String get levelUp => '升级';
	@override String get gameOver => '游戏结束';
	@override String get nextLevel => '下一关';
	@override String get previousLevel => '上一关';
	@override String get restart => '重新开始游戏';
}

// Path: common.social
class TranslationsCommonSocialZhHans extends TranslationsCommonSocialEn {
	TranslationsCommonSocialZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get like => '点赞';
	@override String get share => '分享';
	@override String get comment => '评论';
	@override String get follow => '关注';
	@override String get unfollow => '取消关注';
	@override String get unlike => '取消点赞';
	@override String get reply => '回复';
	@override String get dislike => '不喜欢';
	@override String get block => '屏蔽';
	@override String get blockUser => '屏蔽用户';
	@override String get report => '举报';
	@override String get mute => '静音';
	@override String get uSentFriendRequest => '您发送了好友请求';
	@override String get uReceivedFriendRequest => '您收到了好友请求';
	@override String get sentFriendRequest => '发送了好友请求';
	@override String get receivedFriendRequest => '收到了好友请求';
	@override String get acceptedFriendRequest => '接受了好友请求';
	@override String get uAcceptedFriendRequest => '您接受了好友请求';
}

// Path: common.views
class TranslationsCommonViewsZhHans extends TranslationsCommonViewsEn {
	TranslationsCommonViewsZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get list => '列表';
	@override String get grid => '网格';
	@override String get table => '表格';
	@override String get form => '表单';
}

// Path: common.units
class TranslationsCommonUnitsZhHans extends TranslationsCommonUnitsEn {
	TranslationsCommonUnitsZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonUnitsLengthZhHans length = TranslationsCommonUnitsLengthZhHans._(_root);
	@override late final TranslationsCommonUnitsWeightZhHans weight = TranslationsCommonUnitsWeightZhHans._(_root);
	@override late final TranslationsCommonUnitsVolumeZhHans volume = TranslationsCommonUnitsVolumeZhHans._(_root);
	@override late final TranslationsCommonUnitsTimeZhHans time = TranslationsCommonUnitsTimeZhHans._(_root);
	@override late final TranslationsCommonUnitsAreaZhHans area = TranslationsCommonUnitsAreaZhHans._(_root);
}

// Path: common.numbers
class TranslationsCommonNumbersZhHans extends TranslationsCommonNumbersEn {
	TranslationsCommonNumbersZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

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
class TranslationsCommonRanksZhHans extends TranslationsCommonRanksEn {
	TranslationsCommonRanksZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

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
class TranslationsCommonControlZhHans extends TranslationsCommonControlEn {
	TranslationsCommonControlZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get on => '开';
	@override String get off => '关';
	@override String get yes => '是';
	@override String get no => '否';
	@override String get confirm => '确认';
	@override String get cancel => '取消';
	@override String get retry => '重试';
	@override String get logout => '退出登录';
	@override String get edit => '编辑';
	@override String get delete => '删除';
	@override String get revert => '恢复';
	@override String get save => '保存';
}

// Path: common.buttons
class TranslationsCommonButtonsZhHans extends TranslationsCommonButtonsEn {
	TranslationsCommonButtonsZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get submit => '提交';
	@override String get close => '关闭';
	@override String get reset => '重置';
	@override String get cancel => '取消';
	@override String get kContinue => '继续';
	@override String get back => '返回';
	@override String get next => '下一步';
	@override String get done => '完成';
	@override String get upload => '上传';
	@override String get choose => '选择';
	@override String get select => '选择';
	@override String get clear => '清除';
	@override String get start => '开始';
}

// Path: common.labels
class TranslationsCommonLabelsZhHans extends TranslationsCommonLabelsEn {
	TranslationsCommonLabelsZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get required => '必填';
	@override String get optional => '可选';
	@override String get instructions => '说明:';
	@override String get status => '状态';
	@override String get progress => '进度';
	@override String get question => '问题';
	@override String get answer => '答案';
	@override String get response => '回复';
	@override String get loading => '加载中...';
	@override String get error => '错误';
	@override String get success => '成功';
	@override String get warning => '警告';
}

// Path: common.response
class TranslationsCommonResponseZhHans extends TranslationsCommonResponseEn {
	TranslationsCommonResponseZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get success => '成功';
	@override String get error => '错误';
	@override String get info => '信息';
	@override String get warning => '警告';
	@override String get tbd => '待定';
	@override String get wip => '正在进行';
}

// Path: common.priority
class TranslationsCommonPriorityZhHans extends TranslationsCommonPriorityEn {
	TranslationsCommonPriorityZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get high => '高';
	@override String get medium => '中';
	@override String get low => '低';
}

// Path: common.date
class TranslationsCommonDateZhHans extends TranslationsCommonDateEn {
	TranslationsCommonDateZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get today => '今天';
	@override String get yesterday => '昨天';
	@override String get tomorrow => '明天';
	@override String get justNow => '刚刚';
	@override String get aMomentAgo => '刚才';
	@override String get minutesAgo => '几分钟前';
	@override String get hoursAgo => '几小时前';
	@override String daysAgo({required Object days}) => '${days}天前';
	@override String get weeksAgo => '几周前';
	@override String get thisWeek => '本周';
	@override String get lastWeek => '上周';
	@override String get thisMonth => '本月';
	@override String get lastMonth => '上月';
	@override String get thisYear => '今年';
	@override String get lastYear => '去年';
	@override String daysAhead({required Object days}) => '${days}天后';
}

// Path: common.weekdays
class TranslationsCommonWeekdaysZhHans extends TranslationsCommonWeekdaysEn {
	TranslationsCommonWeekdaysZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonWeekdaysFullZhHans full = TranslationsCommonWeekdaysFullZhHans._(_root);
	@override late final TranslationsCommonWeekdaysShortZhHans short = TranslationsCommonWeekdaysShortZhHans._(_root);
}

// Path: common.formRestrictions
class TranslationsCommonFormRestrictionsZhHans extends TranslationsCommonFormRestrictionsEn {
	TranslationsCommonFormRestrictionsZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get required => '此字段为必填项。';
	@override String minLength({required Object min}) => '最小长度为${min}个字符。';
	@override String maxLength({required Object max}) => '最大长度为${max}个字符。';
	@override String get invalidFormat => '格式无效。';
	@override String pattern({required Object pattern}) => '此字段必须遵循模式${pattern}。';
}

// Path: common.tos
class TranslationsCommonTosZhHans extends TranslationsCommonTosEn {
	TranslationsCommonTosZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get accept => '我接受条款和条件';
	@override String get readAccept => '请阅读并接受我们的条款和条件';
	@override String get title => '条款和条件';
	@override String get service => '服务条款';
	@override String get privacy => '隐私政策';
	@override String get continueAgree => '继续即表示您同意我们的条款和条件';
	@override String get mustAccept => '您必须接受条款和条件才能继续';
	@override String get view => '查看条款和条件';
	@override String lastUpdated({required Object date}) => '最后更新：${date}';
	@override String get contactInfo => '如需了解有关我们条款和条件的更多信息，请联系我们';
}

// Path: common.permissions
class TranslationsCommonPermissionsZhHans extends TranslationsCommonPermissionsEn {
	TranslationsCommonPermissionsZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get allowLocation => '允许访问位置？';
	@override String get allowCamera => '允许访问摄像头？';
	@override String get allowMicrophone => '允许访问麦克风？';
	@override String get allowNotifications => '允许通知？';
	@override String get allowContacts => '允许访问联系人？';
	@override String get allowPhotos => '允许访问照片？';
	@override String get allowStorage => '允许访问存储？';
	@override String get allowBluetooth => '允许蓝牙访问？';
	@override String get needPermission => '我们需要您的许可才能继续';
	@override String get permissionDenied => '权限被拒绝';
	@override String get permissionRequired => '此权限是必需的';
	@override String get enableInSettings => '请在设置中启用';
}

// Path: common.prompts
class TranslationsCommonPromptsZhHans extends TranslationsCommonPromptsEn {
	TranslationsCommonPromptsZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get sessionExpired => '您的会话已过期';
	@override String get areYouSure => '您确定吗？';
	@override String get cannotBeUndone => '此操作无法撤销';
	@override String get unsavedChanges => '您有未保存的更改';
	@override String get discardChanges => '丢弃更改？';
	@override String get locationDisabled => '位置服务已禁用';
	@override String get networkRequired => '需要网络连接';
	@override String get loginRequired => '需要登录才能继续';
	@override String get confirmDelete => '您确定要删除这个吗？';
	@override String get confirmLogout => '您确定要退出登录吗？';
	@override String get saveBeforeExit => '退出前要保存吗？';
	@override String get reloadPage => '您要重新加载页面吗？';
	@override String get updateAvailable => '有可用更新';
	@override String get restartRequired => '需要重启以应用更改';
}

// Path: login.message
class TranslationsLoginMessageZhHans extends TranslationsLoginMessageEn {
	TranslationsLoginMessageZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get success => '登录成功。';
	@override String get error => '登录失败。请重试。';
	@override String get wrongPassword => '请验证您的凭据。';
}

// Path: login.form
class TranslationsLoginFormZhHans extends TranslationsLoginFormEn {
	TranslationsLoginFormZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get username => '用户名';
	@override String get password => '密码';
	@override String get submit => '登录';
	@override String get createAccount => '创建新帐户';
	@override String get forgotPassword => '忘记密码';
}

// Path: login.tooltip
class TranslationsLoginTooltipZhHans extends TranslationsLoginTooltipEn {
	TranslationsLoginTooltipZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get username => '输入您的用户名';
	@override String get password => '输入您的密码';
	@override String get submit => '点击登录';
}

// Path: login.validation
class TranslationsLoginValidationZhHans extends TranslationsLoginValidationEn {
	TranslationsLoginValidationZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginValidationUsernameZhHans username = TranslationsLoginValidationUsernameZhHans._(_root);
	@override late final TranslationsLoginValidationPasswordZhHans password = TranslationsLoginValidationPasswordZhHans._(_root);
}

// Path: register.message
class TranslationsRegisterMessageZhHans extends TranslationsRegisterMessageEn {
	TranslationsRegisterMessageZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get success => '注册成功。';
	@override String get error => '注册失败。请重试。';
}

// Path: register.form
class TranslationsRegisterFormZhHans extends TranslationsRegisterFormEn {
	TranslationsRegisterFormZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get username => '用户名';
	@override String get email => '电子邮件';
	@override String get password => '密码';
	@override String get submit => '注册';
	@override String get acceptTos => '我接受服务条款';
}

// Path: register.tooltip
class TranslationsRegisterTooltipZhHans extends TranslationsRegisterTooltipEn {
	TranslationsRegisterTooltipZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get username => '输入您的用户名';
	@override String get email => '输入您的电子邮件';
	@override String get password => '输入您的密码';
	@override String get submit => '点击注册';
}

// Path: register.validation
class TranslationsRegisterValidationZhHans extends TranslationsRegisterValidationEn {
	TranslationsRegisterValidationZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterValidationUsernameZhHans username = TranslationsRegisterValidationUsernameZhHans._(_root);
	@override late final TranslationsRegisterValidationEmailZhHans email = TranslationsRegisterValidationEmailZhHans._(_root);
	@override late final TranslationsRegisterValidationPasswordZhHans password = TranslationsRegisterValidationPasswordZhHans._(_root);
}

// Path: passwordReset.message
class TranslationsPasswordResetMessageZhHans extends TranslationsPasswordResetMessageEn {
	TranslationsPasswordResetMessageZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get success => '密码重置邮件已发送。';
	@override String get error => '密码重置失败。请重试。';
}

// Path: passwordReset.form
class TranslationsPasswordResetFormZhHans extends TranslationsPasswordResetFormEn {
	TranslationsPasswordResetFormZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get email => '电子邮件';
	@override String get submit => '重置密码';
}

// Path: passwordReset.tooltip
class TranslationsPasswordResetTooltipZhHans extends TranslationsPasswordResetTooltipEn {
	TranslationsPasswordResetTooltipZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get email => '输入您的电子邮件';
	@override String get submit => '点击重置密码';
}

// Path: passwordReset.validation
class TranslationsPasswordResetValidationZhHans extends TranslationsPasswordResetValidationEn {
	TranslationsPasswordResetValidationZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetValidationEmailZhHans email = TranslationsPasswordResetValidationEmailZhHans._(_root);
}

// Path: common.units.length
class TranslationsCommonUnitsLengthZhHans extends TranslationsCommonUnitsLengthEn {
	TranslationsCommonUnitsLengthZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get kilometer => '千米';
	@override String get meter => '米';
	@override String get centimeter => '厘米';
	@override String get millimeter => '毫米';
	@override String get micrometer => '微米';
	@override String get nanometer => '纳米';
}

// Path: common.units.weight
class TranslationsCommonUnitsWeightZhHans extends TranslationsCommonUnitsWeightEn {
	TranslationsCommonUnitsWeightZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get kilogram => '千克';
	@override String get gram => '克';
	@override String get milligram => '毫克';
	@override String get ton => '吨';
}

// Path: common.units.volume
class TranslationsCommonUnitsVolumeZhHans extends TranslationsCommonUnitsVolumeEn {
	TranslationsCommonUnitsVolumeZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get liter => '升';
	@override String get milliliter => '毫升';
	@override String get cubicMeter => '立方米';
}

// Path: common.units.time
class TranslationsCommonUnitsTimeZhHans extends TranslationsCommonUnitsTimeEn {
	TranslationsCommonUnitsTimeZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get second => '秒';
	@override String get minute => '分钟';
	@override String get hour => '小时';
	@override String get day => '天';
	@override String get week => '周';
	@override String get month => '月';
	@override String get year => '年';
}

// Path: common.units.area
class TranslationsCommonUnitsAreaZhHans extends TranslationsCommonUnitsAreaEn {
	TranslationsCommonUnitsAreaZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get squareMeter => '平方米';
	@override String get hectare => '公顷';
	@override String get acre => '英亩';
}

// Path: common.weekdays.full
class TranslationsCommonWeekdaysFullZhHans extends TranslationsCommonWeekdaysFullEn {
	TranslationsCommonWeekdaysFullZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

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
class TranslationsCommonWeekdaysShortZhHans extends TranslationsCommonWeekdaysShortEn {
	TranslationsCommonWeekdaysShortZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

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
class TranslationsLoginValidationUsernameZhHans extends TranslationsLoginValidationUsernameEn {
	TranslationsLoginValidationUsernameZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get required => '用户名是必需的。';
}

// Path: login.validation.password
class TranslationsLoginValidationPasswordZhHans extends TranslationsLoginValidationPasswordEn {
	TranslationsLoginValidationPasswordZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get required => '密码是必需的。';
}

// Path: register.validation.username
class TranslationsRegisterValidationUsernameZhHans extends TranslationsRegisterValidationUsernameEn {
	TranslationsRegisterValidationUsernameZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get required => '用户名是必需的。';
	@override String minLength({required Object min}) => '用户名必须至少${min}个字符长。';
	@override String maxLength({required Object max}) => '用户名最多${max}个字符长。';
}

// Path: register.validation.email
class TranslationsRegisterValidationEmailZhHans extends TranslationsRegisterValidationEmailEn {
	TranslationsRegisterValidationEmailZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get required => '电子邮件是必需的。';
	@override String get invalid => '电子邮件无效。';
}

// Path: register.validation.password
class TranslationsRegisterValidationPasswordZhHans extends TranslationsRegisterValidationPasswordEn {
	TranslationsRegisterValidationPasswordZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get required => '密码是必需的。';
	@override String minLength({required Object min}) => '密码必须至少${min}个字符长。';
}

// Path: passwordReset.validation.email
class TranslationsPasswordResetValidationEmailZhHans extends TranslationsPasswordResetValidationEmailEn {
	TranslationsPasswordResetValidationEmailZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get required => '电子邮件是必需的。';
	@override String get invalid => '电子邮件无效。';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsZhHans {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.message.loading': return '正在加载';
			case 'common.message.somethingWentWrong': return '出了点问题';
			case 'common.message.networkProblem': return '网络有问题';
			case 'common.message.noDataFound': return '未找到数据';
			case 'common.message.noResultsFound': return '未找到结果';
			case 'common.message.unsupportedFileType': return '不支持的文件类型';
			case 'common.message.fileTooLarge': return '文件太大';
			case 'common.message.operationTimedOut': return '操作超时';
			case 'common.message.sessionExpired': return '会话已过期';
			case 'common.message.unsavableChanges': return '无法保存更改';
			case 'common.message.noServerConnect': return '无法连接到服务器';
			case 'common.message.accessDenied': return '访问被拒绝';
			case 'common.game.start': return '开始游戏';
			case 'common.game.pause': return '暂停游戏';
			case 'common.game.resume': return '继续游戏';
			case 'common.game.end': return '结束游戏';
			case 'common.game.levelUp': return '升级';
			case 'common.game.gameOver': return '游戏结束';
			case 'common.game.nextLevel': return '下一关';
			case 'common.game.previousLevel': return '上一关';
			case 'common.game.restart': return '重新开始游戏';
			case 'common.social.like': return '点赞';
			case 'common.social.share': return '分享';
			case 'common.social.comment': return '评论';
			case 'common.social.follow': return '关注';
			case 'common.social.unfollow': return '取消关注';
			case 'common.social.unlike': return '取消点赞';
			case 'common.social.reply': return '回复';
			case 'common.social.dislike': return '不喜欢';
			case 'common.social.block': return '屏蔽';
			case 'common.social.blockUser': return '屏蔽用户';
			case 'common.social.report': return '举报';
			case 'common.social.mute': return '静音';
			case 'common.social.uSentFriendRequest': return '您发送了好友请求';
			case 'common.social.uReceivedFriendRequest': return '您收到了好友请求';
			case 'common.social.sentFriendRequest': return '发送了好友请求';
			case 'common.social.receivedFriendRequest': return '收到了好友请求';
			case 'common.social.acceptedFriendRequest': return '接受了好友请求';
			case 'common.social.uAcceptedFriendRequest': return '您接受了好友请求';
			case 'common.views.list': return '列表';
			case 'common.views.grid': return '网格';
			case 'common.views.table': return '表格';
			case 'common.views.form': return '表单';
			case 'common.units.length.kilometer': return '千米';
			case 'common.units.length.meter': return '米';
			case 'common.units.length.centimeter': return '厘米';
			case 'common.units.length.millimeter': return '毫米';
			case 'common.units.length.micrometer': return '微米';
			case 'common.units.length.nanometer': return '纳米';
			case 'common.units.weight.kilogram': return '千克';
			case 'common.units.weight.gram': return '克';
			case 'common.units.weight.milligram': return '毫克';
			case 'common.units.weight.ton': return '吨';
			case 'common.units.volume.liter': return '升';
			case 'common.units.volume.milliliter': return '毫升';
			case 'common.units.volume.cubicMeter': return '立方米';
			case 'common.units.time.second': return '秒';
			case 'common.units.time.minute': return '分钟';
			case 'common.units.time.hour': return '小时';
			case 'common.units.time.day': return '天';
			case 'common.units.time.week': return '周';
			case 'common.units.time.month': return '月';
			case 'common.units.time.year': return '年';
			case 'common.units.area.squareMeter': return '平方米';
			case 'common.units.area.hectare': return '公顷';
			case 'common.units.area.acre': return '英亩';
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
			case 'common.control.on': return '开';
			case 'common.control.off': return '关';
			case 'common.control.yes': return '是';
			case 'common.control.no': return '否';
			case 'common.control.confirm': return '确认';
			case 'common.control.cancel': return '取消';
			case 'common.control.retry': return '重试';
			case 'common.control.logout': return '退出登录';
			case 'common.control.edit': return '编辑';
			case 'common.control.delete': return '删除';
			case 'common.control.revert': return '恢复';
			case 'common.control.save': return '保存';
			case 'common.buttons.submit': return '提交';
			case 'common.buttons.close': return '关闭';
			case 'common.buttons.reset': return '重置';
			case 'common.buttons.cancel': return '取消';
			case 'common.buttons.kContinue': return '继续';
			case 'common.buttons.back': return '返回';
			case 'common.buttons.next': return '下一步';
			case 'common.buttons.done': return '完成';
			case 'common.buttons.upload': return '上传';
			case 'common.buttons.choose': return '选择';
			case 'common.buttons.select': return '选择';
			case 'common.buttons.clear': return '清除';
			case 'common.buttons.start': return '开始';
			case 'common.labels.required': return '必填';
			case 'common.labels.optional': return '可选';
			case 'common.labels.instructions': return '说明:';
			case 'common.labels.status': return '状态';
			case 'common.labels.progress': return '进度';
			case 'common.labels.question': return '问题';
			case 'common.labels.answer': return '答案';
			case 'common.labels.response': return '回复';
			case 'common.labels.loading': return '加载中...';
			case 'common.labels.error': return '错误';
			case 'common.labels.success': return '成功';
			case 'common.labels.warning': return '警告';
			case 'common.response.success': return '成功';
			case 'common.response.error': return '错误';
			case 'common.response.info': return '信息';
			case 'common.response.warning': return '警告';
			case 'common.response.tbd': return '待定';
			case 'common.response.wip': return '正在进行';
			case 'common.priority.high': return '高';
			case 'common.priority.medium': return '中';
			case 'common.priority.low': return '低';
			case 'common.date.today': return '今天';
			case 'common.date.yesterday': return '昨天';
			case 'common.date.tomorrow': return '明天';
			case 'common.date.justNow': return '刚刚';
			case 'common.date.aMomentAgo': return '刚才';
			case 'common.date.minutesAgo': return '几分钟前';
			case 'common.date.hoursAgo': return '几小时前';
			case 'common.date.daysAgo': return ({required Object days}) => '${days}天前';
			case 'common.date.weeksAgo': return '几周前';
			case 'common.date.thisWeek': return '本周';
			case 'common.date.lastWeek': return '上周';
			case 'common.date.thisMonth': return '本月';
			case 'common.date.lastMonth': return '上月';
			case 'common.date.thisYear': return '今年';
			case 'common.date.lastYear': return '去年';
			case 'common.date.daysAhead': return ({required Object days}) => '${days}天后';
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
			case 'common.formRestrictions.required': return '此字段为必填项。';
			case 'common.formRestrictions.minLength': return ({required Object min}) => '最小长度为${min}个字符。';
			case 'common.formRestrictions.maxLength': return ({required Object max}) => '最大长度为${max}个字符。';
			case 'common.formRestrictions.invalidFormat': return '格式无效。';
			case 'common.formRestrictions.pattern': return ({required Object pattern}) => '此字段必须遵循模式${pattern}。';
			case 'common.tos.accept': return '我接受条款和条件';
			case 'common.tos.readAccept': return '请阅读并接受我们的条款和条件';
			case 'common.tos.title': return '条款和条件';
			case 'common.tos.service': return '服务条款';
			case 'common.tos.privacy': return '隐私政策';
			case 'common.tos.continueAgree': return '继续即表示您同意我们的条款和条件';
			case 'common.tos.mustAccept': return '您必须接受条款和条件才能继续';
			case 'common.tos.view': return '查看条款和条件';
			case 'common.tos.lastUpdated': return ({required Object date}) => '最后更新：${date}';
			case 'common.tos.contactInfo': return '如需了解有关我们条款和条件的更多信息，请联系我们';
			case 'common.permissions.allowLocation': return '允许访问位置？';
			case 'common.permissions.allowCamera': return '允许访问摄像头？';
			case 'common.permissions.allowMicrophone': return '允许访问麦克风？';
			case 'common.permissions.allowNotifications': return '允许通知？';
			case 'common.permissions.allowContacts': return '允许访问联系人？';
			case 'common.permissions.allowPhotos': return '允许访问照片？';
			case 'common.permissions.allowStorage': return '允许访问存储？';
			case 'common.permissions.allowBluetooth': return '允许蓝牙访问？';
			case 'common.permissions.needPermission': return '我们需要您的许可才能继续';
			case 'common.permissions.permissionDenied': return '权限被拒绝';
			case 'common.permissions.permissionRequired': return '此权限是必需的';
			case 'common.permissions.enableInSettings': return '请在设置中启用';
			case 'common.prompts.sessionExpired': return '您的会话已过期';
			case 'common.prompts.areYouSure': return '您确定吗？';
			case 'common.prompts.cannotBeUndone': return '此操作无法撤销';
			case 'common.prompts.unsavedChanges': return '您有未保存的更改';
			case 'common.prompts.discardChanges': return '丢弃更改？';
			case 'common.prompts.locationDisabled': return '位置服务已禁用';
			case 'common.prompts.networkRequired': return '需要网络连接';
			case 'common.prompts.loginRequired': return '需要登录才能继续';
			case 'common.prompts.confirmDelete': return '您确定要删除这个吗？';
			case 'common.prompts.confirmLogout': return '您确定要退出登录吗？';
			case 'common.prompts.saveBeforeExit': return '退出前要保存吗？';
			case 'common.prompts.reloadPage': return '您要重新加载页面吗？';
			case 'common.prompts.updateAvailable': return '有可用更新';
			case 'common.prompts.restartRequired': return '需要重启以应用更改';
			case 'login.message.success': return '登录成功。';
			case 'login.message.error': return '登录失败。请重试。';
			case 'login.message.wrongPassword': return '请验证您的凭据。';
			case 'login.form.username': return '用户名';
			case 'login.form.password': return '密码';
			case 'login.form.submit': return '登录';
			case 'login.form.createAccount': return '创建新帐户';
			case 'login.form.forgotPassword': return '忘记密码';
			case 'login.tooltip.username': return '输入您的用户名';
			case 'login.tooltip.password': return '输入您的密码';
			case 'login.tooltip.submit': return '点击登录';
			case 'login.validation.username.required': return '用户名是必需的。';
			case 'login.validation.password.required': return '密码是必需的。';
			case 'register.message.success': return '注册成功。';
			case 'register.message.error': return '注册失败。请重试。';
			case 'register.form.username': return '用户名';
			case 'register.form.email': return '电子邮件';
			case 'register.form.password': return '密码';
			case 'register.form.submit': return '注册';
			case 'register.form.acceptTos': return '我接受服务条款';
			case 'register.tooltip.username': return '输入您的用户名';
			case 'register.tooltip.email': return '输入您的电子邮件';
			case 'register.tooltip.password': return '输入您的密码';
			case 'register.tooltip.submit': return '点击注册';
			case 'register.validation.username.required': return '用户名是必需的。';
			case 'register.validation.username.minLength': return ({required Object min}) => '用户名必须至少${min}个字符长。';
			case 'register.validation.username.maxLength': return ({required Object max}) => '用户名最多${max}个字符长。';
			case 'register.validation.email.required': return '电子邮件是必需的。';
			case 'register.validation.email.invalid': return '电子邮件无效。';
			case 'register.validation.password.required': return '密码是必需的。';
			case 'register.validation.password.minLength': return ({required Object min}) => '密码必须至少${min}个字符长。';
			case 'passwordReset.message.success': return '密码重置邮件已发送。';
			case 'passwordReset.message.error': return '密码重置失败。请重试。';
			case 'passwordReset.form.email': return '电子邮件';
			case 'passwordReset.form.submit': return '重置密码';
			case 'passwordReset.tooltip.email': return '输入您的电子邮件';
			case 'passwordReset.tooltip.submit': return '点击重置密码';
			case 'passwordReset.validation.email.required': return '电子邮件是必需的。';
			case 'passwordReset.validation.email.invalid': return '电子邮件无效。';
			default: return null;
		}
	}
}

