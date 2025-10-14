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
class TranslationsKo extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsKo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ko,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ko>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsKo _root = this; // ignore: unused_field

	@override 
	TranslationsKo $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsKo(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsNumbersKo numbers = TranslationsNumbersKo._(_root);
	@override late final TranslationsRanksKo ranks = TranslationsRanksKo._(_root);
	@override late final TranslationsPriorityKo priority = TranslationsPriorityKo._(_root);
	@override late final TranslationsTimeKo time = TranslationsTimeKo._(_root);
	@override late final TranslationsTimeRelativeKo timeRelative = TranslationsTimeRelativeKo._(_root);
	@override late final TranslationsDayKo day = TranslationsDayKo._(_root);
	@override late final TranslationsDayTypeKo dayType = TranslationsDayTypeKo._(_root);
	@override late final TranslationsDayRelativeKo dayRelative = TranslationsDayRelativeKo._(_root);
	@override late final TranslationsLanguageKo language = TranslationsLanguageKo._(_root);
	@override late final TranslationsLanguageShortKo languageShort = TranslationsLanguageShortKo._(_root);
	@override late final TranslationsButtonsKo buttons = TranslationsButtonsKo._(_root);
	@override late final TranslationsLabelsKo labels = TranslationsLabelsKo._(_root);
	@override late final TranslationsResponseKo response = TranslationsResponseKo._(_root);
	@override late final TranslationsCommonWebFeaturesKo commonWebFeatures = TranslationsCommonWebFeaturesKo._(_root);
}

// Path: numbers
class TranslationsNumbersKo extends TranslationsNumbersEn {
	TranslationsNumbersKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get k1 => '하나';
	@override String get k2 => '둘';
	@override String get k3 => '셋';
	@override String get k4 => '넷';
	@override String get k5 => '다섯';
	@override String get k6 => '여섯';
	@override String get k7 => '일곱';
	@override String get k8 => '여덟';
	@override String get k9 => '아홉';
	@override String get k10 => '열';
}

// Path: ranks
class TranslationsRanksKo extends TranslationsRanksEn {
	TranslationsRanksKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get k1 => '첫 번째';
	@override String get k2 => '두 번째';
	@override String get k3 => '세 번째';
	@override String get k4 => '네 번째';
	@override String get k5 => '다섯 번째';
	@override String get k6 => '여섯 번째';
	@override String get k7 => '일곱 번째';
	@override String get k8 => '여덟 번째';
	@override String get k9 => '아홉 번째';
	@override String get k10 => '열 번째';
}

// Path: priority
class TranslationsPriorityKo extends TranslationsPriorityEn {
	TranslationsPriorityKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get low => '낮음';
	@override String get medium => '보통';
	@override String get high => '높음';
}

// Path: time
class TranslationsTimeKo extends TranslationsTimeEn {
	TranslationsTimeKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get seconds => '초';
	@override String get minutes => '분';
	@override String get hours => '시간';
	@override String get days => '일';
	@override String get weeks => '주';
	@override String get months => '개월';
	@override String get years => '년';
	@override String get second => '초';
	@override String get minute => '분';
	@override String get hour => '시간';
	@override String get day => '일';
	@override String get week => '주';
	@override String get month => '개월';
	@override String get year => '년';
}

// Path: timeRelative
class TranslationsTimeRelativeKo extends TranslationsTimeRelativeEn {
	TranslationsTimeRelativeKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get now => '지금';
	@override String get later => '나중에';
	@override String get soon => '곧';
	@override String get inAMoment => '잠시 후';
	@override String get justBefore => '바로 전에';
	@override String get before => '이전에';
	@override String get after => '이후에';
}

// Path: day
class TranslationsDayKo extends TranslationsDayEn {
	TranslationsDayKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get monday => '월요일';
	@override String get tuesday => '화요일';
	@override String get wednesday => '수요일';
	@override String get thursday => '목요일';
	@override String get friday => '금요일';
	@override String get saturday => '토요일';
	@override String get sunday => '일요일';
}

// Path: dayType
class TranslationsDayTypeKo extends TranslationsDayTypeEn {
	TranslationsDayTypeKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get weekday => '평일';
	@override String get weekend => '주말';
	@override String get everyday => '매일';
}

// Path: dayRelative
class TranslationsDayRelativeKo extends TranslationsDayRelativeEn {
	TranslationsDayRelativeKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get today => '오늘';
	@override String get tomorrow => '내일';
	@override String get yesterday => '어제';
	@override String get dayAfterTomorrow => '모레';
	@override String get dayBeforeYesterday => '그저께';
}

// Path: language
class TranslationsLanguageKo extends TranslationsLanguageEn {
	TranslationsLanguageKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get en => '영어';
	@override String get da => '덴마크어';
	@override String get es => '스페인어';
	@override String get fr => '프랑스어';
	@override String get he => '히브리어';
	@override String get isIS => '아이슬란드어 (아이슬란드)';
	@override String get ko => '한국어';
	@override String get nb => '노르웨이어 부크몰';
	@override String get nl => '네덜란드어 (플랑드르어)';
	@override String get no => '노르웨이어';
	@override String get sv => '스웨덴어';
	@override String get zhHans => '중국어 (간체)';
	@override String get zh => '중국어 (번체)';
}

// Path: languageShort
class TranslationsLanguageShortKo extends TranslationsLanguageShortEn {
	TranslationsLanguageShortKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

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
class TranslationsButtonsKo extends TranslationsButtonsEn {
	TranslationsButtonsKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get submit => '제출';
	@override String get close => '닫기';
	@override String get reset => '재설정';
	@override String get cancel => '취소';
	@override String get kContinue => '계속';
	@override String get back => '뒤로';
	@override String get next => '다음';
	@override String get done => '완료';
	@override String get upload => '업로드';
	@override String get choose => '선택';
	@override String get select => '선택';
	@override String get clear => '지우기';
	@override String get start => '시작';
	@override String get previous => '이전';
	@override String get finish => '완료';
	@override String get edit => '편집';
	@override String get delete => '삭제';
	@override String get save => '저장';
	@override String get view => '보기';
	@override String get add => '추가';
	@override String get remove => '제거';
	@override String get update => '업데이트';
	@override String get confirm => '확인';
	@override String get retry => '다시 시도';
}

// Path: labels
class TranslationsLabelsKo extends TranslationsLabelsEn {
	TranslationsLabelsKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get required => '필수';
	@override String get optional => '선택사항';
	@override String get instructions => '지침:';
	@override String get status => '상태';
	@override String get progress => '진행률';
	@override String get question => '질문';
	@override String get answer => '답변';
	@override String get response => '응답';
	@override String get loading => '로딩 중...';
	@override String get error => '오류';
	@override String get success => '성공';
	@override String get warning => '경고';
}

// Path: response
class TranslationsResponseKo extends TranslationsResponseEn {
	TranslationsResponseKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get success => '성공';
	@override String get error => '오류';
	@override String get info => '정보';
	@override String get warning => '경고';
	@override String get tbd => '미정';
	@override String get wip => '진행 중인 작업';
}

// Path: commonWebFeatures
class TranslationsCommonWebFeaturesKo extends TranslationsCommonWebFeaturesEn {
	TranslationsCommonWebFeaturesKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get search => '검색';
	@override String get filter => '필터';
	@override String get sort => '정렬';
	@override String get share => '공유';
	@override String get download => '다운로드';
	@override String get upload => '업로드';
	@override String get login => '로그인';
	@override String get logout => '로그아웃';
	@override String get register => '등록';
	@override String get profile => '프로필';
	@override String get settings => '설정';
	@override String get help => '도움말';
	@override String get contact => '연락처';
	@override String get faqFull => '자주 묻는 질문';
	@override String get termsOfService => '서비스 약관';
	@override String get privacyPolicy => '개인정보 보호정책';
	@override String get aboutUs => '회사 소개';
	@override String get careers => '채용';
	@override String get blog => '블로그';
	@override String get news => '뉴스';
	@override String get events => '이벤트';
	@override String get community => '커뮤니티';
	@override String get forum => '포럼';
	@override String get support => '지원';
	@override String get feedback => '피드백';
	@override String get subscribe => '구독';
	@override String get unsubscribe => '구독 해지';
	@override String get notifications => '알림';
	@override String get messages => '메시지';
	@override String get dashboard => '대시보드';
	@override String get analytics => '분석';
	@override String get reports => '보고서';
	@override String get calendar => '달력';
	@override String get tasks => '작업';
	@override String get projects => '프로젝트';
	@override String get teams => '팀';
	@override String get members => '구성원';
	@override String get roles => '역할';
	@override String get permissions => '권한';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsKo {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.k1': return '하나';
			case 'numbers.k2': return '둘';
			case 'numbers.k3': return '셋';
			case 'numbers.k4': return '넷';
			case 'numbers.k5': return '다섯';
			case 'numbers.k6': return '여섯';
			case 'numbers.k7': return '일곱';
			case 'numbers.k8': return '여덟';
			case 'numbers.k9': return '아홉';
			case 'numbers.k10': return '열';
			case 'ranks.k1': return '첫 번째';
			case 'ranks.k2': return '두 번째';
			case 'ranks.k3': return '세 번째';
			case 'ranks.k4': return '네 번째';
			case 'ranks.k5': return '다섯 번째';
			case 'ranks.k6': return '여섯 번째';
			case 'ranks.k7': return '일곱 번째';
			case 'ranks.k8': return '여덟 번째';
			case 'ranks.k9': return '아홉 번째';
			case 'ranks.k10': return '열 번째';
			case 'priority.low': return '낮음';
			case 'priority.medium': return '보통';
			case 'priority.high': return '높음';
			case 'time.seconds': return '초';
			case 'time.minutes': return '분';
			case 'time.hours': return '시간';
			case 'time.days': return '일';
			case 'time.weeks': return '주';
			case 'time.months': return '개월';
			case 'time.years': return '년';
			case 'time.second': return '초';
			case 'time.minute': return '분';
			case 'time.hour': return '시간';
			case 'time.day': return '일';
			case 'time.week': return '주';
			case 'time.month': return '개월';
			case 'time.year': return '년';
			case 'timeRelative.now': return '지금';
			case 'timeRelative.later': return '나중에';
			case 'timeRelative.soon': return '곧';
			case 'timeRelative.inAMoment': return '잠시 후';
			case 'timeRelative.justBefore': return '바로 전에';
			case 'timeRelative.before': return '이전에';
			case 'timeRelative.after': return '이후에';
			case 'day.monday': return '월요일';
			case 'day.tuesday': return '화요일';
			case 'day.wednesday': return '수요일';
			case 'day.thursday': return '목요일';
			case 'day.friday': return '금요일';
			case 'day.saturday': return '토요일';
			case 'day.sunday': return '일요일';
			case 'dayType.weekday': return '평일';
			case 'dayType.weekend': return '주말';
			case 'dayType.everyday': return '매일';
			case 'dayRelative.today': return '오늘';
			case 'dayRelative.tomorrow': return '내일';
			case 'dayRelative.yesterday': return '어제';
			case 'dayRelative.dayAfterTomorrow': return '모레';
			case 'dayRelative.dayBeforeYesterday': return '그저께';
			case 'language.en': return '영어';
			case 'language.da': return '덴마크어';
			case 'language.es': return '스페인어';
			case 'language.fr': return '프랑스어';
			case 'language.he': return '히브리어';
			case 'language.isIS': return '아이슬란드어 (아이슬란드)';
			case 'language.ko': return '한국어';
			case 'language.nb': return '노르웨이어 부크몰';
			case 'language.nl': return '네덜란드어 (플랑드르어)';
			case 'language.no': return '노르웨이어';
			case 'language.sv': return '스웨덴어';
			case 'language.zhHans': return '중국어 (간체)';
			case 'language.zh': return '중국어 (번체)';
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
			case 'buttons.submit': return '제출';
			case 'buttons.close': return '닫기';
			case 'buttons.reset': return '재설정';
			case 'buttons.cancel': return '취소';
			case 'buttons.kContinue': return '계속';
			case 'buttons.back': return '뒤로';
			case 'buttons.next': return '다음';
			case 'buttons.done': return '완료';
			case 'buttons.upload': return '업로드';
			case 'buttons.choose': return '선택';
			case 'buttons.select': return '선택';
			case 'buttons.clear': return '지우기';
			case 'buttons.start': return '시작';
			case 'buttons.previous': return '이전';
			case 'buttons.finish': return '완료';
			case 'buttons.edit': return '편집';
			case 'buttons.delete': return '삭제';
			case 'buttons.save': return '저장';
			case 'buttons.view': return '보기';
			case 'buttons.add': return '추가';
			case 'buttons.remove': return '제거';
			case 'buttons.update': return '업데이트';
			case 'buttons.confirm': return '확인';
			case 'buttons.retry': return '다시 시도';
			case 'labels.required': return '필수';
			case 'labels.optional': return '선택사항';
			case 'labels.instructions': return '지침:';
			case 'labels.status': return '상태';
			case 'labels.progress': return '진행률';
			case 'labels.question': return '질문';
			case 'labels.answer': return '답변';
			case 'labels.response': return '응답';
			case 'labels.loading': return '로딩 중...';
			case 'labels.error': return '오류';
			case 'labels.success': return '성공';
			case 'labels.warning': return '경고';
			case 'response.success': return '성공';
			case 'response.error': return '오류';
			case 'response.info': return '정보';
			case 'response.warning': return '경고';
			case 'response.tbd': return '미정';
			case 'response.wip': return '진행 중인 작업';
			case 'commonWebFeatures.search': return '검색';
			case 'commonWebFeatures.filter': return '필터';
			case 'commonWebFeatures.sort': return '정렬';
			case 'commonWebFeatures.share': return '공유';
			case 'commonWebFeatures.download': return '다운로드';
			case 'commonWebFeatures.upload': return '업로드';
			case 'commonWebFeatures.login': return '로그인';
			case 'commonWebFeatures.logout': return '로그아웃';
			case 'commonWebFeatures.register': return '등록';
			case 'commonWebFeatures.profile': return '프로필';
			case 'commonWebFeatures.settings': return '설정';
			case 'commonWebFeatures.help': return '도움말';
			case 'commonWebFeatures.contact': return '연락처';
			case 'commonWebFeatures.faqFull': return '자주 묻는 질문';
			case 'commonWebFeatures.termsOfService': return '서비스 약관';
			case 'commonWebFeatures.privacyPolicy': return '개인정보 보호정책';
			case 'commonWebFeatures.aboutUs': return '회사 소개';
			case 'commonWebFeatures.careers': return '채용';
			case 'commonWebFeatures.blog': return '블로그';
			case 'commonWebFeatures.news': return '뉴스';
			case 'commonWebFeatures.events': return '이벤트';
			case 'commonWebFeatures.community': return '커뮤니티';
			case 'commonWebFeatures.forum': return '포럼';
			case 'commonWebFeatures.support': return '지원';
			case 'commonWebFeatures.feedback': return '피드백';
			case 'commonWebFeatures.subscribe': return '구독';
			case 'commonWebFeatures.unsubscribe': return '구독 해지';
			case 'commonWebFeatures.notifications': return '알림';
			case 'commonWebFeatures.messages': return '메시지';
			case 'commonWebFeatures.dashboard': return '대시보드';
			case 'commonWebFeatures.analytics': return '분석';
			case 'commonWebFeatures.reports': return '보고서';
			case 'commonWebFeatures.calendar': return '달력';
			case 'commonWebFeatures.tasks': return '작업';
			case 'commonWebFeatures.projects': return '프로젝트';
			case 'commonWebFeatures.teams': return '팀';
			case 'commonWebFeatures.members': return '구성원';
			case 'commonWebFeatures.roles': return '역할';
			case 'commonWebFeatures.permissions': return '권한';
			default: return null;
		}
	}
}

