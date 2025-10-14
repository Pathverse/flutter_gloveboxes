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
class TranslationsKo extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsKo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ko,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ko>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsKo _root = this; // ignore: unused_field

	@override 
	TranslationsKo $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsKo(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsRegisterationKo registeration = TranslationsRegisterationKo._(_root);
	@override late final TranslationsLoginKo login = TranslationsLoginKo._(_root);
	@override late final TranslationsPermissionsKo permissions = TranslationsPermissionsKo._(_root);
}

// Path: registeration
class TranslationsRegisterationKo extends TranslationsRegisterationEn {
	TranslationsRegisterationKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterationFormKo form = TranslationsRegisterationFormKo._(_root);
	@override late final TranslationsRegisterationErrorsKo errors = TranslationsRegisterationErrorsKo._(_root);
}

// Path: login
class TranslationsLoginKo extends TranslationsLoginEn {
	TranslationsLoginKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginFormKo form = TranslationsLoginFormKo._(_root);
	@override late final TranslationsLoginErrorsKo errors = TranslationsLoginErrorsKo._(_root);
}

// Path: permissions
class TranslationsPermissionsKo extends TranslationsPermissionsEn {
	TranslationsPermissionsKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get read => '읽기';
	@override String get write => '쓰기';
	@override String get execute => '실행';
	@override String get delete => '삭제';
	@override String get create => '생성';
	@override String get update => '업데이트';
	@override String get manage => '관리';
	@override String get view => '보기';
	@override String get edit => '편집';
	@override String get share => '공유';
	@override String get download => '다운로드';
	@override String get upload => '업로드';
}

// Path: registeration.form
class TranslationsRegisterationFormKo extends TranslationsRegisterationFormEn {
	TranslationsRegisterationFormKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '계정 등록';
	@override String get name => '이름';
	@override String get email => '이메일';
	@override String get password => '비밀번호';
	@override String get confirmPassword => '비밀번호 확인';
	@override String get register => '등록';
	@override String get alreadyHaveAccount => '이미 계정이 있으신가요? 로그인';
	@override String get tos => '등록하시면 서비스 약관 및 개인정보 보호정책에 동의하는 것입니다.';
	@override String get tosToggle => '서비스 약관 및 개인정보 보호정책 보기';
	@override String get tosAgree => '서비스 약관 및 개인정보 보호정책에 동의합니다';
}

// Path: registeration.errors
class TranslationsRegisterationErrorsKo extends TranslationsRegisterationErrorsEn {
	TranslationsRegisterationErrorsKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get nameRequired => '이름이 필요합니다';
	@override String get emailRequired => '이메일이 필요합니다';
	@override String get emailInvalid => '이메일이 유효하지 않습니다';
	@override String get passwordRequired => '비밀번호가 필요합니다';
	@override String passwordMin({required Object number}) => '비밀번호는 최소 ${number}자 이상이어야 합니다';
	@override String passwordMax({required Object number}) => '비밀번호는 ${number}자를 초과할 수 없습니다';
	@override String passwordFormatSpecial({required Object number}) => '비밀번호에는 최소 ${number}개의 특수 문자가 포함되어야 합니다';
	@override String get confirmPasswordRequired => '비밀번호 확인이 필요합니다';
	@override String get confirmPasswordMatch => '비밀번호가 일치하지 않습니다';
}

// Path: login.form
class TranslationsLoginFormKo extends TranslationsLoginFormEn {
	TranslationsLoginFormKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get title => '계정에 로그인';
	@override String get email => '이메일';
	@override String get password => '비밀번호';
	@override String get login => '로그인';
	@override String get forgotPassword => '비밀번호를 잊으셨나요?';
	@override String get noAccount => '계정이 없으신가요? 등록';
}

// Path: login.errors
class TranslationsLoginErrorsKo extends TranslationsLoginErrorsEn {
	TranslationsLoginErrorsKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get emailRequired => '이메일이 필요합니다';
	@override String get emailInvalid => '이메일이 유효하지 않습니다';
	@override String get passwordRequired => '비밀번호가 필요합니다';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsKo {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'registeration.form.title': return '계정 등록';
			case 'registeration.form.name': return '이름';
			case 'registeration.form.email': return '이메일';
			case 'registeration.form.password': return '비밀번호';
			case 'registeration.form.confirmPassword': return '비밀번호 확인';
			case 'registeration.form.register': return '등록';
			case 'registeration.form.alreadyHaveAccount': return '이미 계정이 있으신가요? 로그인';
			case 'registeration.form.tos': return '등록하시면 서비스 약관 및 개인정보 보호정책에 동의하는 것입니다.';
			case 'registeration.form.tosToggle': return '서비스 약관 및 개인정보 보호정책 보기';
			case 'registeration.form.tosAgree': return '서비스 약관 및 개인정보 보호정책에 동의합니다';
			case 'registeration.errors.nameRequired': return '이름이 필요합니다';
			case 'registeration.errors.emailRequired': return '이메일이 필요합니다';
			case 'registeration.errors.emailInvalid': return '이메일이 유효하지 않습니다';
			case 'registeration.errors.passwordRequired': return '비밀번호가 필요합니다';
			case 'registeration.errors.passwordMin': return ({required Object number}) => '비밀번호는 최소 ${number}자 이상이어야 합니다';
			case 'registeration.errors.passwordMax': return ({required Object number}) => '비밀번호는 ${number}자를 초과할 수 없습니다';
			case 'registeration.errors.passwordFormatSpecial': return ({required Object number}) => '비밀번호에는 최소 ${number}개의 특수 문자가 포함되어야 합니다';
			case 'registeration.errors.confirmPasswordRequired': return '비밀번호 확인이 필요합니다';
			case 'registeration.errors.confirmPasswordMatch': return '비밀번호가 일치하지 않습니다';
			case 'login.form.title': return '계정에 로그인';
			case 'login.form.email': return '이메일';
			case 'login.form.password': return '비밀번호';
			case 'login.form.login': return '로그인';
			case 'login.form.forgotPassword': return '비밀번호를 잊으셨나요?';
			case 'login.form.noAccount': return '계정이 없으신가요? 등록';
			case 'login.errors.emailRequired': return '이메일이 필요합니다';
			case 'login.errors.emailInvalid': return '이메일이 유효하지 않습니다';
			case 'login.errors.passwordRequired': return '비밀번호가 필요합니다';
			case 'permissions.read': return '읽기';
			case 'permissions.write': return '쓰기';
			case 'permissions.execute': return '실행';
			case 'permissions.delete': return '삭제';
			case 'permissions.create': return '생성';
			case 'permissions.update': return '업데이트';
			case 'permissions.manage': return '관리';
			case 'permissions.view': return '보기';
			case 'permissions.edit': return '편집';
			case 'permissions.share': return '공유';
			case 'permissions.download': return '다운로드';
			case 'permissions.upload': return '업로드';
			default: return null;
		}
	}
}

