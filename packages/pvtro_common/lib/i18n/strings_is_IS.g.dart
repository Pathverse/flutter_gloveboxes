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
class TranslationsIsIs extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsIsIs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.isIs,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <is-IS>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsIsIs _root = this; // ignore: unused_field

	@override 
	TranslationsIsIs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsIsIs(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsNumbersIsIs numbers = TranslationsNumbersIsIs._(_root);
	@override late final TranslationsRanksIsIs ranks = TranslationsRanksIsIs._(_root);
	@override late final TranslationsPriorityIsIs priority = TranslationsPriorityIsIs._(_root);
	@override late final TranslationsTimeIsIs time = TranslationsTimeIsIs._(_root);
	@override late final TranslationsTimeRelativeIsIs timeRelative = TranslationsTimeRelativeIsIs._(_root);
	@override late final TranslationsDayIsIs day = TranslationsDayIsIs._(_root);
	@override late final TranslationsDayTypeIsIs dayType = TranslationsDayTypeIsIs._(_root);
	@override late final TranslationsDayRelativeIsIs dayRelative = TranslationsDayRelativeIsIs._(_root);
	@override late final TranslationsLanguageIsIs language = TranslationsLanguageIsIs._(_root);
	@override late final TranslationsLanguageShortIsIs languageShort = TranslationsLanguageShortIsIs._(_root);
	@override late final TranslationsButtonsIsIs buttons = TranslationsButtonsIsIs._(_root);
	@override late final TranslationsLabelsIsIs labels = TranslationsLabelsIsIs._(_root);
	@override late final TranslationsResponseIsIs response = TranslationsResponseIsIs._(_root);
	@override late final TranslationsCommonWebFeaturesIsIs commonWebFeatures = TranslationsCommonWebFeaturesIsIs._(_root);
}

// Path: numbers
class TranslationsNumbersIsIs extends TranslationsNumbersEn {
	TranslationsNumbersIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'einn';
	@override String get k2 => 'tveir';
	@override String get k3 => 'þrír';
	@override String get k4 => 'fjórir';
	@override String get k5 => 'fimm';
	@override String get k6 => 'sex';
	@override String get k7 => 'sjö';
	@override String get k8 => 'átta';
	@override String get k9 => 'níu';
	@override String get k10 => 'tíu';
}

// Path: ranks
class TranslationsRanksIsIs extends TranslationsRanksEn {
	TranslationsRanksIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'fyrsti';
	@override String get k2 => 'annar';
	@override String get k3 => 'þriðji';
	@override String get k4 => 'fjórði';
	@override String get k5 => 'fimmti';
	@override String get k6 => 'sjötti';
	@override String get k7 => 'sjöundi';
	@override String get k8 => 'áttundi';
	@override String get k9 => 'níundi';
	@override String get k10 => 'tíundi';
}

// Path: priority
class TranslationsPriorityIsIs extends TranslationsPriorityEn {
	TranslationsPriorityIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get low => 'Lágur';
	@override String get medium => 'Miðlungs';
	@override String get high => 'Hár';
}

// Path: time
class TranslationsTimeIsIs extends TranslationsTimeEn {
	TranslationsTimeIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get seconds => 'sekúndur';
	@override String get minutes => 'mínútur';
	@override String get hours => 'klukkustundir';
	@override String get days => 'dagar';
	@override String get weeks => 'vikur';
	@override String get months => 'mánuðir';
	@override String get years => 'ár';
	@override String get second => 'sekúnda';
	@override String get minute => 'mínúta';
	@override String get hour => 'klukkustund';
	@override String get day => 'dagur';
	@override String get week => 'vika';
	@override String get month => 'mánuður';
	@override String get year => 'ár';
}

// Path: timeRelative
class TranslationsTimeRelativeIsIs extends TranslationsTimeRelativeEn {
	TranslationsTimeRelativeIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get now => 'núna';
	@override String get later => 'seinna';
	@override String get soon => 'bráðum';
	@override String get inAMoment => 'eftir augnablik';
	@override String get justBefore => 'rétt áður';
	@override String get before => 'áður';
	@override String get after => 'eftir';
}

// Path: day
class TranslationsDayIsIs extends TranslationsDayEn {
	TranslationsDayIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get monday => 'Mánudagur';
	@override String get tuesday => 'Þriðjudagur';
	@override String get wednesday => 'Miðvikudagur';
	@override String get thursday => 'Fimmtudagur';
	@override String get friday => 'Föstudagur';
	@override String get saturday => 'Laugardagur';
	@override String get sunday => 'Sunnudagur';
}

// Path: dayType
class TranslationsDayTypeIsIs extends TranslationsDayTypeEn {
	TranslationsDayTypeIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get weekday => 'vikudagur';
	@override String get weekend => 'helgi';
	@override String get everyday => 'alla daga';
}

// Path: dayRelative
class TranslationsDayRelativeIsIs extends TranslationsDayRelativeEn {
	TranslationsDayRelativeIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get today => 'í dag';
	@override String get tomorrow => 'á morgun';
	@override String get yesterday => 'í gær';
	@override String get dayAfterTomorrow => 'eftir tvo daga';
	@override String get dayBeforeYesterday => 'í fyrradag';
}

// Path: language
class TranslationsLanguageIsIs extends TranslationsLanguageEn {
	TranslationsLanguageIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get en => 'Enska';
	@override String get da => 'Danska';
	@override String get es => 'Spænska';
	@override String get fr => 'Franska';
	@override String get he => 'Hebreska';
	@override String get isIS => 'Íslenska (Ísland)';
	@override String get ko => 'Kóreska';
	@override String get nb => 'Norska Bokmál';
	@override String get nl => 'Hollenska (Flæmska)';
	@override String get no => 'Norska';
	@override String get sv => 'Sænska';
	@override String get zhHans => 'Kínverska (Einfölduð)';
	@override String get zh => 'Kínverska (Hefðbundin)';
}

// Path: languageShort
class TranslationsLanguageShortIsIs extends TranslationsLanguageShortEn {
	TranslationsLanguageShortIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

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
class TranslationsButtonsIsIs extends TranslationsButtonsEn {
	TranslationsButtonsIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get submit => 'Senda';
	@override String get close => 'Loka';
	@override String get reset => 'Endurstilla';
	@override String get cancel => 'Hætta við';
	@override String get kContinue => 'Halda áfram';
	@override String get back => 'Til baka';
	@override String get next => 'Næsta';
	@override String get done => 'Lokið';
	@override String get upload => 'Hlaða upp';
	@override String get choose => 'Velja';
	@override String get select => 'Velja';
	@override String get clear => 'Hreinsa';
	@override String get start => 'Byrja';
	@override String get previous => 'Fyrri';
	@override String get finish => 'Ljúka';
	@override String get edit => 'Breyta';
	@override String get delete => 'Eyða';
	@override String get save => 'Vista';
	@override String get view => 'Skoða';
	@override String get add => 'Bæta við';
	@override String get remove => 'Fjarlægja';
	@override String get update => 'Uppfæra';
	@override String get confirm => 'Staðfesta';
	@override String get retry => 'Reyna aftur';
}

// Path: labels
class TranslationsLabelsIsIs extends TranslationsLabelsEn {
	TranslationsLabelsIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get required => 'Skyldugur';
	@override String get optional => 'Valfrjáls';
	@override String get instructions => 'Leiðbeiningar:';
	@override String get status => 'Staða';
	@override String get progress => 'Framvinda';
	@override String get question => 'Spurning';
	@override String get answer => 'Svar';
	@override String get response => 'Svar';
	@override String get loading => 'Hleður...';
	@override String get error => 'Villa';
	@override String get success => 'Árangur';
	@override String get warning => 'Viðvörun';
}

// Path: response
class TranslationsResponseIsIs extends TranslationsResponseEn {
	TranslationsResponseIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get success => 'Árangur';
	@override String get error => 'Villa';
	@override String get info => 'Upplýsingar';
	@override String get warning => 'Viðvörun';
	@override String get tbd => 'Á eftir að ákveða';
	@override String get wip => 'Í vinnslu';
}

// Path: commonWebFeatures
class TranslationsCommonWebFeaturesIsIs extends TranslationsCommonWebFeaturesEn {
	TranslationsCommonWebFeaturesIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get search => 'Leita';
	@override String get filter => 'Sía';
	@override String get sort => 'Raða';
	@override String get share => 'Deila';
	@override String get download => 'Sækja';
	@override String get upload => 'Hlaða upp';
	@override String get login => 'Innskrá';
	@override String get logout => 'Útskrá';
	@override String get register => 'Skrá';
	@override String get profile => 'Prófíll';
	@override String get settings => 'Stillingar';
	@override String get help => 'Hjálp';
	@override String get contact => 'Tengiliður';
	@override String get faqFull => 'Algengar spurningar';
	@override String get termsOfService => 'Þjónustuskilmálar';
	@override String get privacyPolicy => 'Persónuverndarstefna';
	@override String get aboutUs => 'Um okkur';
	@override String get careers => 'Störf';
	@override String get blog => 'Blogg';
	@override String get news => 'Fréttir';
	@override String get events => 'Viðburðir';
	@override String get community => 'Samfélag';
	@override String get forum => 'Spjallborð';
	@override String get support => 'Stuðningur';
	@override String get feedback => 'Endurgjöf';
	@override String get subscribe => 'Gerast áskrifandi';
	@override String get unsubscribe => 'Hætta áskrift';
	@override String get notifications => 'Tilkynningar';
	@override String get messages => 'Skilaboð';
	@override String get dashboard => 'Stjórnborð';
	@override String get analytics => 'Greiningar';
	@override String get reports => 'Skýrslur';
	@override String get calendar => 'Dagatal';
	@override String get tasks => 'Verkefni';
	@override String get projects => 'Verkefni';
	@override String get teams => 'Lið';
	@override String get members => 'Meðlimir';
	@override String get roles => 'Hlutverk';
	@override String get permissions => 'Heimildir';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsIsIs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.k1': return 'einn';
			case 'numbers.k2': return 'tveir';
			case 'numbers.k3': return 'þrír';
			case 'numbers.k4': return 'fjórir';
			case 'numbers.k5': return 'fimm';
			case 'numbers.k6': return 'sex';
			case 'numbers.k7': return 'sjö';
			case 'numbers.k8': return 'átta';
			case 'numbers.k9': return 'níu';
			case 'numbers.k10': return 'tíu';
			case 'ranks.k1': return 'fyrsti';
			case 'ranks.k2': return 'annar';
			case 'ranks.k3': return 'þriðji';
			case 'ranks.k4': return 'fjórði';
			case 'ranks.k5': return 'fimmti';
			case 'ranks.k6': return 'sjötti';
			case 'ranks.k7': return 'sjöundi';
			case 'ranks.k8': return 'áttundi';
			case 'ranks.k9': return 'níundi';
			case 'ranks.k10': return 'tíundi';
			case 'priority.low': return 'Lágur';
			case 'priority.medium': return 'Miðlungs';
			case 'priority.high': return 'Hár';
			case 'time.seconds': return 'sekúndur';
			case 'time.minutes': return 'mínútur';
			case 'time.hours': return 'klukkustundir';
			case 'time.days': return 'dagar';
			case 'time.weeks': return 'vikur';
			case 'time.months': return 'mánuðir';
			case 'time.years': return 'ár';
			case 'time.second': return 'sekúnda';
			case 'time.minute': return 'mínúta';
			case 'time.hour': return 'klukkustund';
			case 'time.day': return 'dagur';
			case 'time.week': return 'vika';
			case 'time.month': return 'mánuður';
			case 'time.year': return 'ár';
			case 'timeRelative.now': return 'núna';
			case 'timeRelative.later': return 'seinna';
			case 'timeRelative.soon': return 'bráðum';
			case 'timeRelative.inAMoment': return 'eftir augnablik';
			case 'timeRelative.justBefore': return 'rétt áður';
			case 'timeRelative.before': return 'áður';
			case 'timeRelative.after': return 'eftir';
			case 'day.monday': return 'Mánudagur';
			case 'day.tuesday': return 'Þriðjudagur';
			case 'day.wednesday': return 'Miðvikudagur';
			case 'day.thursday': return 'Fimmtudagur';
			case 'day.friday': return 'Föstudagur';
			case 'day.saturday': return 'Laugardagur';
			case 'day.sunday': return 'Sunnudagur';
			case 'dayType.weekday': return 'vikudagur';
			case 'dayType.weekend': return 'helgi';
			case 'dayType.everyday': return 'alla daga';
			case 'dayRelative.today': return 'í dag';
			case 'dayRelative.tomorrow': return 'á morgun';
			case 'dayRelative.yesterday': return 'í gær';
			case 'dayRelative.dayAfterTomorrow': return 'eftir tvo daga';
			case 'dayRelative.dayBeforeYesterday': return 'í fyrradag';
			case 'language.en': return 'Enska';
			case 'language.da': return 'Danska';
			case 'language.es': return 'Spænska';
			case 'language.fr': return 'Franska';
			case 'language.he': return 'Hebreska';
			case 'language.isIS': return 'Íslenska (Ísland)';
			case 'language.ko': return 'Kóreska';
			case 'language.nb': return 'Norska Bokmál';
			case 'language.nl': return 'Hollenska (Flæmska)';
			case 'language.no': return 'Norska';
			case 'language.sv': return 'Sænska';
			case 'language.zhHans': return 'Kínverska (Einfölduð)';
			case 'language.zh': return 'Kínverska (Hefðbundin)';
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
			case 'buttons.submit': return 'Senda';
			case 'buttons.close': return 'Loka';
			case 'buttons.reset': return 'Endurstilla';
			case 'buttons.cancel': return 'Hætta við';
			case 'buttons.kContinue': return 'Halda áfram';
			case 'buttons.back': return 'Til baka';
			case 'buttons.next': return 'Næsta';
			case 'buttons.done': return 'Lokið';
			case 'buttons.upload': return 'Hlaða upp';
			case 'buttons.choose': return 'Velja';
			case 'buttons.select': return 'Velja';
			case 'buttons.clear': return 'Hreinsa';
			case 'buttons.start': return 'Byrja';
			case 'buttons.previous': return 'Fyrri';
			case 'buttons.finish': return 'Ljúka';
			case 'buttons.edit': return 'Breyta';
			case 'buttons.delete': return 'Eyða';
			case 'buttons.save': return 'Vista';
			case 'buttons.view': return 'Skoða';
			case 'buttons.add': return 'Bæta við';
			case 'buttons.remove': return 'Fjarlægja';
			case 'buttons.update': return 'Uppfæra';
			case 'buttons.confirm': return 'Staðfesta';
			case 'buttons.retry': return 'Reyna aftur';
			case 'labels.required': return 'Skyldugur';
			case 'labels.optional': return 'Valfrjáls';
			case 'labels.instructions': return 'Leiðbeiningar:';
			case 'labels.status': return 'Staða';
			case 'labels.progress': return 'Framvinda';
			case 'labels.question': return 'Spurning';
			case 'labels.answer': return 'Svar';
			case 'labels.response': return 'Svar';
			case 'labels.loading': return 'Hleður...';
			case 'labels.error': return 'Villa';
			case 'labels.success': return 'Árangur';
			case 'labels.warning': return 'Viðvörun';
			case 'response.success': return 'Árangur';
			case 'response.error': return 'Villa';
			case 'response.info': return 'Upplýsingar';
			case 'response.warning': return 'Viðvörun';
			case 'response.tbd': return 'Á eftir að ákveða';
			case 'response.wip': return 'Í vinnslu';
			case 'commonWebFeatures.search': return 'Leita';
			case 'commonWebFeatures.filter': return 'Sía';
			case 'commonWebFeatures.sort': return 'Raða';
			case 'commonWebFeatures.share': return 'Deila';
			case 'commonWebFeatures.download': return 'Sækja';
			case 'commonWebFeatures.upload': return 'Hlaða upp';
			case 'commonWebFeatures.login': return 'Innskrá';
			case 'commonWebFeatures.logout': return 'Útskrá';
			case 'commonWebFeatures.register': return 'Skrá';
			case 'commonWebFeatures.profile': return 'Prófíll';
			case 'commonWebFeatures.settings': return 'Stillingar';
			case 'commonWebFeatures.help': return 'Hjálp';
			case 'commonWebFeatures.contact': return 'Tengiliður';
			case 'commonWebFeatures.faqFull': return 'Algengar spurningar';
			case 'commonWebFeatures.termsOfService': return 'Þjónustuskilmálar';
			case 'commonWebFeatures.privacyPolicy': return 'Persónuverndarstefna';
			case 'commonWebFeatures.aboutUs': return 'Um okkur';
			case 'commonWebFeatures.careers': return 'Störf';
			case 'commonWebFeatures.blog': return 'Blogg';
			case 'commonWebFeatures.news': return 'Fréttir';
			case 'commonWebFeatures.events': return 'Viðburðir';
			case 'commonWebFeatures.community': return 'Samfélag';
			case 'commonWebFeatures.forum': return 'Spjallborð';
			case 'commonWebFeatures.support': return 'Stuðningur';
			case 'commonWebFeatures.feedback': return 'Endurgjöf';
			case 'commonWebFeatures.subscribe': return 'Gerast áskrifandi';
			case 'commonWebFeatures.unsubscribe': return 'Hætta áskrift';
			case 'commonWebFeatures.notifications': return 'Tilkynningar';
			case 'commonWebFeatures.messages': return 'Skilaboð';
			case 'commonWebFeatures.dashboard': return 'Stjórnborð';
			case 'commonWebFeatures.analytics': return 'Greiningar';
			case 'commonWebFeatures.reports': return 'Skýrslur';
			case 'commonWebFeatures.calendar': return 'Dagatal';
			case 'commonWebFeatures.tasks': return 'Verkefni';
			case 'commonWebFeatures.projects': return 'Verkefni';
			case 'commonWebFeatures.teams': return 'Lið';
			case 'commonWebFeatures.members': return 'Meðlimir';
			case 'commonWebFeatures.roles': return 'Hlutverk';
			case 'commonWebFeatures.permissions': return 'Heimildir';
			default: return null;
		}
	}
}

