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
class TranslationsHe extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsHe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.he,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <he>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsHe _root = this; // ignore: unused_field

	@override 
	TranslationsHe $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsHe(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsRegisterationHe registeration = TranslationsRegisterationHe._(_root);
	@override late final TranslationsLoginHe login = TranslationsLoginHe._(_root);
	@override late final TranslationsPermissionsHe permissions = TranslationsPermissionsHe._(_root);
}

// Path: registeration
class TranslationsRegisterationHe extends TranslationsRegisterationEn {
	TranslationsRegisterationHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterationFormHe form = TranslationsRegisterationFormHe._(_root);
	@override late final TranslationsRegisterationErrorsHe errors = TranslationsRegisterationErrorsHe._(_root);
}

// Path: login
class TranslationsLoginHe extends TranslationsLoginEn {
	TranslationsLoginHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginFormHe form = TranslationsLoginFormHe._(_root);
	@override late final TranslationsLoginErrorsHe errors = TranslationsLoginErrorsHe._(_root);
}

// Path: permissions
class TranslationsPermissionsHe extends TranslationsPermissionsEn {
	TranslationsPermissionsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get read => 'קריאה';
	@override String get write => 'כתיבה';
	@override String get execute => 'הרצה';
	@override String get delete => 'מחיקה';
	@override String get create => 'יצירה';
	@override String get update => 'עדכון';
	@override String get manage => 'ניהול';
	@override String get view => 'צפייה';
	@override String get edit => 'עריכה';
	@override String get share => 'שיתוף';
	@override String get download => 'הורדה';
	@override String get upload => 'העלאה';
}

// Path: registeration.form
class TranslationsRegisterationFormHe extends TranslationsRegisterationFormEn {
	TranslationsRegisterationFormHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'הרשמה לחשבון';
	@override String get name => 'שם';
	@override String get email => 'אימייל';
	@override String get password => 'סיסמה';
	@override String get confirmPassword => 'אישור סיסמה';
	@override String get register => 'הרשמה';
	@override String get alreadyHaveAccount => 'יש לך כבר חשבון? התחברות';
	@override String get tos => 'בהרשמה, אתה מסכים לתנאי השירות ולמדיניות הפרטיות שלנו.';
	@override String get tosToggle => 'הצג תנאי שירות ומדיניות פרטיות';
	@override String get tosAgree => 'אני מסכים לתנאי השירות ולמדיניות הפרטיות';
}

// Path: registeration.errors
class TranslationsRegisterationErrorsHe extends TranslationsRegisterationErrorsEn {
	TranslationsRegisterationErrorsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get nameRequired => 'שם נדרש';
	@override String get emailRequired => 'אימייל נדרש';
	@override String get emailInvalid => 'אימייל לא תקין';
	@override String get passwordRequired => 'סיסמה נדרשת';
	@override String passwordMin({required Object number}) => 'הסיסמה חייבת להכיל לפחות ${number} תווים';
	@override String passwordMax({required Object number}) => 'הסיסמה לא יכולה לחרוג מ-${number} תווים';
	@override String passwordFormatSpecial({required Object number}) => 'הסיסמה חייבת להכיל לפחות ${number} תו מיוחד';
	@override String get confirmPasswordRequired => 'אישור סיסמה נדרש';
	@override String get confirmPasswordMatch => 'הסיסמאות אינן תואמות';
}

// Path: login.form
class TranslationsLoginFormHe extends TranslationsLoginFormEn {
	TranslationsLoginFormHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get title => 'התחברות לחשבון שלך';
	@override String get email => 'אימייל';
	@override String get password => 'סיסמה';
	@override String get login => 'התחברות';
	@override String get forgotPassword => 'שכחת סיסמה?';
	@override String get noAccount => 'אין לך חשבון? הרשמה';
}

// Path: login.errors
class TranslationsLoginErrorsHe extends TranslationsLoginErrorsEn {
	TranslationsLoginErrorsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get emailRequired => 'אימייל נדרש';
	@override String get emailInvalid => 'אימייל לא תקין';
	@override String get passwordRequired => 'סיסמה נדרשת';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsHe {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'registeration.form.title': return 'הרשמה לחשבון';
			case 'registeration.form.name': return 'שם';
			case 'registeration.form.email': return 'אימייל';
			case 'registeration.form.password': return 'סיסמה';
			case 'registeration.form.confirmPassword': return 'אישור סיסמה';
			case 'registeration.form.register': return 'הרשמה';
			case 'registeration.form.alreadyHaveAccount': return 'יש לך כבר חשבון? התחברות';
			case 'registeration.form.tos': return 'בהרשמה, אתה מסכים לתנאי השירות ולמדיניות הפרטיות שלנו.';
			case 'registeration.form.tosToggle': return 'הצג תנאי שירות ומדיניות פרטיות';
			case 'registeration.form.tosAgree': return 'אני מסכים לתנאי השירות ולמדיניות הפרטיות';
			case 'registeration.errors.nameRequired': return 'שם נדרש';
			case 'registeration.errors.emailRequired': return 'אימייל נדרש';
			case 'registeration.errors.emailInvalid': return 'אימייל לא תקין';
			case 'registeration.errors.passwordRequired': return 'סיסמה נדרשת';
			case 'registeration.errors.passwordMin': return ({required Object number}) => 'הסיסמה חייבת להכיל לפחות ${number} תווים';
			case 'registeration.errors.passwordMax': return ({required Object number}) => 'הסיסמה לא יכולה לחרוג מ-${number} תווים';
			case 'registeration.errors.passwordFormatSpecial': return ({required Object number}) => 'הסיסמה חייבת להכיל לפחות ${number} תו מיוחד';
			case 'registeration.errors.confirmPasswordRequired': return 'אישור סיסמה נדרש';
			case 'registeration.errors.confirmPasswordMatch': return 'הסיסמאות אינן תואמות';
			case 'login.form.title': return 'התחברות לחשבון שלך';
			case 'login.form.email': return 'אימייל';
			case 'login.form.password': return 'סיסמה';
			case 'login.form.login': return 'התחברות';
			case 'login.form.forgotPassword': return 'שכחת סיסמה?';
			case 'login.form.noAccount': return 'אין לך חשבון? הרשמה';
			case 'login.errors.emailRequired': return 'אימייל נדרש';
			case 'login.errors.emailInvalid': return 'אימייל לא תקין';
			case 'login.errors.passwordRequired': return 'סיסמה נדרשת';
			case 'permissions.read': return 'קריאה';
			case 'permissions.write': return 'כתיבה';
			case 'permissions.execute': return 'הרצה';
			case 'permissions.delete': return 'מחיקה';
			case 'permissions.create': return 'יצירה';
			case 'permissions.update': return 'עדכון';
			case 'permissions.manage': return 'ניהול';
			case 'permissions.view': return 'צפייה';
			case 'permissions.edit': return 'עריכה';
			case 'permissions.share': return 'שיתוף';
			case 'permissions.download': return 'הורדה';
			case 'permissions.upload': return 'העלאה';
			default: return null;
		}
	}
}

