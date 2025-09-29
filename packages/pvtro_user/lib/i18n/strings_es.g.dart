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
	@override late final TranslationsRegisterationEs registeration = TranslationsRegisterationEs._(_root);
	@override late final TranslationsLoginEs login = TranslationsLoginEs._(_root);
	@override late final TranslationsPermissionsEs permissions = TranslationsPermissionsEs._(_root);
}

// Path: registeration
class TranslationsRegisterationEs extends TranslationsRegisterationEn {
	TranslationsRegisterationEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterationFormEs form = TranslationsRegisterationFormEs._(_root);
	@override late final TranslationsRegisterationErrorsEs errors = TranslationsRegisterationErrorsEs._(_root);
}

// Path: login
class TranslationsLoginEs extends TranslationsLoginEn {
	TranslationsLoginEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginFormEs form = TranslationsLoginFormEs._(_root);
	@override late final TranslationsLoginErrorsEs errors = TranslationsLoginErrorsEs._(_root);
}

// Path: permissions
class TranslationsPermissionsEs extends TranslationsPermissionsEn {
	TranslationsPermissionsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get read => 'Leer';
	@override String get write => 'Escribir';
	@override String get execute => 'Ejecutar';
	@override String get delete => 'Eliminar';
	@override String get create => 'Crear';
	@override String get update => 'Actualizar';
	@override String get manage => 'Administrar';
	@override String get view => 'Ver';
	@override String get edit => 'Editar';
	@override String get share => 'Compartir';
	@override String get download => 'Descargar';
	@override String get upload => 'Subir';
}

// Path: registeration.form
class TranslationsRegisterationFormEs extends TranslationsRegisterationFormEn {
	TranslationsRegisterationFormEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Registrar cuenta';
	@override String get name => 'Nombre';
	@override String get email => 'Correo electrónico';
	@override String get password => 'Contraseña';
	@override String get confirmPassword => 'Confirmar contraseña';
	@override String get register => 'Registrarse';
	@override String get alreadyHaveAccount => '¿Ya tienes una cuenta? Iniciar sesión';
	@override String get tos => 'Al registrarte, aceptas nuestros Términos de Servicio y Política de Privacidad.';
	@override String get tosToggle => 'Mostrar Términos de Servicio y Política de Privacidad';
	@override String get tosAgree => 'Acepto los Términos de Servicio y la Política de Privacidad';
}

// Path: registeration.errors
class TranslationsRegisterationErrorsEs extends TranslationsRegisterationErrorsEn {
	TranslationsRegisterationErrorsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get nameRequired => 'El nombre es requerido';
	@override String get emailRequired => 'El correo electrónico es requerido';
	@override String get emailInvalid => 'El correo electrónico es inválido';
	@override String get passwordRequired => 'La contraseña es requerida';
	@override String passwordMin({required Object number}) => 'La contraseña debe tener al menos ${number} caracteres';
	@override String passwordMax({required Object number}) => 'La contraseña no debe exceder ${number} caracteres';
	@override String passwordFormatSpecial({required Object number}) => 'La contraseña debe contener al menos ${number} carácter especial';
	@override String get confirmPasswordRequired => 'Confirmar contraseña es requerido';
	@override String get confirmPasswordMatch => 'Las contraseñas no coinciden';
}

// Path: login.form
class TranslationsLoginFormEs extends TranslationsLoginFormEn {
	TranslationsLoginFormEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Iniciar sesión en tu cuenta';
	@override String get email => 'Correo electrónico';
	@override String get password => 'Contraseña';
	@override String get login => 'Iniciar sesión';
	@override String get forgotPassword => '¿Olvidaste tu contraseña?';
	@override String get noAccount => '¿No tienes una cuenta? Registrarse';
}

// Path: login.errors
class TranslationsLoginErrorsEs extends TranslationsLoginErrorsEn {
	TranslationsLoginErrorsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get emailRequired => 'El correo electrónico es requerido';
	@override String get emailInvalid => 'El correo electrónico es inválido';
	@override String get passwordRequired => 'La contraseña es requerida';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'registeration.form.title': return 'Registrar cuenta';
			case 'registeration.form.name': return 'Nombre';
			case 'registeration.form.email': return 'Correo electrónico';
			case 'registeration.form.password': return 'Contraseña';
			case 'registeration.form.confirmPassword': return 'Confirmar contraseña';
			case 'registeration.form.register': return 'Registrarse';
			case 'registeration.form.alreadyHaveAccount': return '¿Ya tienes una cuenta? Iniciar sesión';
			case 'registeration.form.tos': return 'Al registrarte, aceptas nuestros Términos de Servicio y Política de Privacidad.';
			case 'registeration.form.tosToggle': return 'Mostrar Términos de Servicio y Política de Privacidad';
			case 'registeration.form.tosAgree': return 'Acepto los Términos de Servicio y la Política de Privacidad';
			case 'registeration.errors.nameRequired': return 'El nombre es requerido';
			case 'registeration.errors.emailRequired': return 'El correo electrónico es requerido';
			case 'registeration.errors.emailInvalid': return 'El correo electrónico es inválido';
			case 'registeration.errors.passwordRequired': return 'La contraseña es requerida';
			case 'registeration.errors.passwordMin': return ({required Object number}) => 'La contraseña debe tener al menos ${number} caracteres';
			case 'registeration.errors.passwordMax': return ({required Object number}) => 'La contraseña no debe exceder ${number} caracteres';
			case 'registeration.errors.passwordFormatSpecial': return ({required Object number}) => 'La contraseña debe contener al menos ${number} carácter especial';
			case 'registeration.errors.confirmPasswordRequired': return 'Confirmar contraseña es requerido';
			case 'registeration.errors.confirmPasswordMatch': return 'Las contraseñas no coinciden';
			case 'login.form.title': return 'Iniciar sesión en tu cuenta';
			case 'login.form.email': return 'Correo electrónico';
			case 'login.form.password': return 'Contraseña';
			case 'login.form.login': return 'Iniciar sesión';
			case 'login.form.forgotPassword': return '¿Olvidaste tu contraseña?';
			case 'login.form.noAccount': return '¿No tienes una cuenta? Registrarse';
			case 'login.errors.emailRequired': return 'El correo electrónico es requerido';
			case 'login.errors.emailInvalid': return 'El correo electrónico es inválido';
			case 'login.errors.passwordRequired': return 'La contraseña es requerida';
			case 'permissions.read': return 'Leer';
			case 'permissions.write': return 'Escribir';
			case 'permissions.execute': return 'Ejecutar';
			case 'permissions.delete': return 'Eliminar';
			case 'permissions.create': return 'Crear';
			case 'permissions.update': return 'Actualizar';
			case 'permissions.manage': return 'Administrar';
			case 'permissions.view': return 'Ver';
			case 'permissions.edit': return 'Editar';
			case 'permissions.share': return 'Compartir';
			case 'permissions.download': return 'Descargar';
			case 'permissions.upload': return 'Subir';
			default: return null;
		}
	}
}

