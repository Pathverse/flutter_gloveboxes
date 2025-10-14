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
	@override late final TranslationsNumbersZhHans numbers = TranslationsNumbersZhHans._(_root);
	@override late final TranslationsRanksZhHans ranks = TranslationsRanksZhHans._(_root);
	@override late final TranslationsPriorityZhHans priority = TranslationsPriorityZhHans._(_root);
	@override late final TranslationsTimeZhHans time = TranslationsTimeZhHans._(_root);
	@override late final TranslationsTimeRelativeZhHans timeRelative = TranslationsTimeRelativeZhHans._(_root);
	@override late final TranslationsDayZhHans day = TranslationsDayZhHans._(_root);
	@override late final TranslationsDayTypeZhHans dayType = TranslationsDayTypeZhHans._(_root);
	@override late final TranslationsDayRelativeZhHans dayRelative = TranslationsDayRelativeZhHans._(_root);
	@override late final TranslationsLanguageZhHans language = TranslationsLanguageZhHans._(_root);
	@override late final TranslationsLanguageShortZhHans languageShort = TranslationsLanguageShortZhHans._(_root);
	@override late final TranslationsButtonsZhHans buttons = TranslationsButtonsZhHans._(_root);
	@override late final TranslationsLabelsZhHans labels = TranslationsLabelsZhHans._(_root);
	@override late final TranslationsResponseZhHans response = TranslationsResponseZhHans._(_root);
	@override late final TranslationsCommonWebFeaturesZhHans commonWebFeatures = TranslationsCommonWebFeaturesZhHans._(_root);
}

// Path: numbers
class TranslationsNumbersZhHans extends TranslationsNumbersEn {
	TranslationsNumbersZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

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

// Path: ranks
class TranslationsRanksZhHans extends TranslationsRanksEn {
	TranslationsRanksZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

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

// Path: priority
class TranslationsPriorityZhHans extends TranslationsPriorityEn {
	TranslationsPriorityZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get low => '低';
	@override String get medium => '中';
	@override String get high => '高';
}

// Path: time
class TranslationsTimeZhHans extends TranslationsTimeEn {
	TranslationsTimeZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get seconds => '秒';
	@override String get minutes => '分钟';
	@override String get hours => '小时';
	@override String get days => '天';
	@override String get weeks => '周';
	@override String get months => '月';
	@override String get years => '年';
	@override String get second => '秒';
	@override String get minute => '分钟';
	@override String get hour => '小时';
	@override String get day => '天';
	@override String get week => '周';
	@override String get month => '月';
	@override String get year => '年';
}

// Path: timeRelative
class TranslationsTimeRelativeZhHans extends TranslationsTimeRelativeEn {
	TranslationsTimeRelativeZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get now => '现在';
	@override String get later => '稍后';
	@override String get soon => '很快';
	@override String get inAMoment => '马上';
	@override String get justBefore => '就在之前';
	@override String get before => '之前';
	@override String get after => '之后';
}

// Path: day
class TranslationsDayZhHans extends TranslationsDayEn {
	TranslationsDayZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get monday => '星期一';
	@override String get tuesday => '星期二';
	@override String get wednesday => '星期三';
	@override String get thursday => '星期四';
	@override String get friday => '星期五';
	@override String get saturday => '星期六';
	@override String get sunday => '星期日';
}

// Path: dayType
class TranslationsDayTypeZhHans extends TranslationsDayTypeEn {
	TranslationsDayTypeZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get weekday => '工作日';
	@override String get weekend => '周末';
	@override String get everyday => '每天';
}

// Path: dayRelative
class TranslationsDayRelativeZhHans extends TranslationsDayRelativeEn {
	TranslationsDayRelativeZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get today => '今天';
	@override String get tomorrow => '明天';
	@override String get yesterday => '昨天';
	@override String get dayAfterTomorrow => '后天';
	@override String get dayBeforeYesterday => '前天';
}

// Path: language
class TranslationsLanguageZhHans extends TranslationsLanguageEn {
	TranslationsLanguageZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get en => '英语';
	@override String get da => '丹麦语';
	@override String get es => '西班牙语';
	@override String get fr => '法语';
	@override String get he => '希伯来语';
	@override String get isIS => '冰岛语（冰岛）';
	@override String get ko => '韩语';
	@override String get nb => '挪威语博克马尔';
	@override String get nl => '荷兰语（佛兰芒语）';
	@override String get no => '挪威语';
	@override String get sv => '瑞典语';
	@override String get zhHans => '中文（简体）';
	@override String get zh => '中文（繁体）';
}

// Path: languageShort
class TranslationsLanguageShortZhHans extends TranslationsLanguageShortEn {
	TranslationsLanguageShortZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get en => 'EN';
	@override String get da => 'DA';
	@override String get es => 'ES';
	@override String get fr => 'FR';
	@override String get he => 'HE';
	@override String get isIS => 'IS';
	@override String get ko => 'KO';
	@override String get nb => 'NB';
	@override String get nl => 'NL';
	@override String get no => 'NO';
	@override String get sv => 'SV';
	@override String get zhHans => 'ZH';
	@override String get zh => 'ZH';
}

// Path: buttons
class TranslationsButtonsZhHans extends TranslationsButtonsEn {
	TranslationsButtonsZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

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
	@override String get previous => '上一步';
	@override String get finish => '完成';
	@override String get edit => '编辑';
	@override String get delete => '删除';
	@override String get save => '保存';
	@override String get view => '查看';
	@override String get add => '添加';
	@override String get remove => '移除';
	@override String get update => '更新';
	@override String get confirm => '确认';
	@override String get retry => '重试';
}

// Path: labels
class TranslationsLabelsZhHans extends TranslationsLabelsEn {
	TranslationsLabelsZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get required => '必需';
	@override String get optional => '可选';
	@override String get instructions => '说明：';
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

// Path: response
class TranslationsResponseZhHans extends TranslationsResponseEn {
	TranslationsResponseZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get success => '成功';
	@override String get error => '错误';
	@override String get info => '信息';
	@override String get warning => '警告';
	@override String get tbd => '待定';
	@override String get wip => '进行中的工作';
}

// Path: commonWebFeatures
class TranslationsCommonWebFeaturesZhHans extends TranslationsCommonWebFeaturesEn {
	TranslationsCommonWebFeaturesZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get search => '搜索';
	@override String get filter => '筛选';
	@override String get sort => '排序';
	@override String get share => '分享';
	@override String get download => '下载';
	@override String get upload => '上传';
	@override String get login => '登录';
	@override String get logout => '登出';
	@override String get register => '注册';
	@override String get profile => '个人资料';
	@override String get settings => '设置';
	@override String get help => '帮助';
	@override String get contact => '联系';
	@override String get faqFull => '常见问题';
	@override String get termsOfService => '服务条款';
	@override String get privacyPolicy => '隐私政策';
	@override String get aboutUs => '关于我们';
	@override String get careers => '招聘';
	@override String get blog => '博客';
	@override String get news => '新闻';
	@override String get events => '活动';
	@override String get community => '社区';
	@override String get forum => '论坛';
	@override String get support => '支持';
	@override String get feedback => '反馈';
	@override String get subscribe => '订阅';
	@override String get unsubscribe => '取消订阅';
	@override String get notifications => '通知';
	@override String get messages => '消息';
	@override String get dashboard => '仪表板';
	@override String get analytics => '分析';
	@override String get reports => '报告';
	@override String get calendar => '日历';
	@override String get tasks => '任务';
	@override String get projects => '项目';
	@override String get teams => '团队';
	@override String get members => '成员';
	@override String get roles => '角色';
	@override String get permissions => '权限';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsZhHans {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.k1': return '一';
			case 'numbers.k2': return '二';
			case 'numbers.k3': return '三';
			case 'numbers.k4': return '四';
			case 'numbers.k5': return '五';
			case 'numbers.k6': return '六';
			case 'numbers.k7': return '七';
			case 'numbers.k8': return '八';
			case 'numbers.k9': return '九';
			case 'numbers.k10': return '十';
			case 'ranks.k1': return '第一';
			case 'ranks.k2': return '第二';
			case 'ranks.k3': return '第三';
			case 'ranks.k4': return '第四';
			case 'ranks.k5': return '第五';
			case 'ranks.k6': return '第六';
			case 'ranks.k7': return '第七';
			case 'ranks.k8': return '第八';
			case 'ranks.k9': return '第九';
			case 'ranks.k10': return '第十';
			case 'priority.low': return '低';
			case 'priority.medium': return '中';
			case 'priority.high': return '高';
			case 'time.seconds': return '秒';
			case 'time.minutes': return '分钟';
			case 'time.hours': return '小时';
			case 'time.days': return '天';
			case 'time.weeks': return '周';
			case 'time.months': return '月';
			case 'time.years': return '年';
			case 'time.second': return '秒';
			case 'time.minute': return '分钟';
			case 'time.hour': return '小时';
			case 'time.day': return '天';
			case 'time.week': return '周';
			case 'time.month': return '月';
			case 'time.year': return '年';
			case 'timeRelative.now': return '现在';
			case 'timeRelative.later': return '稍后';
			case 'timeRelative.soon': return '很快';
			case 'timeRelative.inAMoment': return '马上';
			case 'timeRelative.justBefore': return '就在之前';
			case 'timeRelative.before': return '之前';
			case 'timeRelative.after': return '之后';
			case 'day.monday': return '星期一';
			case 'day.tuesday': return '星期二';
			case 'day.wednesday': return '星期三';
			case 'day.thursday': return '星期四';
			case 'day.friday': return '星期五';
			case 'day.saturday': return '星期六';
			case 'day.sunday': return '星期日';
			case 'dayType.weekday': return '工作日';
			case 'dayType.weekend': return '周末';
			case 'dayType.everyday': return '每天';
			case 'dayRelative.today': return '今天';
			case 'dayRelative.tomorrow': return '明天';
			case 'dayRelative.yesterday': return '昨天';
			case 'dayRelative.dayAfterTomorrow': return '后天';
			case 'dayRelative.dayBeforeYesterday': return '前天';
			case 'language.en': return '英语';
			case 'language.da': return '丹麦语';
			case 'language.es': return '西班牙语';
			case 'language.fr': return '法语';
			case 'language.he': return '希伯来语';
			case 'language.isIS': return '冰岛语（冰岛）';
			case 'language.ko': return '韩语';
			case 'language.nb': return '挪威语博克马尔';
			case 'language.nl': return '荷兰语（佛兰芒语）';
			case 'language.no': return '挪威语';
			case 'language.sv': return '瑞典语';
			case 'language.zhHans': return '中文（简体）';
			case 'language.zh': return '中文（繁体）';
			case 'languageShort.en': return 'EN';
			case 'languageShort.da': return 'DA';
			case 'languageShort.es': return 'ES';
			case 'languageShort.fr': return 'FR';
			case 'languageShort.he': return 'HE';
			case 'languageShort.isIS': return 'IS';
			case 'languageShort.ko': return 'KO';
			case 'languageShort.nb': return 'NB';
			case 'languageShort.nl': return 'NL';
			case 'languageShort.no': return 'NO';
			case 'languageShort.sv': return 'SV';
			case 'languageShort.zhHans': return 'ZH';
			case 'languageShort.zh': return 'ZH';
			case 'buttons.submit': return '提交';
			case 'buttons.close': return '关闭';
			case 'buttons.reset': return '重置';
			case 'buttons.cancel': return '取消';
			case 'buttons.kContinue': return '继续';
			case 'buttons.back': return '返回';
			case 'buttons.next': return '下一步';
			case 'buttons.done': return '完成';
			case 'buttons.upload': return '上传';
			case 'buttons.choose': return '选择';
			case 'buttons.select': return '选择';
			case 'buttons.clear': return '清除';
			case 'buttons.start': return '开始';
			case 'buttons.previous': return '上一步';
			case 'buttons.finish': return '完成';
			case 'buttons.edit': return '编辑';
			case 'buttons.delete': return '删除';
			case 'buttons.save': return '保存';
			case 'buttons.view': return '查看';
			case 'buttons.add': return '添加';
			case 'buttons.remove': return '移除';
			case 'buttons.update': return '更新';
			case 'buttons.confirm': return '确认';
			case 'buttons.retry': return '重试';
			case 'labels.required': return '必需';
			case 'labels.optional': return '可选';
			case 'labels.instructions': return '说明：';
			case 'labels.status': return '状态';
			case 'labels.progress': return '进度';
			case 'labels.question': return '问题';
			case 'labels.answer': return '答案';
			case 'labels.response': return '回复';
			case 'labels.loading': return '加载中...';
			case 'labels.error': return '错误';
			case 'labels.success': return '成功';
			case 'labels.warning': return '警告';
			case 'response.success': return '成功';
			case 'response.error': return '错误';
			case 'response.info': return '信息';
			case 'response.warning': return '警告';
			case 'response.tbd': return '待定';
			case 'response.wip': return '进行中的工作';
			case 'commonWebFeatures.search': return '搜索';
			case 'commonWebFeatures.filter': return '筛选';
			case 'commonWebFeatures.sort': return '排序';
			case 'commonWebFeatures.share': return '分享';
			case 'commonWebFeatures.download': return '下载';
			case 'commonWebFeatures.upload': return '上传';
			case 'commonWebFeatures.login': return '登录';
			case 'commonWebFeatures.logout': return '登出';
			case 'commonWebFeatures.register': return '注册';
			case 'commonWebFeatures.profile': return '个人资料';
			case 'commonWebFeatures.settings': return '设置';
			case 'commonWebFeatures.help': return '帮助';
			case 'commonWebFeatures.contact': return '联系';
			case 'commonWebFeatures.faqFull': return '常见问题';
			case 'commonWebFeatures.termsOfService': return '服务条款';
			case 'commonWebFeatures.privacyPolicy': return '隐私政策';
			case 'commonWebFeatures.aboutUs': return '关于我们';
			case 'commonWebFeatures.careers': return '招聘';
			case 'commonWebFeatures.blog': return '博客';
			case 'commonWebFeatures.news': return '新闻';
			case 'commonWebFeatures.events': return '活动';
			case 'commonWebFeatures.community': return '社区';
			case 'commonWebFeatures.forum': return '论坛';
			case 'commonWebFeatures.support': return '支持';
			case 'commonWebFeatures.feedback': return '反馈';
			case 'commonWebFeatures.subscribe': return '订阅';
			case 'commonWebFeatures.unsubscribe': return '取消订阅';
			case 'commonWebFeatures.notifications': return '通知';
			case 'commonWebFeatures.messages': return '消息';
			case 'commonWebFeatures.dashboard': return '仪表板';
			case 'commonWebFeatures.analytics': return '分析';
			case 'commonWebFeatures.reports': return '报告';
			case 'commonWebFeatures.calendar': return '日历';
			case 'commonWebFeatures.tasks': return '任务';
			case 'commonWebFeatures.projects': return '项目';
			case 'commonWebFeatures.teams': return '团队';
			case 'commonWebFeatures.members': return '成员';
			case 'commonWebFeatures.roles': return '角色';
			case 'commonWebFeatures.permissions': return '权限';
			default: return null;
		}
	}
}

