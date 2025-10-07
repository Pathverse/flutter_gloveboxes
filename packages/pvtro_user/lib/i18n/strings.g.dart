/// Generated file. Do not edit.
///
/// Source: i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 13
/// Strings: 520 (40 per locale)
///
/// Built on 2025-10-07 at 20:12 UTC

// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

import 'strings_da.g.dart' deferred as l_da;
import 'strings_es.g.dart' deferred as l_es;
import 'strings_fr.g.dart' deferred as l_fr;
import 'strings_he.g.dart' deferred as l_he;
import 'strings_is_IS.g.dart' deferred as l_is_IS;
import 'strings_ko.g.dart' deferred as l_ko;
import 'strings_nb.g.dart' deferred as l_nb;
import 'strings_nl.g.dart' deferred as l_nl;
import 'strings_no.g.dart' deferred as l_no;
import 'strings_sv.g.dart' deferred as l_sv;
import 'strings_zh.g.dart' deferred as l_zh;
import 'strings_zh_Hans.g.dart' deferred as l_zh_Hans;
part 'strings_en.g.dart';

/// Supported locales.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en'),
	da(languageCode: 'da'),
	es(languageCode: 'es'),
	fr(languageCode: 'fr'),
	he(languageCode: 'he'),
	isIs(languageCode: 'is', countryCode: 'IS'),
	ko(languageCode: 'ko'),
	nb(languageCode: 'nb'),
	nl(languageCode: 'nl'),
	no(languageCode: 'no'),
	sv(languageCode: 'sv'),
	zh(languageCode: 'zh'),
	zhHans(languageCode: 'zh', scriptCode: 'Hans');

	const AppLocale({
		required this.languageCode,
		this.scriptCode, // ignore: unused_element, unused_element_parameter
		this.countryCode, // ignore: unused_element, unused_element_parameter
	});

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;

	@override
	Future<Translations> build({
		Map<String, Node>? overrides,
		PluralResolver? cardinalResolver,
		PluralResolver? ordinalResolver,
	}) async {
		switch (this) {
			case AppLocale.en:
				return TranslationsEn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.da:
				await l_da.loadLibrary();
				return l_da.TranslationsDa(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.es:
				await l_es.loadLibrary();
				return l_es.TranslationsEs(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.fr:
				await l_fr.loadLibrary();
				return l_fr.TranslationsFr(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.he:
				await l_he.loadLibrary();
				return l_he.TranslationsHe(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.isIs:
				await l_is_IS.loadLibrary();
				return l_is_IS.TranslationsIsIs(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.ko:
				await l_ko.loadLibrary();
				return l_ko.TranslationsKo(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.nb:
				await l_nb.loadLibrary();
				return l_nb.TranslationsNb(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.nl:
				await l_nl.loadLibrary();
				return l_nl.TranslationsNl(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.no:
				await l_no.loadLibrary();
				return l_no.TranslationsNo(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.sv:
				await l_sv.loadLibrary();
				return l_sv.TranslationsSv(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.zh:
				await l_zh.loadLibrary();
				return l_zh.TranslationsZh(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.zhHans:
				await l_zh_Hans.loadLibrary();
				return l_zh_Hans.TranslationsZhHans(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
		}
	}

	@override
	Translations buildSync({
		Map<String, Node>? overrides,
		PluralResolver? cardinalResolver,
		PluralResolver? ordinalResolver,
	}) {
		switch (this) {
			case AppLocale.en:
				return TranslationsEn(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.da:
				return l_da.TranslationsDa(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.es:
				return l_es.TranslationsEs(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.fr:
				return l_fr.TranslationsFr(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.he:
				return l_he.TranslationsHe(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.isIs:
				return l_is_IS.TranslationsIsIs(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.ko:
				return l_ko.TranslationsKo(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.nb:
				return l_nb.TranslationsNb(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.nl:
				return l_nl.TranslationsNl(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.no:
				return l_no.TranslationsNo(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.sv:
				return l_sv.TranslationsSv(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.zh:
				return l_zh.TranslationsZh(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
			case AppLocale.zhHans:
				return l_zh_Hans.TranslationsZhHans(
					overrides: overrides,
					cardinalResolver: cardinalResolver,
					ordinalResolver: ordinalResolver,
				);
		}
	}

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.getTranslations(this);
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of pvtroUser).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = pvtroUser.someKey.anotherKey;
/// String b = pvtroUser['someKey.anotherKey']; // Only for edge cases!
Translations get pvtroUser => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final pvtroUser = Translations.of(context); // Get pvtroUser variable.
/// String a = pvtroUser.someKey.anotherKey; // Use pvtroUser variable.
/// String b = pvtroUser['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.pvtroUser.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get pvtroUser => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(
		utils: AppLocaleUtils.instance,
		lazy: true,
	);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static Future<AppLocale> setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static Future<AppLocale> setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static Future<AppLocale> useDeviceLocale() => instance.useDeviceLocale();
	static Future<void> setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);

	// synchronous versions
	static AppLocale setLocaleSync(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocaleSync(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRawSync(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRawSync(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocaleSync() => instance.useDeviceLocaleSync();
	static void setPluralResolverSync({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolverSync(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(
		baseLocale: AppLocale.en,
		locales: AppLocale.values,
	);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}
