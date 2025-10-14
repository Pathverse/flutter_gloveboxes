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
class TranslationsNb extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsNb({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.nb,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <nb>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsNb _root = this; // ignore: unused_field

	@override 
	TranslationsNb $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsNb(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsNumbersNb numbers = TranslationsNumbersNb._(_root);
	@override late final TranslationsRanksNb ranks = TranslationsRanksNb._(_root);
	@override late final TranslationsPriorityNb priority = TranslationsPriorityNb._(_root);
	@override late final TranslationsTimeNb time = TranslationsTimeNb._(_root);
	@override late final TranslationsTimeRelativeNb timeRelative = TranslationsTimeRelativeNb._(_root);
	@override late final TranslationsDayNb day = TranslationsDayNb._(_root);
	@override late final TranslationsDayTypeNb dayType = TranslationsDayTypeNb._(_root);
	@override late final TranslationsDayRelativeNb dayRelative = TranslationsDayRelativeNb._(_root);
	@override late final TranslationsLanguageNb language = TranslationsLanguageNb._(_root);
	@override late final TranslationsLanguageShortNb languageShort = TranslationsLanguageShortNb._(_root);
	@override late final TranslationsButtonsNb buttons = TranslationsButtonsNb._(_root);
	@override late final TranslationsLabelsNb labels = TranslationsLabelsNb._(_root);
	@override late final TranslationsResponseNb response = TranslationsResponseNb._(_root);
	@override late final TranslationsCommonWebFeaturesNb commonWebFeatures = TranslationsCommonWebFeaturesNb._(_root);
}

// Path: numbers
class TranslationsNumbersNb extends TranslationsNumbersEn {
	TranslationsNumbersNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'en';
	@override String get k2 => 'to';
	@override String get k3 => 'tre';
	@override String get k4 => 'fire';
	@override String get k5 => 'fem';
	@override String get k6 => 'seks';
	@override String get k7 => 'syv';
	@override String get k8 => 'åtte';
	@override String get k9 => 'ni';
	@override String get k10 => 'ti';
}

// Path: ranks
class TranslationsRanksNb extends TranslationsRanksEn {
	TranslationsRanksNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'første';
	@override String get k2 => 'andre';
	@override String get k3 => 'tredje';
	@override String get k4 => 'fjerde';
	@override String get k5 => 'femte';
	@override String get k6 => 'sjette';
	@override String get k7 => 'syvende';
	@override String get k8 => 'åttende';
	@override String get k9 => 'niende';
	@override String get k10 => 'tiende';
}

// Path: priority
class TranslationsPriorityNb extends TranslationsPriorityEn {
	TranslationsPriorityNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get low => 'Lav';
	@override String get medium => 'Medium';
	@override String get high => 'Høy';
}

// Path: time
class TranslationsTimeNb extends TranslationsTimeEn {
	TranslationsTimeNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get seconds => 'sekunder';
	@override String get minutes => 'minutter';
	@override String get hours => 'timer';
	@override String get days => 'dager';
	@override String get weeks => 'uker';
	@override String get months => 'måneder';
	@override String get years => 'år';
	@override String get second => 'sekund';
	@override String get minute => 'minutt';
	@override String get hour => 'time';
	@override String get day => 'dag';
	@override String get week => 'uke';
	@override String get month => 'måned';
	@override String get year => 'år';
}

// Path: timeRelative
class TranslationsTimeRelativeNb extends TranslationsTimeRelativeEn {
	TranslationsTimeRelativeNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get now => 'nå';
	@override String get later => 'senere';
	@override String get soon => 'snart';
	@override String get inAMoment => 'om et øyeblikk';
	@override String get justBefore => 'rett før';
	@override String get before => 'før';
	@override String get after => 'etter';
}

// Path: day
class TranslationsDayNb extends TranslationsDayEn {
	TranslationsDayNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get monday => 'Mandag';
	@override String get tuesday => 'Tirsdag';
	@override String get wednesday => 'Onsdag';
	@override String get thursday => 'Torsdag';
	@override String get friday => 'Fredag';
	@override String get saturday => 'Lørdag';
	@override String get sunday => 'Søndag';
}

// Path: dayType
class TranslationsDayTypeNb extends TranslationsDayTypeEn {
	TranslationsDayTypeNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get weekday => 'hverdag';
	@override String get weekend => 'helg';
	@override String get everyday => 'hver dag';
}

// Path: dayRelative
class TranslationsDayRelativeNb extends TranslationsDayRelativeEn {
	TranslationsDayRelativeNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get today => 'i dag';
	@override String get tomorrow => 'i morgen';
	@override String get yesterday => 'i går';
	@override String get dayAfterTomorrow => 'i overmorgen';
	@override String get dayBeforeYesterday => 'i forgårs';
}

// Path: language
class TranslationsLanguageNb extends TranslationsLanguageEn {
	TranslationsLanguageNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get en => 'Engelsk';
	@override String get da => 'Dansk';
	@override String get es => 'Spansk';
	@override String get fr => 'Fransk';
	@override String get he => 'Hebraisk';
	@override String get isIS => 'Islandsk (Island)';
	@override String get ko => 'Koreansk';
	@override String get nb => 'Norsk Bokmål';
	@override String get nl => 'Nederlandsk (Flamsk)';
	@override String get no => 'Norsk';
	@override String get sv => 'Svensk';
	@override String get zhHans => 'Kinesisk (Forenklet)';
	@override String get zh => 'Kinesisk (Tradisjonell)';
}

// Path: languageShort
class TranslationsLanguageShortNb extends TranslationsLanguageShortEn {
	TranslationsLanguageShortNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

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
class TranslationsButtonsNb extends TranslationsButtonsEn {
	TranslationsButtonsNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get submit => 'Send inn';
	@override String get close => 'Lukk';
	@override String get reset => 'Tilbakestill';
	@override String get cancel => 'Avbryt';
	@override String get kContinue => 'Fortsett';
	@override String get back => 'Tilbake';
	@override String get next => 'Neste';
	@override String get done => 'Ferdig';
	@override String get upload => 'Last opp';
	@override String get choose => 'Velg';
	@override String get select => 'Velg';
	@override String get clear => 'Tøm';
	@override String get start => 'Start';
	@override String get previous => 'Forrige';
	@override String get finish => 'Fullfør';
	@override String get edit => 'Rediger';
	@override String get delete => 'Slett';
	@override String get save => 'Lagre';
	@override String get view => 'Vis';
	@override String get add => 'Legg til';
	@override String get remove => 'Fjern';
	@override String get update => 'Oppdater';
	@override String get confirm => 'Bekreft';
	@override String get retry => 'Prøv igjen';
}

// Path: labels
class TranslationsLabelsNb extends TranslationsLabelsEn {
	TranslationsLabelsNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get required => 'Påkrevd';
	@override String get optional => 'Valgfritt';
	@override String get instructions => 'Instruksjoner:';
	@override String get status => 'Status';
	@override String get progress => 'Fremdrift';
	@override String get question => 'Spørsmål';
	@override String get answer => 'Svar';
	@override String get response => 'Respons';
	@override String get loading => 'Laster...';
	@override String get error => 'Feil';
	@override String get success => 'Suksess';
	@override String get warning => 'Advarsel';
}

// Path: response
class TranslationsResponseNb extends TranslationsResponseEn {
	TranslationsResponseNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get success => 'Suksess';
	@override String get error => 'Feil';
	@override String get info => 'Info';
	@override String get warning => 'Advarsel';
	@override String get tbd => 'Skal Bestemmes';
	@override String get wip => 'Pågående Arbeid';
}

// Path: commonWebFeatures
class TranslationsCommonWebFeaturesNb extends TranslationsCommonWebFeaturesEn {
	TranslationsCommonWebFeaturesNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get search => 'Søk';
	@override String get filter => 'Filtrer';
	@override String get sort => 'Sorter';
	@override String get share => 'Del';
	@override String get download => 'Last ned';
	@override String get upload => 'Last opp';
	@override String get login => 'Logg inn';
	@override String get logout => 'Logg ut';
	@override String get register => 'Registrer';
	@override String get profile => 'Profil';
	@override String get settings => 'Innstillinger';
	@override String get help => 'Hjelp';
	@override String get contact => 'Kontakt';
	@override String get faqFull => 'Ofte Stilte Spørsmål';
	@override String get termsOfService => 'Tjenestevilkår';
	@override String get privacyPolicy => 'Personvernregler';
	@override String get aboutUs => 'Om Oss';
	@override String get careers => 'Karrierer';
	@override String get blog => 'Blogg';
	@override String get news => 'Nyheter';
	@override String get events => 'Arrangementer';
	@override String get community => 'Samfunn';
	@override String get forum => 'Forum';
	@override String get support => 'Støtte';
	@override String get feedback => 'Tilbakemelding';
	@override String get subscribe => 'Abonner';
	@override String get unsubscribe => 'Avslutt abonnement';
	@override String get notifications => 'Varslinger';
	@override String get messages => 'Meldinger';
	@override String get dashboard => 'Dashbord';
	@override String get analytics => 'Analyser';
	@override String get reports => 'Rapporter';
	@override String get calendar => 'Kalender';
	@override String get tasks => 'Oppgaver';
	@override String get projects => 'Prosjekter';
	@override String get teams => 'Team';
	@override String get members => 'Medlemmer';
	@override String get roles => 'Roller';
	@override String get permissions => 'Tillatelser';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsNb {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.k1': return 'en';
			case 'numbers.k2': return 'to';
			case 'numbers.k3': return 'tre';
			case 'numbers.k4': return 'fire';
			case 'numbers.k5': return 'fem';
			case 'numbers.k6': return 'seks';
			case 'numbers.k7': return 'syv';
			case 'numbers.k8': return 'åtte';
			case 'numbers.k9': return 'ni';
			case 'numbers.k10': return 'ti';
			case 'ranks.k1': return 'første';
			case 'ranks.k2': return 'andre';
			case 'ranks.k3': return 'tredje';
			case 'ranks.k4': return 'fjerde';
			case 'ranks.k5': return 'femte';
			case 'ranks.k6': return 'sjette';
			case 'ranks.k7': return 'syvende';
			case 'ranks.k8': return 'åttende';
			case 'ranks.k9': return 'niende';
			case 'ranks.k10': return 'tiende';
			case 'priority.low': return 'Lav';
			case 'priority.medium': return 'Medium';
			case 'priority.high': return 'Høy';
			case 'time.seconds': return 'sekunder';
			case 'time.minutes': return 'minutter';
			case 'time.hours': return 'timer';
			case 'time.days': return 'dager';
			case 'time.weeks': return 'uker';
			case 'time.months': return 'måneder';
			case 'time.years': return 'år';
			case 'time.second': return 'sekund';
			case 'time.minute': return 'minutt';
			case 'time.hour': return 'time';
			case 'time.day': return 'dag';
			case 'time.week': return 'uke';
			case 'time.month': return 'måned';
			case 'time.year': return 'år';
			case 'timeRelative.now': return 'nå';
			case 'timeRelative.later': return 'senere';
			case 'timeRelative.soon': return 'snart';
			case 'timeRelative.inAMoment': return 'om et øyeblikk';
			case 'timeRelative.justBefore': return 'rett før';
			case 'timeRelative.before': return 'før';
			case 'timeRelative.after': return 'etter';
			case 'day.monday': return 'Mandag';
			case 'day.tuesday': return 'Tirsdag';
			case 'day.wednesday': return 'Onsdag';
			case 'day.thursday': return 'Torsdag';
			case 'day.friday': return 'Fredag';
			case 'day.saturday': return 'Lørdag';
			case 'day.sunday': return 'Søndag';
			case 'dayType.weekday': return 'hverdag';
			case 'dayType.weekend': return 'helg';
			case 'dayType.everyday': return 'hver dag';
			case 'dayRelative.today': return 'i dag';
			case 'dayRelative.tomorrow': return 'i morgen';
			case 'dayRelative.yesterday': return 'i går';
			case 'dayRelative.dayAfterTomorrow': return 'i overmorgen';
			case 'dayRelative.dayBeforeYesterday': return 'i forgårs';
			case 'language.en': return 'Engelsk';
			case 'language.da': return 'Dansk';
			case 'language.es': return 'Spansk';
			case 'language.fr': return 'Fransk';
			case 'language.he': return 'Hebraisk';
			case 'language.isIS': return 'Islandsk (Island)';
			case 'language.ko': return 'Koreansk';
			case 'language.nb': return 'Norsk Bokmål';
			case 'language.nl': return 'Nederlandsk (Flamsk)';
			case 'language.no': return 'Norsk';
			case 'language.sv': return 'Svensk';
			case 'language.zhHans': return 'Kinesisk (Forenklet)';
			case 'language.zh': return 'Kinesisk (Tradisjonell)';
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
			case 'buttons.submit': return 'Send inn';
			case 'buttons.close': return 'Lukk';
			case 'buttons.reset': return 'Tilbakestill';
			case 'buttons.cancel': return 'Avbryt';
			case 'buttons.kContinue': return 'Fortsett';
			case 'buttons.back': return 'Tilbake';
			case 'buttons.next': return 'Neste';
			case 'buttons.done': return 'Ferdig';
			case 'buttons.upload': return 'Last opp';
			case 'buttons.choose': return 'Velg';
			case 'buttons.select': return 'Velg';
			case 'buttons.clear': return 'Tøm';
			case 'buttons.start': return 'Start';
			case 'buttons.previous': return 'Forrige';
			case 'buttons.finish': return 'Fullfør';
			case 'buttons.edit': return 'Rediger';
			case 'buttons.delete': return 'Slett';
			case 'buttons.save': return 'Lagre';
			case 'buttons.view': return 'Vis';
			case 'buttons.add': return 'Legg til';
			case 'buttons.remove': return 'Fjern';
			case 'buttons.update': return 'Oppdater';
			case 'buttons.confirm': return 'Bekreft';
			case 'buttons.retry': return 'Prøv igjen';
			case 'labels.required': return 'Påkrevd';
			case 'labels.optional': return 'Valgfritt';
			case 'labels.instructions': return 'Instruksjoner:';
			case 'labels.status': return 'Status';
			case 'labels.progress': return 'Fremdrift';
			case 'labels.question': return 'Spørsmål';
			case 'labels.answer': return 'Svar';
			case 'labels.response': return 'Respons';
			case 'labels.loading': return 'Laster...';
			case 'labels.error': return 'Feil';
			case 'labels.success': return 'Suksess';
			case 'labels.warning': return 'Advarsel';
			case 'response.success': return 'Suksess';
			case 'response.error': return 'Feil';
			case 'response.info': return 'Info';
			case 'response.warning': return 'Advarsel';
			case 'response.tbd': return 'Skal Bestemmes';
			case 'response.wip': return 'Pågående Arbeid';
			case 'commonWebFeatures.search': return 'Søk';
			case 'commonWebFeatures.filter': return 'Filtrer';
			case 'commonWebFeatures.sort': return 'Sorter';
			case 'commonWebFeatures.share': return 'Del';
			case 'commonWebFeatures.download': return 'Last ned';
			case 'commonWebFeatures.upload': return 'Last opp';
			case 'commonWebFeatures.login': return 'Logg inn';
			case 'commonWebFeatures.logout': return 'Logg ut';
			case 'commonWebFeatures.register': return 'Registrer';
			case 'commonWebFeatures.profile': return 'Profil';
			case 'commonWebFeatures.settings': return 'Innstillinger';
			case 'commonWebFeatures.help': return 'Hjelp';
			case 'commonWebFeatures.contact': return 'Kontakt';
			case 'commonWebFeatures.faqFull': return 'Ofte Stilte Spørsmål';
			case 'commonWebFeatures.termsOfService': return 'Tjenestevilkår';
			case 'commonWebFeatures.privacyPolicy': return 'Personvernregler';
			case 'commonWebFeatures.aboutUs': return 'Om Oss';
			case 'commonWebFeatures.careers': return 'Karrierer';
			case 'commonWebFeatures.blog': return 'Blogg';
			case 'commonWebFeatures.news': return 'Nyheter';
			case 'commonWebFeatures.events': return 'Arrangementer';
			case 'commonWebFeatures.community': return 'Samfunn';
			case 'commonWebFeatures.forum': return 'Forum';
			case 'commonWebFeatures.support': return 'Støtte';
			case 'commonWebFeatures.feedback': return 'Tilbakemelding';
			case 'commonWebFeatures.subscribe': return 'Abonner';
			case 'commonWebFeatures.unsubscribe': return 'Avslutt abonnement';
			case 'commonWebFeatures.notifications': return 'Varslinger';
			case 'commonWebFeatures.messages': return 'Meldinger';
			case 'commonWebFeatures.dashboard': return 'Dashbord';
			case 'commonWebFeatures.analytics': return 'Analyser';
			case 'commonWebFeatures.reports': return 'Rapporter';
			case 'commonWebFeatures.calendar': return 'Kalender';
			case 'commonWebFeatures.tasks': return 'Oppgaver';
			case 'commonWebFeatures.projects': return 'Prosjekter';
			case 'commonWebFeatures.teams': return 'Team';
			case 'commonWebFeatures.members': return 'Medlemmer';
			case 'commonWebFeatures.roles': return 'Roller';
			case 'commonWebFeatures.permissions': return 'Tillatelser';
			default: return null;
		}
	}
}

