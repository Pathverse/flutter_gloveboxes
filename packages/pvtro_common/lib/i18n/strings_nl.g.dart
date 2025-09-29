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
class TranslationsNl extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsNl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.nl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <nl>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsNl _root = this; // ignore: unused_field

	@override 
	TranslationsNl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsNl(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsNumbersNl numbers = TranslationsNumbersNl._(_root);
	@override late final TranslationsRanksNl ranks = TranslationsRanksNl._(_root);
	@override late final TranslationsPriorityNl priority = TranslationsPriorityNl._(_root);
	@override late final TranslationsTimeNl time = TranslationsTimeNl._(_root);
	@override late final TranslationsTimeRelativeNl timeRelative = TranslationsTimeRelativeNl._(_root);
	@override late final TranslationsDayNl day = TranslationsDayNl._(_root);
	@override late final TranslationsDayTypeNl dayType = TranslationsDayTypeNl._(_root);
	@override late final TranslationsDayRelativeNl dayRelative = TranslationsDayRelativeNl._(_root);
	@override late final TranslationsLanguageNl language = TranslationsLanguageNl._(_root);
	@override late final TranslationsLanguageShortNl languageShort = TranslationsLanguageShortNl._(_root);
	@override late final TranslationsButtonsNl buttons = TranslationsButtonsNl._(_root);
	@override late final TranslationsLabelsNl labels = TranslationsLabelsNl._(_root);
	@override late final TranslationsResponseNl response = TranslationsResponseNl._(_root);
	@override late final TranslationsCommonWebFeaturesNl commonWebFeatures = TranslationsCommonWebFeaturesNl._(_root);
}

// Path: numbers
class TranslationsNumbersNl extends TranslationsNumbersEn {
	TranslationsNumbersNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'een';
	@override String get k2 => 'twee';
	@override String get k3 => 'drie';
	@override String get k4 => 'vier';
	@override String get k5 => 'vijf';
	@override String get k6 => 'zes';
	@override String get k7 => 'zeven';
	@override String get k8 => 'acht';
	@override String get k9 => 'negen';
	@override String get k10 => 'tien';
}

// Path: ranks
class TranslationsRanksNl extends TranslationsRanksEn {
	TranslationsRanksNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'eerste';
	@override String get k2 => 'tweede';
	@override String get k3 => 'derde';
	@override String get k4 => 'vierde';
	@override String get k5 => 'vijfde';
	@override String get k6 => 'zesde';
	@override String get k7 => 'zevende';
	@override String get k8 => 'achtste';
	@override String get k9 => 'negende';
	@override String get k10 => 'tiende';
}

// Path: priority
class TranslationsPriorityNl extends TranslationsPriorityEn {
	TranslationsPriorityNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get low => 'Laag';
	@override String get medium => 'Gemiddeld';
	@override String get high => 'Hoog';
}

// Path: time
class TranslationsTimeNl extends TranslationsTimeEn {
	TranslationsTimeNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get seconds => 'seconden';
	@override String get minutes => 'minuten';
	@override String get hours => 'uren';
	@override String get days => 'dagen';
	@override String get weeks => 'weken';
	@override String get months => 'maanden';
	@override String get years => 'jaren';
	@override String get second => 'seconde';
	@override String get minute => 'minuut';
	@override String get hour => 'uur';
	@override String get day => 'dag';
	@override String get week => 'week';
	@override String get month => 'maand';
	@override String get year => 'jaar';
}

// Path: timeRelative
class TranslationsTimeRelativeNl extends TranslationsTimeRelativeEn {
	TranslationsTimeRelativeNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get now => 'nu';
	@override String get later => 'later';
	@override String get soon => 'binnenkort';
	@override String get inAMoment => 'zo meteen';
	@override String get justBefore => 'net ervoor';
	@override String get before => 'voor';
	@override String get after => 'na';
}

// Path: day
class TranslationsDayNl extends TranslationsDayEn {
	TranslationsDayNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get monday => 'Maandag';
	@override String get tuesday => 'Dinsdag';
	@override String get wednesday => 'Woensdag';
	@override String get thursday => 'Donderdag';
	@override String get friday => 'Vrijdag';
	@override String get saturday => 'Zaterdag';
	@override String get sunday => 'Zondag';
}

// Path: dayType
class TranslationsDayTypeNl extends TranslationsDayTypeEn {
	TranslationsDayTypeNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get weekday => 'weekdag';
	@override String get weekend => 'weekend';
	@override String get everyday => 'elke dag';
}

// Path: dayRelative
class TranslationsDayRelativeNl extends TranslationsDayRelativeEn {
	TranslationsDayRelativeNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get today => 'vandaag';
	@override String get tomorrow => 'morgen';
	@override String get yesterday => 'gisteren';
	@override String get dayAfterTomorrow => 'overmorgen';
	@override String get dayBeforeYesterday => 'eergisteren';
}

// Path: language
class TranslationsLanguageNl extends TranslationsLanguageEn {
	TranslationsLanguageNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get en => 'Engels';
	@override String get da => 'Deens';
	@override String get es => 'Spaans';
	@override String get fr => 'Frans';
	@override String get he => 'Hebreeuws';
	@override String get isIS => 'IJslands (IJsland)';
	@override String get ko => 'Koreaans';
	@override String get nb => 'Noors Bokmål';
	@override String get nl => 'Nederlands (Vlaams)';
	@override String get no => 'Noors';
	@override String get sv => 'Zweeds';
	@override String get zhHans => 'Chinees (Vereenvoudigd)';
	@override String get zh => 'Chinees (Traditioneel)';
}

// Path: languageShort
class TranslationsLanguageShortNl extends TranslationsLanguageShortEn {
	TranslationsLanguageShortNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

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
class TranslationsButtonsNl extends TranslationsButtonsEn {
	TranslationsButtonsNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get submit => 'Verzenden';
	@override String get close => 'Sluiten';
	@override String get reset => 'Opnieuw instellen';
	@override String get cancel => 'Annuleren';
	@override String get kContinue => 'Doorgaan';
	@override String get back => 'Terug';
	@override String get next => 'Volgende';
	@override String get done => 'Klaar';
	@override String get upload => 'Uploaden';
	@override String get choose => 'Kiezen';
	@override String get select => 'Selecteren';
	@override String get clear => 'Wissen';
	@override String get start => 'Starten';
	@override String get previous => 'Vorige';
	@override String get finish => 'Voltooien';
	@override String get edit => 'Bewerken';
	@override String get delete => 'Verwijderen';
	@override String get save => 'Opslaan';
	@override String get view => 'Bekijken';
	@override String get add => 'Toevoegen';
	@override String get remove => 'Verwijderen';
	@override String get update => 'Bijwerken';
	@override String get confirm => 'Bevestigen';
	@override String get retry => 'Opnieuw proberen';
}

// Path: labels
class TranslationsLabelsNl extends TranslationsLabelsEn {
	TranslationsLabelsNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get required => 'Vereist';
	@override String get optional => 'Optioneel';
	@override String get instructions => 'Instructies:';
	@override String get status => 'Status';
	@override String get progress => 'Voortgang';
	@override String get question => 'Vraag';
	@override String get answer => 'Antwoord';
	@override String get response => 'Antwoord';
	@override String get loading => 'Laden...';
	@override String get error => 'Fout';
	@override String get success => 'Succes';
	@override String get warning => 'Waarschuwing';
}

// Path: response
class TranslationsResponseNl extends TranslationsResponseEn {
	TranslationsResponseNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get success => 'Succes';
	@override String get error => 'Fout';
	@override String get info => 'Info';
	@override String get warning => 'Waarschuwing';
	@override String get tbd => 'Nog Te Bepalen';
	@override String get wip => 'Werk In Uitvoering';
}

// Path: commonWebFeatures
class TranslationsCommonWebFeaturesNl extends TranslationsCommonWebFeaturesEn {
	TranslationsCommonWebFeaturesNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get search => 'Zoeken';
	@override String get filter => 'Filteren';
	@override String get sort => 'Sorteren';
	@override String get share => 'Delen';
	@override String get download => 'Downloaden';
	@override String get upload => 'Uploaden';
	@override String get login => 'Inloggen';
	@override String get logout => 'Uitloggen';
	@override String get register => 'Registreren';
	@override String get profile => 'Profiel';
	@override String get settings => 'Instellingen';
	@override String get help => 'Hulp';
	@override String get contact => 'Contact';
	@override String get faqFull => 'Veelgestelde Vragen';
	@override String get termsOfService => 'Servicevoorwaarden';
	@override String get privacyPolicy => 'Privacybeleid';
	@override String get aboutUs => 'Over Ons';
	@override String get careers => 'Carrières';
	@override String get blog => 'Blog';
	@override String get news => 'Nieuws';
	@override String get events => 'Evenementen';
	@override String get community => 'Gemeenschap';
	@override String get forum => 'Forum';
	@override String get support => 'Ondersteuning';
	@override String get feedback => 'Feedback';
	@override String get subscribe => 'Abonneren';
	@override String get unsubscribe => 'Uitschrijven';
	@override String get notifications => 'Meldingen';
	@override String get messages => 'Berichten';
	@override String get dashboard => 'Dashboard';
	@override String get analytics => 'Analytics';
	@override String get reports => 'Rapporten';
	@override String get calendar => 'Kalender';
	@override String get tasks => 'Taken';
	@override String get projects => 'Projecten';
	@override String get teams => 'Teams';
	@override String get members => 'Leden';
	@override String get roles => 'Rollen';
	@override String get permissions => 'Machtigingen';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsNl {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.k1': return 'een';
			case 'numbers.k2': return 'twee';
			case 'numbers.k3': return 'drie';
			case 'numbers.k4': return 'vier';
			case 'numbers.k5': return 'vijf';
			case 'numbers.k6': return 'zes';
			case 'numbers.k7': return 'zeven';
			case 'numbers.k8': return 'acht';
			case 'numbers.k9': return 'negen';
			case 'numbers.k10': return 'tien';
			case 'ranks.k1': return 'eerste';
			case 'ranks.k2': return 'tweede';
			case 'ranks.k3': return 'derde';
			case 'ranks.k4': return 'vierde';
			case 'ranks.k5': return 'vijfde';
			case 'ranks.k6': return 'zesde';
			case 'ranks.k7': return 'zevende';
			case 'ranks.k8': return 'achtste';
			case 'ranks.k9': return 'negende';
			case 'ranks.k10': return 'tiende';
			case 'priority.low': return 'Laag';
			case 'priority.medium': return 'Gemiddeld';
			case 'priority.high': return 'Hoog';
			case 'time.seconds': return 'seconden';
			case 'time.minutes': return 'minuten';
			case 'time.hours': return 'uren';
			case 'time.days': return 'dagen';
			case 'time.weeks': return 'weken';
			case 'time.months': return 'maanden';
			case 'time.years': return 'jaren';
			case 'time.second': return 'seconde';
			case 'time.minute': return 'minuut';
			case 'time.hour': return 'uur';
			case 'time.day': return 'dag';
			case 'time.week': return 'week';
			case 'time.month': return 'maand';
			case 'time.year': return 'jaar';
			case 'timeRelative.now': return 'nu';
			case 'timeRelative.later': return 'later';
			case 'timeRelative.soon': return 'binnenkort';
			case 'timeRelative.inAMoment': return 'zo meteen';
			case 'timeRelative.justBefore': return 'net ervoor';
			case 'timeRelative.before': return 'voor';
			case 'timeRelative.after': return 'na';
			case 'day.monday': return 'Maandag';
			case 'day.tuesday': return 'Dinsdag';
			case 'day.wednesday': return 'Woensdag';
			case 'day.thursday': return 'Donderdag';
			case 'day.friday': return 'Vrijdag';
			case 'day.saturday': return 'Zaterdag';
			case 'day.sunday': return 'Zondag';
			case 'dayType.weekday': return 'weekdag';
			case 'dayType.weekend': return 'weekend';
			case 'dayType.everyday': return 'elke dag';
			case 'dayRelative.today': return 'vandaag';
			case 'dayRelative.tomorrow': return 'morgen';
			case 'dayRelative.yesterday': return 'gisteren';
			case 'dayRelative.dayAfterTomorrow': return 'overmorgen';
			case 'dayRelative.dayBeforeYesterday': return 'eergisteren';
			case 'language.en': return 'Engels';
			case 'language.da': return 'Deens';
			case 'language.es': return 'Spaans';
			case 'language.fr': return 'Frans';
			case 'language.he': return 'Hebreeuws';
			case 'language.isIS': return 'IJslands (IJsland)';
			case 'language.ko': return 'Koreaans';
			case 'language.nb': return 'Noors Bokmål';
			case 'language.nl': return 'Nederlands (Vlaams)';
			case 'language.no': return 'Noors';
			case 'language.sv': return 'Zweeds';
			case 'language.zhHans': return 'Chinees (Vereenvoudigd)';
			case 'language.zh': return 'Chinees (Traditioneel)';
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
			case 'buttons.submit': return 'Verzenden';
			case 'buttons.close': return 'Sluiten';
			case 'buttons.reset': return 'Opnieuw instellen';
			case 'buttons.cancel': return 'Annuleren';
			case 'buttons.kContinue': return 'Doorgaan';
			case 'buttons.back': return 'Terug';
			case 'buttons.next': return 'Volgende';
			case 'buttons.done': return 'Klaar';
			case 'buttons.upload': return 'Uploaden';
			case 'buttons.choose': return 'Kiezen';
			case 'buttons.select': return 'Selecteren';
			case 'buttons.clear': return 'Wissen';
			case 'buttons.start': return 'Starten';
			case 'buttons.previous': return 'Vorige';
			case 'buttons.finish': return 'Voltooien';
			case 'buttons.edit': return 'Bewerken';
			case 'buttons.delete': return 'Verwijderen';
			case 'buttons.save': return 'Opslaan';
			case 'buttons.view': return 'Bekijken';
			case 'buttons.add': return 'Toevoegen';
			case 'buttons.remove': return 'Verwijderen';
			case 'buttons.update': return 'Bijwerken';
			case 'buttons.confirm': return 'Bevestigen';
			case 'buttons.retry': return 'Opnieuw proberen';
			case 'labels.required': return 'Vereist';
			case 'labels.optional': return 'Optioneel';
			case 'labels.instructions': return 'Instructies:';
			case 'labels.status': return 'Status';
			case 'labels.progress': return 'Voortgang';
			case 'labels.question': return 'Vraag';
			case 'labels.answer': return 'Antwoord';
			case 'labels.response': return 'Antwoord';
			case 'labels.loading': return 'Laden...';
			case 'labels.error': return 'Fout';
			case 'labels.success': return 'Succes';
			case 'labels.warning': return 'Waarschuwing';
			case 'response.success': return 'Succes';
			case 'response.error': return 'Fout';
			case 'response.info': return 'Info';
			case 'response.warning': return 'Waarschuwing';
			case 'response.tbd': return 'Nog Te Bepalen';
			case 'response.wip': return 'Werk In Uitvoering';
			case 'commonWebFeatures.search': return 'Zoeken';
			case 'commonWebFeatures.filter': return 'Filteren';
			case 'commonWebFeatures.sort': return 'Sorteren';
			case 'commonWebFeatures.share': return 'Delen';
			case 'commonWebFeatures.download': return 'Downloaden';
			case 'commonWebFeatures.upload': return 'Uploaden';
			case 'commonWebFeatures.login': return 'Inloggen';
			case 'commonWebFeatures.logout': return 'Uitloggen';
			case 'commonWebFeatures.register': return 'Registreren';
			case 'commonWebFeatures.profile': return 'Profiel';
			case 'commonWebFeatures.settings': return 'Instellingen';
			case 'commonWebFeatures.help': return 'Hulp';
			case 'commonWebFeatures.contact': return 'Contact';
			case 'commonWebFeatures.faqFull': return 'Veelgestelde Vragen';
			case 'commonWebFeatures.termsOfService': return 'Servicevoorwaarden';
			case 'commonWebFeatures.privacyPolicy': return 'Privacybeleid';
			case 'commonWebFeatures.aboutUs': return 'Over Ons';
			case 'commonWebFeatures.careers': return 'Carrières';
			case 'commonWebFeatures.blog': return 'Blog';
			case 'commonWebFeatures.news': return 'Nieuws';
			case 'commonWebFeatures.events': return 'Evenementen';
			case 'commonWebFeatures.community': return 'Gemeenschap';
			case 'commonWebFeatures.forum': return 'Forum';
			case 'commonWebFeatures.support': return 'Ondersteuning';
			case 'commonWebFeatures.feedback': return 'Feedback';
			case 'commonWebFeatures.subscribe': return 'Abonneren';
			case 'commonWebFeatures.unsubscribe': return 'Uitschrijven';
			case 'commonWebFeatures.notifications': return 'Meldingen';
			case 'commonWebFeatures.messages': return 'Berichten';
			case 'commonWebFeatures.dashboard': return 'Dashboard';
			case 'commonWebFeatures.analytics': return 'Analytics';
			case 'commonWebFeatures.reports': return 'Rapporten';
			case 'commonWebFeatures.calendar': return 'Kalender';
			case 'commonWebFeatures.tasks': return 'Taken';
			case 'commonWebFeatures.projects': return 'Projecten';
			case 'commonWebFeatures.teams': return 'Teams';
			case 'commonWebFeatures.members': return 'Leden';
			case 'commonWebFeatures.roles': return 'Rollen';
			case 'commonWebFeatures.permissions': return 'Machtigingen';
			default: return null;
		}
	}
}

