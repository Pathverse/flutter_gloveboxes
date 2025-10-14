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
class TranslationsZhHans extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhHans({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhHans,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-Hans>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsZhHans _root = this; // ignore: unused_field

	@override 
	TranslationsZhHans $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhHans(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsRegisterationZhHans registeration = TranslationsRegisterationZhHans._(_root);
	@override late final TranslationsLoginZhHans login = TranslationsLoginZhHans._(_root);
	@override late final TranslationsPermissionsZhHans permissions = TranslationsPermissionsZhHans._(_root);
}

// Path: registeration
class TranslationsRegisterationZhHans extends TranslationsRegisterationEn {
	TranslationsRegisterationZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterationFormZhHans form = TranslationsRegisterationFormZhHans._(_root);
	@override late final TranslationsRegisterationErrorsZhHans errors = TranslationsRegisterationErrorsZhHans._(_root);
}

// Path: login
class TranslationsLoginZhHans extends TranslationsLoginEn {
	TranslationsLoginZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginFormZhHans form = TranslationsLoginFormZhHans._(_root);
	@override late final TranslationsLoginErrorsZhHans errors = TranslationsLoginErrorsZhHans._(_root);
}

// Path: permissions
class TranslationsPermissionsZhHans extends TranslationsPermissionsEn {
	TranslationsPermissionsZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get read => '读取';
	@override String get write => '写入';
	@override String get execute => '执行';
	@override String get delete => '删除';
	@override String get create => '创建';
	@override String get update => '更新';
	@override String get manage => '管理';
	@override String get view => '查看';
	@override String get edit => '编辑';
	@override String get share => '分享';
	@override String get download => '下载';
	@override String get upload => '上传';
}

// Path: registeration.form
class TranslationsRegisterationFormZhHans extends TranslationsRegisterationFormEn {
	TranslationsRegisterationFormZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get title => '注册账户';
	@override String get name => '姓名';
	@override String get email => '邮箱';
	@override String get password => '密码';
	@override String get confirmPassword => '确认密码';
	@override String get register => '注册';
	@override String get alreadyHaveAccount => '已有账户？登录';
	@override String get tos => '注册即表示您同意我们的服务条款和隐私政策。';
	@override String get tosToggle => '显示服务条款和隐私政策';
	@override String get tosAgree => '我同意服务条款和隐私政策';
}

// Path: registeration.errors
class TranslationsRegisterationErrorsZhHans extends TranslationsRegisterationErrorsEn {
	TranslationsRegisterationErrorsZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get nameRequired => '姓名为必填项';
	@override String get emailRequired => '邮箱为必填项';
	@override String get emailInvalid => '邮箱格式无效';
	@override String get passwordRequired => '密码为必填项';
	@override String passwordMin({required Object number}) => '密码至少需要${number}个字符';
	@override String passwordMax({required Object number}) => '密码不得超过${number}个字符';
	@override String passwordFormatSpecial({required Object number}) => '密码必须包含至少${number}个特殊字符';
	@override String get confirmPasswordRequired => '确认密码为必填项';
	@override String get confirmPasswordMatch => '密码不匹配';
}

// Path: login.form
class TranslationsLoginFormZhHans extends TranslationsLoginFormEn {
	TranslationsLoginFormZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get title => '登录您的账户';
	@override String get email => '邮箱';
	@override String get password => '密码';
	@override String get login => '登录';
	@override String get forgotPassword => '忘记密码？';
	@override String get noAccount => '没有账户？注册';
}

// Path: login.errors
class TranslationsLoginErrorsZhHans extends TranslationsLoginErrorsEn {
	TranslationsLoginErrorsZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get emailRequired => '邮箱为必填项';
	@override String get emailInvalid => '邮箱格式无效';
	@override String get passwordRequired => '密码为必填项';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsZhHans {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'registeration.form.title': return '注册账户';
			case 'registeration.form.name': return '姓名';
			case 'registeration.form.email': return '邮箱';
			case 'registeration.form.password': return '密码';
			case 'registeration.form.confirmPassword': return '确认密码';
			case 'registeration.form.register': return '注册';
			case 'registeration.form.alreadyHaveAccount': return '已有账户？登录';
			case 'registeration.form.tos': return '注册即表示您同意我们的服务条款和隐私政策。';
			case 'registeration.form.tosToggle': return '显示服务条款和隐私政策';
			case 'registeration.form.tosAgree': return '我同意服务条款和隐私政策';
			case 'registeration.errors.nameRequired': return '姓名为必填项';
			case 'registeration.errors.emailRequired': return '邮箱为必填项';
			case 'registeration.errors.emailInvalid': return '邮箱格式无效';
			case 'registeration.errors.passwordRequired': return '密码为必填项';
			case 'registeration.errors.passwordMin': return ({required Object number}) => '密码至少需要${number}个字符';
			case 'registeration.errors.passwordMax': return ({required Object number}) => '密码不得超过${number}个字符';
			case 'registeration.errors.passwordFormatSpecial': return ({required Object number}) => '密码必须包含至少${number}个特殊字符';
			case 'registeration.errors.confirmPasswordRequired': return '确认密码为必填项';
			case 'registeration.errors.confirmPasswordMatch': return '密码不匹配';
			case 'login.form.title': return '登录您的账户';
			case 'login.form.email': return '邮箱';
			case 'login.form.password': return '密码';
			case 'login.form.login': return '登录';
			case 'login.form.forgotPassword': return '忘记密码？';
			case 'login.form.noAccount': return '没有账户？注册';
			case 'login.errors.emailRequired': return '邮箱为必填项';
			case 'login.errors.emailInvalid': return '邮箱格式无效';
			case 'login.errors.passwordRequired': return '密码为必填项';
			case 'permissions.read': return '读取';
			case 'permissions.write': return '写入';
			case 'permissions.execute': return '执行';
			case 'permissions.delete': return '删除';
			case 'permissions.create': return '创建';
			case 'permissions.update': return '更新';
			case 'permissions.manage': return '管理';
			case 'permissions.view': return '查看';
			case 'permissions.edit': return '编辑';
			case 'permissions.share': return '分享';
			case 'permissions.download': return '下载';
			case 'permissions.upload': return '上传';
			default: return null;
		}
	}
}

