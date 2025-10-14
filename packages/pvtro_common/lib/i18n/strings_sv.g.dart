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
class TranslationsSv extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsSv({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.sv,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <sv>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsSv _root = this; // ignore: unused_field

	@override 
	TranslationsSv $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsSv(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsNumbersSv numbers = TranslationsNumbersSv._(_root);
	@override late final TranslationsRanksSv ranks = TranslationsRanksSv._(_root);
	@override late final TranslationsPrioritySv priority = TranslationsPrioritySv._(_root);
	@override late final TranslationsTimeSv time = TranslationsTimeSv._(_root);
	@override late final TranslationsTimeRelativeSv timeRelative = TranslationsTimeRelativeSv._(_root);
	@override late final TranslationsDaySv day = TranslationsDaySv._(_root);
	@override late final TranslationsDayTypeSv dayType = TranslationsDayTypeSv._(_root);
	@override late final TranslationsDayRelativeSv dayRelative = TranslationsDayRelativeSv._(_root);
	@override late final TranslationsLanguageSv language = TranslationsLanguageSv._(_root);
	@override late final TranslationsLanguageShortSv languageShort = TranslationsLanguageShortSv._(_root);
	@override late final TranslationsButtonsSv buttons = TranslationsButtonsSv._(_root);
	@override late final TranslationsLabelsSv labels = TranslationsLabelsSv._(_root);
	@override late final TranslationsResponseSv response = TranslationsResponseSv._(_root);
	@override late final TranslationsCommonWebFeaturesSv commonWebFeatures = TranslationsCommonWebFeaturesSv._(_root);
}

// Path: numbers
class TranslationsNumbersSv extends TranslationsNumbersEn {
	TranslationsNumbersSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'en';
	@override String get k2 => 'två';
	@override String get k3 => 'tre';
	@override String get k4 => 'fyra';
	@override String get k5 => 'fem';
	@override String get k6 => 'sex';
	@override String get k7 => 'sju';
	@override String get k8 => 'åtta';
	@override String get k9 => 'nio';
	@override String get k10 => 'tio';
}

// Path: ranks
class TranslationsRanksSv extends TranslationsRanksEn {
	TranslationsRanksSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'första';
	@override String get k2 => 'andra';
	@override String get k3 => 'tredje';
	@override String get k4 => 'fjärde';
	@override String get k5 => 'femte';
	@override String get k6 => 'sjätte';
	@override String get k7 => 'sjunde';
	@override String get k8 => 'åttonde';
	@override String get k9 => 'nionde';
	@override String get k10 => 'tionde';
}

// Path: priority
class TranslationsPrioritySv extends TranslationsPriorityEn {
	TranslationsPrioritySv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get low => 'Låg';
	@override String get medium => 'Medium';
	@override String get high => 'Hög';
}

// Path: time
class TranslationsTimeSv extends TranslationsTimeEn {
	TranslationsTimeSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get seconds => 'sekunder';
	@override String get minutes => 'minuter';
	@override String get hours => 'timmar';
	@override String get days => 'dagar';
	@override String get weeks => 'veckor';
	@override String get months => 'månader';
	@override String get years => 'år';
	@override String get second => 'sekund';
	@override String get minute => 'minut';
	@override String get hour => 'timme';
	@override String get day => 'dag';
	@override String get week => 'vecka';
	@override String get month => 'månad';
	@override String get year => 'år';
}

// Path: timeRelative
class TranslationsTimeRelativeSv extends TranslationsTimeRelativeEn {
	TranslationsTimeRelativeSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get now => 'nu';
	@override String get later => 'senare';
	@override String get soon => 'snart';
	@override String get inAMoment => 'om en stund';
	@override String get justBefore => 'precis innan';
	@override String get before => 'före';
	@override String get after => 'efter';
}

// Path: day
class TranslationsDaySv extends TranslationsDayEn {
	TranslationsDaySv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get monday => 'Måndag';
	@override String get tuesday => 'Tisdag';
	@override String get wednesday => 'Onsdag';
	@override String get thursday => 'Torsdag';
	@override String get friday => 'Fredag';
	@override String get saturday => 'Lördag';
	@override String get sunday => 'Söndag';
}

// Path: dayType
class TranslationsDayTypeSv extends TranslationsDayTypeEn {
	TranslationsDayTypeSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get weekday => 'vardag';
	@override String get weekend => 'helg';
	@override String get everyday => 'varje dag';
}

// Path: dayRelative
class TranslationsDayRelativeSv extends TranslationsDayRelativeEn {
	TranslationsDayRelativeSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get today => 'idag';
	@override String get tomorrow => 'imorgon';
	@override String get yesterday => 'igår';
	@override String get dayAfterTomorrow => 'i övermorgon';
	@override String get dayBeforeYesterday => 'i förrgår';
}

// Path: language
class TranslationsLanguageSv extends TranslationsLanguageEn {
	TranslationsLanguageSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get en => 'Engelska';
	@override String get da => 'Danska';
	@override String get es => 'Spanska';
	@override String get fr => 'Franska';
	@override String get he => 'Hebreiska';
	@override String get isIS => 'Isländska (Island)';
	@override String get ko => 'Koreanska';
	@override String get nb => 'Norska Bokmål';
	@override String get nl => 'Holländska (Flamländska)';
	@override String get no => 'Norska';
	@override String get sv => 'Svenska';
	@override String get zhHans => 'Kinesiska (Förenklad)';
	@override String get zh => 'Kinesiska (Traditionell)';
}

// Path: languageShort
class TranslationsLanguageShortSv extends TranslationsLanguageShortEn {
	TranslationsLanguageShortSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

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
class TranslationsButtonsSv extends TranslationsButtonsEn {
	TranslationsButtonsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get submit => 'Skicka';
	@override String get close => 'Stäng';
	@override String get reset => 'Återställ';
	@override String get cancel => 'Avbryt';
	@override String get kContinue => 'Fortsätt';
	@override String get back => 'Tillbaka';
	@override String get next => 'Nästa';
	@override String get done => 'Klar';
	@override String get upload => 'Ladda upp';
	@override String get choose => 'Välj';
	@override String get select => 'Välj';
	@override String get clear => 'Rensa';
	@override String get start => 'Starta';
	@override String get previous => 'Föregående';
	@override String get finish => 'Slutför';
	@override String get edit => 'Redigera';
	@override String get delete => 'Radera';
	@override String get save => 'Spara';
	@override String get view => 'Visa';
	@override String get add => 'Lägg till';
	@override String get remove => 'Ta bort';
	@override String get update => 'Uppdatera';
	@override String get confirm => 'Bekräfta';
	@override String get retry => 'Försök igen';
}

// Path: labels
class TranslationsLabelsSv extends TranslationsLabelsEn {
	TranslationsLabelsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get required => 'Obligatorisk';
	@override String get optional => 'Valfri';
	@override String get instructions => 'Instruktioner:';
	@override String get status => 'Status';
	@override String get progress => 'Framsteg';
	@override String get question => 'Fråga';
	@override String get answer => 'Svar';
	@override String get response => 'Svar';
	@override String get loading => 'Laddar...';
	@override String get error => 'Fel';
	@override String get success => 'Framgång';
	@override String get warning => 'Varning';
}

// Path: response
class TranslationsResponseSv extends TranslationsResponseEn {
	TranslationsResponseSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get success => 'Framgång';
	@override String get error => 'Fel';
	@override String get info => 'Info';
	@override String get warning => 'Varning';
	@override String get tbd => 'Ska Bestämmas';
	@override String get wip => 'Pågående Arbete';
}

// Path: commonWebFeatures
class TranslationsCommonWebFeaturesSv extends TranslationsCommonWebFeaturesEn {
	TranslationsCommonWebFeaturesSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get search => 'Sök';
	@override String get filter => 'Filtrera';
	@override String get sort => 'Sortera';
	@override String get share => 'Dela';
	@override String get download => 'Ladda ner';
	@override String get upload => 'Ladda upp';
	@override String get login => 'Logga in';
	@override String get logout => 'Logga ut';
	@override String get register => 'Registrera';
	@override String get profile => 'Profil';
	@override String get settings => 'Inställningar';
	@override String get help => 'Hjälp';
	@override String get contact => 'Kontakt';
	@override String get faqFull => 'Vanliga Frågor';
	@override String get termsOfService => 'Tjänstevillkor';
	@override String get privacyPolicy => 'Integritetspolicy';
	@override String get aboutUs => 'Om Oss';
	@override String get careers => 'Karriärer';
	@override String get blog => 'Blogg';
	@override String get news => 'Nyheter';
	@override String get events => 'Evenemang';
	@override String get community => 'Gemenskap';
	@override String get forum => 'Forum';
	@override String get support => 'Support';
	@override String get feedback => 'Återkoppling';
	@override String get subscribe => 'Prenumerera';
	@override String get unsubscribe => 'Avsluta prenumeration';
	@override String get notifications => 'Meddelanden';
	@override String get messages => 'Meddelanden';
	@override String get dashboard => 'Instrumentpanel';
	@override String get analytics => 'Analyser';
	@override String get reports => 'Rapporter';
	@override String get calendar => 'Kalender';
	@override String get tasks => 'Uppgifter';
	@override String get projects => 'Projekt';
	@override String get teams => 'Team';
	@override String get members => 'Medlemmar';
	@override String get roles => 'Roller';
	@override String get permissions => 'Behörigheter';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsSv {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.k1': return 'en';
			case 'numbers.k2': return 'två';
			case 'numbers.k3': return 'tre';
			case 'numbers.k4': return 'fyra';
			case 'numbers.k5': return 'fem';
			case 'numbers.k6': return 'sex';
			case 'numbers.k7': return 'sju';
			case 'numbers.k8': return 'åtta';
			case 'numbers.k9': return 'nio';
			case 'numbers.k10': return 'tio';
			case 'ranks.k1': return 'första';
			case 'ranks.k2': return 'andra';
			case 'ranks.k3': return 'tredje';
			case 'ranks.k4': return 'fjärde';
			case 'ranks.k5': return 'femte';
			case 'ranks.k6': return 'sjätte';
			case 'ranks.k7': return 'sjunde';
			case 'ranks.k8': return 'åttonde';
			case 'ranks.k9': return 'nionde';
			case 'ranks.k10': return 'tionde';
			case 'priority.low': return 'Låg';
			case 'priority.medium': return 'Medium';
			case 'priority.high': return 'Hög';
			case 'time.seconds': return 'sekunder';
			case 'time.minutes': return 'minuter';
			case 'time.hours': return 'timmar';
			case 'time.days': return 'dagar';
			case 'time.weeks': return 'veckor';
			case 'time.months': return 'månader';
			case 'time.years': return 'år';
			case 'time.second': return 'sekund';
			case 'time.minute': return 'minut';
			case 'time.hour': return 'timme';
			case 'time.day': return 'dag';
			case 'time.week': return 'vecka';
			case 'time.month': return 'månad';
			case 'time.year': return 'år';
			case 'timeRelative.now': return 'nu';
			case 'timeRelative.later': return 'senare';
			case 'timeRelative.soon': return 'snart';
			case 'timeRelative.inAMoment': return 'om en stund';
			case 'timeRelative.justBefore': return 'precis innan';
			case 'timeRelative.before': return 'före';
			case 'timeRelative.after': return 'efter';
			case 'day.monday': return 'Måndag';
			case 'day.tuesday': return 'Tisdag';
			case 'day.wednesday': return 'Onsdag';
			case 'day.thursday': return 'Torsdag';
			case 'day.friday': return 'Fredag';
			case 'day.saturday': return 'Lördag';
			case 'day.sunday': return 'Söndag';
			case 'dayType.weekday': return 'vardag';
			case 'dayType.weekend': return 'helg';
			case 'dayType.everyday': return 'varje dag';
			case 'dayRelative.today': return 'idag';
			case 'dayRelative.tomorrow': return 'imorgon';
			case 'dayRelative.yesterday': return 'igår';
			case 'dayRelative.dayAfterTomorrow': return 'i övermorgon';
			case 'dayRelative.dayBeforeYesterday': return 'i förrgår';
			case 'language.en': return 'Engelska';
			case 'language.da': return 'Danska';
			case 'language.es': return 'Spanska';
			case 'language.fr': return 'Franska';
			case 'language.he': return 'Hebreiska';
			case 'language.isIS': return 'Isländska (Island)';
			case 'language.ko': return 'Koreanska';
			case 'language.nb': return 'Norska Bokmål';
			case 'language.nl': return 'Holländska (Flamländska)';
			case 'language.no': return 'Norska';
			case 'language.sv': return 'Svenska';
			case 'language.zhHans': return 'Kinesiska (Förenklad)';
			case 'language.zh': return 'Kinesiska (Traditionell)';
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
			case 'buttons.submit': return 'Skicka';
			case 'buttons.close': return 'Stäng';
			case 'buttons.reset': return 'Återställ';
			case 'buttons.cancel': return 'Avbryt';
			case 'buttons.kContinue': return 'Fortsätt';
			case 'buttons.back': return 'Tillbaka';
			case 'buttons.next': return 'Nästa';
			case 'buttons.done': return 'Klar';
			case 'buttons.upload': return 'Ladda upp';
			case 'buttons.choose': return 'Välj';
			case 'buttons.select': return 'Välj';
			case 'buttons.clear': return 'Rensa';
			case 'buttons.start': return 'Starta';
			case 'buttons.previous': return 'Föregående';
			case 'buttons.finish': return 'Slutför';
			case 'buttons.edit': return 'Redigera';
			case 'buttons.delete': return 'Radera';
			case 'buttons.save': return 'Spara';
			case 'buttons.view': return 'Visa';
			case 'buttons.add': return 'Lägg till';
			case 'buttons.remove': return 'Ta bort';
			case 'buttons.update': return 'Uppdatera';
			case 'buttons.confirm': return 'Bekräfta';
			case 'buttons.retry': return 'Försök igen';
			case 'labels.required': return 'Obligatorisk';
			case 'labels.optional': return 'Valfri';
			case 'labels.instructions': return 'Instruktioner:';
			case 'labels.status': return 'Status';
			case 'labels.progress': return 'Framsteg';
			case 'labels.question': return 'Fråga';
			case 'labels.answer': return 'Svar';
			case 'labels.response': return 'Svar';
			case 'labels.loading': return 'Laddar...';
			case 'labels.error': return 'Fel';
			case 'labels.success': return 'Framgång';
			case 'labels.warning': return 'Varning';
			case 'response.success': return 'Framgång';
			case 'response.error': return 'Fel';
			case 'response.info': return 'Info';
			case 'response.warning': return 'Varning';
			case 'response.tbd': return 'Ska Bestämmas';
			case 'response.wip': return 'Pågående Arbete';
			case 'commonWebFeatures.search': return 'Sök';
			case 'commonWebFeatures.filter': return 'Filtrera';
			case 'commonWebFeatures.sort': return 'Sortera';
			case 'commonWebFeatures.share': return 'Dela';
			case 'commonWebFeatures.download': return 'Ladda ner';
			case 'commonWebFeatures.upload': return 'Ladda upp';
			case 'commonWebFeatures.login': return 'Logga in';
			case 'commonWebFeatures.logout': return 'Logga ut';
			case 'commonWebFeatures.register': return 'Registrera';
			case 'commonWebFeatures.profile': return 'Profil';
			case 'commonWebFeatures.settings': return 'Inställningar';
			case 'commonWebFeatures.help': return 'Hjälp';
			case 'commonWebFeatures.contact': return 'Kontakt';
			case 'commonWebFeatures.faqFull': return 'Vanliga Frågor';
			case 'commonWebFeatures.termsOfService': return 'Tjänstevillkor';
			case 'commonWebFeatures.privacyPolicy': return 'Integritetspolicy';
			case 'commonWebFeatures.aboutUs': return 'Om Oss';
			case 'commonWebFeatures.careers': return 'Karriärer';
			case 'commonWebFeatures.blog': return 'Blogg';
			case 'commonWebFeatures.news': return 'Nyheter';
			case 'commonWebFeatures.events': return 'Evenemang';
			case 'commonWebFeatures.community': return 'Gemenskap';
			case 'commonWebFeatures.forum': return 'Forum';
			case 'commonWebFeatures.support': return 'Support';
			case 'commonWebFeatures.feedback': return 'Återkoppling';
			case 'commonWebFeatures.subscribe': return 'Prenumerera';
			case 'commonWebFeatures.unsubscribe': return 'Avsluta prenumeration';
			case 'commonWebFeatures.notifications': return 'Meddelanden';
			case 'commonWebFeatures.messages': return 'Meddelanden';
			case 'commonWebFeatures.dashboard': return 'Instrumentpanel';
			case 'commonWebFeatures.analytics': return 'Analyser';
			case 'commonWebFeatures.reports': return 'Rapporter';
			case 'commonWebFeatures.calendar': return 'Kalender';
			case 'commonWebFeatures.tasks': return 'Uppgifter';
			case 'commonWebFeatures.projects': return 'Projekt';
			case 'commonWebFeatures.teams': return 'Team';
			case 'commonWebFeatures.members': return 'Medlemmar';
			case 'commonWebFeatures.roles': return 'Roller';
			case 'commonWebFeatures.permissions': return 'Behörigheter';
			default: return null;
		}
	}
}

