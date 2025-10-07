///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final pvtroCommon = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsNumbersEn numbers = TranslationsNumbersEn.internal(_root);
	late final TranslationsRanksEn ranks = TranslationsRanksEn.internal(_root);
	late final TranslationsPriorityEn priority = TranslationsPriorityEn.internal(_root);
	late final TranslationsTimeEn time = TranslationsTimeEn.internal(_root);
	late final TranslationsTimeRelativeEn timeRelative = TranslationsTimeRelativeEn.internal(_root);
	late final TranslationsDayEn day = TranslationsDayEn.internal(_root);
	late final TranslationsDayTypeEn dayType = TranslationsDayTypeEn.internal(_root);
	late final TranslationsDayRelativeEn dayRelative = TranslationsDayRelativeEn.internal(_root);
	late final TranslationsLanguageEn language = TranslationsLanguageEn.internal(_root);
	late final TranslationsLanguageShortEn languageShort = TranslationsLanguageShortEn.internal(_root);
	late final TranslationsButtonsEn buttons = TranslationsButtonsEn.internal(_root);
	late final TranslationsLabelsEn labels = TranslationsLabelsEn.internal(_root);
	late final TranslationsResponseEn response = TranslationsResponseEn.internal(_root);
	late final TranslationsCommonWebFeaturesEn commonWebFeatures = TranslationsCommonWebFeaturesEn.internal(_root);
}

// Path: numbers
class TranslationsNumbersEn {
	TranslationsNumbersEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'one'
	String get k1 => 'one';

	/// en: 'two'
	String get k2 => 'two';

	/// en: 'three'
	String get k3 => 'three';

	/// en: 'four'
	String get k4 => 'four';

	/// en: 'five'
	String get k5 => 'five';

	/// en: 'six'
	String get k6 => 'six';

	/// en: 'seven'
	String get k7 => 'seven';

	/// en: 'eight'
	String get k8 => 'eight';

	/// en: 'nine'
	String get k9 => 'nine';

	/// en: 'ten'
	String get k10 => 'ten';
}

// Path: ranks
class TranslationsRanksEn {
	TranslationsRanksEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'first'
	String get k1 => 'first';

	/// en: 'second'
	String get k2 => 'second';

	/// en: 'third'
	String get k3 => 'third';

	/// en: 'fourth'
	String get k4 => 'fourth';

	/// en: 'fifth'
	String get k5 => 'fifth';

	/// en: 'sixth'
	String get k6 => 'sixth';

	/// en: 'seventh'
	String get k7 => 'seventh';

	/// en: 'eighth'
	String get k8 => 'eighth';

	/// en: 'ninth'
	String get k9 => 'ninth';

	/// en: 'tenth'
	String get k10 => 'tenth';
}

// Path: priority
class TranslationsPriorityEn {
	TranslationsPriorityEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Low'
	String get low => 'Low';

	/// en: 'Medium'
	String get medium => 'Medium';

	/// en: 'High'
	String get high => 'High';
}

// Path: time
class TranslationsTimeEn {
	TranslationsTimeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'seconds'
	String get seconds => 'seconds';

	/// en: 'minutes'
	String get minutes => 'minutes';

	/// en: 'hours'
	String get hours => 'hours';

	/// en: 'days'
	String get days => 'days';

	/// en: 'weeks'
	String get weeks => 'weeks';

	/// en: 'months'
	String get months => 'months';

	/// en: 'years'
	String get years => 'years';

	/// en: 'second'
	String get second => 'second';

	/// en: 'minute'
	String get minute => 'minute';

	/// en: 'hour'
	String get hour => 'hour';

	/// en: 'day'
	String get day => 'day';

	/// en: 'week'
	String get week => 'week';

	/// en: 'month'
	String get month => 'month';

	/// en: 'year'
	String get year => 'year';
}

// Path: timeRelative
class TranslationsTimeRelativeEn {
	TranslationsTimeRelativeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'now'
	String get now => 'now';

	/// en: 'later'
	String get later => 'later';

	/// en: 'soon'
	String get soon => 'soon';

	/// en: 'in a moment'
	String get inAMoment => 'in a moment';

	/// en: 'just before'
	String get justBefore => 'just before';

	/// en: 'before'
	String get before => 'before';

	/// en: 'after'
	String get after => 'after';
}

// Path: day
class TranslationsDayEn {
	TranslationsDayEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Monday'
	String get monday => 'Monday';

	/// en: 'Tuesday'
	String get tuesday => 'Tuesday';

	/// en: 'Wednesday'
	String get wednesday => 'Wednesday';

	/// en: 'Thursday'
	String get thursday => 'Thursday';

	/// en: 'Friday'
	String get friday => 'Friday';

	/// en: 'Saturday'
	String get saturday => 'Saturday';

	/// en: 'Sunday'
	String get sunday => 'Sunday';
}

// Path: dayType
class TranslationsDayTypeEn {
	TranslationsDayTypeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'weekday'
	String get weekday => 'weekday';

	/// en: 'weekend'
	String get weekend => 'weekend';

	/// en: 'everyday'
	String get everyday => 'everyday';
}

// Path: dayRelative
class TranslationsDayRelativeEn {
	TranslationsDayRelativeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'today'
	String get today => 'today';

	/// en: 'tomorrow'
	String get tomorrow => 'tomorrow';

	/// en: 'yesterday'
	String get yesterday => 'yesterday';

	/// en: 'day after tomorrow'
	String get dayAfterTomorrow => 'day after tomorrow';

	/// en: 'day before yesterday'
	String get dayBeforeYesterday => 'day before yesterday';
}

// Path: language
class TranslationsLanguageEn {
	TranslationsLanguageEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'English'
	String get en => 'English';

	/// en: 'Danish'
	String get da => 'Danish';

	/// en: 'Spanish'
	String get es => 'Spanish';

	/// en: 'French'
	String get fr => 'French';

	/// en: 'Hebrew'
	String get he => 'Hebrew';

	/// en: 'Icelandic (Iceland)'
	String get isIS => 'Icelandic (Iceland)';

	/// en: 'Korean'
	String get ko => 'Korean';

	/// en: 'Norwegian Bokmål'
	String get nb => 'Norwegian Bokmål';

	/// en: 'Dutch (Flemish)'
	String get nl => 'Dutch (Flemish)';

	/// en: 'Norwegian'
	String get no => 'Norwegian';

	/// en: 'Swedish'
	String get sv => 'Swedish';

	/// en: 'Chinese (Simplified)'
	String get zhHans => 'Chinese (Simplified)';

	/// en: 'Chinese (Traditional)'
	String get zh => 'Chinese (Traditional)';
}

// Path: languageShort
class TranslationsLanguageShortEn {
	TranslationsLanguageShortEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'EN'
	String get en => 'EN';

	/// en: 'DA'
	String get da => 'DA';

	/// en: 'ES'
	String get es => 'ES';

	/// en: 'FR'
	String get fr => 'FR';

	/// en: 'HE'
	String get he => 'HE';

	/// en: 'IS'
	String get isIS => 'IS';

	/// en: 'KO'
	String get ko => 'KO';

	/// en: 'NB'
	String get nb => 'NB';

	/// en: 'NL'
	String get nl => 'NL';

	/// en: 'NO'
	String get no => 'NO';

	/// en: 'SV'
	String get sv => 'SV';

	/// en: 'ZH'
	String get zhHans => 'ZH';

	/// en: 'ZH'
	String get zh => 'ZH';
}

// Path: buttons
class TranslationsButtonsEn {
	TranslationsButtonsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Submit'
	String get submit => 'Submit';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Reset'
	String get reset => 'Reset';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Continue'
	String get kContinue => 'Continue';

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Done'
	String get done => 'Done';

	/// en: 'Upload'
	String get upload => 'Upload';

	/// en: 'Choose'
	String get choose => 'Choose';

	/// en: 'Select'
	String get select => 'Select';

	/// en: 'Clear'
	String get clear => 'Clear';

	/// en: 'Start'
	String get start => 'Start';

	/// en: 'Previous'
	String get previous => 'Previous';

	/// en: 'Finish'
	String get finish => 'Finish';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'View'
	String get view => 'View';

	/// en: 'Add'
	String get add => 'Add';

	/// en: 'Remove'
	String get remove => 'Remove';

	/// en: 'Update'
	String get update => 'Update';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Retry'
	String get retry => 'Retry';
}

// Path: labels
class TranslationsLabelsEn {
	TranslationsLabelsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Required'
	String get required => 'Required';

	/// en: 'Optional'
	String get optional => 'Optional';

	/// en: 'Instructions:'
	String get instructions => 'Instructions:';

	/// en: 'Status'
	String get status => 'Status';

	/// en: 'Progress'
	String get progress => 'Progress';

	/// en: 'Question'
	String get question => 'Question';

	/// en: 'Answer'
	String get answer => 'Answer';

	/// en: 'Response'
	String get response => 'Response';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Error'
	String get error => 'Error';

	/// en: 'Success'
	String get success => 'Success';

	/// en: 'Warning'
	String get warning => 'Warning';
}

// Path: response
class TranslationsResponseEn {
	TranslationsResponseEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Success'
	String get success => 'Success';

	/// en: 'Error'
	String get error => 'Error';

	/// en: 'Info'
	String get info => 'Info';

	/// en: 'Warning'
	String get warning => 'Warning';

	/// en: 'To Be Determined'
	String get tbd => 'To Be Determined';

	/// en: 'Work In Progress'
	String get wip => 'Work In Progress';
}

// Path: commonWebFeatures
class TranslationsCommonWebFeaturesEn {
	TranslationsCommonWebFeaturesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Filter'
	String get filter => 'Filter';

	/// en: 'Sort'
	String get sort => 'Sort';

	/// en: 'Share'
	String get share => 'Share';

	/// en: 'Download'
	String get download => 'Download';

	/// en: 'Upload'
	String get upload => 'Upload';

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'Logout'
	String get logout => 'Logout';

	/// en: 'Register'
	String get register => 'Register';

	/// en: 'Profile'
	String get profile => 'Profile';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Help'
	String get help => 'Help';

	/// en: 'Contact'
	String get contact => 'Contact';

	/// en: 'Frequently Asked Questions'
	String get faqFull => 'Frequently Asked Questions';

	/// en: 'Terms of Service'
	String get termsOfService => 'Terms of Service';

	/// en: 'Privacy Policy'
	String get privacyPolicy => 'Privacy Policy';

	/// en: 'About Us'
	String get aboutUs => 'About Us';

	/// en: 'Careers'
	String get careers => 'Careers';

	/// en: 'Blog'
	String get blog => 'Blog';

	/// en: 'News'
	String get news => 'News';

	/// en: 'Events'
	String get events => 'Events';

	/// en: 'Community'
	String get community => 'Community';

	/// en: 'Forum'
	String get forum => 'Forum';

	/// en: 'Support'
	String get support => 'Support';

	/// en: 'Feedback'
	String get feedback => 'Feedback';

	/// en: 'Subscribe'
	String get subscribe => 'Subscribe';

	/// en: 'Unsubscribe'
	String get unsubscribe => 'Unsubscribe';

	/// en: 'Notifications'
	String get notifications => 'Notifications';

	/// en: 'Messages'
	String get messages => 'Messages';

	/// en: 'Dashboard'
	String get dashboard => 'Dashboard';

	/// en: 'Analytics'
	String get analytics => 'Analytics';

	/// en: 'Reports'
	String get reports => 'Reports';

	/// en: 'Calendar'
	String get calendar => 'Calendar';

	/// en: 'Tasks'
	String get tasks => 'Tasks';

	/// en: 'Projects'
	String get projects => 'Projects';

	/// en: 'Teams'
	String get teams => 'Teams';

	/// en: 'Members'
	String get members => 'Members';

	/// en: 'Roles'
	String get roles => 'Roles';

	/// en: 'Permissions'
	String get permissions => 'Permissions';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.k1': return 'one';
			case 'numbers.k2': return 'two';
			case 'numbers.k3': return 'three';
			case 'numbers.k4': return 'four';
			case 'numbers.k5': return 'five';
			case 'numbers.k6': return 'six';
			case 'numbers.k7': return 'seven';
			case 'numbers.k8': return 'eight';
			case 'numbers.k9': return 'nine';
			case 'numbers.k10': return 'ten';
			case 'ranks.k1': return 'first';
			case 'ranks.k2': return 'second';
			case 'ranks.k3': return 'third';
			case 'ranks.k4': return 'fourth';
			case 'ranks.k5': return 'fifth';
			case 'ranks.k6': return 'sixth';
			case 'ranks.k7': return 'seventh';
			case 'ranks.k8': return 'eighth';
			case 'ranks.k9': return 'ninth';
			case 'ranks.k10': return 'tenth';
			case 'priority.low': return 'Low';
			case 'priority.medium': return 'Medium';
			case 'priority.high': return 'High';
			case 'time.seconds': return 'seconds';
			case 'time.minutes': return 'minutes';
			case 'time.hours': return 'hours';
			case 'time.days': return 'days';
			case 'time.weeks': return 'weeks';
			case 'time.months': return 'months';
			case 'time.years': return 'years';
			case 'time.second': return 'second';
			case 'time.minute': return 'minute';
			case 'time.hour': return 'hour';
			case 'time.day': return 'day';
			case 'time.week': return 'week';
			case 'time.month': return 'month';
			case 'time.year': return 'year';
			case 'timeRelative.now': return 'now';
			case 'timeRelative.later': return 'later';
			case 'timeRelative.soon': return 'soon';
			case 'timeRelative.inAMoment': return 'in a moment';
			case 'timeRelative.justBefore': return 'just before';
			case 'timeRelative.before': return 'before';
			case 'timeRelative.after': return 'after';
			case 'day.monday': return 'Monday';
			case 'day.tuesday': return 'Tuesday';
			case 'day.wednesday': return 'Wednesday';
			case 'day.thursday': return 'Thursday';
			case 'day.friday': return 'Friday';
			case 'day.saturday': return 'Saturday';
			case 'day.sunday': return 'Sunday';
			case 'dayType.weekday': return 'weekday';
			case 'dayType.weekend': return 'weekend';
			case 'dayType.everyday': return 'everyday';
			case 'dayRelative.today': return 'today';
			case 'dayRelative.tomorrow': return 'tomorrow';
			case 'dayRelative.yesterday': return 'yesterday';
			case 'dayRelative.dayAfterTomorrow': return 'day after tomorrow';
			case 'dayRelative.dayBeforeYesterday': return 'day before yesterday';
			case 'language.en': return 'English';
			case 'language.da': return 'Danish';
			case 'language.es': return 'Spanish';
			case 'language.fr': return 'French';
			case 'language.he': return 'Hebrew';
			case 'language.isIS': return 'Icelandic (Iceland)';
			case 'language.ko': return 'Korean';
			case 'language.nb': return 'Norwegian Bokmål';
			case 'language.nl': return 'Dutch (Flemish)';
			case 'language.no': return 'Norwegian';
			case 'language.sv': return 'Swedish';
			case 'language.zhHans': return 'Chinese (Simplified)';
			case 'language.zh': return 'Chinese (Traditional)';
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
			case 'buttons.submit': return 'Submit';
			case 'buttons.close': return 'Close';
			case 'buttons.reset': return 'Reset';
			case 'buttons.cancel': return 'Cancel';
			case 'buttons.kContinue': return 'Continue';
			case 'buttons.back': return 'Back';
			case 'buttons.next': return 'Next';
			case 'buttons.done': return 'Done';
			case 'buttons.upload': return 'Upload';
			case 'buttons.choose': return 'Choose';
			case 'buttons.select': return 'Select';
			case 'buttons.clear': return 'Clear';
			case 'buttons.start': return 'Start';
			case 'buttons.previous': return 'Previous';
			case 'buttons.finish': return 'Finish';
			case 'buttons.edit': return 'Edit';
			case 'buttons.delete': return 'Delete';
			case 'buttons.save': return 'Save';
			case 'buttons.view': return 'View';
			case 'buttons.add': return 'Add';
			case 'buttons.remove': return 'Remove';
			case 'buttons.update': return 'Update';
			case 'buttons.confirm': return 'Confirm';
			case 'buttons.retry': return 'Retry';
			case 'labels.required': return 'Required';
			case 'labels.optional': return 'Optional';
			case 'labels.instructions': return 'Instructions:';
			case 'labels.status': return 'Status';
			case 'labels.progress': return 'Progress';
			case 'labels.question': return 'Question';
			case 'labels.answer': return 'Answer';
			case 'labels.response': return 'Response';
			case 'labels.loading': return 'Loading...';
			case 'labels.error': return 'Error';
			case 'labels.success': return 'Success';
			case 'labels.warning': return 'Warning';
			case 'response.success': return 'Success';
			case 'response.error': return 'Error';
			case 'response.info': return 'Info';
			case 'response.warning': return 'Warning';
			case 'response.tbd': return 'To Be Determined';
			case 'response.wip': return 'Work In Progress';
			case 'commonWebFeatures.search': return 'Search';
			case 'commonWebFeatures.filter': return 'Filter';
			case 'commonWebFeatures.sort': return 'Sort';
			case 'commonWebFeatures.share': return 'Share';
			case 'commonWebFeatures.download': return 'Download';
			case 'commonWebFeatures.upload': return 'Upload';
			case 'commonWebFeatures.login': return 'Login';
			case 'commonWebFeatures.logout': return 'Logout';
			case 'commonWebFeatures.register': return 'Register';
			case 'commonWebFeatures.profile': return 'Profile';
			case 'commonWebFeatures.settings': return 'Settings';
			case 'commonWebFeatures.help': return 'Help';
			case 'commonWebFeatures.contact': return 'Contact';
			case 'commonWebFeatures.faqFull': return 'Frequently Asked Questions';
			case 'commonWebFeatures.termsOfService': return 'Terms of Service';
			case 'commonWebFeatures.privacyPolicy': return 'Privacy Policy';
			case 'commonWebFeatures.aboutUs': return 'About Us';
			case 'commonWebFeatures.careers': return 'Careers';
			case 'commonWebFeatures.blog': return 'Blog';
			case 'commonWebFeatures.news': return 'News';
			case 'commonWebFeatures.events': return 'Events';
			case 'commonWebFeatures.community': return 'Community';
			case 'commonWebFeatures.forum': return 'Forum';
			case 'commonWebFeatures.support': return 'Support';
			case 'commonWebFeatures.feedback': return 'Feedback';
			case 'commonWebFeatures.subscribe': return 'Subscribe';
			case 'commonWebFeatures.unsubscribe': return 'Unsubscribe';
			case 'commonWebFeatures.notifications': return 'Notifications';
			case 'commonWebFeatures.messages': return 'Messages';
			case 'commonWebFeatures.dashboard': return 'Dashboard';
			case 'commonWebFeatures.analytics': return 'Analytics';
			case 'commonWebFeatures.reports': return 'Reports';
			case 'commonWebFeatures.calendar': return 'Calendar';
			case 'commonWebFeatures.tasks': return 'Tasks';
			case 'commonWebFeatures.projects': return 'Projects';
			case 'commonWebFeatures.teams': return 'Teams';
			case 'commonWebFeatures.members': return 'Members';
			case 'commonWebFeatures.roles': return 'Roles';
			case 'commonWebFeatures.permissions': return 'Permissions';
			default: return null;
		}
	}
}

