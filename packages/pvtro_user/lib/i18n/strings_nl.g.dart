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
	@override late final TranslationsRegisterationNl registeration = TranslationsRegisterationNl._(_root);
	@override late final TranslationsLoginNl login = TranslationsLoginNl._(_root);
	@override late final TranslationsPermissionsNl permissions = TranslationsPermissionsNl._(_root);
}

// Path: registeration
class TranslationsRegisterationNl extends TranslationsRegisterationEn {
	TranslationsRegisterationNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterationFormNl form = TranslationsRegisterationFormNl._(_root);
	@override late final TranslationsRegisterationErrorsNl errors = TranslationsRegisterationErrorsNl._(_root);
}

// Path: login
class TranslationsLoginNl extends TranslationsLoginEn {
	TranslationsLoginNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginFormNl form = TranslationsLoginFormNl._(_root);
	@override late final TranslationsLoginErrorsNl errors = TranslationsLoginErrorsNl._(_root);
}

// Path: permissions
class TranslationsPermissionsNl extends TranslationsPermissionsEn {
	TranslationsPermissionsNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get read => 'Lezen';
	@override String get write => 'Schrijven';
	@override String get execute => 'Uitvoeren';
	@override String get delete => 'Verwijderen';
	@override String get create => 'Aanmaken';
	@override String get update => 'Bijwerken';
	@override String get manage => 'Beheren';
	@override String get view => 'Bekijken';
	@override String get edit => 'Bewerken';
	@override String get share => 'Delen';
	@override String get download => 'Downloaden';
	@override String get upload => 'Uploaden';
}

// Path: registeration.form
class TranslationsRegisterationFormNl extends TranslationsRegisterationFormEn {
	TranslationsRegisterationFormNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Account aanmaken';
	@override String get name => 'Naam';
	@override String get email => 'E-mail';
	@override String get password => 'Wachtwoord';
	@override String get confirmPassword => 'Bevestig wachtwoord';
	@override String get register => 'Registreren';
	@override String get alreadyHaveAccount => 'Heb je al een account? Inloggen';
	@override String get tos => 'Door je te registreren ga je akkoord met onze Servicevoorwaarden en Privacybeleid.';
	@override String get tosToggle => 'Toon Servicevoorwaarden en Privacybeleid';
	@override String get tosAgree => 'Ik ga akkoord met de Servicevoorwaarden en het Privacybeleid';
}

// Path: registeration.errors
class TranslationsRegisterationErrorsNl extends TranslationsRegisterationErrorsEn {
	TranslationsRegisterationErrorsNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get nameRequired => 'Naam is verplicht';
	@override String get emailRequired => 'E-mail is verplicht';
	@override String get emailInvalid => 'E-mail is ongeldig';
	@override String get passwordRequired => 'Wachtwoord is verplicht';
	@override String passwordMin({required Object number}) => 'Wachtwoord moet minstens ${number} karakters bevatten';
	@override String passwordMax({required Object number}) => 'Wachtwoord mag niet meer dan ${number} karakters bevatten';
	@override String passwordFormatSpecial({required Object number}) => 'Wachtwoord moet minstens ${number} speciaal karakter bevatten';
	@override String get confirmPasswordRequired => 'Bevestig wachtwoord is verplicht';
	@override String get confirmPasswordMatch => 'Wachtwoorden komen niet overeen';
}

// Path: login.form
class TranslationsLoginFormNl extends TranslationsLoginFormEn {
	TranslationsLoginFormNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Inloggen op je account';
	@override String get email => 'E-mail';
	@override String get password => 'Wachtwoord';
	@override String get login => 'Inloggen';
	@override String get forgotPassword => 'Wachtwoord vergeten?';
	@override String get noAccount => 'Heb je geen account? Registreren';
}

// Path: login.errors
class TranslationsLoginErrorsNl extends TranslationsLoginErrorsEn {
	TranslationsLoginErrorsNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get emailRequired => 'E-mail is verplicht';
	@override String get emailInvalid => 'E-mail is ongeldig';
	@override String get passwordRequired => 'Wachtwoord is verplicht';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsNl {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'registeration.form.title': return 'Account aanmaken';
			case 'registeration.form.name': return 'Naam';
			case 'registeration.form.email': return 'E-mail';
			case 'registeration.form.password': return 'Wachtwoord';
			case 'registeration.form.confirmPassword': return 'Bevestig wachtwoord';
			case 'registeration.form.register': return 'Registreren';
			case 'registeration.form.alreadyHaveAccount': return 'Heb je al een account? Inloggen';
			case 'registeration.form.tos': return 'Door je te registreren ga je akkoord met onze Servicevoorwaarden en Privacybeleid.';
			case 'registeration.form.tosToggle': return 'Toon Servicevoorwaarden en Privacybeleid';
			case 'registeration.form.tosAgree': return 'Ik ga akkoord met de Servicevoorwaarden en het Privacybeleid';
			case 'registeration.errors.nameRequired': return 'Naam is verplicht';
			case 'registeration.errors.emailRequired': return 'E-mail is verplicht';
			case 'registeration.errors.emailInvalid': return 'E-mail is ongeldig';
			case 'registeration.errors.passwordRequired': return 'Wachtwoord is verplicht';
			case 'registeration.errors.passwordMin': return ({required Object number}) => 'Wachtwoord moet minstens ${number} karakters bevatten';
			case 'registeration.errors.passwordMax': return ({required Object number}) => 'Wachtwoord mag niet meer dan ${number} karakters bevatten';
			case 'registeration.errors.passwordFormatSpecial': return ({required Object number}) => 'Wachtwoord moet minstens ${number} speciaal karakter bevatten';
			case 'registeration.errors.confirmPasswordRequired': return 'Bevestig wachtwoord is verplicht';
			case 'registeration.errors.confirmPasswordMatch': return 'Wachtwoorden komen niet overeen';
			case 'login.form.title': return 'Inloggen op je account';
			case 'login.form.email': return 'E-mail';
			case 'login.form.password': return 'Wachtwoord';
			case 'login.form.login': return 'Inloggen';
			case 'login.form.forgotPassword': return 'Wachtwoord vergeten?';
			case 'login.form.noAccount': return 'Heb je geen account? Registreren';
			case 'login.errors.emailRequired': return 'E-mail is verplicht';
			case 'login.errors.emailInvalid': return 'E-mail is ongeldig';
			case 'login.errors.passwordRequired': return 'Wachtwoord is verplicht';
			case 'permissions.read': return 'Lezen';
			case 'permissions.write': return 'Schrijven';
			case 'permissions.execute': return 'Uitvoeren';
			case 'permissions.delete': return 'Verwijderen';
			case 'permissions.create': return 'Aanmaken';
			case 'permissions.update': return 'Bijwerken';
			case 'permissions.manage': return 'Beheren';
			case 'permissions.view': return 'Bekijken';
			case 'permissions.edit': return 'Bewerken';
			case 'permissions.share': return 'Delen';
			case 'permissions.download': return 'Downloaden';
			case 'permissions.upload': return 'Uploaden';
			default: return null;
		}
	}
}

