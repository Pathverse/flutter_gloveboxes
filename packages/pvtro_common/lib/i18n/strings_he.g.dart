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
class TranslationsHe extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsHe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.he,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <he>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsHe _root = this; // ignore: unused_field

	@override 
	TranslationsHe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHe(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsNumbersHe numbers = TranslationsNumbersHe._(_root);
	@override late final TranslationsRanksHe ranks = TranslationsRanksHe._(_root);
	@override late final TranslationsPriorityHe priority = TranslationsPriorityHe._(_root);
	@override late final TranslationsTimeHe time = TranslationsTimeHe._(_root);
	@override late final TranslationsTimeRelativeHe timeRelative = TranslationsTimeRelativeHe._(_root);
	@override late final TranslationsDayHe day = TranslationsDayHe._(_root);
	@override late final TranslationsDayTypeHe dayType = TranslationsDayTypeHe._(_root);
	@override late final TranslationsDayRelativeHe dayRelative = TranslationsDayRelativeHe._(_root);
	@override late final TranslationsLanguageHe language = TranslationsLanguageHe._(_root);
	@override late final TranslationsLanguageShortHe languageShort = TranslationsLanguageShortHe._(_root);
	@override late final TranslationsButtonsHe buttons = TranslationsButtonsHe._(_root);
	@override late final TranslationsLabelsHe labels = TranslationsLabelsHe._(_root);
	@override late final TranslationsResponseHe response = TranslationsResponseHe._(_root);
	@override late final TranslationsCommonWebFeaturesHe commonWebFeatures = TranslationsCommonWebFeaturesHe._(_root);
}

// Path: numbers
class TranslationsNumbersHe extends TranslationsNumbersEn {
	TranslationsNumbersHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'אחד';
	@override String get k2 => 'שניים';
	@override String get k3 => 'שלושה';
	@override String get k4 => 'ארבעה';
	@override String get k5 => 'חמישה';
	@override String get k6 => 'שישה';
	@override String get k7 => 'שבעה';
	@override String get k8 => 'שמונה';
	@override String get k9 => 'תשעה';
	@override String get k10 => 'עשרה';
}

// Path: ranks
class TranslationsRanksHe extends TranslationsRanksEn {
	TranslationsRanksHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'ראשון';
	@override String get k2 => 'שני';
	@override String get k3 => 'שלישי';
	@override String get k4 => 'רביעי';
	@override String get k5 => 'חמישי';
	@override String get k6 => 'שישי';
	@override String get k7 => 'שביעי';
	@override String get k8 => 'שמיני';
	@override String get k9 => 'תשיעי';
	@override String get k10 => 'עשירי';
}

// Path: priority
class TranslationsPriorityHe extends TranslationsPriorityEn {
	TranslationsPriorityHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get low => 'נמוך';
	@override String get medium => 'בינוני';
	@override String get high => 'גבוה';
}

// Path: time
class TranslationsTimeHe extends TranslationsTimeEn {
	TranslationsTimeHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get seconds => 'שניות';
	@override String get minutes => 'דקות';
	@override String get hours => 'שעות';
	@override String get days => 'ימים';
	@override String get weeks => 'שבועות';
	@override String get months => 'חודשים';
	@override String get years => 'שנים';
	@override String get second => 'שנייה';
	@override String get minute => 'דקה';
	@override String get hour => 'שעה';
	@override String get day => 'יום';
	@override String get week => 'שבוע';
	@override String get month => 'חודש';
	@override String get year => 'שנה';
}

// Path: timeRelative
class TranslationsTimeRelativeHe extends TranslationsTimeRelativeEn {
	TranslationsTimeRelativeHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get now => 'עכשיו';
	@override String get later => 'מאוחר יותר';
	@override String get soon => 'בקרוב';
	@override String get inAMoment => 'בעוד רגע';
	@override String get justBefore => 'ממש לפני';
	@override String get before => 'לפני';
	@override String get after => 'אחרי';
}

// Path: day
class TranslationsDayHe extends TranslationsDayEn {
	TranslationsDayHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get monday => 'יום שני';
	@override String get tuesday => 'יום שלישי';
	@override String get wednesday => 'יום רביעי';
	@override String get thursday => 'יום חמישי';
	@override String get friday => 'יום שישי';
	@override String get saturday => 'יום שבת';
	@override String get sunday => 'יום ראשון';
}

// Path: dayType
class TranslationsDayTypeHe extends TranslationsDayTypeEn {
	TranslationsDayTypeHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get weekday => 'יום חול';
	@override String get weekend => 'סוף שבוע';
	@override String get everyday => 'כל יום';
}

// Path: dayRelative
class TranslationsDayRelativeHe extends TranslationsDayRelativeEn {
	TranslationsDayRelativeHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get today => 'היום';
	@override String get tomorrow => 'מחר';
	@override String get yesterday => 'אתמול';
	@override String get dayAfterTomorrow => 'מחרתיים';
	@override String get dayBeforeYesterday => 'שלשום';
}

// Path: language
class TranslationsLanguageHe extends TranslationsLanguageEn {
	TranslationsLanguageHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get en => 'אנגלית';
	@override String get da => 'דנית';
	@override String get es => 'ספרדית';
	@override String get fr => 'צרפתית';
	@override String get he => 'עברית';
	@override String get isIS => 'איסלנדית (איסלנד)';
	@override String get ko => 'קוריאנית';
	@override String get nb => 'נורבגית בוקמול';
	@override String get nl => 'הולנדית (פלמית)';
	@override String get no => 'נורבגית';
	@override String get sv => 'שוודית';
	@override String get zhHans => 'סינית (פשוטה)';
	@override String get zh => 'סינית (מסורתית)';
}

// Path: languageShort
class TranslationsLanguageShortHe extends TranslationsLanguageShortEn {
	TranslationsLanguageShortHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

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
class TranslationsButtonsHe extends TranslationsButtonsEn {
	TranslationsButtonsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get submit => 'שלח';
	@override String get close => 'סגור';
	@override String get reset => 'איפוס';
	@override String get cancel => 'ביטול';
	@override String get kContinue => 'המשך';
	@override String get back => 'חזור';
	@override String get next => 'הבא';
	@override String get done => 'סיים';
	@override String get upload => 'העלה';
	@override String get choose => 'בחר';
	@override String get select => 'בחר';
	@override String get clear => 'נקה';
	@override String get start => 'התחל';
	@override String get previous => 'קודם';
	@override String get finish => 'סיים';
	@override String get edit => 'ערוך';
	@override String get delete => 'מחק';
	@override String get save => 'שמור';
	@override String get view => 'צפה';
	@override String get add => 'הוסף';
	@override String get remove => 'הסר';
	@override String get update => 'עדכן';
	@override String get confirm => 'אשר';
	@override String get retry => 'נסה שוב';
}

// Path: labels
class TranslationsLabelsHe extends TranslationsLabelsEn {
	TranslationsLabelsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get required => 'נדרש';
	@override String get optional => 'אופציונלי';
	@override String get instructions => 'הוראות:';
	@override String get status => 'סטטוס';
	@override String get progress => 'התקדמות';
	@override String get question => 'שאלה';
	@override String get answer => 'תשובה';
	@override String get response => 'תגובה';
	@override String get loading => 'טוען...';
	@override String get error => 'שגיאה';
	@override String get success => 'הצלחה';
	@override String get warning => 'אזהרה';
}

// Path: response
class TranslationsResponseHe extends TranslationsResponseEn {
	TranslationsResponseHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get success => 'הצלחה';
	@override String get error => 'שגיאה';
	@override String get info => 'מידע';
	@override String get warning => 'אזהרה';
	@override String get tbd => 'לקביעה';
	@override String get wip => 'עבודה בתהליך';
}

// Path: commonWebFeatures
class TranslationsCommonWebFeaturesHe extends TranslationsCommonWebFeaturesEn {
	TranslationsCommonWebFeaturesHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get search => 'חיפוש';
	@override String get filter => 'סינון';
	@override String get sort => 'מיון';
	@override String get share => 'שתף';
	@override String get download => 'הורד';
	@override String get upload => 'העלה';
	@override String get login => 'התחבר';
	@override String get logout => 'התנתק';
	@override String get register => 'הרשם';
	@override String get profile => 'פרופיל';
	@override String get settings => 'הגדרות';
	@override String get help => 'עזרה';
	@override String get contact => 'צור קשר';
	@override String get faqFull => 'שאלות נפוצות';
	@override String get termsOfService => 'תנאי שירות';
	@override String get privacyPolicy => 'מדיניות פרטיות';
	@override String get aboutUs => 'אודותינו';
	@override String get careers => 'קריירה';
	@override String get blog => 'בלוג';
	@override String get news => 'חדשות';
	@override String get events => 'אירועים';
	@override String get community => 'קהילה';
	@override String get forum => 'פורום';
	@override String get support => 'תמיכה';
	@override String get feedback => 'משוב';
	@override String get subscribe => 'הירשם';
	@override String get unsubscribe => 'בטל הרשמה';
	@override String get notifications => 'התראות';
	@override String get messages => 'הודעות';
	@override String get dashboard => 'לוח בקרה';
	@override String get analytics => 'אנליטיקה';
	@override String get reports => 'דוחות';
	@override String get calendar => 'לוח שנה';
	@override String get tasks => 'משימות';
	@override String get projects => 'פרויקטים';
	@override String get teams => 'צוותים';
	@override String get members => 'חברים';
	@override String get roles => 'תפקידים';
	@override String get permissions => 'הרשאות';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsHe {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.k1': return 'אחד';
			case 'numbers.k2': return 'שניים';
			case 'numbers.k3': return 'שלושה';
			case 'numbers.k4': return 'ארבעה';
			case 'numbers.k5': return 'חמישה';
			case 'numbers.k6': return 'שישה';
			case 'numbers.k7': return 'שבעה';
			case 'numbers.k8': return 'שמונה';
			case 'numbers.k9': return 'תשעה';
			case 'numbers.k10': return 'עשרה';
			case 'ranks.k1': return 'ראשון';
			case 'ranks.k2': return 'שני';
			case 'ranks.k3': return 'שלישי';
			case 'ranks.k4': return 'רביעי';
			case 'ranks.k5': return 'חמישי';
			case 'ranks.k6': return 'שישי';
			case 'ranks.k7': return 'שביעי';
			case 'ranks.k8': return 'שמיני';
			case 'ranks.k9': return 'תשיעי';
			case 'ranks.k10': return 'עשירי';
			case 'priority.low': return 'נמוך';
			case 'priority.medium': return 'בינוני';
			case 'priority.high': return 'גבוה';
			case 'time.seconds': return 'שניות';
			case 'time.minutes': return 'דקות';
			case 'time.hours': return 'שעות';
			case 'time.days': return 'ימים';
			case 'time.weeks': return 'שבועות';
			case 'time.months': return 'חודשים';
			case 'time.years': return 'שנים';
			case 'time.second': return 'שנייה';
			case 'time.minute': return 'דקה';
			case 'time.hour': return 'שעה';
			case 'time.day': return 'יום';
			case 'time.week': return 'שבוע';
			case 'time.month': return 'חודש';
			case 'time.year': return 'שנה';
			case 'timeRelative.now': return 'עכשיו';
			case 'timeRelative.later': return 'מאוחר יותר';
			case 'timeRelative.soon': return 'בקרוב';
			case 'timeRelative.inAMoment': return 'בעוד רגע';
			case 'timeRelative.justBefore': return 'ממש לפני';
			case 'timeRelative.before': return 'לפני';
			case 'timeRelative.after': return 'אחרי';
			case 'day.monday': return 'יום שני';
			case 'day.tuesday': return 'יום שלישי';
			case 'day.wednesday': return 'יום רביעי';
			case 'day.thursday': return 'יום חמישי';
			case 'day.friday': return 'יום שישי';
			case 'day.saturday': return 'יום שבת';
			case 'day.sunday': return 'יום ראשון';
			case 'dayType.weekday': return 'יום חול';
			case 'dayType.weekend': return 'סוף שבוע';
			case 'dayType.everyday': return 'כל יום';
			case 'dayRelative.today': return 'היום';
			case 'dayRelative.tomorrow': return 'מחר';
			case 'dayRelative.yesterday': return 'אתמול';
			case 'dayRelative.dayAfterTomorrow': return 'מחרתיים';
			case 'dayRelative.dayBeforeYesterday': return 'שלשום';
			case 'language.en': return 'אנגלית';
			case 'language.da': return 'דנית';
			case 'language.es': return 'ספרדית';
			case 'language.fr': return 'צרפתית';
			case 'language.he': return 'עברית';
			case 'language.isIS': return 'איסלנדית (איסלנד)';
			case 'language.ko': return 'קוריאנית';
			case 'language.nb': return 'נורבגית בוקמול';
			case 'language.nl': return 'הולנדית (פלמית)';
			case 'language.no': return 'נורבגית';
			case 'language.sv': return 'שוודית';
			case 'language.zhHans': return 'סינית (פשוטה)';
			case 'language.zh': return 'סינית (מסורתית)';
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
			case 'buttons.submit': return 'שלח';
			case 'buttons.close': return 'סגור';
			case 'buttons.reset': return 'איפוס';
			case 'buttons.cancel': return 'ביטול';
			case 'buttons.kContinue': return 'המשך';
			case 'buttons.back': return 'חזור';
			case 'buttons.next': return 'הבא';
			case 'buttons.done': return 'סיים';
			case 'buttons.upload': return 'העלה';
			case 'buttons.choose': return 'בחר';
			case 'buttons.select': return 'בחר';
			case 'buttons.clear': return 'נקה';
			case 'buttons.start': return 'התחל';
			case 'buttons.previous': return 'קודם';
			case 'buttons.finish': return 'סיים';
			case 'buttons.edit': return 'ערוך';
			case 'buttons.delete': return 'מחק';
			case 'buttons.save': return 'שמור';
			case 'buttons.view': return 'צפה';
			case 'buttons.add': return 'הוסף';
			case 'buttons.remove': return 'הסר';
			case 'buttons.update': return 'עדכן';
			case 'buttons.confirm': return 'אשר';
			case 'buttons.retry': return 'נסה שוב';
			case 'labels.required': return 'נדרש';
			case 'labels.optional': return 'אופציונלי';
			case 'labels.instructions': return 'הוראות:';
			case 'labels.status': return 'סטטוס';
			case 'labels.progress': return 'התקדמות';
			case 'labels.question': return 'שאלה';
			case 'labels.answer': return 'תשובה';
			case 'labels.response': return 'תגובה';
			case 'labels.loading': return 'טוען...';
			case 'labels.error': return 'שגיאה';
			case 'labels.success': return 'הצלחה';
			case 'labels.warning': return 'אזהרה';
			case 'response.success': return 'הצלחה';
			case 'response.error': return 'שגיאה';
			case 'response.info': return 'מידע';
			case 'response.warning': return 'אזהרה';
			case 'response.tbd': return 'לקביעה';
			case 'response.wip': return 'עבודה בתהליך';
			case 'commonWebFeatures.search': return 'חיפוש';
			case 'commonWebFeatures.filter': return 'סינון';
			case 'commonWebFeatures.sort': return 'מיון';
			case 'commonWebFeatures.share': return 'שתף';
			case 'commonWebFeatures.download': return 'הורד';
			case 'commonWebFeatures.upload': return 'העלה';
			case 'commonWebFeatures.login': return 'התחבר';
			case 'commonWebFeatures.logout': return 'התנתק';
			case 'commonWebFeatures.register': return 'הרשם';
			case 'commonWebFeatures.profile': return 'פרופיל';
			case 'commonWebFeatures.settings': return 'הגדרות';
			case 'commonWebFeatures.help': return 'עזרה';
			case 'commonWebFeatures.contact': return 'צור קשר';
			case 'commonWebFeatures.faqFull': return 'שאלות נפוצות';
			case 'commonWebFeatures.termsOfService': return 'תנאי שירות';
			case 'commonWebFeatures.privacyPolicy': return 'מדיניות פרטיות';
			case 'commonWebFeatures.aboutUs': return 'אודותינו';
			case 'commonWebFeatures.careers': return 'קריירה';
			case 'commonWebFeatures.blog': return 'בלוג';
			case 'commonWebFeatures.news': return 'חדשות';
			case 'commonWebFeatures.events': return 'אירועים';
			case 'commonWebFeatures.community': return 'קהילה';
			case 'commonWebFeatures.forum': return 'פורום';
			case 'commonWebFeatures.support': return 'תמיכה';
			case 'commonWebFeatures.feedback': return 'משוב';
			case 'commonWebFeatures.subscribe': return 'הירשם';
			case 'commonWebFeatures.unsubscribe': return 'בטל הרשמה';
			case 'commonWebFeatures.notifications': return 'התראות';
			case 'commonWebFeatures.messages': return 'הודעות';
			case 'commonWebFeatures.dashboard': return 'לוח בקרה';
			case 'commonWebFeatures.analytics': return 'אנליטיקה';
			case 'commonWebFeatures.reports': return 'דוחות';
			case 'commonWebFeatures.calendar': return 'לוח שנה';
			case 'commonWebFeatures.tasks': return 'משימות';
			case 'commonWebFeatures.projects': return 'פרויקטים';
			case 'commonWebFeatures.teams': return 'צוותים';
			case 'commonWebFeatures.members': return 'חברים';
			case 'commonWebFeatures.roles': return 'תפקידים';
			case 'commonWebFeatures.permissions': return 'הרשאות';
			default: return null;
		}
	}
}

