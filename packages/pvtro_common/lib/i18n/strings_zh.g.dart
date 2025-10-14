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
	@override late final TranslationsNumbersZh numbers = TranslationsNumbersZh._(_root);
	@override late final TranslationsRanksZh ranks = TranslationsRanksZh._(_root);
	@override late final TranslationsPriorityZh priority = TranslationsPriorityZh._(_root);
	@override late final TranslationsTimeZh time = TranslationsTimeZh._(_root);
	@override late final TranslationsTimeRelativeZh timeRelative = TranslationsTimeRelativeZh._(_root);
	@override late final TranslationsDayZh day = TranslationsDayZh._(_root);
	@override late final TranslationsDayTypeZh dayType = TranslationsDayTypeZh._(_root);
	@override late final TranslationsDayRelativeZh dayRelative = TranslationsDayRelativeZh._(_root);
	@override late final TranslationsLanguageZh language = TranslationsLanguageZh._(_root);
	@override late final TranslationsLanguageShortZh languageShort = TranslationsLanguageShortZh._(_root);
	@override late final TranslationsButtonsZh buttons = TranslationsButtonsZh._(_root);
	@override late final TranslationsLabelsZh labels = TranslationsLabelsZh._(_root);
	@override late final TranslationsResponseZh response = TranslationsResponseZh._(_root);
	@override late final TranslationsCommonWebFeaturesZh commonWebFeatures = TranslationsCommonWebFeaturesZh._(_root);
}

// Path: numbers
class TranslationsNumbersZh extends TranslationsNumbersEn {
	TranslationsNumbersZh._(TranslationsZh root) : this._root = root, super.internal(root);

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

// Path: ranks
class TranslationsRanksZh extends TranslationsRanksEn {
	TranslationsRanksZh._(TranslationsZh root) : this._root = root, super.internal(root);

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

// Path: priority
class TranslationsPriorityZh extends TranslationsPriorityEn {
	TranslationsPriorityZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get low => '低';
	@override String get medium => '中';
	@override String get high => '高';
}

// Path: time
class TranslationsTimeZh extends TranslationsTimeEn {
	TranslationsTimeZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get seconds => '秒';
	@override String get minutes => '分鐘';
	@override String get hours => '小時';
	@override String get days => '天';
	@override String get weeks => '週';
	@override String get months => '月';
	@override String get years => '年';
	@override String get second => '秒';
	@override String get minute => '分鐘';
	@override String get hour => '小時';
	@override String get day => '天';
	@override String get week => '週';
	@override String get month => '月';
	@override String get year => '年';
}

// Path: timeRelative
class TranslationsTimeRelativeZh extends TranslationsTimeRelativeEn {
	TranslationsTimeRelativeZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get now => '現在';
	@override String get later => '稍後';
	@override String get soon => '很快';
	@override String get inAMoment => '馬上';
	@override String get justBefore => '就在之前';
	@override String get before => '之前';
	@override String get after => '之後';
}

// Path: day
class TranslationsDayZh extends TranslationsDayEn {
	TranslationsDayZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

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
class TranslationsDayTypeZh extends TranslationsDayTypeEn {
	TranslationsDayTypeZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get weekday => '工作日';
	@override String get weekend => '週末';
	@override String get everyday => '每天';
}

// Path: dayRelative
class TranslationsDayRelativeZh extends TranslationsDayRelativeEn {
	TranslationsDayRelativeZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get today => '今天';
	@override String get tomorrow => '明天';
	@override String get yesterday => '昨天';
	@override String get dayAfterTomorrow => '後天';
	@override String get dayBeforeYesterday => '前天';
}

// Path: language
class TranslationsLanguageZh extends TranslationsLanguageEn {
	TranslationsLanguageZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get en => '英語';
	@override String get da => '丹麥語';
	@override String get es => '西班牙語';
	@override String get fr => '法語';
	@override String get he => '希伯來語';
	@override String get isIS => '冰島語（冰島）';
	@override String get ko => '韓語';
	@override String get nb => '挪威語博克馬爾';
	@override String get nl => '荷蘭語（佛拉芒語）';
	@override String get no => '挪威語';
	@override String get sv => '瑞典語';
	@override String get zhHans => '中文（簡體）';
	@override String get zh => '中文（繁體）';
}

// Path: languageShort
class TranslationsLanguageShortZh extends TranslationsLanguageShortEn {
	TranslationsLanguageShortZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

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
class TranslationsButtonsZh extends TranslationsButtonsEn {
	TranslationsButtonsZh._(TranslationsZh root) : this._root = root, super.internal(root);

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
	@override String get select => '選擇';
	@override String get clear => '清除';
	@override String get start => '開始';
	@override String get previous => '上一步';
	@override String get finish => '完成';
	@override String get edit => '編輯';
	@override String get delete => '刪除';
	@override String get save => '保存';
	@override String get view => '檢視';
	@override String get add => '新增';
	@override String get remove => '移除';
	@override String get update => '更新';
	@override String get confirm => '確認';
	@override String get retry => '重試';
}

// Path: labels
class TranslationsLabelsZh extends TranslationsLabelsEn {
	TranslationsLabelsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get required => '必需';
	@override String get optional => '可選';
	@override String get instructions => '說明：';
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

// Path: response
class TranslationsResponseZh extends TranslationsResponseEn {
	TranslationsResponseZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get success => '成功';
	@override String get error => '錯誤';
	@override String get info => '資訊';
	@override String get warning => '警告';
	@override String get tbd => '待定';
	@override String get wip => '進行中的工作';
}

// Path: commonWebFeatures
class TranslationsCommonWebFeaturesZh extends TranslationsCommonWebFeaturesEn {
	TranslationsCommonWebFeaturesZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get search => '搜尋';
	@override String get filter => '篩選';
	@override String get sort => '排序';
	@override String get share => '分享';
	@override String get download => '下載';
	@override String get upload => '上傳';
	@override String get login => '登入';
	@override String get logout => '登出';
	@override String get register => '註冊';
	@override String get profile => '個人資料';
	@override String get settings => '設定';
	@override String get help => '幫助';
	@override String get contact => '聯絡';
	@override String get faqFull => '常見問題';
	@override String get termsOfService => '服務條款';
	@override String get privacyPolicy => '隱私政策';
	@override String get aboutUs => '關於我們';
	@override String get careers => '招聘';
	@override String get blog => '部落格';
	@override String get news => '新聞';
	@override String get events => '活動';
	@override String get community => '社群';
	@override String get forum => '論壇';
	@override String get support => '支援';
	@override String get feedback => '意見回饋';
	@override String get subscribe => '訂閱';
	@override String get unsubscribe => '取消訂閱';
	@override String get notifications => '通知';
	@override String get messages => '訊息';
	@override String get dashboard => '儀表板';
	@override String get analytics => '分析';
	@override String get reports => '報告';
	@override String get calendar => '行事曆';
	@override String get tasks => '任務';
	@override String get projects => '專案';
	@override String get teams => '團隊';
	@override String get members => '成員';
	@override String get roles => '角色';
	@override String get permissions => '權限';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsZh {
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
			case 'time.minutes': return '分鐘';
			case 'time.hours': return '小時';
			case 'time.days': return '天';
			case 'time.weeks': return '週';
			case 'time.months': return '月';
			case 'time.years': return '年';
			case 'time.second': return '秒';
			case 'time.minute': return '分鐘';
			case 'time.hour': return '小時';
			case 'time.day': return '天';
			case 'time.week': return '週';
			case 'time.month': return '月';
			case 'time.year': return '年';
			case 'timeRelative.now': return '現在';
			case 'timeRelative.later': return '稍後';
			case 'timeRelative.soon': return '很快';
			case 'timeRelative.inAMoment': return '馬上';
			case 'timeRelative.justBefore': return '就在之前';
			case 'timeRelative.before': return '之前';
			case 'timeRelative.after': return '之後';
			case 'day.monday': return '星期一';
			case 'day.tuesday': return '星期二';
			case 'day.wednesday': return '星期三';
			case 'day.thursday': return '星期四';
			case 'day.friday': return '星期五';
			case 'day.saturday': return '星期六';
			case 'day.sunday': return '星期日';
			case 'dayType.weekday': return '工作日';
			case 'dayType.weekend': return '週末';
			case 'dayType.everyday': return '每天';
			case 'dayRelative.today': return '今天';
			case 'dayRelative.tomorrow': return '明天';
			case 'dayRelative.yesterday': return '昨天';
			case 'dayRelative.dayAfterTomorrow': return '後天';
			case 'dayRelative.dayBeforeYesterday': return '前天';
			case 'language.en': return '英語';
			case 'language.da': return '丹麥語';
			case 'language.es': return '西班牙語';
			case 'language.fr': return '法語';
			case 'language.he': return '希伯來語';
			case 'language.isIS': return '冰島語（冰島）';
			case 'language.ko': return '韓語';
			case 'language.nb': return '挪威語博克馬爾';
			case 'language.nl': return '荷蘭語（佛拉芒語）';
			case 'language.no': return '挪威語';
			case 'language.sv': return '瑞典語';
			case 'language.zhHans': return '中文（簡體）';
			case 'language.zh': return '中文（繁體）';
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
			case 'buttons.close': return '關閉';
			case 'buttons.reset': return '重置';
			case 'buttons.cancel': return '取消';
			case 'buttons.kContinue': return '繼續';
			case 'buttons.back': return '返回';
			case 'buttons.next': return '下一步';
			case 'buttons.done': return '完成';
			case 'buttons.upload': return '上傳';
			case 'buttons.choose': return '選擇';
			case 'buttons.select': return '選擇';
			case 'buttons.clear': return '清除';
			case 'buttons.start': return '開始';
			case 'buttons.previous': return '上一步';
			case 'buttons.finish': return '完成';
			case 'buttons.edit': return '編輯';
			case 'buttons.delete': return '刪除';
			case 'buttons.save': return '保存';
			case 'buttons.view': return '檢視';
			case 'buttons.add': return '新增';
			case 'buttons.remove': return '移除';
			case 'buttons.update': return '更新';
			case 'buttons.confirm': return '確認';
			case 'buttons.retry': return '重試';
			case 'labels.required': return '必需';
			case 'labels.optional': return '可選';
			case 'labels.instructions': return '說明：';
			case 'labels.status': return '狀態';
			case 'labels.progress': return '進度';
			case 'labels.question': return '問題';
			case 'labels.answer': return '答案';
			case 'labels.response': return '回覆';
			case 'labels.loading': return '載入中...';
			case 'labels.error': return '錯誤';
			case 'labels.success': return '成功';
			case 'labels.warning': return '警告';
			case 'response.success': return '成功';
			case 'response.error': return '錯誤';
			case 'response.info': return '資訊';
			case 'response.warning': return '警告';
			case 'response.tbd': return '待定';
			case 'response.wip': return '進行中的工作';
			case 'commonWebFeatures.search': return '搜尋';
			case 'commonWebFeatures.filter': return '篩選';
			case 'commonWebFeatures.sort': return '排序';
			case 'commonWebFeatures.share': return '分享';
			case 'commonWebFeatures.download': return '下載';
			case 'commonWebFeatures.upload': return '上傳';
			case 'commonWebFeatures.login': return '登入';
			case 'commonWebFeatures.logout': return '登出';
			case 'commonWebFeatures.register': return '註冊';
			case 'commonWebFeatures.profile': return '個人資料';
			case 'commonWebFeatures.settings': return '設定';
			case 'commonWebFeatures.help': return '幫助';
			case 'commonWebFeatures.contact': return '聯絡';
			case 'commonWebFeatures.faqFull': return '常見問題';
			case 'commonWebFeatures.termsOfService': return '服務條款';
			case 'commonWebFeatures.privacyPolicy': return '隱私政策';
			case 'commonWebFeatures.aboutUs': return '關於我們';
			case 'commonWebFeatures.careers': return '招聘';
			case 'commonWebFeatures.blog': return '部落格';
			case 'commonWebFeatures.news': return '新聞';
			case 'commonWebFeatures.events': return '活動';
			case 'commonWebFeatures.community': return '社群';
			case 'commonWebFeatures.forum': return '論壇';
			case 'commonWebFeatures.support': return '支援';
			case 'commonWebFeatures.feedback': return '意見回饋';
			case 'commonWebFeatures.subscribe': return '訂閱';
			case 'commonWebFeatures.unsubscribe': return '取消訂閱';
			case 'commonWebFeatures.notifications': return '通知';
			case 'commonWebFeatures.messages': return '訊息';
			case 'commonWebFeatures.dashboard': return '儀表板';
			case 'commonWebFeatures.analytics': return '分析';
			case 'commonWebFeatures.reports': return '報告';
			case 'commonWebFeatures.calendar': return '行事曆';
			case 'commonWebFeatures.tasks': return '任務';
			case 'commonWebFeatures.projects': return '專案';
			case 'commonWebFeatures.teams': return '團隊';
			case 'commonWebFeatures.members': return '成員';
			case 'commonWebFeatures.roles': return '角色';
			case 'commonWebFeatures.permissions': return '權限';
			default: return null;
		}
	}
}

