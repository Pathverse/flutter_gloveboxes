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
	@override late final TranslationsAppFr app = TranslationsAppFr._(_root);
	@override late final TranslationsWelcomeFr welcome = TranslationsWelcomeFr._(_root);
	@override late final TranslationsConversionFr conversion = TranslationsConversionFr._(_root);
	@override late final TranslationsStatsFr stats = TranslationsStatsFr._(_root);
	@override late final TranslationsDemoFr demo = TranslationsDemoFr._(_root);
	@override late final TranslationsDialogsFr dialogs = TranslationsDialogsFr._(_root);
	@override late final TranslationsUnitsFr units = TranslationsUnitsFr._(_root);
	@override late final TranslationsPackagesFr packages = TranslationsPackagesFr._(_root);
	@override late final TranslationsActionsFr actions = TranslationsActionsFr._(_root);
}

// Path: app
class TranslationsAppFr extends TranslationsAppEn {
	TranslationsAppFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Exemple Pvtro';
	@override String get subtitle => 'Démo de Coordination de Traduction Multi-Package';
}

// Path: welcome
class TranslationsWelcomeFr extends TranslationsWelcomeEn {
	TranslationsWelcomeFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bienvenue à Pvtro !';
	@override String get description => 'Cet exemple démontre la capacité de pvtro à coordiner les traductions entre plusieurs packages slang de manière transparente.';
	@override String get getStarted => 'Commencer';
}

// Path: conversion
class TranslationsConversionFr extends TranslationsConversionEn {
	TranslationsConversionFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Conversions d\'Unités';
	@override String get description => 'Convertissez entre différentes unités en utilisant les traductions du package pvtro_conver.';
	@override String get selectType => 'Sélectionner le type d\'unité';
	@override String get enterValue => 'Entrez la valeur à convertir';
	@override String get convert => 'Convertir';
	@override String get result => 'Résultat de Conversion';
}

// Path: stats
class TranslationsStatsFr extends TranslationsStatsEn {
	TranslationsStatsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'État du Système Pvtro';
	@override String get currentLanguage => 'Langue Actuelle';
	@override String get languageCode => 'Code de Langue';
	@override String get packagesCoordinated => 'Packages Coordonnés';
	@override String get totalLanguages => 'Total des Langues';
	@override String get coordinatedPackages => 'Packages Coordonnés';
	@override String viewAllLanguages({required Object count}) => 'Voir Toutes les ${count} Langues';
}

// Path: demo
class TranslationsDemoFr extends TranslationsDemoEn {
	TranslationsDemoFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Actions Démo';
	@override String get description => 'Testez diverses fonctionnalités pvtro et voyez la coordination de traduction en temps réel.';
	@override String get testLanguageSwitch => 'Tester le Changement de Langue';
	@override String get systemInfo => 'Informations Système';
	@override String get cycleLanguages => 'Parcourir les Langues';
}

// Path: dialogs
class TranslationsDialogsFr extends TranslationsDialogsEn {
	TranslationsDialogsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsAboutFr about = TranslationsDialogsAboutFr._(_root);
	@override late final TranslationsDialogsLanguageInfoFr languageInfo = TranslationsDialogsLanguageInfoFr._(_root);
	@override late final TranslationsDialogsLanguageSwitchFr languageSwitch = TranslationsDialogsLanguageSwitchFr._(_root);
	@override late final TranslationsDialogsCycleCompleteFr cycleComplete = TranslationsDialogsCycleCompleteFr._(_root);
	@override late final TranslationsDialogsSystemInfoFr systemInfo = TranslationsDialogsSystemInfoFr._(_root);
	@override late final TranslationsDialogsUnitInfoFr unitInfo = TranslationsDialogsUnitInfoFr._(_root);
	@override late final TranslationsDialogsAllLanguagesFr allLanguages = TranslationsDialogsAllLanguagesFr._(_root);
}

// Path: units
class TranslationsUnitsFr extends TranslationsUnitsEn {
	TranslationsUnitsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get length => 'Longueur / Distance';
	@override String get weight => 'Poids / Masse';
	@override String get temperature => 'Température';
}

// Path: packages
class TranslationsPackagesFr extends TranslationsPackagesEn {
	TranslationsPackagesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get common => 'Traductions communes';
	@override String get conver => 'Conversions d\'unités';
}

// Path: actions
class TranslationsActionsFr extends TranslationsActionsEn {
	TranslationsActionsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get ok => 'OK';
	@override String get close => 'Fermer';
	@override String get help => 'Aide';
}

// Path: dialogs.about
class TranslationsDialogsAboutFr extends TranslationsDialogsAboutEn {
	TranslationsDialogsAboutFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'À Propos de Pvtro';
	@override String get description => 'Pvtro est un Orchestrateur de Traduction Basé sur Fournisseur qui coordonne automatiquement les traductions slang entre plusieurs packages, éliminant les conflits d\'importation et fournissant une gestion unifiée des locales.';
}

// Path: dialogs.languageInfo
class TranslationsDialogsLanguageInfoFr extends TranslationsDialogsLanguageInfoEn {
	TranslationsDialogsLanguageInfoFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informations de Langue';
	@override String get currentLanguage => 'Langue Actuelle';
	@override String get languageCode => 'Code de Langue';
	@override String get packagesCoordinated => 'Packages Coordonnés';
}

// Path: dialogs.languageSwitch
class TranslationsDialogsLanguageSwitchFr extends TranslationsDialogsLanguageSwitchEn {
	TranslationsDialogsLanguageSwitchFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Langue Changée';
	@override String message({required Object language}) => 'Changé vers ${language} - Tous les packages mis à jour !';
}

// Path: dialogs.cycleComplete
class TranslationsDialogsCycleCompleteFr extends TranslationsDialogsCycleCompleteEn {
	TranslationsDialogsCycleCompleteFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Parcours des Langues Terminé';
	@override String get message => 'Parcours des langues terminé ! Tous les packages sont restés synchronisés.';
}

// Path: dialogs.systemInfo
class TranslationsDialogsSystemInfoFr extends TranslationsDialogsSystemInfoEn {
	TranslationsDialogsSystemInfoFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informations du Système Pvtro';
	@override String get runtimePackage => 'Package Runtime : pvtro v0.0.1';
	@override String get builderPackage => 'Package Builder : pvtro_builder v0.0.1';
	@override late final TranslationsDialogsSystemInfoFeaturesFr features = TranslationsDialogsSystemInfoFeaturesFr._(_root);
}

// Path: dialogs.unitInfo
class TranslationsDialogsUnitInfoFr extends TranslationsDialogsUnitInfoEn {
	TranslationsDialogsUnitInfoFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informations de Conversion d\'Unités';
	@override String currentType({required Object type}) => 'Type d\'unité actuel : ${type}';
	@override String get description => 'Ceci démontre les traductions du package pvtro_conver fonctionnant aux côtés des traductions pvtro_common dans la même UI.';
	@override String get coordination => 'Toutes les traductions sont automatiquement coordonnées quand vous changez la langue en utilisant le sélecteur en haut.';
}

// Path: dialogs.allLanguages
class TranslationsDialogsAllLanguagesFr extends TranslationsDialogsAllLanguagesEn {
	TranslationsDialogsAllLanguagesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Toutes les Langues Supportées';
	@override String get description => 'Pvtro a automatiquement découvert et unifié ces langues :';
}

// Path: dialogs.systemInfo.features
class TranslationsDialogsSystemInfoFeaturesFr extends TranslationsDialogsSystemInfoFeaturesEn {
	TranslationsDialogsSystemInfoFeaturesFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get noImportConflicts => 'Zéro conflit d\'importation';
	@override String get autoCoordination => 'Coordination automatique des locales';
	@override String get typeSafe => 'Gestion des enums type-safe';
	@override String get buildRunner => 'Intégration build-runner';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app.title': return 'Exemple Pvtro';
			case 'app.subtitle': return 'Démo de Coordination de Traduction Multi-Package';
			case 'welcome.title': return 'Bienvenue à Pvtro !';
			case 'welcome.description': return 'Cet exemple démontre la capacité de pvtro à coordiner les traductions entre plusieurs packages slang de manière transparente.';
			case 'welcome.getStarted': return 'Commencer';
			case 'conversion.title': return 'Conversions d\'Unités';
			case 'conversion.description': return 'Convertissez entre différentes unités en utilisant les traductions du package pvtro_conver.';
			case 'conversion.selectType': return 'Sélectionner le type d\'unité';
			case 'conversion.enterValue': return 'Entrez la valeur à convertir';
			case 'conversion.convert': return 'Convertir';
			case 'conversion.result': return 'Résultat de Conversion';
			case 'stats.title': return 'État du Système Pvtro';
			case 'stats.currentLanguage': return 'Langue Actuelle';
			case 'stats.languageCode': return 'Code de Langue';
			case 'stats.packagesCoordinated': return 'Packages Coordonnés';
			case 'stats.totalLanguages': return 'Total des Langues';
			case 'stats.coordinatedPackages': return 'Packages Coordonnés';
			case 'stats.viewAllLanguages': return ({required Object count}) => 'Voir Toutes les ${count} Langues';
			case 'demo.title': return 'Actions Démo';
			case 'demo.description': return 'Testez diverses fonctionnalités pvtro et voyez la coordination de traduction en temps réel.';
			case 'demo.testLanguageSwitch': return 'Tester le Changement de Langue';
			case 'demo.systemInfo': return 'Informations Système';
			case 'demo.cycleLanguages': return 'Parcourir les Langues';
			case 'dialogs.about.title': return 'À Propos de Pvtro';
			case 'dialogs.about.description': return 'Pvtro est un Orchestrateur de Traduction Basé sur Fournisseur qui coordonne automatiquement les traductions slang entre plusieurs packages, éliminant les conflits d\'importation et fournissant une gestion unifiée des locales.';
			case 'dialogs.languageInfo.title': return 'Informations de Langue';
			case 'dialogs.languageInfo.currentLanguage': return 'Langue Actuelle';
			case 'dialogs.languageInfo.languageCode': return 'Code de Langue';
			case 'dialogs.languageInfo.packagesCoordinated': return 'Packages Coordonnés';
			case 'dialogs.languageSwitch.title': return 'Langue Changée';
			case 'dialogs.languageSwitch.message': return ({required Object language}) => 'Changé vers ${language} - Tous les packages mis à jour !';
			case 'dialogs.cycleComplete.title': return 'Parcours des Langues Terminé';
			case 'dialogs.cycleComplete.message': return 'Parcours des langues terminé ! Tous les packages sont restés synchronisés.';
			case 'dialogs.systemInfo.title': return 'Informations du Système Pvtro';
			case 'dialogs.systemInfo.runtimePackage': return 'Package Runtime : pvtro v0.0.1';
			case 'dialogs.systemInfo.builderPackage': return 'Package Builder : pvtro_builder v0.0.1';
			case 'dialogs.systemInfo.features.noImportConflicts': return 'Zéro conflit d\'importation';
			case 'dialogs.systemInfo.features.autoCoordination': return 'Coordination automatique des locales';
			case 'dialogs.systemInfo.features.typeSafe': return 'Gestion des enums type-safe';
			case 'dialogs.systemInfo.features.buildRunner': return 'Intégration build-runner';
			case 'dialogs.unitInfo.title': return 'Informations de Conversion d\'Unités';
			case 'dialogs.unitInfo.currentType': return ({required Object type}) => 'Type d\'unité actuel : ${type}';
			case 'dialogs.unitInfo.description': return 'Ceci démontre les traductions du package pvtro_conver fonctionnant aux côtés des traductions pvtro_common dans la même UI.';
			case 'dialogs.unitInfo.coordination': return 'Toutes les traductions sont automatiquement coordonnées quand vous changez la langue en utilisant le sélecteur en haut.';
			case 'dialogs.allLanguages.title': return 'Toutes les Langues Supportées';
			case 'dialogs.allLanguages.description': return 'Pvtro a automatiquement découvert et unifié ces langues :';
			case 'units.length': return 'Longueur / Distance';
			case 'units.weight': return 'Poids / Masse';
			case 'units.temperature': return 'Température';
			case 'packages.common': return 'Traductions communes';
			case 'packages.conver': return 'Conversions d\'unités';
			case 'actions.ok': return 'OK';
			case 'actions.close': return 'Fermer';
			case 'actions.help': return 'Aide';
			default: return null;
		}
	}
}

