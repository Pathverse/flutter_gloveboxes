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
class TranslationsZh extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsZh _root = this; // ignore: unused_field

	@override 
	TranslationsZh $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZh(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsRegisterationZh registeration = TranslationsRegisterationZh._(_root);
	@override late final TranslationsLoginZh login = TranslationsLoginZh._(_root);
	@override late final TranslationsPermissionsZh permissions = TranslationsPermissionsZh._(_root);
}

// Path: registeration
class TranslationsRegisterationZh extends TranslationsRegisterationEn {
	TranslationsRegisterationZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterationFormZh form = TranslationsRegisterationFormZh._(_root);
	@override late final TranslationsRegisterationErrorsZh errors = TranslationsRegisterationErrorsZh._(_root);
}

// Path: login
class TranslationsLoginZh extends TranslationsLoginEn {
	TranslationsLoginZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginFormZh form = TranslationsLoginFormZh._(_root);
	@override late final TranslationsLoginErrorsZh errors = TranslationsLoginErrorsZh._(_root);
}

// Path: permissions
class TranslationsPermissionsZh extends TranslationsPermissionsEn {
	TranslationsPermissionsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get read => '讀取';
	@override String get write => '寫入';
	@override String get execute => '執行';
	@override String get delete => '刪除';
	@override String get create => '建立';
	@override String get update => '更新';
	@override String get manage => '管理';
	@override String get view => '查看';
	@override String get edit => '編輯';
	@override String get share => '分享';
	@override String get download => '下載';
	@override String get upload => '上傳';
}

// Path: registeration.form
class TranslationsRegisterationFormZh extends TranslationsRegisterationFormEn {
	TranslationsRegisterationFormZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '註冊帳戶';
	@override String get name => '姓名';
	@override String get email => '電子郵件';
	@override String get password => '密碼';
	@override String get confirmPassword => '確認密碼';
	@override String get register => '註冊';
	@override String get alreadyHaveAccount => '已有帳戶？登入';
	@override String get tos => '註冊即表示您同意我們的服務條款和隱私政策。';
	@override String get tosToggle => '顯示服務條款和隱私政策';
	@override String get tosAgree => '我同意服務條款和隱私政策';
}

// Path: registeration.errors
class TranslationsRegisterationErrorsZh extends TranslationsRegisterationErrorsEn {
	TranslationsRegisterationErrorsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get nameRequired => '姓名為必填項目';
	@override String get emailRequired => '電子郵件為必填項目';
	@override String get emailInvalid => '電子郵件格式無效';
	@override String get passwordRequired => '密碼為必填項目';
	@override String passwordMin({required Object number}) => '密碼至少需要${number}個字元';
	@override String passwordMax({required Object number}) => '密碼不得超過${number}個字元';
	@override String passwordFormatSpecial({required Object number}) => '密碼必須包含至少${number}個特殊字元';
	@override String get confirmPasswordRequired => '確認密碼為必填項目';
	@override String get confirmPasswordMatch => '密碼不匹配';
}

// Path: login.form
class TranslationsLoginFormZh extends TranslationsLoginFormEn {
	TranslationsLoginFormZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '登入您的帳戶';
	@override String get email => '電子郵件';
	@override String get password => '密碼';
	@override String get login => '登入';
	@override String get forgotPassword => '忘記密碼？';
	@override String get noAccount => '沒有帳戶？註冊';
}

// Path: login.errors
class TranslationsLoginErrorsZh extends TranslationsLoginErrorsEn {
	TranslationsLoginErrorsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get emailRequired => '電子郵件為必填項目';
	@override String get emailInvalid => '電子郵件格式無效';
	@override String get passwordRequired => '密碼為必填項目';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsZh {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'registeration.form.title': return '註冊帳戶';
			case 'registeration.form.name': return '姓名';
			case 'registeration.form.email': return '電子郵件';
			case 'registeration.form.password': return '密碼';
			case 'registeration.form.confirmPassword': return '確認密碼';
			case 'registeration.form.register': return '註冊';
			case 'registeration.form.alreadyHaveAccount': return '已有帳戶？登入';
			case 'registeration.form.tos': return '註冊即表示您同意我們的服務條款和隱私政策。';
			case 'registeration.form.tosToggle': return '顯示服務條款和隱私政策';
			case 'registeration.form.tosAgree': return '我同意服務條款和隱私政策';
			case 'registeration.errors.nameRequired': return '姓名為必填項目';
			case 'registeration.errors.emailRequired': return '電子郵件為必填項目';
			case 'registeration.errors.emailInvalid': return '電子郵件格式無效';
			case 'registeration.errors.passwordRequired': return '密碼為必填項目';
			case 'registeration.errors.passwordMin': return ({required Object number}) => '密碼至少需要${number}個字元';
			case 'registeration.errors.passwordMax': return ({required Object number}) => '密碼不得超過${number}個字元';
			case 'registeration.errors.passwordFormatSpecial': return ({required Object number}) => '密碼必須包含至少${number}個特殊字元';
			case 'registeration.errors.confirmPasswordRequired': return '確認密碼為必填項目';
			case 'registeration.errors.confirmPasswordMatch': return '密碼不匹配';
			case 'login.form.title': return '登入您的帳戶';
			case 'login.form.email': return '電子郵件';
			case 'login.form.password': return '密碼';
			case 'login.form.login': return '登入';
			case 'login.form.forgotPassword': return '忘記密碼？';
			case 'login.form.noAccount': return '沒有帳戶？註冊';
			case 'login.errors.emailRequired': return '電子郵件為必填項目';
			case 'login.errors.emailInvalid': return '電子郵件格式無效';
			case 'login.errors.passwordRequired': return '密碼為必填項目';
			case 'permissions.read': return '讀取';
			case 'permissions.write': return '寫入';
			case 'permissions.execute': return '執行';
			case 'permissions.delete': return '刪除';
			case 'permissions.create': return '建立';
			case 'permissions.update': return '更新';
			case 'permissions.manage': return '管理';
			case 'permissions.view': return '查看';
			case 'permissions.edit': return '編輯';
			case 'permissions.share': return '分享';
			case 'permissions.download': return '下載';
			case 'permissions.upload': return '上傳';
			default: return null;
		}
	}
}

