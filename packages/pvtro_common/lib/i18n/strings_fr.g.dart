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
class TranslationsFr extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsNumbersFr numbers = TranslationsNumbersFr._(_root);
	@override late final TranslationsRanksFr ranks = TranslationsRanksFr._(_root);
	@override late final TranslationsPriorityFr priority = TranslationsPriorityFr._(_root);
	@override late final TranslationsTimeFr time = TranslationsTimeFr._(_root);
	@override late final TranslationsTimeRelativeFr timeRelative = TranslationsTimeRelativeFr._(_root);
	@override late final TranslationsDayFr day = TranslationsDayFr._(_root);
	@override late final TranslationsDayTypeFr dayType = TranslationsDayTypeFr._(_root);
	@override late final TranslationsDayRelativeFr dayRelative = TranslationsDayRelativeFr._(_root);
	@override late final TranslationsLanguageFr language = TranslationsLanguageFr._(_root);
	@override late final TranslationsLanguageShortFr languageShort = TranslationsLanguageShortFr._(_root);
	@override late final TranslationsButtonsFr buttons = TranslationsButtonsFr._(_root);
	@override late final TranslationsLabelsFr labels = TranslationsLabelsFr._(_root);
	@override late final TranslationsResponseFr response = TranslationsResponseFr._(_root);
	@override late final TranslationsCommonWebFeaturesFr commonWebFeatures = TranslationsCommonWebFeaturesFr._(_root);
}

// Path: numbers
class TranslationsNumbersFr extends TranslationsNumbersEn {
	TranslationsNumbersFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'un';
	@override String get k2 => 'deux';
	@override String get k3 => 'trois';
	@override String get k4 => 'quatre';
	@override String get k5 => 'cinq';
	@override String get k6 => 'six';
	@override String get k7 => 'sept';
	@override String get k8 => 'huit';
	@override String get k9 => 'neuf';
	@override String get k10 => 'dix';
}

// Path: ranks
class TranslationsRanksFr extends TranslationsRanksEn {
	TranslationsRanksFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'premier';
	@override String get k2 => 'deuxième';
	@override String get k3 => 'troisième';
	@override String get k4 => 'quatrième';
	@override String get k5 => 'cinquième';
	@override String get k6 => 'sixième';
	@override String get k7 => 'septième';
	@override String get k8 => 'huitième';
	@override String get k9 => 'neuvième';
	@override String get k10 => 'dixième';
}

// Path: priority
class TranslationsPriorityFr extends TranslationsPriorityEn {
	TranslationsPriorityFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get low => 'Faible';
	@override String get medium => 'Moyen';
	@override String get high => 'Élevé';
}

// Path: time
class TranslationsTimeFr extends TranslationsTimeEn {
	TranslationsTimeFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get seconds => 'secondes';
	@override String get minutes => 'minutes';
	@override String get hours => 'heures';
	@override String get days => 'jours';
	@override String get weeks => 'semaines';
	@override String get months => 'mois';
	@override String get years => 'années';
	@override String get second => 'seconde';
	@override String get minute => 'minute';
	@override String get hour => 'heure';
	@override String get day => 'jour';
	@override String get week => 'semaine';
	@override String get month => 'mois';
	@override String get year => 'année';
}

// Path: timeRelative
class TranslationsTimeRelativeFr extends TranslationsTimeRelativeEn {
	TranslationsTimeRelativeFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get now => 'maintenant';
	@override String get later => 'plus tard';
	@override String get soon => 'bientôt';
	@override String get inAMoment => 'dans un instant';
	@override String get justBefore => 'juste avant';
	@override String get before => 'avant';
	@override String get after => 'après';
}

// Path: day
class TranslationsDayFr extends TranslationsDayEn {
	TranslationsDayFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get monday => 'Lundi';
	@override String get tuesday => 'Mardi';
	@override String get wednesday => 'Mercredi';
	@override String get thursday => 'Jeudi';
	@override String get friday => 'Vendredi';
	@override String get saturday => 'Samedi';
	@override String get sunday => 'Dimanche';
}

// Path: dayType
class TranslationsDayTypeFr extends TranslationsDayTypeEn {
	TranslationsDayTypeFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get weekday => 'jour de semaine';
	@override String get weekend => 'week-end';
	@override String get everyday => 'tous les jours';
}

// Path: dayRelative
class TranslationsDayRelativeFr extends TranslationsDayRelativeEn {
	TranslationsDayRelativeFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get today => 'aujourd\'hui';
	@override String get tomorrow => 'demain';
	@override String get yesterday => 'hier';
	@override String get dayAfterTomorrow => 'après-demain';
	@override String get dayBeforeYesterday => 'avant-hier';
}

// Path: language
class TranslationsLanguageFr extends TranslationsLanguageEn {
	TranslationsLanguageFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get en => 'Anglais';
	@override String get da => 'Danois';
	@override String get es => 'Espagnol';
	@override String get fr => 'Français';
	@override String get he => 'Hébreu';
	@override String get isIS => 'Islandais (Islande)';
	@override String get ko => 'Coréen';
	@override String get nb => 'Norvégien Bokmål';
	@override String get nl => 'Néerlandais (Flamand)';
	@override String get no => 'Norvégien';
	@override String get sv => 'Suédois';
	@override String get zhHans => 'Chinois (Simplifié)';
	@override String get zh => 'Chinois (Traditionnel)';
}

// Path: languageShort
class TranslationsLanguageShortFr extends TranslationsLanguageShortEn {
	TranslationsLanguageShortFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

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
class TranslationsButtonsFr extends TranslationsButtonsEn {
	TranslationsButtonsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get submit => 'Soumettre';
	@override String get close => 'Fermer';
	@override String get reset => 'Réinitialiser';
	@override String get cancel => 'Annuler';
	@override String get kContinue => 'Continuer';
	@override String get back => 'Retour';
	@override String get next => 'Suivant';
	@override String get done => 'Terminé';
	@override String get upload => 'Télécharger';
	@override String get choose => 'Choisir';
	@override String get select => 'Sélectionner';
	@override String get clear => 'Effacer';
	@override String get start => 'Démarrer';
	@override String get previous => 'Précédent';
	@override String get finish => 'Terminer';
	@override String get edit => 'Modifier';
	@override String get delete => 'Supprimer';
	@override String get save => 'Enregistrer';
	@override String get view => 'Voir';
	@override String get add => 'Ajouter';
	@override String get remove => 'Supprimer';
	@override String get update => 'Mettre à jour';
	@override String get confirm => 'Confirmer';
	@override String get retry => 'Réessayer';
}

// Path: labels
class TranslationsLabelsFr extends TranslationsLabelsEn {
	TranslationsLabelsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get required => 'Requis';
	@override String get optional => 'Optionnel';
	@override String get instructions => 'Instructions:';
	@override String get status => 'Statut';
	@override String get progress => 'Progrès';
	@override String get question => 'Question';
	@override String get answer => 'Réponse';
	@override String get response => 'Réponse';
	@override String get loading => 'Chargement...';
	@override String get error => 'Erreur';
	@override String get success => 'Succès';
	@override String get warning => 'Avertissement';
}

// Path: response
class TranslationsResponseFr extends TranslationsResponseEn {
	TranslationsResponseFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Succès';
	@override String get error => 'Erreur';
	@override String get info => 'Info';
	@override String get warning => 'Avertissement';
	@override String get tbd => 'À Déterminer';
	@override String get wip => 'Travail en Cours';
}

// Path: commonWebFeatures
class TranslationsCommonWebFeaturesFr extends TranslationsCommonWebFeaturesEn {
	TranslationsCommonWebFeaturesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get search => 'Rechercher';
	@override String get filter => 'Filtrer';
	@override String get sort => 'Trier';
	@override String get share => 'Partager';
	@override String get download => 'Télécharger';
	@override String get upload => 'Télécharger';
	@override String get login => 'Connexion';
	@override String get logout => 'Déconnexion';
	@override String get register => 'S\'inscrire';
	@override String get profile => 'Profil';
	@override String get settings => 'Paramètres';
	@override String get help => 'Aide';
	@override String get contact => 'Contact';
	@override String get faqFull => 'Questions Fréquemment Posées';
	@override String get termsOfService => 'Conditions de Service';
	@override String get privacyPolicy => 'Politique de Confidentialité';
	@override String get aboutUs => 'À Propos de Nous';
	@override String get careers => 'Carrières';
	@override String get blog => 'Blog';
	@override String get news => 'Actualités';
	@override String get events => 'Événements';
	@override String get community => 'Communauté';
	@override String get forum => 'Forum';
	@override String get support => 'Support';
	@override String get feedback => 'Commentaires';
	@override String get subscribe => 'S\'abonner';
	@override String get unsubscribe => 'Se désabonner';
	@override String get notifications => 'Notifications';
	@override String get messages => 'Messages';
	@override String get dashboard => 'Tableau de bord';
	@override String get analytics => 'Analytiques';
	@override String get reports => 'Rapports';
	@override String get calendar => 'Calendrier';
	@override String get tasks => 'Tâches';
	@override String get projects => 'Projets';
	@override String get teams => 'Équipes';
	@override String get members => 'Membres';
	@override String get roles => 'Rôles';
	@override String get permissions => 'Permissions';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.k1': return 'un';
			case 'numbers.k2': return 'deux';
			case 'numbers.k3': return 'trois';
			case 'numbers.k4': return 'quatre';
			case 'numbers.k5': return 'cinq';
			case 'numbers.k6': return 'six';
			case 'numbers.k7': return 'sept';
			case 'numbers.k8': return 'huit';
			case 'numbers.k9': return 'neuf';
			case 'numbers.k10': return 'dix';
			case 'ranks.k1': return 'premier';
			case 'ranks.k2': return 'deuxième';
			case 'ranks.k3': return 'troisième';
			case 'ranks.k4': return 'quatrième';
			case 'ranks.k5': return 'cinquième';
			case 'ranks.k6': return 'sixième';
			case 'ranks.k7': return 'septième';
			case 'ranks.k8': return 'huitième';
			case 'ranks.k9': return 'neuvième';
			case 'ranks.k10': return 'dixième';
			case 'priority.low': return 'Faible';
			case 'priority.medium': return 'Moyen';
			case 'priority.high': return 'Élevé';
			case 'time.seconds': return 'secondes';
			case 'time.minutes': return 'minutes';
			case 'time.hours': return 'heures';
			case 'time.days': return 'jours';
			case 'time.weeks': return 'semaines';
			case 'time.months': return 'mois';
			case 'time.years': return 'années';
			case 'time.second': return 'seconde';
			case 'time.minute': return 'minute';
			case 'time.hour': return 'heure';
			case 'time.day': return 'jour';
			case 'time.week': return 'semaine';
			case 'time.month': return 'mois';
			case 'time.year': return 'année';
			case 'timeRelative.now': return 'maintenant';
			case 'timeRelative.later': return 'plus tard';
			case 'timeRelative.soon': return 'bientôt';
			case 'timeRelative.inAMoment': return 'dans un instant';
			case 'timeRelative.justBefore': return 'juste avant';
			case 'timeRelative.before': return 'avant';
			case 'timeRelative.after': return 'après';
			case 'day.monday': return 'Lundi';
			case 'day.tuesday': return 'Mardi';
			case 'day.wednesday': return 'Mercredi';
			case 'day.thursday': return 'Jeudi';
			case 'day.friday': return 'Vendredi';
			case 'day.saturday': return 'Samedi';
			case 'day.sunday': return 'Dimanche';
			case 'dayType.weekday': return 'jour de semaine';
			case 'dayType.weekend': return 'week-end';
			case 'dayType.everyday': return 'tous les jours';
			case 'dayRelative.today': return 'aujourd\'hui';
			case 'dayRelative.tomorrow': return 'demain';
			case 'dayRelative.yesterday': return 'hier';
			case 'dayRelative.dayAfterTomorrow': return 'après-demain';
			case 'dayRelative.dayBeforeYesterday': return 'avant-hier';
			case 'language.en': return 'Anglais';
			case 'language.da': return 'Danois';
			case 'language.es': return 'Espagnol';
			case 'language.fr': return 'Français';
			case 'language.he': return 'Hébreu';
			case 'language.isIS': return 'Islandais (Islande)';
			case 'language.ko': return 'Coréen';
			case 'language.nb': return 'Norvégien Bokmål';
			case 'language.nl': return 'Néerlandais (Flamand)';
			case 'language.no': return 'Norvégien';
			case 'language.sv': return 'Suédois';
			case 'language.zhHans': return 'Chinois (Simplifié)';
			case 'language.zh': return 'Chinois (Traditionnel)';
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
			case 'buttons.submit': return 'Soumettre';
			case 'buttons.close': return 'Fermer';
			case 'buttons.reset': return 'Réinitialiser';
			case 'buttons.cancel': return 'Annuler';
			case 'buttons.kContinue': return 'Continuer';
			case 'buttons.back': return 'Retour';
			case 'buttons.next': return 'Suivant';
			case 'buttons.done': return 'Terminé';
			case 'buttons.upload': return 'Télécharger';
			case 'buttons.choose': return 'Choisir';
			case 'buttons.select': return 'Sélectionner';
			case 'buttons.clear': return 'Effacer';
			case 'buttons.start': return 'Démarrer';
			case 'buttons.previous': return 'Précédent';
			case 'buttons.finish': return 'Terminer';
			case 'buttons.edit': return 'Modifier';
			case 'buttons.delete': return 'Supprimer';
			case 'buttons.save': return 'Enregistrer';
			case 'buttons.view': return 'Voir';
			case 'buttons.add': return 'Ajouter';
			case 'buttons.remove': return 'Supprimer';
			case 'buttons.update': return 'Mettre à jour';
			case 'buttons.confirm': return 'Confirmer';
			case 'buttons.retry': return 'Réessayer';
			case 'labels.required': return 'Requis';
			case 'labels.optional': return 'Optionnel';
			case 'labels.instructions': return 'Instructions:';
			case 'labels.status': return 'Statut';
			case 'labels.progress': return 'Progrès';
			case 'labels.question': return 'Question';
			case 'labels.answer': return 'Réponse';
			case 'labels.response': return 'Réponse';
			case 'labels.loading': return 'Chargement...';
			case 'labels.error': return 'Erreur';
			case 'labels.success': return 'Succès';
			case 'labels.warning': return 'Avertissement';
			case 'response.success': return 'Succès';
			case 'response.error': return 'Erreur';
			case 'response.info': return 'Info';
			case 'response.warning': return 'Avertissement';
			case 'response.tbd': return 'À Déterminer';
			case 'response.wip': return 'Travail en Cours';
			case 'commonWebFeatures.search': return 'Rechercher';
			case 'commonWebFeatures.filter': return 'Filtrer';
			case 'commonWebFeatures.sort': return 'Trier';
			case 'commonWebFeatures.share': return 'Partager';
			case 'commonWebFeatures.download': return 'Télécharger';
			case 'commonWebFeatures.upload': return 'Télécharger';
			case 'commonWebFeatures.login': return 'Connexion';
			case 'commonWebFeatures.logout': return 'Déconnexion';
			case 'commonWebFeatures.register': return 'S\'inscrire';
			case 'commonWebFeatures.profile': return 'Profil';
			case 'commonWebFeatures.settings': return 'Paramètres';
			case 'commonWebFeatures.help': return 'Aide';
			case 'commonWebFeatures.contact': return 'Contact';
			case 'commonWebFeatures.faqFull': return 'Questions Fréquemment Posées';
			case 'commonWebFeatures.termsOfService': return 'Conditions de Service';
			case 'commonWebFeatures.privacyPolicy': return 'Politique de Confidentialité';
			case 'commonWebFeatures.aboutUs': return 'À Propos de Nous';
			case 'commonWebFeatures.careers': return 'Carrières';
			case 'commonWebFeatures.blog': return 'Blog';
			case 'commonWebFeatures.news': return 'Actualités';
			case 'commonWebFeatures.events': return 'Événements';
			case 'commonWebFeatures.community': return 'Communauté';
			case 'commonWebFeatures.forum': return 'Forum';
			case 'commonWebFeatures.support': return 'Support';
			case 'commonWebFeatures.feedback': return 'Commentaires';
			case 'commonWebFeatures.subscribe': return 'S\'abonner';
			case 'commonWebFeatures.unsubscribe': return 'Se désabonner';
			case 'commonWebFeatures.notifications': return 'Notifications';
			case 'commonWebFeatures.messages': return 'Messages';
			case 'commonWebFeatures.dashboard': return 'Tableau de bord';
			case 'commonWebFeatures.analytics': return 'Analytiques';
			case 'commonWebFeatures.reports': return 'Rapports';
			case 'commonWebFeatures.calendar': return 'Calendrier';
			case 'commonWebFeatures.tasks': return 'Tâches';
			case 'commonWebFeatures.projects': return 'Projets';
			case 'commonWebFeatures.teams': return 'Équipes';
			case 'commonWebFeatures.members': return 'Membres';
			case 'commonWebFeatures.roles': return 'Rôles';
			case 'commonWebFeatures.permissions': return 'Permissions';
			default: return null;
		}
	}
}

