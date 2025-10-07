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
	/// final pvtroExample = Translations.of(context);
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
	late final TranslationsAppEn app = TranslationsAppEn.internal(_root);
	late final TranslationsWelcomeEn welcome = TranslationsWelcomeEn.internal(_root);
	late final TranslationsConversionEn conversion = TranslationsConversionEn.internal(_root);
	late final TranslationsStatsEn stats = TranslationsStatsEn.internal(_root);
	late final TranslationsDemoEn demo = TranslationsDemoEn.internal(_root);
	late final TranslationsDialogsEn dialogs = TranslationsDialogsEn.internal(_root);
	late final TranslationsUnitsEn units = TranslationsUnitsEn.internal(_root);
	late final TranslationsPackagesEn packages = TranslationsPackagesEn.internal(_root);
	late final TranslationsActionsEn actions = TranslationsActionsEn.internal(_root);
}

// Path: app
class TranslationsAppEn {
	TranslationsAppEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Pvtro Example'
	String get title => 'Pvtro Example';

	/// en: 'Multi-Package Translation Coordination Demo'
	String get subtitle => 'Multi-Package Translation Coordination Demo';
}

// Path: welcome
class TranslationsWelcomeEn {
	TranslationsWelcomeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Welcome to Pvtro!'
	String get title => 'Welcome to Pvtro!';

	/// en: 'This example demonstrates pvtro's ability to coordinate translations across multiple slang packages seamlessly.'
	String get description => 'This example demonstrates pvtro\'s ability to coordinate translations across multiple slang packages seamlessly.';

	/// en: 'Get Started'
	String get getStarted => 'Get Started';
}

// Path: conversion
class TranslationsConversionEn {
	TranslationsConversionEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unit Conversions'
	String get title => 'Unit Conversions';

	/// en: 'Convert between different units using pvtro_conver package translations.'
	String get description => 'Convert between different units using pvtro_conver package translations.';

	/// en: 'Select unit type'
	String get selectType => 'Select unit type';

	/// en: 'Enter value to convert'
	String get enterValue => 'Enter value to convert';

	/// en: 'Convert'
	String get convert => 'Convert';

	/// en: 'Conversion Result'
	String get result => 'Conversion Result';
}

// Path: stats
class TranslationsStatsEn {
	TranslationsStatsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Pvtro System Status'
	String get title => 'Pvtro System Status';

	/// en: 'Current Language'
	String get currentLanguage => 'Current Language';

	/// en: 'Language Code'
	String get languageCode => 'Language Code';

	/// en: 'Packages Coordinated'
	String get packagesCoordinated => 'Packages Coordinated';

	/// en: 'Total Languages'
	String get totalLanguages => 'Total Languages';

	/// en: 'Coordinated Packages'
	String get coordinatedPackages => 'Coordinated Packages';

	/// en: 'View All {{count}} Languages'
	String viewAllLanguages({required Object count}) => 'View All ${count} Languages';
}

// Path: demo
class TranslationsDemoEn {
	TranslationsDemoEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Demo Actions'
	String get title => 'Demo Actions';

	/// en: 'Test various pvtro features and see real-time translation coordination.'
	String get description => 'Test various pvtro features and see real-time translation coordination.';

	/// en: 'Test Language Switch'
	String get testLanguageSwitch => 'Test Language Switch';

	/// en: 'System Info'
	String get systemInfo => 'System Info';

	/// en: 'Cycle Languages'
	String get cycleLanguages => 'Cycle Languages';
}

// Path: dialogs
class TranslationsDialogsEn {
	TranslationsDialogsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsDialogsAboutEn about = TranslationsDialogsAboutEn.internal(_root);
	late final TranslationsDialogsLanguageInfoEn languageInfo = TranslationsDialogsLanguageInfoEn.internal(_root);
	late final TranslationsDialogsLanguageSwitchEn languageSwitch = TranslationsDialogsLanguageSwitchEn.internal(_root);
	late final TranslationsDialogsCycleCompleteEn cycleComplete = TranslationsDialogsCycleCompleteEn.internal(_root);
	late final TranslationsDialogsSystemInfoEn systemInfo = TranslationsDialogsSystemInfoEn.internal(_root);
	late final TranslationsDialogsUnitInfoEn unitInfo = TranslationsDialogsUnitInfoEn.internal(_root);
	late final TranslationsDialogsAllLanguagesEn allLanguages = TranslationsDialogsAllLanguagesEn.internal(_root);
}

// Path: units
class TranslationsUnitsEn {
	TranslationsUnitsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Length / Distance'
	String get length => 'Length / Distance';

	/// en: 'Weight / Mass'
	String get weight => 'Weight / Mass';

	/// en: 'Temperature'
	String get temperature => 'Temperature';
}

// Path: packages
class TranslationsPackagesEn {
	TranslationsPackagesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Common translations'
	String get common => 'Common translations';

	/// en: 'Unit conversions'
	String get conver => 'Unit conversions';
}

// Path: actions
class TranslationsActionsEn {
	TranslationsActionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'OK'
	String get ok => 'OK';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Help'
	String get help => 'Help';
}

// Path: dialogs.about
class TranslationsDialogsAboutEn {
	TranslationsDialogsAboutEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'About Pvtro'
	String get title => 'About Pvtro';

	/// en: 'Pvtro is a Provider-based Translation Orchestrator that automatically coordinates slang translations across multiple packages, eliminating import conflicts and providing unified locale management.'
	String get description => 'Pvtro is a Provider-based Translation Orchestrator that automatically coordinates slang translations across multiple packages, eliminating import conflicts and providing unified locale management.';
}

// Path: dialogs.languageInfo
class TranslationsDialogsLanguageInfoEn {
	TranslationsDialogsLanguageInfoEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Language Information'
	String get title => 'Language Information';

	/// en: 'Current Language'
	String get currentLanguage => 'Current Language';

	/// en: 'Language Code'
	String get languageCode => 'Language Code';

	/// en: 'Packages Coordinated'
	String get packagesCoordinated => 'Packages Coordinated';
}

// Path: dialogs.languageSwitch
class TranslationsDialogsLanguageSwitchEn {
	TranslationsDialogsLanguageSwitchEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Language Switched'
	String get title => 'Language Switched';

	/// en: 'Switched to {{language}} - All packages updated!'
	String message({required Object language}) => 'Switched to ${language} - All packages updated!';
}

// Path: dialogs.cycleComplete
class TranslationsDialogsCycleCompleteEn {
	TranslationsDialogsCycleCompleteEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Language Cycling Complete'
	String get title => 'Language Cycling Complete';

	/// en: 'Language cycling complete! All packages stayed synchronized.'
	String get message => 'Language cycling complete! All packages stayed synchronized.';
}

// Path: dialogs.systemInfo
class TranslationsDialogsSystemInfoEn {
	TranslationsDialogsSystemInfoEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Pvtro System Information'
	String get title => 'Pvtro System Information';

	/// en: 'Runtime Package: pvtro v0.0.1'
	String get runtimePackage => 'Runtime Package: pvtro v0.0.1';

	/// en: 'Builder Package: pvtro_builder v0.0.1'
	String get builderPackage => 'Builder Package: pvtro_builder v0.0.1';

	late final TranslationsDialogsSystemInfoFeaturesEn features = TranslationsDialogsSystemInfoFeaturesEn.internal(_root);
}

// Path: dialogs.unitInfo
class TranslationsDialogsUnitInfoEn {
	TranslationsDialogsUnitInfoEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Unit Conversion Info'
	String get title => 'Unit Conversion Info';

	/// en: 'Current unit type: {{type}}'
	String currentType({required Object type}) => 'Current unit type: ${type}';

	/// en: 'This demonstrates pvtro_conver package translations working alongside pvtro_common translations in the same UI.'
	String get description => 'This demonstrates pvtro_conver package translations working alongside pvtro_common translations in the same UI.';

	/// en: 'All translations are automatically coordinated when you change the language using the selector at the top.'
	String get coordination => 'All translations are automatically coordinated when you change the language using the selector at the top.';
}

// Path: dialogs.allLanguages
class TranslationsDialogsAllLanguagesEn {
	TranslationsDialogsAllLanguagesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'All Supported Languages'
	String get title => 'All Supported Languages';

	/// en: 'Pvtro automatically discovered and unified these languages:'
	String get description => 'Pvtro automatically discovered and unified these languages:';
}

// Path: dialogs.systemInfo.features
class TranslationsDialogsSystemInfoFeaturesEn {
	TranslationsDialogsSystemInfoFeaturesEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Zero import conflicts'
	String get noImportConflicts => 'Zero import conflicts';

	/// en: 'Automatic locale coordination'
	String get autoCoordination => 'Automatic locale coordination';

	/// en: 'Type-safe enum management'
	String get typeSafe => 'Type-safe enum management';

	/// en: 'Build-runner integration'
	String get buildRunner => 'Build-runner integration';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app.title': return 'Pvtro Example';
			case 'app.subtitle': return 'Multi-Package Translation Coordination Demo';
			case 'welcome.title': return 'Welcome to Pvtro!';
			case 'welcome.description': return 'This example demonstrates pvtro\'s ability to coordinate translations across multiple slang packages seamlessly.';
			case 'welcome.getStarted': return 'Get Started';
			case 'conversion.title': return 'Unit Conversions';
			case 'conversion.description': return 'Convert between different units using pvtro_conver package translations.';
			case 'conversion.selectType': return 'Select unit type';
			case 'conversion.enterValue': return 'Enter value to convert';
			case 'conversion.convert': return 'Convert';
			case 'conversion.result': return 'Conversion Result';
			case 'stats.title': return 'Pvtro System Status';
			case 'stats.currentLanguage': return 'Current Language';
			case 'stats.languageCode': return 'Language Code';
			case 'stats.packagesCoordinated': return 'Packages Coordinated';
			case 'stats.totalLanguages': return 'Total Languages';
			case 'stats.coordinatedPackages': return 'Coordinated Packages';
			case 'stats.viewAllLanguages': return ({required Object count}) => 'View All ${count} Languages';
			case 'demo.title': return 'Demo Actions';
			case 'demo.description': return 'Test various pvtro features and see real-time translation coordination.';
			case 'demo.testLanguageSwitch': return 'Test Language Switch';
			case 'demo.systemInfo': return 'System Info';
			case 'demo.cycleLanguages': return 'Cycle Languages';
			case 'dialogs.about.title': return 'About Pvtro';
			case 'dialogs.about.description': return 'Pvtro is a Provider-based Translation Orchestrator that automatically coordinates slang translations across multiple packages, eliminating import conflicts and providing unified locale management.';
			case 'dialogs.languageInfo.title': return 'Language Information';
			case 'dialogs.languageInfo.currentLanguage': return 'Current Language';
			case 'dialogs.languageInfo.languageCode': return 'Language Code';
			case 'dialogs.languageInfo.packagesCoordinated': return 'Packages Coordinated';
			case 'dialogs.languageSwitch.title': return 'Language Switched';
			case 'dialogs.languageSwitch.message': return ({required Object language}) => 'Switched to ${language} - All packages updated!';
			case 'dialogs.cycleComplete.title': return 'Language Cycling Complete';
			case 'dialogs.cycleComplete.message': return 'Language cycling complete! All packages stayed synchronized.';
			case 'dialogs.systemInfo.title': return 'Pvtro System Information';
			case 'dialogs.systemInfo.runtimePackage': return 'Runtime Package: pvtro v0.0.1';
			case 'dialogs.systemInfo.builderPackage': return 'Builder Package: pvtro_builder v0.0.1';
			case 'dialogs.systemInfo.features.noImportConflicts': return 'Zero import conflicts';
			case 'dialogs.systemInfo.features.autoCoordination': return 'Automatic locale coordination';
			case 'dialogs.systemInfo.features.typeSafe': return 'Type-safe enum management';
			case 'dialogs.systemInfo.features.buildRunner': return 'Build-runner integration';
			case 'dialogs.unitInfo.title': return 'Unit Conversion Info';
			case 'dialogs.unitInfo.currentType': return ({required Object type}) => 'Current unit type: ${type}';
			case 'dialogs.unitInfo.description': return 'This demonstrates pvtro_conver package translations working alongside pvtro_common translations in the same UI.';
			case 'dialogs.unitInfo.coordination': return 'All translations are automatically coordinated when you change the language using the selector at the top.';
			case 'dialogs.allLanguages.title': return 'All Supported Languages';
			case 'dialogs.allLanguages.description': return 'Pvtro automatically discovered and unified these languages:';
			case 'units.length': return 'Length / Distance';
			case 'units.weight': return 'Weight / Mass';
			case 'units.temperature': return 'Temperature';
			case 'packages.common': return 'Common translations';
			case 'packages.conver': return 'Unit conversions';
			case 'actions.ok': return 'OK';
			case 'actions.close': return 'Close';
			case 'actions.help': return 'Help';
			default: return null;
		}
	}
}

