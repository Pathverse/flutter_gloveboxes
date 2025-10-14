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
class TranslationsEs extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsAppEs app = TranslationsAppEs._(_root);
	@override late final TranslationsWelcomeEs welcome = TranslationsWelcomeEs._(_root);
	@override late final TranslationsConversionEs conversion = TranslationsConversionEs._(_root);
	@override late final TranslationsStatsEs stats = TranslationsStatsEs._(_root);
	@override late final TranslationsDemoEs demo = TranslationsDemoEs._(_root);
	@override late final TranslationsDialogsEs dialogs = TranslationsDialogsEs._(_root);
	@override late final TranslationsUnitsEs units = TranslationsUnitsEs._(_root);
	@override late final TranslationsPackagesEs packages = TranslationsPackagesEs._(_root);
	@override late final TranslationsActionsEs actions = TranslationsActionsEs._(_root);
}

// Path: app
class TranslationsAppEs extends TranslationsAppEn {
	TranslationsAppEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ejemplo de Pvtro';
	@override String get subtitle => 'Demo de Coordinación de Traducción Multi-Paquete';
}

// Path: welcome
class TranslationsWelcomeEs extends TranslationsWelcomeEn {
	TranslationsWelcomeEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => '¡Bienvenido a Pvtro!';
	@override String get description => 'Este ejemplo demuestra la capacidad de pvtro para coordinar traducciones entre múltiples paquetes slang sin problemas.';
	@override String get getStarted => 'Comenzar';
}

// Path: conversion
class TranslationsConversionEs extends TranslationsConversionEn {
	TranslationsConversionEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Conversiones de Unidades';
	@override String get description => 'Convierte entre diferentes unidades usando las traducciones del paquete pvtro_conver.';
	@override String get selectType => 'Seleccionar tipo de unidad';
	@override String get enterValue => 'Ingresa el valor a convertir';
	@override String get convert => 'Convertir';
	@override String get result => 'Resultado de Conversión';
}

// Path: stats
class TranslationsStatsEs extends TranslationsStatsEn {
	TranslationsStatsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Estado del Sistema Pvtro';
	@override String get currentLanguage => 'Idioma Actual';
	@override String get languageCode => 'Código de Idioma';
	@override String get packagesCoordinated => 'Paquetes Coordinados';
	@override String get totalLanguages => 'Total de Idiomas';
	@override String get coordinatedPackages => 'Paquetes Coordinados';
	@override String viewAllLanguages({required Object count}) => 'Ver Todos los ${count} Idiomas';
}

// Path: demo
class TranslationsDemoEs extends TranslationsDemoEn {
	TranslationsDemoEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Acciones Demo';
	@override String get description => 'Prueba varias características de pvtro y ve la coordinación de traducción en tiempo real.';
	@override String get testLanguageSwitch => 'Probar Cambio de Idioma';
	@override String get systemInfo => 'Información del Sistema';
	@override String get cycleLanguages => 'Ciclar Idiomas';
}

// Path: dialogs
class TranslationsDialogsEs extends TranslationsDialogsEn {
	TranslationsDialogsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsAboutEs about = TranslationsDialogsAboutEs._(_root);
	@override late final TranslationsDialogsLanguageInfoEs languageInfo = TranslationsDialogsLanguageInfoEs._(_root);
	@override late final TranslationsDialogsLanguageSwitchEs languageSwitch = TranslationsDialogsLanguageSwitchEs._(_root);
	@override late final TranslationsDialogsCycleCompleteEs cycleComplete = TranslationsDialogsCycleCompleteEs._(_root);
	@override late final TranslationsDialogsSystemInfoEs systemInfo = TranslationsDialogsSystemInfoEs._(_root);
	@override late final TranslationsDialogsUnitInfoEs unitInfo = TranslationsDialogsUnitInfoEs._(_root);
	@override late final TranslationsDialogsAllLanguagesEs allLanguages = TranslationsDialogsAllLanguagesEs._(_root);
}

// Path: units
class TranslationsUnitsEs extends TranslationsUnitsEn {
	TranslationsUnitsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get length => 'Longitud / Distancia';
	@override String get weight => 'Peso / Masa';
	@override String get temperature => 'Temperatura';
}

// Path: packages
class TranslationsPackagesEs extends TranslationsPackagesEn {
	TranslationsPackagesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get common => 'Traducciones comunes';
	@override String get conver => 'Conversiones de unidades';
}

// Path: actions
class TranslationsActionsEs extends TranslationsActionsEn {
	TranslationsActionsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get ok => 'OK';
	@override String get close => 'Cerrar';
	@override String get help => 'Ayuda';
}

// Path: dialogs.about
class TranslationsDialogsAboutEs extends TranslationsDialogsAboutEn {
	TranslationsDialogsAboutEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Acerca de Pvtro';
	@override String get description => 'Pvtro es un Orquestador de Traducción Basado en Proveedor que coordina automáticamente las traducciones slang entre múltiples paquetes, eliminando conflictos de importación y proporcionando gestión unificada de localización.';
}

// Path: dialogs.languageInfo
class TranslationsDialogsLanguageInfoEs extends TranslationsDialogsLanguageInfoEn {
	TranslationsDialogsLanguageInfoEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Información del Idioma';
	@override String get currentLanguage => 'Idioma Actual';
	@override String get languageCode => 'Código de Idioma';
	@override String get packagesCoordinated => 'Paquetes Coordinados';
}

// Path: dialogs.languageSwitch
class TranslationsDialogsLanguageSwitchEs extends TranslationsDialogsLanguageSwitchEn {
	TranslationsDialogsLanguageSwitchEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Idioma Cambiado';
	@override String message({required Object language}) => '¡Cambiado a ${language} - Todos los paquetes actualizados!';
}

// Path: dialogs.cycleComplete
class TranslationsDialogsCycleCompleteEs extends TranslationsDialogsCycleCompleteEn {
	TranslationsDialogsCycleCompleteEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ciclo de Idiomas Completo';
	@override String get message => '¡Ciclo de idiomas completo! Todos los paquetes permanecieron sincronizados.';
}

// Path: dialogs.systemInfo
class TranslationsDialogsSystemInfoEs extends TranslationsDialogsSystemInfoEn {
	TranslationsDialogsSystemInfoEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Información del Sistema Pvtro';
	@override String get runtimePackage => 'Paquete Runtime: pvtro v0.0.1';
	@override String get builderPackage => 'Paquete Builder: pvtro_builder v0.0.1';
	@override late final TranslationsDialogsSystemInfoFeaturesEs features = TranslationsDialogsSystemInfoFeaturesEs._(_root);
}

// Path: dialogs.unitInfo
class TranslationsDialogsUnitInfoEs extends TranslationsDialogsUnitInfoEn {
	TranslationsDialogsUnitInfoEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Información de Conversión de Unidades';
	@override String currentType({required Object type}) => 'Tipo de unidad actual: ${type}';
	@override String get description => 'Esto demuestra las traducciones del paquete pvtro_conver funcionando junto con las traducciones pvtro_common en la misma UI.';
	@override String get coordination => 'Todas las traducciones se coordinan automáticamente cuando cambias el idioma usando el selector en la parte superior.';
}

// Path: dialogs.allLanguages
class TranslationsDialogsAllLanguagesEs extends TranslationsDialogsAllLanguagesEn {
	TranslationsDialogsAllLanguagesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Todos los Idiomas Soportados';
	@override String get description => 'Pvtro descubrió y unificó automáticamente estos idiomas:';
}

// Path: dialogs.systemInfo.features
class TranslationsDialogsSystemInfoFeaturesEs extends TranslationsDialogsSystemInfoFeaturesEn {
	TranslationsDialogsSystemInfoFeaturesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get noImportConflicts => 'Cero conflictos de importación';
	@override String get autoCoordination => 'Coordinación automática de localización';
	@override String get typeSafe => 'Gestión de enums type-safe';
	@override String get buildRunner => 'Integración build-runner';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app.title': return 'Ejemplo de Pvtro';
			case 'app.subtitle': return 'Demo de Coordinación de Traducción Multi-Paquete';
			case 'welcome.title': return '¡Bienvenido a Pvtro!';
			case 'welcome.description': return 'Este ejemplo demuestra la capacidad de pvtro para coordinar traducciones entre múltiples paquetes slang sin problemas.';
			case 'welcome.getStarted': return 'Comenzar';
			case 'conversion.title': return 'Conversiones de Unidades';
			case 'conversion.description': return 'Convierte entre diferentes unidades usando las traducciones del paquete pvtro_conver.';
			case 'conversion.selectType': return 'Seleccionar tipo de unidad';
			case 'conversion.enterValue': return 'Ingresa el valor a convertir';
			case 'conversion.convert': return 'Convertir';
			case 'conversion.result': return 'Resultado de Conversión';
			case 'stats.title': return 'Estado del Sistema Pvtro';
			case 'stats.currentLanguage': return 'Idioma Actual';
			case 'stats.languageCode': return 'Código de Idioma';
			case 'stats.packagesCoordinated': return 'Paquetes Coordinados';
			case 'stats.totalLanguages': return 'Total de Idiomas';
			case 'stats.coordinatedPackages': return 'Paquetes Coordinados';
			case 'stats.viewAllLanguages': return ({required Object count}) => 'Ver Todos los ${count} Idiomas';
			case 'demo.title': return 'Acciones Demo';
			case 'demo.description': return 'Prueba varias características de pvtro y ve la coordinación de traducción en tiempo real.';
			case 'demo.testLanguageSwitch': return 'Probar Cambio de Idioma';
			case 'demo.systemInfo': return 'Información del Sistema';
			case 'demo.cycleLanguages': return 'Ciclar Idiomas';
			case 'dialogs.about.title': return 'Acerca de Pvtro';
			case 'dialogs.about.description': return 'Pvtro es un Orquestador de Traducción Basado en Proveedor que coordina automáticamente las traducciones slang entre múltiples paquetes, eliminando conflictos de importación y proporcionando gestión unificada de localización.';
			case 'dialogs.languageInfo.title': return 'Información del Idioma';
			case 'dialogs.languageInfo.currentLanguage': return 'Idioma Actual';
			case 'dialogs.languageInfo.languageCode': return 'Código de Idioma';
			case 'dialogs.languageInfo.packagesCoordinated': return 'Paquetes Coordinados';
			case 'dialogs.languageSwitch.title': return 'Idioma Cambiado';
			case 'dialogs.languageSwitch.message': return ({required Object language}) => '¡Cambiado a ${language} - Todos los paquetes actualizados!';
			case 'dialogs.cycleComplete.title': return 'Ciclo de Idiomas Completo';
			case 'dialogs.cycleComplete.message': return '¡Ciclo de idiomas completo! Todos los paquetes permanecieron sincronizados.';
			case 'dialogs.systemInfo.title': return 'Información del Sistema Pvtro';
			case 'dialogs.systemInfo.runtimePackage': return 'Paquete Runtime: pvtro v0.0.1';
			case 'dialogs.systemInfo.builderPackage': return 'Paquete Builder: pvtro_builder v0.0.1';
			case 'dialogs.systemInfo.features.noImportConflicts': return 'Cero conflictos de importación';
			case 'dialogs.systemInfo.features.autoCoordination': return 'Coordinación automática de localización';
			case 'dialogs.systemInfo.features.typeSafe': return 'Gestión de enums type-safe';
			case 'dialogs.systemInfo.features.buildRunner': return 'Integración build-runner';
			case 'dialogs.unitInfo.title': return 'Información de Conversión de Unidades';
			case 'dialogs.unitInfo.currentType': return ({required Object type}) => 'Tipo de unidad actual: ${type}';
			case 'dialogs.unitInfo.description': return 'Esto demuestra las traducciones del paquete pvtro_conver funcionando junto con las traducciones pvtro_common en la misma UI.';
			case 'dialogs.unitInfo.coordination': return 'Todas las traducciones se coordinan automáticamente cuando cambias el idioma usando el selector en la parte superior.';
			case 'dialogs.allLanguages.title': return 'Todos los Idiomas Soportados';
			case 'dialogs.allLanguages.description': return 'Pvtro descubrió y unificó automáticamente estos idiomas:';
			case 'units.length': return 'Longitud / Distancia';
			case 'units.weight': return 'Peso / Masa';
			case 'units.temperature': return 'Temperatura';
			case 'packages.common': return 'Traducciones comunes';
			case 'packages.conver': return 'Conversiones de unidades';
			case 'actions.ok': return 'OK';
			case 'actions.close': return 'Cerrar';
			case 'actions.help': return 'Ayuda';
			default: return null;
		}
	}
}

