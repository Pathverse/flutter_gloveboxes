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
class TranslationsDa extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsDa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.da,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <da>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsDa _root = this; // ignore: unused_field

	@override 
	TranslationsDa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDa(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsNumbersDa numbers = TranslationsNumbersDa._(_root);
	@override late final TranslationsRanksDa ranks = TranslationsRanksDa._(_root);
	@override late final TranslationsPriorityDa priority = TranslationsPriorityDa._(_root);
	@override late final TranslationsTimeDa time = TranslationsTimeDa._(_root);
	@override late final TranslationsTimeRelativeDa timeRelative = TranslationsTimeRelativeDa._(_root);
	@override late final TranslationsDayDa day = TranslationsDayDa._(_root);
	@override late final TranslationsDayTypeDa dayType = TranslationsDayTypeDa._(_root);
	@override late final TranslationsDayRelativeDa dayRelative = TranslationsDayRelativeDa._(_root);
	@override late final TranslationsLanguageDa language = TranslationsLanguageDa._(_root);
	@override late final TranslationsLanguageShortDa languageShort = TranslationsLanguageShortDa._(_root);
	@override late final TranslationsButtonsDa buttons = TranslationsButtonsDa._(_root);
	@override late final TranslationsLabelsDa labels = TranslationsLabelsDa._(_root);
	@override late final TranslationsResponseDa response = TranslationsResponseDa._(_root);
	@override late final TranslationsCommonWebFeaturesDa commonWebFeatures = TranslationsCommonWebFeaturesDa._(_root);
}

// Path: numbers
class TranslationsNumbersDa extends TranslationsNumbersEn {
	TranslationsNumbersDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'en';
	@override String get k2 => 'to';
	@override String get k3 => 'tre';
	@override String get k4 => 'fire';
	@override String get k5 => 'fem';
	@override String get k6 => 'seks';
	@override String get k7 => 'syv';
	@override String get k8 => 'otte';
	@override String get k9 => 'ni';
	@override String get k10 => 'ti';
}

// Path: ranks
class TranslationsRanksDa extends TranslationsRanksEn {
	TranslationsRanksDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'første';
	@override String get k2 => 'anden';
	@override String get k3 => 'tredje';
	@override String get k4 => 'fjerde';
	@override String get k5 => 'femte';
	@override String get k6 => 'sjette';
	@override String get k7 => 'syvende';
	@override String get k8 => 'ottende';
	@override String get k9 => 'niende';
	@override String get k10 => 'tiende';
}

// Path: priority
class TranslationsPriorityDa extends TranslationsPriorityEn {
	TranslationsPriorityDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get low => 'Lav';
	@override String get medium => 'Mellem';
	@override String get high => 'Høj';
}

// Path: time
class TranslationsTimeDa extends TranslationsTimeEn {
	TranslationsTimeDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get seconds => 'sekunder';
	@override String get minutes => 'minutter';
	@override String get hours => 'timer';
	@override String get days => 'dage';
	@override String get weeks => 'uger';
	@override String get months => 'måneder';
	@override String get years => 'år';
	@override String get second => 'sekund';
	@override String get minute => 'minut';
	@override String get hour => 'time';
	@override String get day => 'dag';
	@override String get week => 'uge';
	@override String get month => 'måned';
	@override String get year => 'år';
}

// Path: timeRelative
class TranslationsTimeRelativeDa extends TranslationsTimeRelativeEn {
	TranslationsTimeRelativeDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get now => 'nu';
	@override String get later => 'senere';
	@override String get soon => 'snart';
	@override String get inAMoment => 'om et øjeblik';
	@override String get justBefore => 'lige før';
	@override String get before => 'før';
	@override String get after => 'efter';
}

// Path: day
class TranslationsDayDa extends TranslationsDayEn {
	TranslationsDayDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

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
class TranslationsDayTypeDa extends TranslationsDayTypeEn {
	TranslationsDayTypeDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get weekday => 'hverdag';
	@override String get weekend => 'weekend';
	@override String get everyday => 'hver dag';
}

// Path: dayRelative
class TranslationsDayRelativeDa extends TranslationsDayRelativeEn {
	TranslationsDayRelativeDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get today => 'i dag';
	@override String get tomorrow => 'i morgen';
	@override String get yesterday => 'i går';
	@override String get dayAfterTomorrow => 'i overmorgen';
	@override String get dayBeforeYesterday => 'i forgårs';
}

// Path: language
class TranslationsLanguageDa extends TranslationsLanguageEn {
	TranslationsLanguageDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get en => 'Engelsk';
	@override String get da => 'Dansk';
	@override String get es => 'Spansk';
	@override String get fr => 'Fransk';
	@override String get he => 'Hebraisk';
	@override String get isIS => 'Islandsk (Island)';
	@override String get ko => 'Koreansk';
	@override String get nb => 'Norsk Bokmål';
	@override String get nl => 'Hollandsk (Flamsk)';
	@override String get no => 'Norsk';
	@override String get sv => 'Svensk';
	@override String get zhHans => 'Kinesisk (Forenklet)';
	@override String get zh => 'Kinesisk (Traditionel)';
}

// Path: languageShort
class TranslationsLanguageShortDa extends TranslationsLanguageShortEn {
	TranslationsLanguageShortDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

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
class TranslationsButtonsDa extends TranslationsButtonsEn {
	TranslationsButtonsDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get submit => 'Indsend';
	@override String get close => 'Luk';
	@override String get reset => 'Nulstil';
	@override String get cancel => 'Annuller';
	@override String get kContinue => 'Fortsæt';
	@override String get back => 'Tilbage';
	@override String get next => 'Næste';
	@override String get done => 'Færdig';
	@override String get upload => 'Upload';
	@override String get choose => 'Vælg';
	@override String get select => 'Vælg';
	@override String get clear => 'Ryd';
	@override String get start => 'Start';
	@override String get previous => 'Forrige';
	@override String get finish => 'Afslut';
	@override String get edit => 'Rediger';
	@override String get delete => 'Slet';
	@override String get save => 'Gem';
	@override String get view => 'Vis';
	@override String get add => 'Tilføj';
	@override String get remove => 'Fjern';
	@override String get update => 'Opdater';
	@override String get confirm => 'Bekræft';
	@override String get retry => 'Prøv igen';
}

// Path: labels
class TranslationsLabelsDa extends TranslationsLabelsEn {
	TranslationsLabelsDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get required => 'Påkrævet';
	@override String get optional => 'Valgfri';
	@override String get instructions => 'Instruktioner:';
	@override String get status => 'Status';
	@override String get progress => 'Fremskridt';
	@override String get question => 'Spørgsmål';
	@override String get answer => 'Svar';
	@override String get response => 'Svar';
	@override String get loading => 'Indlæser...';
	@override String get error => 'Fejl';
	@override String get success => 'Succes';
	@override String get warning => 'Advarsel';
}

// Path: response
class TranslationsResponseDa extends TranslationsResponseEn {
	TranslationsResponseDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get success => 'Succes';
	@override String get error => 'Fejl';
	@override String get info => 'Info';
	@override String get warning => 'Advarsel';
	@override String get tbd => 'Skal Bestemmes';
	@override String get wip => 'Igangværende Arbejde';
}

// Path: commonWebFeatures
class TranslationsCommonWebFeaturesDa extends TranslationsCommonWebFeaturesEn {
	TranslationsCommonWebFeaturesDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get search => 'Søg';
	@override String get filter => 'Filtrer';
	@override String get sort => 'Sorter';
	@override String get share => 'Del';
	@override String get download => 'Download';
	@override String get upload => 'Upload';
	@override String get login => 'Log ind';
	@override String get logout => 'Log ud';
	@override String get register => 'Registrer';
	@override String get profile => 'Profil';
	@override String get settings => 'Indstillinger';
	@override String get help => 'Hjælp';
	@override String get contact => 'Kontakt';
	@override String get faqFull => 'Ofte Stillede Spørgsmål';
	@override String get termsOfService => 'Servicevilkår';
	@override String get privacyPolicy => 'Privatlivspolitik';
	@override String get aboutUs => 'Om Os';
	@override String get careers => 'Karrierer';
	@override String get blog => 'Blog';
	@override String get news => 'Nyheder';
	@override String get events => 'Begivenheder';
	@override String get community => 'Fællesskab';
	@override String get forum => 'Forum';
	@override String get support => 'Support';
	@override String get feedback => 'Feedback';
	@override String get subscribe => 'Abonner';
	@override String get unsubscribe => 'Afmeld';
	@override String get notifications => 'Notifikationer';
	@override String get messages => 'Beskeder';
	@override String get dashboard => 'Dashboard';
	@override String get analytics => 'Analytics';
	@override String get reports => 'Rapporter';
	@override String get calendar => 'Kalender';
	@override String get tasks => 'Opgaver';
	@override String get projects => 'Projekter';
	@override String get teams => 'Hold';
	@override String get members => 'Medlemmer';
	@override String get roles => 'Roller';
	@override String get permissions => 'Tilladelser';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsDa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.k1': return 'en';
			case 'numbers.k2': return 'to';
			case 'numbers.k3': return 'tre';
			case 'numbers.k4': return 'fire';
			case 'numbers.k5': return 'fem';
			case 'numbers.k6': return 'seks';
			case 'numbers.k7': return 'syv';
			case 'numbers.k8': return 'otte';
			case 'numbers.k9': return 'ni';
			case 'numbers.k10': return 'ti';
			case 'ranks.k1': return 'første';
			case 'ranks.k2': return 'anden';
			case 'ranks.k3': return 'tredje';
			case 'ranks.k4': return 'fjerde';
			case 'ranks.k5': return 'femte';
			case 'ranks.k6': return 'sjette';
			case 'ranks.k7': return 'syvende';
			case 'ranks.k8': return 'ottende';
			case 'ranks.k9': return 'niende';
			case 'ranks.k10': return 'tiende';
			case 'priority.low': return 'Lav';
			case 'priority.medium': return 'Mellem';
			case 'priority.high': return 'Høj';
			case 'time.seconds': return 'sekunder';
			case 'time.minutes': return 'minutter';
			case 'time.hours': return 'timer';
			case 'time.days': return 'dage';
			case 'time.weeks': return 'uger';
			case 'time.months': return 'måneder';
			case 'time.years': return 'år';
			case 'time.second': return 'sekund';
			case 'time.minute': return 'minut';
			case 'time.hour': return 'time';
			case 'time.day': return 'dag';
			case 'time.week': return 'uge';
			case 'time.month': return 'måned';
			case 'time.year': return 'år';
			case 'timeRelative.now': return 'nu';
			case 'timeRelative.later': return 'senere';
			case 'timeRelative.soon': return 'snart';
			case 'timeRelative.inAMoment': return 'om et øjeblik';
			case 'timeRelative.justBefore': return 'lige før';
			case 'timeRelative.before': return 'før';
			case 'timeRelative.after': return 'efter';
			case 'day.monday': return 'Mandag';
			case 'day.tuesday': return 'Tirsdag';
			case 'day.wednesday': return 'Onsdag';
			case 'day.thursday': return 'Torsdag';
			case 'day.friday': return 'Fredag';
			case 'day.saturday': return 'Lørdag';
			case 'day.sunday': return 'Søndag';
			case 'dayType.weekday': return 'hverdag';
			case 'dayType.weekend': return 'weekend';
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
			case 'language.nl': return 'Hollandsk (Flamsk)';
			case 'language.no': return 'Norsk';
			case 'language.sv': return 'Svensk';
			case 'language.zhHans': return 'Kinesisk (Forenklet)';
			case 'language.zh': return 'Kinesisk (Traditionel)';
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
			case 'buttons.submit': return 'Indsend';
			case 'buttons.close': return 'Luk';
			case 'buttons.reset': return 'Nulstil';
			case 'buttons.cancel': return 'Annuller';
			case 'buttons.kContinue': return 'Fortsæt';
			case 'buttons.back': return 'Tilbage';
			case 'buttons.next': return 'Næste';
			case 'buttons.done': return 'Færdig';
			case 'buttons.upload': return 'Upload';
			case 'buttons.choose': return 'Vælg';
			case 'buttons.select': return 'Vælg';
			case 'buttons.clear': return 'Ryd';
			case 'buttons.start': return 'Start';
			case 'buttons.previous': return 'Forrige';
			case 'buttons.finish': return 'Afslut';
			case 'buttons.edit': return 'Rediger';
			case 'buttons.delete': return 'Slet';
			case 'buttons.save': return 'Gem';
			case 'buttons.view': return 'Vis';
			case 'buttons.add': return 'Tilføj';
			case 'buttons.remove': return 'Fjern';
			case 'buttons.update': return 'Opdater';
			case 'buttons.confirm': return 'Bekræft';
			case 'buttons.retry': return 'Prøv igen';
			case 'labels.required': return 'Påkrævet';
			case 'labels.optional': return 'Valgfri';
			case 'labels.instructions': return 'Instruktioner:';
			case 'labels.status': return 'Status';
			case 'labels.progress': return 'Fremskridt';
			case 'labels.question': return 'Spørgsmål';
			case 'labels.answer': return 'Svar';
			case 'labels.response': return 'Svar';
			case 'labels.loading': return 'Indlæser...';
			case 'labels.error': return 'Fejl';
			case 'labels.success': return 'Succes';
			case 'labels.warning': return 'Advarsel';
			case 'response.success': return 'Succes';
			case 'response.error': return 'Fejl';
			case 'response.info': return 'Info';
			case 'response.warning': return 'Advarsel';
			case 'response.tbd': return 'Skal Bestemmes';
			case 'response.wip': return 'Igangværende Arbejde';
			case 'commonWebFeatures.search': return 'Søg';
			case 'commonWebFeatures.filter': return 'Filtrer';
			case 'commonWebFeatures.sort': return 'Sorter';
			case 'commonWebFeatures.share': return 'Del';
			case 'commonWebFeatures.download': return 'Download';
			case 'commonWebFeatures.upload': return 'Upload';
			case 'commonWebFeatures.login': return 'Log ind';
			case 'commonWebFeatures.logout': return 'Log ud';
			case 'commonWebFeatures.register': return 'Registrer';
			case 'commonWebFeatures.profile': return 'Profil';
			case 'commonWebFeatures.settings': return 'Indstillinger';
			case 'commonWebFeatures.help': return 'Hjælp';
			case 'commonWebFeatures.contact': return 'Kontakt';
			case 'commonWebFeatures.faqFull': return 'Ofte Stillede Spørgsmål';
			case 'commonWebFeatures.termsOfService': return 'Servicevilkår';
			case 'commonWebFeatures.privacyPolicy': return 'Privatlivspolitik';
			case 'commonWebFeatures.aboutUs': return 'Om Os';
			case 'commonWebFeatures.careers': return 'Karrierer';
			case 'commonWebFeatures.blog': return 'Blog';
			case 'commonWebFeatures.news': return 'Nyheder';
			case 'commonWebFeatures.events': return 'Begivenheder';
			case 'commonWebFeatures.community': return 'Fællesskab';
			case 'commonWebFeatures.forum': return 'Forum';
			case 'commonWebFeatures.support': return 'Support';
			case 'commonWebFeatures.feedback': return 'Feedback';
			case 'commonWebFeatures.subscribe': return 'Abonner';
			case 'commonWebFeatures.unsubscribe': return 'Afmeld';
			case 'commonWebFeatures.notifications': return 'Notifikationer';
			case 'commonWebFeatures.messages': return 'Beskeder';
			case 'commonWebFeatures.dashboard': return 'Dashboard';
			case 'commonWebFeatures.analytics': return 'Analytics';
			case 'commonWebFeatures.reports': return 'Rapporter';
			case 'commonWebFeatures.calendar': return 'Kalender';
			case 'commonWebFeatures.tasks': return 'Opgaver';
			case 'commonWebFeatures.projects': return 'Projekter';
			case 'commonWebFeatures.teams': return 'Hold';
			case 'commonWebFeatures.members': return 'Medlemmer';
			case 'commonWebFeatures.roles': return 'Roller';
			case 'commonWebFeatures.permissions': return 'Tilladelser';
			default: return null;
		}
	}
}

