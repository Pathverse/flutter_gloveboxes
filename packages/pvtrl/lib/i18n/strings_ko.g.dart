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
	@override late final TranslationsCommonKo common = TranslationsCommonKo._(_root);
	@override late final TranslationsLoginKo login = TranslationsLoginKo._(_root);
	@override late final TranslationsRegisterKo register = TranslationsRegisterKo._(_root);
	@override late final TranslationsPasswordResetKo passwordReset = TranslationsPasswordResetKo._(_root);
}

// Path: common
class TranslationsCommonKo extends TranslationsCommonEn {
	TranslationsCommonKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMessageKo message = TranslationsCommonMessageKo._(_root);
	@override late final TranslationsCommonGameKo game = TranslationsCommonGameKo._(_root);
	@override late final TranslationsCommonSocialKo social = TranslationsCommonSocialKo._(_root);
	@override late final TranslationsCommonViewsKo views = TranslationsCommonViewsKo._(_root);
	@override late final TranslationsCommonUnitsKo units = TranslationsCommonUnitsKo._(_root);
	@override late final TranslationsCommonNumbersKo numbers = TranslationsCommonNumbersKo._(_root);
	@override late final TranslationsCommonRanksKo ranks = TranslationsCommonRanksKo._(_root);
	@override late final TranslationsCommonControlKo control = TranslationsCommonControlKo._(_root);
	@override late final TranslationsCommonResponseKo response = TranslationsCommonResponseKo._(_root);
	@override late final TranslationsCommonPriorityKo priority = TranslationsCommonPriorityKo._(_root);
	@override late final TranslationsCommonDateKo date = TranslationsCommonDateKo._(_root);
	@override late final TranslationsCommonWeekdaysKo weekdays = TranslationsCommonWeekdaysKo._(_root);
	@override late final TranslationsCommonFormRestrictionsKo formRestrictions = TranslationsCommonFormRestrictionsKo._(_root);
	@override late final TranslationsCommonTosKo tos = TranslationsCommonTosKo._(_root);
	@override late final TranslationsCommonPermissionsKo permissions = TranslationsCommonPermissionsKo._(_root);
	@override late final TranslationsCommonPromptsKo prompts = TranslationsCommonPromptsKo._(_root);
}

// Path: login
class TranslationsLoginKo extends TranslationsLoginEn {
	TranslationsLoginKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginMessageKo message = TranslationsLoginMessageKo._(_root);
	@override late final TranslationsLoginFormKo form = TranslationsLoginFormKo._(_root);
	@override late final TranslationsLoginTooltipKo tooltip = TranslationsLoginTooltipKo._(_root);
	@override late final TranslationsLoginValidationKo validation = TranslationsLoginValidationKo._(_root);
}

// Path: register
class TranslationsRegisterKo extends TranslationsRegisterEn {
	TranslationsRegisterKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterMessageKo message = TranslationsRegisterMessageKo._(_root);
	@override late final TranslationsRegisterFormKo form = TranslationsRegisterFormKo._(_root);
	@override late final TranslationsRegisterTooltipKo tooltip = TranslationsRegisterTooltipKo._(_root);
	@override late final TranslationsRegisterValidationKo validation = TranslationsRegisterValidationKo._(_root);
}

// Path: passwordReset
class TranslationsPasswordResetKo extends TranslationsPasswordResetEn {
	TranslationsPasswordResetKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetMessageKo message = TranslationsPasswordResetMessageKo._(_root);
	@override late final TranslationsPasswordResetFormKo form = TranslationsPasswordResetFormKo._(_root);
	@override late final TranslationsPasswordResetTooltipKo tooltip = TranslationsPasswordResetTooltipKo._(_root);
	@override late final TranslationsPasswordResetValidationKo validation = TranslationsPasswordResetValidationKo._(_root);
}

// Path: common.message
class TranslationsCommonMessageKo extends TranslationsCommonMessageEn {
	TranslationsCommonMessageKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get loading => '로딩 중';
	@override String get somethingWentWrong => '문제가 발생했습니다';
	@override String get networkProblem => '네트워크 문제가 있습니다';
	@override String get noDataFound => '데이터를 찾을 수 없습니다';
	@override String get noResultsFound => '결과를 찾을 수 없습니다';
	@override String get unsupportedFileType => '지원되지 않는 파일 형식';
	@override String get fileTooLarge => '파일이 너무 큽니다';
	@override String get operationTimedOut => '작업 시간이 초과되었습니다';
	@override String get sessionExpired => '세션이 만료되었습니다';
	@override String get unsavableChanges => '변경사항을 저장할 수 없습니다';
	@override String get noServerConnect => '서버에 연결할 수 없습니다';
	@override String get accessDenied => '액세스가 거부되었습니다';
}

// Path: common.game
class TranslationsCommonGameKo extends TranslationsCommonGameEn {
	TranslationsCommonGameKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get start => '게임 시작';
	@override String get pause => '게임 일시정지';
	@override String get resume => '게임 재개';
	@override String get end => '게임 종료';
	@override String get levelUp => '레벨 업';
	@override String get gameOver => '게임 오버';
	@override String get nextLevel => '다음 레벨';
	@override String get previousLevel => '이전 레벨';
	@override String get restart => '게임 재시작';
}

// Path: common.social
class TranslationsCommonSocialKo extends TranslationsCommonSocialEn {
	TranslationsCommonSocialKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get like => '좋아요';
	@override String get share => '공유';
	@override String get comment => '댓글';
	@override String get follow => '팔로우';
	@override String get unfollow => '언팔로우';
	@override String get unlike => '좋아요 취소';
	@override String get reply => '답글';
	@override String get dislike => '싫어요';
	@override String get block => '차단';
	@override String get blockUser => '사용자 차단';
	@override String get report => '신고';
	@override String get mute => '음소거';
	@override String get uSentFriendRequest => '친구 요청을 보냈습니다';
	@override String get uReceivedFriendRequest => '친구 요청을 받았습니다';
	@override String get sentFriendRequest => '친구 요청을 보냈습니다';
	@override String get receivedFriendRequest => '친구 요청을 받았습니다';
	@override String get acceptedFriendRequest => '친구 요청을 수락했습니다';
	@override String get uAcceptedFriendRequest => '친구 요청을 수락했습니다';
}

// Path: common.views
class TranslationsCommonViewsKo extends TranslationsCommonViewsEn {
	TranslationsCommonViewsKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get list => '목록';
	@override String get grid => '격자';
	@override String get table => '표';
	@override String get form => '양식';
}

// Path: common.units
class TranslationsCommonUnitsKo extends TranslationsCommonUnitsEn {
	TranslationsCommonUnitsKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonUnitsLengthKo length = TranslationsCommonUnitsLengthKo._(_root);
	@override late final TranslationsCommonUnitsWeightKo weight = TranslationsCommonUnitsWeightKo._(_root);
	@override late final TranslationsCommonUnitsVolumeKo volume = TranslationsCommonUnitsVolumeKo._(_root);
	@override late final TranslationsCommonUnitsTimeKo time = TranslationsCommonUnitsTimeKo._(_root);
	@override late final TranslationsCommonUnitsAreaKo area = TranslationsCommonUnitsAreaKo._(_root);
}

// Path: common.numbers
class TranslationsCommonNumbersKo extends TranslationsCommonNumbersEn {
	TranslationsCommonNumbersKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get k1 => '하나';
	@override String get k2 => '둘';
	@override String get k3 => '셋';
	@override String get k4 => '넷';
	@override String get k5 => '다섯';
	@override String get k6 => '여섯';
	@override String get k7 => '일곱';
	@override String get k8 => '여덟';
	@override String get k9 => '아홉';
	@override String get k10 => '열';
}

// Path: common.ranks
class TranslationsCommonRanksKo extends TranslationsCommonRanksEn {
	TranslationsCommonRanksKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get k1 => '첫 번째';
	@override String get k2 => '두 번째';
	@override String get k3 => '세 번째';
	@override String get k4 => '네 번째';
	@override String get k5 => '다섯 번째';
	@override String get k6 => '여섯 번째';
	@override String get k7 => '일곱 번째';
	@override String get k8 => '여덟 번째';
	@override String get k9 => '아홉 번째';
	@override String get k10 => '열 번째';
}

// Path: common.control
class TranslationsCommonControlKo extends TranslationsCommonControlEn {
	TranslationsCommonControlKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get on => '켜기';
	@override String get off => '끄기';
	@override String get yes => '예';
	@override String get no => '아니오';
	@override String get confirm => '확인';
	@override String get cancel => '취소';
	@override String get retry => '다시 시도';
	@override String get logout => '로그아웃';
	@override String get edit => '편집';
	@override String get delete => '삭제';
	@override String get revert => '되돌리기';
	@override String get save => '저장';
}

// Path: common.response
class TranslationsCommonResponseKo extends TranslationsCommonResponseEn {
	TranslationsCommonResponseKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get success => '성공';
	@override String get error => '오류';
	@override String get info => '정보';
	@override String get warning => '경고';
	@override String get tbd => '미정';
	@override String get wip => '진행 중';
}

// Path: common.priority
class TranslationsCommonPriorityKo extends TranslationsCommonPriorityEn {
	TranslationsCommonPriorityKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get high => '높음';
	@override String get medium => '보통';
	@override String get low => '낮음';
}

// Path: common.date
class TranslationsCommonDateKo extends TranslationsCommonDateEn {
	TranslationsCommonDateKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get today => '오늘';
	@override String get yesterday => '어제';
	@override String get tomorrow => '내일';
	@override String get justNow => '방금';
	@override String get aMomentAgo => '잠깐 전';
	@override String get minutesAgo => '몇 분 전';
	@override String get hoursAgo => '몇 시간 전';
	@override String daysAgo({required Object days}) => '${days}일 전';
	@override String get weeksAgo => '몇 주 전';
	@override String get thisWeek => '이번 주';
	@override String get lastWeek => '지난 주';
	@override String get thisMonth => '이번 달';
	@override String get lastMonth => '지난 달';
	@override String get thisYear => '올해';
	@override String get lastYear => '작년';
	@override String daysAhead({required Object days}) => '${days}일 후';
}

// Path: common.weekdays
class TranslationsCommonWeekdaysKo extends TranslationsCommonWeekdaysEn {
	TranslationsCommonWeekdaysKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonWeekdaysFullKo full = TranslationsCommonWeekdaysFullKo._(_root);
	@override late final TranslationsCommonWeekdaysShortKo short = TranslationsCommonWeekdaysShortKo._(_root);
}

// Path: common.formRestrictions
class TranslationsCommonFormRestrictionsKo extends TranslationsCommonFormRestrictionsEn {
	TranslationsCommonFormRestrictionsKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get required => '이 필드는 필수입니다.';
	@override String minLength({required Object min}) => '최소 길이는 ${min}자입니다.';
	@override String maxLength({required Object max}) => '최대 길이는 ${max}자입니다.';
	@override String get invalidFormat => '형식이 올바르지 않습니다.';
	@override String pattern({required Object pattern}) => '이 필드는 패턴 ${pattern}을 따라야 합니다.';
}

// Path: common.tos
class TranslationsCommonTosKo extends TranslationsCommonTosEn {
	TranslationsCommonTosKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get accept => '약관에 동의합니다';
	@override String get readAccept => '약관을 읽고 동의해 주세요';
	@override String get title => '약관';
	@override String get service => '서비스 약관';
	@override String get privacy => '개인정보처리방침';
	@override String get continueAgree => '계속하면 약관에 동의하는 것입니다';
	@override String get mustAccept => '계속하려면 약관에 동의해야 합니다';
	@override String get view => '약관 보기';
	@override String lastUpdated({required Object date}) => '마지막 업데이트: ${date}';
	@override String get contactInfo => '약관에 대한 자세한 정보는 문의해 주세요';
}

// Path: common.permissions
class TranslationsCommonPermissionsKo extends TranslationsCommonPermissionsEn {
	TranslationsCommonPermissionsKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get allowLocation => '위치 접근을 허용하시겠습니까?';
	@override String get allowCamera => '카메라 접근을 허용하시겠습니까?';
	@override String get allowMicrophone => '마이크 접근을 허용하시겠습니까?';
	@override String get allowNotifications => '알림을 허용하시겠습니까?';
	@override String get allowContacts => '연락처 접근을 허용하시겠습니까?';
	@override String get allowPhotos => '사진 접근을 허용하시겠습니까?';
	@override String get allowStorage => '저장소 접근을 허용하시겠습니까?';
	@override String get allowBluetooth => '블루투스 접근을 허용하시겠습니까?';
	@override String get needPermission => '계속하려면 권한이 필요합니다';
	@override String get permissionDenied => '권한이 거부되었습니다';
	@override String get permissionRequired => '이 권한은 필수입니다';
	@override String get enableInSettings => '설정에서 활성화해 주세요';
}

// Path: common.prompts
class TranslationsCommonPromptsKo extends TranslationsCommonPromptsEn {
	TranslationsCommonPromptsKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get sessionExpired => '세션이 만료되었습니다';
	@override String get areYouSure => '정말 확실합니까?';
	@override String get cannotBeUndone => '이 작업은 취소할 수 없습니다';
	@override String get unsavedChanges => '저장되지 않은 변경사항이 있습니다';
	@override String get discardChanges => '변경사항을 버리시겠습니까?';
	@override String get locationDisabled => '위치 서비스가 비활성화되어 있습니다';
	@override String get networkRequired => '네트워크 연결이 필요합니다';
	@override String get loginRequired => '계속하려면 로그인이 필요합니다';
	@override String get confirmDelete => '정말 삭제하시겠습니까?';
	@override String get confirmLogout => '정말 로그아웃하시겠습니까?';
	@override String get saveBeforeExit => '종료하기 전에 저장하시겠습니까?';
	@override String get reloadPage => '페이지를 새로고침하시겠습니까?';
	@override String get updateAvailable => '업데이트가 있습니다';
	@override String get restartRequired => '변경사항을 적용하려면 재시작이 필요합니다';
}

// Path: login.message
class TranslationsLoginMessageKo extends TranslationsLoginMessageEn {
	TranslationsLoginMessageKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get success => '로그인 성공.';
	@override String get error => '로그인 실패. 다시 시도해 주세요.';
	@override String get wrongPassword => '자격 증명을 확인해 주세요.';
}

// Path: login.form
class TranslationsLoginFormKo extends TranslationsLoginFormEn {
	TranslationsLoginFormKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get username => '사용자명';
	@override String get password => '비밀번호';
	@override String get submit => '로그인';
	@override String get createAccount => '새 계정 만들기';
	@override String get forgotPassword => '비밀번호 찾기';
}

// Path: login.tooltip
class TranslationsLoginTooltipKo extends TranslationsLoginTooltipEn {
	TranslationsLoginTooltipKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get username => '사용자명을 입력하세요';
	@override String get password => '비밀번호를 입력하세요';
	@override String get submit => '로그인하려면 클릭하세요';
}

// Path: login.validation
class TranslationsLoginValidationKo extends TranslationsLoginValidationEn {
	TranslationsLoginValidationKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginValidationUsernameKo username = TranslationsLoginValidationUsernameKo._(_root);
	@override late final TranslationsLoginValidationPasswordKo password = TranslationsLoginValidationPasswordKo._(_root);
}

// Path: register.message
class TranslationsRegisterMessageKo extends TranslationsRegisterMessageEn {
	TranslationsRegisterMessageKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get success => '회원가입 성공.';
	@override String get error => '회원가입 실패. 다시 시도해 주세요.';
}

// Path: register.form
class TranslationsRegisterFormKo extends TranslationsRegisterFormEn {
	TranslationsRegisterFormKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get username => '사용자명';
	@override String get email => '이메일';
	@override String get password => '비밀번호';
	@override String get submit => '회원가입';
	@override String get acceptTos => '서비스 약관에 동의합니다';
}

// Path: register.tooltip
class TranslationsRegisterTooltipKo extends TranslationsRegisterTooltipEn {
	TranslationsRegisterTooltipKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get username => '사용자명을 입력하세요';
	@override String get email => '이메일을 입력하세요';
	@override String get password => '비밀번호를 입력하세요';
	@override String get submit => '회원가입하려면 클릭하세요';
}

// Path: register.validation
class TranslationsRegisterValidationKo extends TranslationsRegisterValidationEn {
	TranslationsRegisterValidationKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterValidationUsernameKo username = TranslationsRegisterValidationUsernameKo._(_root);
	@override late final TranslationsRegisterValidationEmailKo email = TranslationsRegisterValidationEmailKo._(_root);
	@override late final TranslationsRegisterValidationPasswordKo password = TranslationsRegisterValidationPasswordKo._(_root);
}

// Path: passwordReset.message
class TranslationsPasswordResetMessageKo extends TranslationsPasswordResetMessageEn {
	TranslationsPasswordResetMessageKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get success => '비밀번호 재설정 이메일이 전송되었습니다.';
	@override String get error => '비밀번호 재설정 실패. 다시 시도해 주세요.';
}

// Path: passwordReset.form
class TranslationsPasswordResetFormKo extends TranslationsPasswordResetFormEn {
	TranslationsPasswordResetFormKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get email => '이메일';
	@override String get submit => '비밀번호 재설정';
}

// Path: passwordReset.tooltip
class TranslationsPasswordResetTooltipKo extends TranslationsPasswordResetTooltipEn {
	TranslationsPasswordResetTooltipKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get email => '이메일을 입력하세요';
	@override String get submit => '비밀번호를 재설정하려면 클릭하세요';
}

// Path: passwordReset.validation
class TranslationsPasswordResetValidationKo extends TranslationsPasswordResetValidationEn {
	TranslationsPasswordResetValidationKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetValidationEmailKo email = TranslationsPasswordResetValidationEmailKo._(_root);
}

// Path: common.units.length
class TranslationsCommonUnitsLengthKo extends TranslationsCommonUnitsLengthEn {
	TranslationsCommonUnitsLengthKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get kilometer => '킬로미터';
	@override String get meter => '미터';
	@override String get centimeter => '센티미터';
	@override String get millimeter => '밀리미터';
	@override String get micrometer => '마이크로미터';
	@override String get nanometer => '나노미터';
}

// Path: common.units.weight
class TranslationsCommonUnitsWeightKo extends TranslationsCommonUnitsWeightEn {
	TranslationsCommonUnitsWeightKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get kilogram => '킬로그램';
	@override String get gram => '그램';
	@override String get milligram => '밀리그램';
	@override String get ton => '톤';
}

// Path: common.units.volume
class TranslationsCommonUnitsVolumeKo extends TranslationsCommonUnitsVolumeEn {
	TranslationsCommonUnitsVolumeKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get liter => '리터';
	@override String get milliliter => '밀리리터';
	@override String get cubicMeter => '세제곱미터';
}

// Path: common.units.time
class TranslationsCommonUnitsTimeKo extends TranslationsCommonUnitsTimeEn {
	TranslationsCommonUnitsTimeKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get second => '초';
	@override String get minute => '분';
	@override String get hour => '시간';
	@override String get day => '일';
	@override String get week => '주';
	@override String get month => '월';
	@override String get year => '년';
}

// Path: common.units.area
class TranslationsCommonUnitsAreaKo extends TranslationsCommonUnitsAreaEn {
	TranslationsCommonUnitsAreaKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get squareMeter => '제곱미터';
	@override String get hectare => '헥타르';
	@override String get acre => '에이커';
}

// Path: common.weekdays.full
class TranslationsCommonWeekdaysFullKo extends TranslationsCommonWeekdaysFullEn {
	TranslationsCommonWeekdaysFullKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get sunday => '일요일';
	@override String get monday => '월요일';
	@override String get tuesday => '화요일';
	@override String get wednesday => '수요일';
	@override String get thursday => '목요일';
	@override String get friday => '금요일';
	@override String get saturday => '토요일';
}

// Path: common.weekdays.short
class TranslationsCommonWeekdaysShortKo extends TranslationsCommonWeekdaysShortEn {
	TranslationsCommonWeekdaysShortKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get sunday => '일';
	@override String get monday => '월';
	@override String get tuesday => '화';
	@override String get wednesday => '수';
	@override String get thursday => '목';
	@override String get friday => '금';
	@override String get saturday => '토';
}

// Path: login.validation.username
class TranslationsLoginValidationUsernameKo extends TranslationsLoginValidationUsernameEn {
	TranslationsLoginValidationUsernameKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get required => '사용자명은 필수입니다.';
}

// Path: login.validation.password
class TranslationsLoginValidationPasswordKo extends TranslationsLoginValidationPasswordEn {
	TranslationsLoginValidationPasswordKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get required => '비밀번호는 필수입니다.';
}

// Path: register.validation.username
class TranslationsRegisterValidationUsernameKo extends TranslationsRegisterValidationUsernameEn {
	TranslationsRegisterValidationUsernameKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get required => '사용자명은 필수입니다.';
	@override String minLength({required Object min}) => '사용자명은 최소 ${min}자여야 합니다.';
	@override String maxLength({required Object max}) => '사용자명은 최대 ${max}자여야 합니다.';
}

// Path: register.validation.email
class TranslationsRegisterValidationEmailKo extends TranslationsRegisterValidationEmailEn {
	TranslationsRegisterValidationEmailKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get required => '이메일은 필수입니다.';
	@override String get invalid => '이메일이 유효하지 않습니다.';
}

// Path: register.validation.password
class TranslationsRegisterValidationPasswordKo extends TranslationsRegisterValidationPasswordEn {
	TranslationsRegisterValidationPasswordKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get required => '비밀번호는 필수입니다.';
	@override String minLength({required Object min}) => '비밀번호는 최소 ${min}자여야 합니다.';
}

// Path: passwordReset.validation.email
class TranslationsPasswordResetValidationEmailKo extends TranslationsPasswordResetValidationEmailEn {
	TranslationsPasswordResetValidationEmailKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get required => '이메일은 필수입니다.';
	@override String get invalid => '이메일이 유효하지 않습니다.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsKo {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.message.loading': return '로딩 중';
			case 'common.message.somethingWentWrong': return '문제가 발생했습니다';
			case 'common.message.networkProblem': return '네트워크 문제가 있습니다';
			case 'common.message.noDataFound': return '데이터를 찾을 수 없습니다';
			case 'common.message.noResultsFound': return '결과를 찾을 수 없습니다';
			case 'common.message.unsupportedFileType': return '지원되지 않는 파일 형식';
			case 'common.message.fileTooLarge': return '파일이 너무 큽니다';
			case 'common.message.operationTimedOut': return '작업 시간이 초과되었습니다';
			case 'common.message.sessionExpired': return '세션이 만료되었습니다';
			case 'common.message.unsavableChanges': return '변경사항을 저장할 수 없습니다';
			case 'common.message.noServerConnect': return '서버에 연결할 수 없습니다';
			case 'common.message.accessDenied': return '액세스가 거부되었습니다';
			case 'common.game.start': return '게임 시작';
			case 'common.game.pause': return '게임 일시정지';
			case 'common.game.resume': return '게임 재개';
			case 'common.game.end': return '게임 종료';
			case 'common.game.levelUp': return '레벨 업';
			case 'common.game.gameOver': return '게임 오버';
			case 'common.game.nextLevel': return '다음 레벨';
			case 'common.game.previousLevel': return '이전 레벨';
			case 'common.game.restart': return '게임 재시작';
			case 'common.social.like': return '좋아요';
			case 'common.social.share': return '공유';
			case 'common.social.comment': return '댓글';
			case 'common.social.follow': return '팔로우';
			case 'common.social.unfollow': return '언팔로우';
			case 'common.social.unlike': return '좋아요 취소';
			case 'common.social.reply': return '답글';
			case 'common.social.dislike': return '싫어요';
			case 'common.social.block': return '차단';
			case 'common.social.blockUser': return '사용자 차단';
			case 'common.social.report': return '신고';
			case 'common.social.mute': return '음소거';
			case 'common.social.uSentFriendRequest': return '친구 요청을 보냈습니다';
			case 'common.social.uReceivedFriendRequest': return '친구 요청을 받았습니다';
			case 'common.social.sentFriendRequest': return '친구 요청을 보냈습니다';
			case 'common.social.receivedFriendRequest': return '친구 요청을 받았습니다';
			case 'common.social.acceptedFriendRequest': return '친구 요청을 수락했습니다';
			case 'common.social.uAcceptedFriendRequest': return '친구 요청을 수락했습니다';
			case 'common.views.list': return '목록';
			case 'common.views.grid': return '격자';
			case 'common.views.table': return '표';
			case 'common.views.form': return '양식';
			case 'common.units.length.kilometer': return '킬로미터';
			case 'common.units.length.meter': return '미터';
			case 'common.units.length.centimeter': return '센티미터';
			case 'common.units.length.millimeter': return '밀리미터';
			case 'common.units.length.micrometer': return '마이크로미터';
			case 'common.units.length.nanometer': return '나노미터';
			case 'common.units.weight.kilogram': return '킬로그램';
			case 'common.units.weight.gram': return '그램';
			case 'common.units.weight.milligram': return '밀리그램';
			case 'common.units.weight.ton': return '톤';
			case 'common.units.volume.liter': return '리터';
			case 'common.units.volume.milliliter': return '밀리리터';
			case 'common.units.volume.cubicMeter': return '세제곱미터';
			case 'common.units.time.second': return '초';
			case 'common.units.time.minute': return '분';
			case 'common.units.time.hour': return '시간';
			case 'common.units.time.day': return '일';
			case 'common.units.time.week': return '주';
			case 'common.units.time.month': return '월';
			case 'common.units.time.year': return '년';
			case 'common.units.area.squareMeter': return '제곱미터';
			case 'common.units.area.hectare': return '헥타르';
			case 'common.units.area.acre': return '에이커';
			case 'common.numbers.k1': return '하나';
			case 'common.numbers.k2': return '둘';
			case 'common.numbers.k3': return '셋';
			case 'common.numbers.k4': return '넷';
			case 'common.numbers.k5': return '다섯';
			case 'common.numbers.k6': return '여섯';
			case 'common.numbers.k7': return '일곱';
			case 'common.numbers.k8': return '여덟';
			case 'common.numbers.k9': return '아홉';
			case 'common.numbers.k10': return '열';
			case 'common.ranks.k1': return '첫 번째';
			case 'common.ranks.k2': return '두 번째';
			case 'common.ranks.k3': return '세 번째';
			case 'common.ranks.k4': return '네 번째';
			case 'common.ranks.k5': return '다섯 번째';
			case 'common.ranks.k6': return '여섯 번째';
			case 'common.ranks.k7': return '일곱 번째';
			case 'common.ranks.k8': return '여덟 번째';
			case 'common.ranks.k9': return '아홉 번째';
			case 'common.ranks.k10': return '열 번째';
			case 'common.control.on': return '켜기';
			case 'common.control.off': return '끄기';
			case 'common.control.yes': return '예';
			case 'common.control.no': return '아니오';
			case 'common.control.confirm': return '확인';
			case 'common.control.cancel': return '취소';
			case 'common.control.retry': return '다시 시도';
			case 'common.control.logout': return '로그아웃';
			case 'common.control.edit': return '편집';
			case 'common.control.delete': return '삭제';
			case 'common.control.revert': return '되돌리기';
			case 'common.control.save': return '저장';
			case 'common.response.success': return '성공';
			case 'common.response.error': return '오류';
			case 'common.response.info': return '정보';
			case 'common.response.warning': return '경고';
			case 'common.response.tbd': return '미정';
			case 'common.response.wip': return '진행 중';
			case 'common.priority.high': return '높음';
			case 'common.priority.medium': return '보통';
			case 'common.priority.low': return '낮음';
			case 'common.date.today': return '오늘';
			case 'common.date.yesterday': return '어제';
			case 'common.date.tomorrow': return '내일';
			case 'common.date.justNow': return '방금';
			case 'common.date.aMomentAgo': return '잠깐 전';
			case 'common.date.minutesAgo': return '몇 분 전';
			case 'common.date.hoursAgo': return '몇 시간 전';
			case 'common.date.daysAgo': return ({required Object days}) => '${days}일 전';
			case 'common.date.weeksAgo': return '몇 주 전';
			case 'common.date.thisWeek': return '이번 주';
			case 'common.date.lastWeek': return '지난 주';
			case 'common.date.thisMonth': return '이번 달';
			case 'common.date.lastMonth': return '지난 달';
			case 'common.date.thisYear': return '올해';
			case 'common.date.lastYear': return '작년';
			case 'common.date.daysAhead': return ({required Object days}) => '${days}일 후';
			case 'common.weekdays.full.sunday': return '일요일';
			case 'common.weekdays.full.monday': return '월요일';
			case 'common.weekdays.full.tuesday': return '화요일';
			case 'common.weekdays.full.wednesday': return '수요일';
			case 'common.weekdays.full.thursday': return '목요일';
			case 'common.weekdays.full.friday': return '금요일';
			case 'common.weekdays.full.saturday': return '토요일';
			case 'common.weekdays.short.sunday': return '일';
			case 'common.weekdays.short.monday': return '월';
			case 'common.weekdays.short.tuesday': return '화';
			case 'common.weekdays.short.wednesday': return '수';
			case 'common.weekdays.short.thursday': return '목';
			case 'common.weekdays.short.friday': return '금';
			case 'common.weekdays.short.saturday': return '토';
			case 'common.formRestrictions.required': return '이 필드는 필수입니다.';
			case 'common.formRestrictions.minLength': return ({required Object min}) => '최소 길이는 ${min}자입니다.';
			case 'common.formRestrictions.maxLength': return ({required Object max}) => '최대 길이는 ${max}자입니다.';
			case 'common.formRestrictions.invalidFormat': return '형식이 올바르지 않습니다.';
			case 'common.formRestrictions.pattern': return ({required Object pattern}) => '이 필드는 패턴 ${pattern}을 따라야 합니다.';
			case 'common.tos.accept': return '약관에 동의합니다';
			case 'common.tos.readAccept': return '약관을 읽고 동의해 주세요';
			case 'common.tos.title': return '약관';
			case 'common.tos.service': return '서비스 약관';
			case 'common.tos.privacy': return '개인정보처리방침';
			case 'common.tos.continueAgree': return '계속하면 약관에 동의하는 것입니다';
			case 'common.tos.mustAccept': return '계속하려면 약관에 동의해야 합니다';
			case 'common.tos.view': return '약관 보기';
			case 'common.tos.lastUpdated': return ({required Object date}) => '마지막 업데이트: ${date}';
			case 'common.tos.contactInfo': return '약관에 대한 자세한 정보는 문의해 주세요';
			case 'common.permissions.allowLocation': return '위치 접근을 허용하시겠습니까?';
			case 'common.permissions.allowCamera': return '카메라 접근을 허용하시겠습니까?';
			case 'common.permissions.allowMicrophone': return '마이크 접근을 허용하시겠습니까?';
			case 'common.permissions.allowNotifications': return '알림을 허용하시겠습니까?';
			case 'common.permissions.allowContacts': return '연락처 접근을 허용하시겠습니까?';
			case 'common.permissions.allowPhotos': return '사진 접근을 허용하시겠습니까?';
			case 'common.permissions.allowStorage': return '저장소 접근을 허용하시겠습니까?';
			case 'common.permissions.allowBluetooth': return '블루투스 접근을 허용하시겠습니까?';
			case 'common.permissions.needPermission': return '계속하려면 권한이 필요합니다';
			case 'common.permissions.permissionDenied': return '권한이 거부되었습니다';
			case 'common.permissions.permissionRequired': return '이 권한은 필수입니다';
			case 'common.permissions.enableInSettings': return '설정에서 활성화해 주세요';
			case 'common.prompts.sessionExpired': return '세션이 만료되었습니다';
			case 'common.prompts.areYouSure': return '정말 확실합니까?';
			case 'common.prompts.cannotBeUndone': return '이 작업은 취소할 수 없습니다';
			case 'common.prompts.unsavedChanges': return '저장되지 않은 변경사항이 있습니다';
			case 'common.prompts.discardChanges': return '변경사항을 버리시겠습니까?';
			case 'common.prompts.locationDisabled': return '위치 서비스가 비활성화되어 있습니다';
			case 'common.prompts.networkRequired': return '네트워크 연결이 필요합니다';
			case 'common.prompts.loginRequired': return '계속하려면 로그인이 필요합니다';
			case 'common.prompts.confirmDelete': return '정말 삭제하시겠습니까?';
			case 'common.prompts.confirmLogout': return '정말 로그아웃하시겠습니까?';
			case 'common.prompts.saveBeforeExit': return '종료하기 전에 저장하시겠습니까?';
			case 'common.prompts.reloadPage': return '페이지를 새로고침하시겠습니까?';
			case 'common.prompts.updateAvailable': return '업데이트가 있습니다';
			case 'common.prompts.restartRequired': return '변경사항을 적용하려면 재시작이 필요합니다';
			case 'login.message.success': return '로그인 성공.';
			case 'login.message.error': return '로그인 실패. 다시 시도해 주세요.';
			case 'login.message.wrongPassword': return '자격 증명을 확인해 주세요.';
			case 'login.form.username': return '사용자명';
			case 'login.form.password': return '비밀번호';
			case 'login.form.submit': return '로그인';
			case 'login.form.createAccount': return '새 계정 만들기';
			case 'login.form.forgotPassword': return '비밀번호 찾기';
			case 'login.tooltip.username': return '사용자명을 입력하세요';
			case 'login.tooltip.password': return '비밀번호를 입력하세요';
			case 'login.tooltip.submit': return '로그인하려면 클릭하세요';
			case 'login.validation.username.required': return '사용자명은 필수입니다.';
			case 'login.validation.password.required': return '비밀번호는 필수입니다.';
			case 'register.message.success': return '회원가입 성공.';
			case 'register.message.error': return '회원가입 실패. 다시 시도해 주세요.';
			case 'register.form.username': return '사용자명';
			case 'register.form.email': return '이메일';
			case 'register.form.password': return '비밀번호';
			case 'register.form.submit': return '회원가입';
			case 'register.form.acceptTos': return '서비스 약관에 동의합니다';
			case 'register.tooltip.username': return '사용자명을 입력하세요';
			case 'register.tooltip.email': return '이메일을 입력하세요';
			case 'register.tooltip.password': return '비밀번호를 입력하세요';
			case 'register.tooltip.submit': return '회원가입하려면 클릭하세요';
			case 'register.validation.username.required': return '사용자명은 필수입니다.';
			case 'register.validation.username.minLength': return ({required Object min}) => '사용자명은 최소 ${min}자여야 합니다.';
			case 'register.validation.username.maxLength': return ({required Object max}) => '사용자명은 최대 ${max}자여야 합니다.';
			case 'register.validation.email.required': return '이메일은 필수입니다.';
			case 'register.validation.email.invalid': return '이메일이 유효하지 않습니다.';
			case 'register.validation.password.required': return '비밀번호는 필수입니다.';
			case 'register.validation.password.minLength': return ({required Object min}) => '비밀번호는 최소 ${min}자여야 합니다.';
			case 'passwordReset.message.success': return '비밀번호 재설정 이메일이 전송되었습니다.';
			case 'passwordReset.message.error': return '비밀번호 재설정 실패. 다시 시도해 주세요.';
			case 'passwordReset.form.email': return '이메일';
			case 'passwordReset.form.submit': return '비밀번호 재설정';
			case 'passwordReset.tooltip.email': return '이메일을 입력하세요';
			case 'passwordReset.tooltip.submit': return '비밀번호를 재설정하려면 클릭하세요';
			case 'passwordReset.validation.email.required': return '이메일은 필수입니다.';
			case 'passwordReset.validation.email.invalid': return '이메일이 유효하지 않습니다.';
			default: return null;
		}
	}
}

