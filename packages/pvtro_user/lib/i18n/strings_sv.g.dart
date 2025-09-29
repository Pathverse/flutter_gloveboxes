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
class TranslationsSv extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsSv({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.sv,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <sv>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsSv _root = this; // ignore: unused_field

	@override 
	TranslationsSv $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsSv(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsRegisterationSv registeration = TranslationsRegisterationSv._(_root);
	@override late final TranslationsLoginSv login = TranslationsLoginSv._(_root);
	@override late final TranslationsPermissionsSv permissions = TranslationsPermissionsSv._(_root);
}

// Path: registeration
class TranslationsRegisterationSv extends TranslationsRegisterationEn {
	TranslationsRegisterationSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterationFormSv form = TranslationsRegisterationFormSv._(_root);
	@override late final TranslationsRegisterationErrorsSv errors = TranslationsRegisterationErrorsSv._(_root);
}

// Path: login
class TranslationsLoginSv extends TranslationsLoginEn {
	TranslationsLoginSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginFormSv form = TranslationsLoginFormSv._(_root);
	@override late final TranslationsLoginErrorsSv errors = TranslationsLoginErrorsSv._(_root);
}

// Path: permissions
class TranslationsPermissionsSv extends TranslationsPermissionsEn {
	TranslationsPermissionsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get read => 'Läsa';
	@override String get write => 'Skriva';
	@override String get execute => 'Utföra';
	@override String get delete => 'Radera';
	@override String get create => 'Skapa';
	@override String get update => 'Uppdatera';
	@override String get manage => 'Hantera';
	@override String get view => 'Visa';
	@override String get edit => 'Redigera';
	@override String get share => 'Dela';
	@override String get download => 'Ladda ned';
	@override String get upload => 'Ladda upp';
}

// Path: registeration.form
class TranslationsRegisterationFormSv extends TranslationsRegisterationFormEn {
	TranslationsRegisterationFormSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Registrera konto';
	@override String get name => 'Namn';
	@override String get email => 'E-post';
	@override String get password => 'Lösenord';
	@override String get confirmPassword => 'Bekräfta lösenord';
	@override String get register => 'Registrera';
	@override String get alreadyHaveAccount => 'Har du redan ett konto? Logga in';
	@override String get tos => 'Genom att registrera dig godkänner du våra användarvillkor och integritetspolicy.';
	@override String get tosToggle => 'Visa användarvillkor och integritetspolicy';
	@override String get tosAgree => 'Jag godkänner användarvillkoren och integritetspolicyn';
}

// Path: registeration.errors
class TranslationsRegisterationErrorsSv extends TranslationsRegisterationErrorsEn {
	TranslationsRegisterationErrorsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get nameRequired => 'Namn krävs';
	@override String get emailRequired => 'E-post krävs';
	@override String get emailInvalid => 'E-post är ogiltig';
	@override String get passwordRequired => 'Lösenord krävs';
	@override String passwordMin({required Object number}) => 'Lösenordet måste vara minst ${number} tecken';
	@override String passwordMax({required Object number}) => 'Lösenordet får inte överstiga ${number} tecken';
	@override String passwordFormatSpecial({required Object number}) => 'Lösenordet måste innehålla minst ${number} specialtecken';
	@override String get confirmPasswordRequired => 'Bekräfta lösenord krävs';
	@override String get confirmPasswordMatch => 'Lösenorden stämmer inte överens';
}

// Path: login.form
class TranslationsLoginFormSv extends TranslationsLoginFormEn {
	TranslationsLoginFormSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get title => 'Logga in på ditt konto';
	@override String get email => 'E-post';
	@override String get password => 'Lösenord';
	@override String get login => 'Logga in';
	@override String get forgotPassword => 'Glömt lösenord?';
	@override String get noAccount => 'Har du inget konto? Registrera';
}

// Path: login.errors
class TranslationsLoginErrorsSv extends TranslationsLoginErrorsEn {
	TranslationsLoginErrorsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get emailRequired => 'E-post krävs';
	@override String get emailInvalid => 'E-post är ogiltig';
	@override String get passwordRequired => 'Lösenord krävs';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsSv {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'registeration.form.title': return 'Registrera konto';
			case 'registeration.form.name': return 'Namn';
			case 'registeration.form.email': return 'E-post';
			case 'registeration.form.password': return 'Lösenord';
			case 'registeration.form.confirmPassword': return 'Bekräfta lösenord';
			case 'registeration.form.register': return 'Registrera';
			case 'registeration.form.alreadyHaveAccount': return 'Har du redan ett konto? Logga in';
			case 'registeration.form.tos': return 'Genom att registrera dig godkänner du våra användarvillkor och integritetspolicy.';
			case 'registeration.form.tosToggle': return 'Visa användarvillkor och integritetspolicy';
			case 'registeration.form.tosAgree': return 'Jag godkänner användarvillkoren och integritetspolicyn';
			case 'registeration.errors.nameRequired': return 'Namn krävs';
			case 'registeration.errors.emailRequired': return 'E-post krävs';
			case 'registeration.errors.emailInvalid': return 'E-post är ogiltig';
			case 'registeration.errors.passwordRequired': return 'Lösenord krävs';
			case 'registeration.errors.passwordMin': return ({required Object number}) => 'Lösenordet måste vara minst ${number} tecken';
			case 'registeration.errors.passwordMax': return ({required Object number}) => 'Lösenordet får inte överstiga ${number} tecken';
			case 'registeration.errors.passwordFormatSpecial': return ({required Object number}) => 'Lösenordet måste innehålla minst ${number} specialtecken';
			case 'registeration.errors.confirmPasswordRequired': return 'Bekräfta lösenord krävs';
			case 'registeration.errors.confirmPasswordMatch': return 'Lösenorden stämmer inte överens';
			case 'login.form.title': return 'Logga in på ditt konto';
			case 'login.form.email': return 'E-post';
			case 'login.form.password': return 'Lösenord';
			case 'login.form.login': return 'Logga in';
			case 'login.form.forgotPassword': return 'Glömt lösenord?';
			case 'login.form.noAccount': return 'Har du inget konto? Registrera';
			case 'login.errors.emailRequired': return 'E-post krävs';
			case 'login.errors.emailInvalid': return 'E-post är ogiltig';
			case 'login.errors.passwordRequired': return 'Lösenord krävs';
			case 'permissions.read': return 'Läsa';
			case 'permissions.write': return 'Skriva';
			case 'permissions.execute': return 'Utföra';
			case 'permissions.delete': return 'Radera';
			case 'permissions.create': return 'Skapa';
			case 'permissions.update': return 'Uppdatera';
			case 'permissions.manage': return 'Hantera';
			case 'permissions.view': return 'Visa';
			case 'permissions.edit': return 'Redigera';
			case 'permissions.share': return 'Dela';
			case 'permissions.download': return 'Ladda ned';
			case 'permissions.upload': return 'Ladda upp';
			default: return null;
		}
	}
}

