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
	/// final t = Translations.of(context);
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
	late final TranslationsRegisterationEn registeration = TranslationsRegisterationEn.internal(_root);
	late final TranslationsLoginEn login = TranslationsLoginEn.internal(_root);
	late final TranslationsPermissionsEn permissions = TranslationsPermissionsEn.internal(_root);
}

// Path: registeration
class TranslationsRegisterationEn {
	TranslationsRegisterationEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsRegisterationFormEn form = TranslationsRegisterationFormEn.internal(_root);
	late final TranslationsRegisterationErrorsEn errors = TranslationsRegisterationErrorsEn.internal(_root);
}

// Path: login
class TranslationsLoginEn {
	TranslationsLoginEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsLoginFormEn form = TranslationsLoginFormEn.internal(_root);
	late final TranslationsLoginErrorsEn errors = TranslationsLoginErrorsEn.internal(_root);
}

// Path: permissions
class TranslationsPermissionsEn {
	TranslationsPermissionsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Read'
	String get read => 'Read';

	/// en: 'Write'
	String get write => 'Write';

	/// en: 'Execute'
	String get execute => 'Execute';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Create'
	String get create => 'Create';

	/// en: 'Update'
	String get update => 'Update';

	/// en: 'Manage'
	String get manage => 'Manage';

	/// en: 'View'
	String get view => 'View';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Share'
	String get share => 'Share';

	/// en: 'Download'
	String get download => 'Download';

	/// en: 'Upload'
	String get upload => 'Upload';
}

// Path: registeration.form
class TranslationsRegisterationFormEn {
	TranslationsRegisterationFormEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Register Account'
	String get title => 'Register Account';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Confirm Password'
	String get confirmPassword => 'Confirm Password';

	/// en: 'Register'
	String get register => 'Register';

	/// en: 'Already have an account? Login'
	String get alreadyHaveAccount => 'Already have an account? Login';

	/// en: 'By registering, you agree to our Terms of Service and Privacy Policy.'
	String get tos => 'By registering, you agree to our Terms of Service and Privacy Policy.';

	/// en: 'Show Terms of Service and Privacy Policy'
	String get tosToggle => 'Show Terms of Service and Privacy Policy';

	/// en: 'I agree to the Terms of Service and Privacy Policy'
	String get tosAgree => 'I agree to the Terms of Service and Privacy Policy';
}

// Path: registeration.errors
class TranslationsRegisterationErrorsEn {
	TranslationsRegisterationErrorsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Name is required'
	String get nameRequired => 'Name is required';

	/// en: 'Email is required'
	String get emailRequired => 'Email is required';

	/// en: 'Email is invalid'
	String get emailInvalid => 'Email is invalid';

	/// en: 'Password is required'
	String get passwordRequired => 'Password is required';

	/// en: 'Password must be at least {{number}} characters'
	String passwordMin({required Object number}) => 'Password must be at least ${number} characters';

	/// en: 'Password must not exceed {{number}} characters'
	String passwordMax({required Object number}) => 'Password must not exceed ${number} characters';

	/// en: 'Password must contain at least {{number}} special character'
	String passwordFormatSpecial({required Object number}) => 'Password must contain at least ${number} special character';

	/// en: 'Confirm Password is required'
	String get confirmPasswordRequired => 'Confirm Password is required';

	/// en: 'Passwords do not match'
	String get confirmPasswordMatch => 'Passwords do not match';
}

// Path: login.form
class TranslationsLoginFormEn {
	TranslationsLoginFormEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Login to Your Account'
	String get title => 'Login to Your Account';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'Forgot Password?'
	String get forgotPassword => 'Forgot Password?';

	/// en: 'Don't have an account? Register'
	String get noAccount => 'Don\'t have an account? Register';
}

// Path: login.errors
class TranslationsLoginErrorsEn {
	TranslationsLoginErrorsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Email is required'
	String get emailRequired => 'Email is required';

	/// en: 'Email is invalid'
	String get emailInvalid => 'Email is invalid';

	/// en: 'Password is required'
	String get passwordRequired => 'Password is required';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'registeration.form.title': return 'Register Account';
			case 'registeration.form.name': return 'Name';
			case 'registeration.form.email': return 'Email';
			case 'registeration.form.password': return 'Password';
			case 'registeration.form.confirmPassword': return 'Confirm Password';
			case 'registeration.form.register': return 'Register';
			case 'registeration.form.alreadyHaveAccount': return 'Already have an account? Login';
			case 'registeration.form.tos': return 'By registering, you agree to our Terms of Service and Privacy Policy.';
			case 'registeration.form.tosToggle': return 'Show Terms of Service and Privacy Policy';
			case 'registeration.form.tosAgree': return 'I agree to the Terms of Service and Privacy Policy';
			case 'registeration.errors.nameRequired': return 'Name is required';
			case 'registeration.errors.emailRequired': return 'Email is required';
			case 'registeration.errors.emailInvalid': return 'Email is invalid';
			case 'registeration.errors.passwordRequired': return 'Password is required';
			case 'registeration.errors.passwordMin': return ({required Object number}) => 'Password must be at least ${number} characters';
			case 'registeration.errors.passwordMax': return ({required Object number}) => 'Password must not exceed ${number} characters';
			case 'registeration.errors.passwordFormatSpecial': return ({required Object number}) => 'Password must contain at least ${number} special character';
			case 'registeration.errors.confirmPasswordRequired': return 'Confirm Password is required';
			case 'registeration.errors.confirmPasswordMatch': return 'Passwords do not match';
			case 'login.form.title': return 'Login to Your Account';
			case 'login.form.email': return 'Email';
			case 'login.form.password': return 'Password';
			case 'login.form.login': return 'Login';
			case 'login.form.forgotPassword': return 'Forgot Password?';
			case 'login.form.noAccount': return 'Don\'t have an account? Register';
			case 'login.errors.emailRequired': return 'Email is required';
			case 'login.errors.emailInvalid': return 'Email is invalid';
			case 'login.errors.passwordRequired': return 'Password is required';
			case 'permissions.read': return 'Read';
			case 'permissions.write': return 'Write';
			case 'permissions.execute': return 'Execute';
			case 'permissions.delete': return 'Delete';
			case 'permissions.create': return 'Create';
			case 'permissions.update': return 'Update';
			case 'permissions.manage': return 'Manage';
			case 'permissions.view': return 'View';
			case 'permissions.edit': return 'Edit';
			case 'permissions.share': return 'Share';
			case 'permissions.download': return 'Download';
			case 'permissions.upload': return 'Upload';
			default: return null;
		}
	}
}

