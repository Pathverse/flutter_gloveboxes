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
	@override late final TranslationsRegisterationFr registeration = TranslationsRegisterationFr._(_root);
	@override late final TranslationsLoginFr login = TranslationsLoginFr._(_root);
	@override late final TranslationsPermissionsFr permissions = TranslationsPermissionsFr._(_root);
}

// Path: registeration
class TranslationsRegisterationFr extends TranslationsRegisterationEn {
	TranslationsRegisterationFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterationFormFr form = TranslationsRegisterationFormFr._(_root);
	@override late final TranslationsRegisterationErrorsFr errors = TranslationsRegisterationErrorsFr._(_root);
}

// Path: login
class TranslationsLoginFr extends TranslationsLoginEn {
	TranslationsLoginFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginFormFr form = TranslationsLoginFormFr._(_root);
	@override late final TranslationsLoginErrorsFr errors = TranslationsLoginErrorsFr._(_root);
}

// Path: permissions
class TranslationsPermissionsFr extends TranslationsPermissionsEn {
	TranslationsPermissionsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get read => 'Lire';
	@override String get write => 'Écrire';
	@override String get execute => 'Exécuter';
	@override String get delete => 'Supprimer';
	@override String get create => 'Créer';
	@override String get update => 'Mettre à jour';
	@override String get manage => 'Gérer';
	@override String get view => 'Voir';
	@override String get edit => 'Modifier';
	@override String get share => 'Partager';
	@override String get download => 'Télécharger';
	@override String get upload => 'Téléverser';
}

// Path: registeration.form
class TranslationsRegisterationFormFr extends TranslationsRegisterationFormEn {
	TranslationsRegisterationFormFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Créer un compte';
	@override String get name => 'Nom';
	@override String get email => 'E-mail';
	@override String get password => 'Mot de passe';
	@override String get confirmPassword => 'Confirmer le mot de passe';
	@override String get register => 'S\'inscrire';
	@override String get alreadyHaveAccount => 'Vous avez déjà un compte ? Se connecter';
	@override String get tos => 'En vous inscrivant, vous acceptez nos Conditions d\'utilisation et notre Politique de confidentialité.';
	@override String get tosToggle => 'Afficher les Conditions d\'utilisation et la Politique de confidentialité';
	@override String get tosAgree => 'J\'accepte les Conditions d\'utilisation et la Politique de confidentialité';
}

// Path: registeration.errors
class TranslationsRegisterationErrorsFr extends TranslationsRegisterationErrorsEn {
	TranslationsRegisterationErrorsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get nameRequired => 'Le nom est requis';
	@override String get emailRequired => 'L\'e-mail est requis';
	@override String get emailInvalid => 'L\'e-mail est invalide';
	@override String get passwordRequired => 'Le mot de passe est requis';
	@override String passwordMin({required Object number}) => 'Le mot de passe doit contenir au moins ${number} caractères';
	@override String passwordMax({required Object number}) => 'Le mot de passe ne doit pas dépasser ${number} caractères';
	@override String passwordFormatSpecial({required Object number}) => 'Le mot de passe doit contenir au moins ${number} caractère spécial';
	@override String get confirmPasswordRequired => 'La confirmation du mot de passe est requise';
	@override String get confirmPasswordMatch => 'Les mots de passe ne correspondent pas';
}

// Path: login.form
class TranslationsLoginFormFr extends TranslationsLoginFormEn {
	TranslationsLoginFormFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Se connecter à votre compte';
	@override String get email => 'E-mail';
	@override String get password => 'Mot de passe';
	@override String get login => 'Se connecter';
	@override String get forgotPassword => 'Mot de passe oublié ?';
	@override String get noAccount => 'Vous n\'avez pas de compte ? S\'inscrire';
}

// Path: login.errors
class TranslationsLoginErrorsFr extends TranslationsLoginErrorsEn {
	TranslationsLoginErrorsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get emailRequired => 'L\'e-mail est requis';
	@override String get emailInvalid => 'L\'e-mail est invalide';
	@override String get passwordRequired => 'Le mot de passe est requis';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'registeration.form.title': return 'Créer un compte';
			case 'registeration.form.name': return 'Nom';
			case 'registeration.form.email': return 'E-mail';
			case 'registeration.form.password': return 'Mot de passe';
			case 'registeration.form.confirmPassword': return 'Confirmer le mot de passe';
			case 'registeration.form.register': return 'S\'inscrire';
			case 'registeration.form.alreadyHaveAccount': return 'Vous avez déjà un compte ? Se connecter';
			case 'registeration.form.tos': return 'En vous inscrivant, vous acceptez nos Conditions d\'utilisation et notre Politique de confidentialité.';
			case 'registeration.form.tosToggle': return 'Afficher les Conditions d\'utilisation et la Politique de confidentialité';
			case 'registeration.form.tosAgree': return 'J\'accepte les Conditions d\'utilisation et la Politique de confidentialité';
			case 'registeration.errors.nameRequired': return 'Le nom est requis';
			case 'registeration.errors.emailRequired': return 'L\'e-mail est requis';
			case 'registeration.errors.emailInvalid': return 'L\'e-mail est invalide';
			case 'registeration.errors.passwordRequired': return 'Le mot de passe est requis';
			case 'registeration.errors.passwordMin': return ({required Object number}) => 'Le mot de passe doit contenir au moins ${number} caractères';
			case 'registeration.errors.passwordMax': return ({required Object number}) => 'Le mot de passe ne doit pas dépasser ${number} caractères';
			case 'registeration.errors.passwordFormatSpecial': return ({required Object number}) => 'Le mot de passe doit contenir au moins ${number} caractère spécial';
			case 'registeration.errors.confirmPasswordRequired': return 'La confirmation du mot de passe est requise';
			case 'registeration.errors.confirmPasswordMatch': return 'Les mots de passe ne correspondent pas';
			case 'login.form.title': return 'Se connecter à votre compte';
			case 'login.form.email': return 'E-mail';
			case 'login.form.password': return 'Mot de passe';
			case 'login.form.login': return 'Se connecter';
			case 'login.form.forgotPassword': return 'Mot de passe oublié ?';
			case 'login.form.noAccount': return 'Vous n\'avez pas de compte ? S\'inscrire';
			case 'login.errors.emailRequired': return 'L\'e-mail est requis';
			case 'login.errors.emailInvalid': return 'L\'e-mail est invalide';
			case 'login.errors.passwordRequired': return 'Le mot de passe est requis';
			case 'permissions.read': return 'Lire';
			case 'permissions.write': return 'Écrire';
			case 'permissions.execute': return 'Exécuter';
			case 'permissions.delete': return 'Supprimer';
			case 'permissions.create': return 'Créer';
			case 'permissions.update': return 'Mettre à jour';
			case 'permissions.manage': return 'Gérer';
			case 'permissions.view': return 'Voir';
			case 'permissions.edit': return 'Modifier';
			case 'permissions.share': return 'Partager';
			case 'permissions.download': return 'Télécharger';
			case 'permissions.upload': return 'Téléverser';
			default: return null;
		}
	}
}

