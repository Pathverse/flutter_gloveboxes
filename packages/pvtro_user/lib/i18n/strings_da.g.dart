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
	@override late final TranslationsRegisterationDa registeration = TranslationsRegisterationDa._(_root);
	@override late final TranslationsLoginDa login = TranslationsLoginDa._(_root);
	@override late final TranslationsPermissionsDa permissions = TranslationsPermissionsDa._(_root);
}

// Path: registeration
class TranslationsRegisterationDa extends TranslationsRegisterationEn {
	TranslationsRegisterationDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterationFormDa form = TranslationsRegisterationFormDa._(_root);
	@override late final TranslationsRegisterationErrorsDa errors = TranslationsRegisterationErrorsDa._(_root);
}

// Path: login
class TranslationsLoginDa extends TranslationsLoginEn {
	TranslationsLoginDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginFormDa form = TranslationsLoginFormDa._(_root);
	@override late final TranslationsLoginErrorsDa errors = TranslationsLoginErrorsDa._(_root);
}

// Path: permissions
class TranslationsPermissionsDa extends TranslationsPermissionsEn {
	TranslationsPermissionsDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get read => 'Læse';
	@override String get write => 'Skrive';
	@override String get execute => 'Udføre';
	@override String get delete => 'Slette';
	@override String get create => 'Oprette';
	@override String get update => 'Opdatere';
	@override String get manage => 'Administrere';
	@override String get view => 'Se';
	@override String get edit => 'Redigere';
	@override String get share => 'Dele';
	@override String get download => 'Downloade';
	@override String get upload => 'Uploade';
}

// Path: registeration.form
class TranslationsRegisterationFormDa extends TranslationsRegisterationFormEn {
	TranslationsRegisterationFormDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Opret konto';
	@override String get name => 'Navn';
	@override String get email => 'E-mail';
	@override String get password => 'Adgangskode';
	@override String get confirmPassword => 'Bekræft adgangskode';
	@override String get register => 'Registrer';
	@override String get alreadyHaveAccount => 'Har du allerede en konto? Log ind';
	@override String get tos => 'Ved at registrere dig accepterer du vores servicevilkår og privatlivspolitik.';
	@override String get tosToggle => 'Vis servicevilkår og privatlivspolitik';
	@override String get tosAgree => 'Jeg accepterer servicevilkårene og privatlivspolitikken';
}

// Path: registeration.errors
class TranslationsRegisterationErrorsDa extends TranslationsRegisterationErrorsEn {
	TranslationsRegisterationErrorsDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get nameRequired => 'Navn er påkrævet';
	@override String get emailRequired => 'E-mail er påkrævet';
	@override String get emailInvalid => 'E-mail er ugyldig';
	@override String get passwordRequired => 'Adgangskode er påkrævet';
	@override String passwordMin({required Object number}) => 'Adgangskode skal være mindst ${number} tegn';
	@override String passwordMax({required Object number}) => 'Adgangskode må ikke overstige ${number} tegn';
	@override String passwordFormatSpecial({required Object number}) => 'Adgangskode skal indeholde mindst ${number} specialtegn';
	@override String get confirmPasswordRequired => 'Bekræft adgangskode er påkrævet';
	@override String get confirmPasswordMatch => 'Adgangskoder stemmer ikke overens';
}

// Path: login.form
class TranslationsLoginFormDa extends TranslationsLoginFormEn {
	TranslationsLoginFormDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get title => 'Log ind på din konto';
	@override String get email => 'E-mail';
	@override String get password => 'Adgangskode';
	@override String get login => 'Log ind';
	@override String get forgotPassword => 'Glemt adgangskode?';
	@override String get noAccount => 'Har du ikke en konto? Registrer';
}

// Path: login.errors
class TranslationsLoginErrorsDa extends TranslationsLoginErrorsEn {
	TranslationsLoginErrorsDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get emailRequired => 'E-mail er påkrævet';
	@override String get emailInvalid => 'E-mail er ugyldig';
	@override String get passwordRequired => 'Adgangskode er påkrævet';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsDa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'registeration.form.title': return 'Opret konto';
			case 'registeration.form.name': return 'Navn';
			case 'registeration.form.email': return 'E-mail';
			case 'registeration.form.password': return 'Adgangskode';
			case 'registeration.form.confirmPassword': return 'Bekræft adgangskode';
			case 'registeration.form.register': return 'Registrer';
			case 'registeration.form.alreadyHaveAccount': return 'Har du allerede en konto? Log ind';
			case 'registeration.form.tos': return 'Ved at registrere dig accepterer du vores servicevilkår og privatlivspolitik.';
			case 'registeration.form.tosToggle': return 'Vis servicevilkår og privatlivspolitik';
			case 'registeration.form.tosAgree': return 'Jeg accepterer servicevilkårene og privatlivspolitikken';
			case 'registeration.errors.nameRequired': return 'Navn er påkrævet';
			case 'registeration.errors.emailRequired': return 'E-mail er påkrævet';
			case 'registeration.errors.emailInvalid': return 'E-mail er ugyldig';
			case 'registeration.errors.passwordRequired': return 'Adgangskode er påkrævet';
			case 'registeration.errors.passwordMin': return ({required Object number}) => 'Adgangskode skal være mindst ${number} tegn';
			case 'registeration.errors.passwordMax': return ({required Object number}) => 'Adgangskode må ikke overstige ${number} tegn';
			case 'registeration.errors.passwordFormatSpecial': return ({required Object number}) => 'Adgangskode skal indeholde mindst ${number} specialtegn';
			case 'registeration.errors.confirmPasswordRequired': return 'Bekræft adgangskode er påkrævet';
			case 'registeration.errors.confirmPasswordMatch': return 'Adgangskoder stemmer ikke overens';
			case 'login.form.title': return 'Log ind på din konto';
			case 'login.form.email': return 'E-mail';
			case 'login.form.password': return 'Adgangskode';
			case 'login.form.login': return 'Log ind';
			case 'login.form.forgotPassword': return 'Glemt adgangskode?';
			case 'login.form.noAccount': return 'Har du ikke en konto? Registrer';
			case 'login.errors.emailRequired': return 'E-mail er påkrævet';
			case 'login.errors.emailInvalid': return 'E-mail er ugyldig';
			case 'login.errors.passwordRequired': return 'Adgangskode er påkrævet';
			case 'permissions.read': return 'Læse';
			case 'permissions.write': return 'Skrive';
			case 'permissions.execute': return 'Udføre';
			case 'permissions.delete': return 'Slette';
			case 'permissions.create': return 'Oprette';
			case 'permissions.update': return 'Opdatere';
			case 'permissions.manage': return 'Administrere';
			case 'permissions.view': return 'Se';
			case 'permissions.edit': return 'Redigere';
			case 'permissions.share': return 'Dele';
			case 'permissions.download': return 'Downloade';
			case 'permissions.upload': return 'Uploade';
			default: return null;
		}
	}
}

