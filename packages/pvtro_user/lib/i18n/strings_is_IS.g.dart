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
	@override late final TranslationsRegisterationIsIs registeration = TranslationsRegisterationIsIs._(_root);
	@override late final TranslationsLoginIsIs login = TranslationsLoginIsIs._(_root);
	@override late final TranslationsPermissionsIsIs permissions = TranslationsPermissionsIsIs._(_root);
}

// Path: registeration
class TranslationsRegisterationIsIs extends TranslationsRegisterationEn {
	TranslationsRegisterationIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterationFormIsIs form = TranslationsRegisterationFormIsIs._(_root);
	@override late final TranslationsRegisterationErrorsIsIs errors = TranslationsRegisterationErrorsIsIs._(_root);
}

// Path: login
class TranslationsLoginIsIs extends TranslationsLoginEn {
	TranslationsLoginIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginFormIsIs form = TranslationsLoginFormIsIs._(_root);
	@override late final TranslationsLoginErrorsIsIs errors = TranslationsLoginErrorsIsIs._(_root);
}

// Path: permissions
class TranslationsPermissionsIsIs extends TranslationsPermissionsEn {
	TranslationsPermissionsIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get read => 'Lesa';
	@override String get write => 'Skrifa';
	@override String get execute => 'Keyra';
	@override String get delete => 'Eyða';
	@override String get create => 'Búa til';
	@override String get update => 'Uppfæra';
	@override String get manage => 'Stjórna';
	@override String get view => 'Skoða';
	@override String get edit => 'Breyta';
	@override String get share => 'Deila';
	@override String get download => 'Sækja';
	@override String get upload => 'Hlaða upp';
}

// Path: registeration.form
class TranslationsRegisterationFormIsIs extends TranslationsRegisterationFormEn {
	TranslationsRegisterationFormIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Skrá reikning';
	@override String get name => 'Nafn';
	@override String get email => 'Netfang';
	@override String get password => 'Lykilorð';
	@override String get confirmPassword => 'Staðfesta lykilorð';
	@override String get register => 'Skrá';
	@override String get alreadyHaveAccount => 'Ertu þegar með reikning? Innskráning';
	@override String get tos => 'Með því að skrá þig samþykkir þú þjónustuskilmála okkar og persónuverndarstefnu.';
	@override String get tosToggle => 'Sýna þjónustuskilmála og persónuverndarstefnu';
	@override String get tosAgree => 'Ég samþykki þjónustuskilmálana og persónuverndarstefnuna';
}

// Path: registeration.errors
class TranslationsRegisterationErrorsIsIs extends TranslationsRegisterationErrorsEn {
	TranslationsRegisterationErrorsIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get nameRequired => 'Nafn er nauðsynlegt';
	@override String get emailRequired => 'Netfang er nauðsynlegt';
	@override String get emailInvalid => 'Netfang er ógilt';
	@override String get passwordRequired => 'Lykilorð er nauðsynlegt';
	@override String passwordMin({required Object number}) => 'Lykilorð verður að vera að minnsta kosti ${number} stafir';
	@override String passwordMax({required Object number}) => 'Lykilorð má ekki fara yfir ${number} stafi';
	@override String passwordFormatSpecial({required Object number}) => 'Lykilorð verður að innihalda að minnsta kosti ${number} sérstaf';
	@override String get confirmPasswordRequired => 'Staðfesting lykilorðs er nauðsynleg';
	@override String get confirmPasswordMatch => 'Lykilorð passa ekki saman';
}

// Path: login.form
class TranslationsLoginFormIsIs extends TranslationsLoginFormEn {
	TranslationsLoginFormIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Skrá inn á reikninginn þinn';
	@override String get email => 'Netfang';
	@override String get password => 'Lykilorð';
	@override String get login => 'Skrá inn';
	@override String get forgotPassword => 'Gleymt lykilorð?';
	@override String get noAccount => 'Átt þú ekki reikning? Skrá';
}

// Path: login.errors
class TranslationsLoginErrorsIsIs extends TranslationsLoginErrorsEn {
	TranslationsLoginErrorsIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get emailRequired => 'Netfang er nauðsynlegt';
	@override String get emailInvalid => 'Netfang er ógilt';
	@override String get passwordRequired => 'Lykilorð er nauðsynlegt';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsIsIs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'registeration.form.title': return 'Skrá reikning';
			case 'registeration.form.name': return 'Nafn';
			case 'registeration.form.email': return 'Netfang';
			case 'registeration.form.password': return 'Lykilorð';
			case 'registeration.form.confirmPassword': return 'Staðfesta lykilorð';
			case 'registeration.form.register': return 'Skrá';
			case 'registeration.form.alreadyHaveAccount': return 'Ertu þegar með reikning? Innskráning';
			case 'registeration.form.tos': return 'Með því að skrá þig samþykkir þú þjónustuskilmála okkar og persónuverndarstefnu.';
			case 'registeration.form.tosToggle': return 'Sýna þjónustuskilmála og persónuverndarstefnu';
			case 'registeration.form.tosAgree': return 'Ég samþykki þjónustuskilmálana og persónuverndarstefnuna';
			case 'registeration.errors.nameRequired': return 'Nafn er nauðsynlegt';
			case 'registeration.errors.emailRequired': return 'Netfang er nauðsynlegt';
			case 'registeration.errors.emailInvalid': return 'Netfang er ógilt';
			case 'registeration.errors.passwordRequired': return 'Lykilorð er nauðsynlegt';
			case 'registeration.errors.passwordMin': return ({required Object number}) => 'Lykilorð verður að vera að minnsta kosti ${number} stafir';
			case 'registeration.errors.passwordMax': return ({required Object number}) => 'Lykilorð má ekki fara yfir ${number} stafi';
			case 'registeration.errors.passwordFormatSpecial': return ({required Object number}) => 'Lykilorð verður að innihalda að minnsta kosti ${number} sérstaf';
			case 'registeration.errors.confirmPasswordRequired': return 'Staðfesting lykilorðs er nauðsynleg';
			case 'registeration.errors.confirmPasswordMatch': return 'Lykilorð passa ekki saman';
			case 'login.form.title': return 'Skrá inn á reikninginn þinn';
			case 'login.form.email': return 'Netfang';
			case 'login.form.password': return 'Lykilorð';
			case 'login.form.login': return 'Skrá inn';
			case 'login.form.forgotPassword': return 'Gleymt lykilorð?';
			case 'login.form.noAccount': return 'Átt þú ekki reikning? Skrá';
			case 'login.errors.emailRequired': return 'Netfang er nauðsynlegt';
			case 'login.errors.emailInvalid': return 'Netfang er ógilt';
			case 'login.errors.passwordRequired': return 'Lykilorð er nauðsynlegt';
			case 'permissions.read': return 'Lesa';
			case 'permissions.write': return 'Skrifa';
			case 'permissions.execute': return 'Keyra';
			case 'permissions.delete': return 'Eyða';
			case 'permissions.create': return 'Búa til';
			case 'permissions.update': return 'Uppfæra';
			case 'permissions.manage': return 'Stjórna';
			case 'permissions.view': return 'Skoða';
			case 'permissions.edit': return 'Breyta';
			case 'permissions.share': return 'Deila';
			case 'permissions.download': return 'Sækja';
			case 'permissions.upload': return 'Hlaða upp';
			default: return null;
		}
	}
}

