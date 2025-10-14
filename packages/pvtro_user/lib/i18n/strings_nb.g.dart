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
	@override late final TranslationsRegisterationNb registeration = TranslationsRegisterationNb._(_root);
	@override late final TranslationsLoginNb login = TranslationsLoginNb._(_root);
	@override late final TranslationsPermissionsNb permissions = TranslationsPermissionsNb._(_root);
}

// Path: registeration
class TranslationsRegisterationNb extends TranslationsRegisterationEn {
	TranslationsRegisterationNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterationFormNb form = TranslationsRegisterationFormNb._(_root);
	@override late final TranslationsRegisterationErrorsNb errors = TranslationsRegisterationErrorsNb._(_root);
}

// Path: login
class TranslationsLoginNb extends TranslationsLoginEn {
	TranslationsLoginNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginFormNb form = TranslationsLoginFormNb._(_root);
	@override late final TranslationsLoginErrorsNb errors = TranslationsLoginErrorsNb._(_root);
}

// Path: permissions
class TranslationsPermissionsNb extends TranslationsPermissionsEn {
	TranslationsPermissionsNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get read => 'Les';
	@override String get write => 'Skriv';
	@override String get execute => 'Utfør';
	@override String get delete => 'Slett';
	@override String get create => 'Opprett';
	@override String get update => 'Oppdater';
	@override String get manage => 'Administrer';
	@override String get view => 'Se';
	@override String get edit => 'Rediger';
	@override String get share => 'Del';
	@override String get download => 'Last ned';
	@override String get upload => 'Last opp';
}

// Path: registeration.form
class TranslationsRegisterationFormNb extends TranslationsRegisterationFormEn {
	TranslationsRegisterationFormNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get title => 'Registrer konto';
	@override String get name => 'Navn';
	@override String get email => 'E-post';
	@override String get password => 'Passord';
	@override String get confirmPassword => 'Bekreft passord';
	@override String get register => 'Registrer';
	@override String get alreadyHaveAccount => 'Har du allerede en konto? Logg inn';
	@override String get tos => 'Ved å registrere deg godtar du våre tjenestevilkår og personvernregler.';
	@override String get tosToggle => 'Vis tjenestevilkår og personvernregler';
	@override String get tosAgree => 'Jeg godtar tjenestevilkårene og personvernreglene';
}

// Path: registeration.errors
class TranslationsRegisterationErrorsNb extends TranslationsRegisterationErrorsEn {
	TranslationsRegisterationErrorsNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get nameRequired => 'Navn er påkrevd';
	@override String get emailRequired => 'E-post er påkrevd';
	@override String get emailInvalid => 'E-post er ugyldig';
	@override String get passwordRequired => 'Passord er påkrevd';
	@override String passwordMin({required Object number}) => 'Passordet må være minst ${number} tegn';
	@override String passwordMax({required Object number}) => 'Passordet må ikke overstige ${number} tegn';
	@override String passwordFormatSpecial({required Object number}) => 'Passordet må inneholde minst ${number} spesialtegn';
	@override String get confirmPasswordRequired => 'Bekreft passord er påkrevd';
	@override String get confirmPasswordMatch => 'Passordene stemmer ikke overens';
}

// Path: login.form
class TranslationsLoginFormNb extends TranslationsLoginFormEn {
	TranslationsLoginFormNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get title => 'Logg inn på kontoen din';
	@override String get email => 'E-post';
	@override String get password => 'Passord';
	@override String get login => 'Logg inn';
	@override String get forgotPassword => 'Glemt passord?';
	@override String get noAccount => 'Har du ikke en konto? Registrer';
}

// Path: login.errors
class TranslationsLoginErrorsNb extends TranslationsLoginErrorsEn {
	TranslationsLoginErrorsNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get emailRequired => 'E-post er påkrevd';
	@override String get emailInvalid => 'E-post er ugyldig';
	@override String get passwordRequired => 'Passord er påkrevd';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsNb {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'registeration.form.title': return 'Registrer konto';
			case 'registeration.form.name': return 'Navn';
			case 'registeration.form.email': return 'E-post';
			case 'registeration.form.password': return 'Passord';
			case 'registeration.form.confirmPassword': return 'Bekreft passord';
			case 'registeration.form.register': return 'Registrer';
			case 'registeration.form.alreadyHaveAccount': return 'Har du allerede en konto? Logg inn';
			case 'registeration.form.tos': return 'Ved å registrere deg godtar du våre tjenestevilkår og personvernregler.';
			case 'registeration.form.tosToggle': return 'Vis tjenestevilkår og personvernregler';
			case 'registeration.form.tosAgree': return 'Jeg godtar tjenestevilkårene og personvernreglene';
			case 'registeration.errors.nameRequired': return 'Navn er påkrevd';
			case 'registeration.errors.emailRequired': return 'E-post er påkrevd';
			case 'registeration.errors.emailInvalid': return 'E-post er ugyldig';
			case 'registeration.errors.passwordRequired': return 'Passord er påkrevd';
			case 'registeration.errors.passwordMin': return ({required Object number}) => 'Passordet må være minst ${number} tegn';
			case 'registeration.errors.passwordMax': return ({required Object number}) => 'Passordet må ikke overstige ${number} tegn';
			case 'registeration.errors.passwordFormatSpecial': return ({required Object number}) => 'Passordet må inneholde minst ${number} spesialtegn';
			case 'registeration.errors.confirmPasswordRequired': return 'Bekreft passord er påkrevd';
			case 'registeration.errors.confirmPasswordMatch': return 'Passordene stemmer ikke overens';
			case 'login.form.title': return 'Logg inn på kontoen din';
			case 'login.form.email': return 'E-post';
			case 'login.form.password': return 'Passord';
			case 'login.form.login': return 'Logg inn';
			case 'login.form.forgotPassword': return 'Glemt passord?';
			case 'login.form.noAccount': return 'Har du ikke en konto? Registrer';
			case 'login.errors.emailRequired': return 'E-post er påkrevd';
			case 'login.errors.emailInvalid': return 'E-post er ugyldig';
			case 'login.errors.passwordRequired': return 'Passord er påkrevd';
			case 'permissions.read': return 'Les';
			case 'permissions.write': return 'Skriv';
			case 'permissions.execute': return 'Utfør';
			case 'permissions.delete': return 'Slett';
			case 'permissions.create': return 'Opprett';
			case 'permissions.update': return 'Oppdater';
			case 'permissions.manage': return 'Administrer';
			case 'permissions.view': return 'Se';
			case 'permissions.edit': return 'Rediger';
			case 'permissions.share': return 'Del';
			case 'permissions.download': return 'Last ned';
			case 'permissions.upload': return 'Last opp';
			default: return null;
		}
	}
}

