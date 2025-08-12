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
	@override late final TranslationsCommonHe common = TranslationsCommonHe._(_root);
	@override late final TranslationsLoginHe login = TranslationsLoginHe._(_root);
	@override late final TranslationsRegisterHe register = TranslationsRegisterHe._(_root);
	@override late final TranslationsPasswordResetHe passwordReset = TranslationsPasswordResetHe._(_root);
}

// Path: common
class TranslationsCommonHe extends TranslationsCommonEn {
	TranslationsCommonHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMessageHe message = TranslationsCommonMessageHe._(_root);
	@override late final TranslationsCommonGameHe game = TranslationsCommonGameHe._(_root);
	@override late final TranslationsCommonSocialHe social = TranslationsCommonSocialHe._(_root);
	@override late final TranslationsCommonViewsHe views = TranslationsCommonViewsHe._(_root);
	@override late final TranslationsCommonUnitsHe units = TranslationsCommonUnitsHe._(_root);
	@override late final TranslationsCommonNumbersHe numbers = TranslationsCommonNumbersHe._(_root);
	@override late final TranslationsCommonRanksHe ranks = TranslationsCommonRanksHe._(_root);
	@override late final TranslationsCommonControlHe control = TranslationsCommonControlHe._(_root);
	@override late final TranslationsCommonResponseHe response = TranslationsCommonResponseHe._(_root);
	@override late final TranslationsCommonPriorityHe priority = TranslationsCommonPriorityHe._(_root);
	@override late final TranslationsCommonDateHe date = TranslationsCommonDateHe._(_root);
	@override late final TranslationsCommonWeekdaysHe weekdays = TranslationsCommonWeekdaysHe._(_root);
	@override late final TranslationsCommonFormRestrictionsHe formRestrictions = TranslationsCommonFormRestrictionsHe._(_root);
	@override late final TranslationsCommonTosHe tos = TranslationsCommonTosHe._(_root);
	@override late final TranslationsCommonPermissionsHe permissions = TranslationsCommonPermissionsHe._(_root);
	@override late final TranslationsCommonPromptsHe prompts = TranslationsCommonPromptsHe._(_root);
}

// Path: login
class TranslationsLoginHe extends TranslationsLoginEn {
	TranslationsLoginHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginMessageHe message = TranslationsLoginMessageHe._(_root);
	@override late final TranslationsLoginFormHe form = TranslationsLoginFormHe._(_root);
	@override late final TranslationsLoginTooltipHe tooltip = TranslationsLoginTooltipHe._(_root);
	@override late final TranslationsLoginValidationHe validation = TranslationsLoginValidationHe._(_root);
}

// Path: register
class TranslationsRegisterHe extends TranslationsRegisterEn {
	TranslationsRegisterHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterMessageHe message = TranslationsRegisterMessageHe._(_root);
	@override late final TranslationsRegisterFormHe form = TranslationsRegisterFormHe._(_root);
	@override late final TranslationsRegisterTooltipHe tooltip = TranslationsRegisterTooltipHe._(_root);
	@override late final TranslationsRegisterValidationHe validation = TranslationsRegisterValidationHe._(_root);
}

// Path: passwordReset
class TranslationsPasswordResetHe extends TranslationsPasswordResetEn {
	TranslationsPasswordResetHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetMessageHe message = TranslationsPasswordResetMessageHe._(_root);
	@override late final TranslationsPasswordResetFormHe form = TranslationsPasswordResetFormHe._(_root);
	@override late final TranslationsPasswordResetTooltipHe tooltip = TranslationsPasswordResetTooltipHe._(_root);
	@override late final TranslationsPasswordResetValidationHe validation = TranslationsPasswordResetValidationHe._(_root);
}

// Path: common.message
class TranslationsCommonMessageHe extends TranslationsCommonMessageEn {
	TranslationsCommonMessageHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get loading => 'טוען';
	@override String get somethingWentWrong => 'משהו השתבש';
	@override String get networkProblem => 'יש בעיית רשת';
	@override String get noDataFound => 'לא נמצאו נתונים';
	@override String get noResultsFound => 'לא נמצאו תוצאות';
	@override String get unsupportedFileType => 'סוג קובץ לא נתמך';
	@override String get fileTooLarge => 'הקובץ גדול מדי';
	@override String get operationTimedOut => 'הפעולה תמה בהקצאת הזמן';
	@override String get sessionExpired => 'ההפעלה פגה';
	@override String get unsavableChanges => 'לא ניתן לשמור את השינויים';
	@override String get noServerConnect => 'לא ניתן להתחבר לשרת';
	@override String get accessDenied => 'הגישה נדחתה';
}

// Path: common.game
class TranslationsCommonGameHe extends TranslationsCommonGameEn {
	TranslationsCommonGameHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get start => 'התחל משחק';
	@override String get pause => 'השהה משחק';
	@override String get resume => 'המשך משחק';
	@override String get end => 'סיים משחק';
	@override String get levelUp => 'עלייה ברמה';
	@override String get gameOver => 'המשחק הסתיים';
	@override String get nextLevel => 'הרמה הבאה';
	@override String get previousLevel => 'הרמה הקודמת';
	@override String get restart => 'הפעל מחדש את המשחק';
}

// Path: common.social
class TranslationsCommonSocialHe extends TranslationsCommonSocialEn {
	TranslationsCommonSocialHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get like => 'אהבתי';
	@override String get share => 'שתף';
	@override String get comment => 'הגב';
	@override String get follow => 'עקוב';
	@override String get unfollow => 'הפסק לעקוב';
	@override String get unlike => 'ביטול אהבתי';
	@override String get reply => 'השב';
	@override String get dislike => 'לא אהבתי';
	@override String get block => 'חסום';
	@override String get blockUser => 'חסום משתמש';
	@override String get report => 'דווח';
	@override String get mute => 'השתק';
	@override String get uSentFriendRequest => 'שלחת בקשת חברות';
	@override String get uReceivedFriendRequest => 'קיבלת בקשת חברות';
	@override String get sentFriendRequest => 'שלח בקשת חברות';
	@override String get receivedFriendRequest => 'קיבל בקשת חברות';
	@override String get acceptedFriendRequest => 'אישר בקשת חברות';
	@override String get uAcceptedFriendRequest => 'אישרת בקשת חברות';
}

// Path: common.views
class TranslationsCommonViewsHe extends TranslationsCommonViewsEn {
	TranslationsCommonViewsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get list => 'רשימה';
	@override String get grid => 'רשת';
	@override String get table => 'טבלה';
	@override String get form => 'טופס';
}

// Path: common.units
class TranslationsCommonUnitsHe extends TranslationsCommonUnitsEn {
	TranslationsCommonUnitsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonUnitsLengthHe length = TranslationsCommonUnitsLengthHe._(_root);
	@override late final TranslationsCommonUnitsWeightHe weight = TranslationsCommonUnitsWeightHe._(_root);
	@override late final TranslationsCommonUnitsVolumeHe volume = TranslationsCommonUnitsVolumeHe._(_root);
	@override late final TranslationsCommonUnitsTimeHe time = TranslationsCommonUnitsTimeHe._(_root);
	@override late final TranslationsCommonUnitsAreaHe area = TranslationsCommonUnitsAreaHe._(_root);
}

// Path: common.numbers
class TranslationsCommonNumbersHe extends TranslationsCommonNumbersEn {
	TranslationsCommonNumbersHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'אחד';
	@override String get k2 => 'שניים';
	@override String get k3 => 'שלושה';
	@override String get k4 => 'ארבעה';
	@override String get k5 => 'חמישה';
	@override String get k6 => 'שישה';
	@override String get k7 => 'שבעה';
	@override String get k8 => 'שמונה';
	@override String get k9 => 'תשעה';
	@override String get k10 => 'עשרה';
}

// Path: common.ranks
class TranslationsCommonRanksHe extends TranslationsCommonRanksEn {
	TranslationsCommonRanksHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'ראשון';
	@override String get k2 => 'שני';
	@override String get k3 => 'שלישי';
	@override String get k4 => 'רביעי';
	@override String get k5 => 'חמישי';
	@override String get k6 => 'שישי';
	@override String get k7 => 'שביעי';
	@override String get k8 => 'שמיני';
	@override String get k9 => 'תשיעי';
	@override String get k10 => 'עשירי';
}

// Path: common.control
class TranslationsCommonControlHe extends TranslationsCommonControlEn {
	TranslationsCommonControlHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get on => 'פועל';
	@override String get off => 'כבוי';
	@override String get yes => 'כן';
	@override String get no => 'לא';
	@override String get confirm => 'אישור';
	@override String get cancel => 'ביטול';
	@override String get retry => 'נסה שוב';
	@override String get logout => 'התנתק';
	@override String get edit => 'ערוך';
	@override String get delete => 'מחק';
	@override String get revert => 'החזר';
	@override String get save => 'שמור';
}

// Path: common.response
class TranslationsCommonResponseHe extends TranslationsCommonResponseEn {
	TranslationsCommonResponseHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get success => 'הצלחה';
	@override String get error => 'שגיאה';
	@override String get info => 'מידע';
	@override String get warning => 'אזהרה';
	@override String get tbd => 'עוד לא הוחלט';
	@override String get wip => 'בעבודה';
}

// Path: common.priority
class TranslationsCommonPriorityHe extends TranslationsCommonPriorityEn {
	TranslationsCommonPriorityHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get high => 'גבוהה';
	@override String get medium => 'בינונית';
	@override String get low => 'נמוכה';
}

// Path: common.date
class TranslationsCommonDateHe extends TranslationsCommonDateEn {
	TranslationsCommonDateHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get today => 'היום';
	@override String get yesterday => 'אתמול';
	@override String get tomorrow => 'מחר';
	@override String get justNow => 'עכשיו';
	@override String get aMomentAgo => 'לפני רגע';
	@override String get minutesAgo => 'לפני דקות';
	@override String get hoursAgo => 'לפני שעות';
	@override String daysAgo({required Object days}) => 'לפני ${days} ימים';
	@override String get weeksAgo => 'לפני שבועות';
	@override String get thisWeek => 'השבוע';
	@override String get lastWeek => 'השבוע שעבר';
	@override String get thisMonth => 'החודש';
	@override String get lastMonth => 'החודש שעבר';
	@override String get thisYear => 'השנה';
	@override String get lastYear => 'השנה שעברה';
	@override String daysAhead({required Object days}) => 'בעוד ${days} ימים';
}

// Path: common.weekdays
class TranslationsCommonWeekdaysHe extends TranslationsCommonWeekdaysEn {
	TranslationsCommonWeekdaysHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonWeekdaysFullHe full = TranslationsCommonWeekdaysFullHe._(_root);
	@override late final TranslationsCommonWeekdaysShortHe short = TranslationsCommonWeekdaysShortHe._(_root);
}

// Path: common.formRestrictions
class TranslationsCommonFormRestrictionsHe extends TranslationsCommonFormRestrictionsEn {
	TranslationsCommonFormRestrictionsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get required => 'שדה זה הוא חובה.';
	@override String minLength({required Object min}) => 'האורך המינימלי הוא ${min} תווים.';
	@override String maxLength({required Object max}) => 'האורך המקסימלי הוא ${max} תווים.';
	@override String get invalidFormat => 'הפורמט לא תקין.';
	@override String pattern({required Object pattern}) => 'שדה זה חייב לעקוב אחר התבנית ${pattern}.';
}

// Path: common.tos
class TranslationsCommonTosHe extends TranslationsCommonTosEn {
	TranslationsCommonTosHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get accept => 'אני מסכים לתנאי השימוש';
	@override String get readAccept => 'אנא קרא ואשר את תנאי השימוש שלנו';
	@override String get title => 'תנאי השימוש';
	@override String get service => 'תנאי השירות';
	@override String get privacy => 'מדיניות פרטיות';
	@override String get continueAgree => 'המשך פעולה מהווה הסכמה לתנאי השימוש שלנו';
	@override String get mustAccept => 'עליך לאשר את תנאי השימוש כדי להמשיך';
	@override String get view => 'צפה בתנאי השימוש';
	@override String lastUpdated({required Object date}) => 'עודכן לאחרונה: ${date}';
	@override String get contactInfo => 'צור קשר למידע נוסף על תנאי השימוש שלנו';
}

// Path: common.permissions
class TranslationsCommonPermissionsHe extends TranslationsCommonPermissionsEn {
	TranslationsCommonPermissionsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get allowLocation => 'לאפשר גישה למיקום?';
	@override String get allowCamera => 'לאפשר גישה למצלמה?';
	@override String get allowMicrophone => 'לאפשר גישה למיקרופון?';
	@override String get allowNotifications => 'לאפשר התראות?';
	@override String get allowContacts => 'לאפשר גישה לאנשי קשר?';
	@override String get allowPhotos => 'לאפשר גישה לתמונות?';
	@override String get allowStorage => 'לאפשר גישה לאחסון?';
	@override String get allowBluetooth => 'לאפשר גישה לבלוטות\'?';
	@override String get needPermission => 'אנחנו זקוקים להרשאה שלך כדי להמשיך';
	@override String get permissionDenied => 'ההרשאה נדחתה';
	@override String get permissionRequired => 'הרשאה זו נדרשת';
	@override String get enableInSettings => 'אנא הפעל בהגדרות';
}

// Path: common.prompts
class TranslationsCommonPromptsHe extends TranslationsCommonPromptsEn {
	TranslationsCommonPromptsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get sessionExpired => 'ההפעלה שלך פגה';
	@override String get areYouSure => 'האם אתה בטוח?';
	@override String get cannotBeUndone => 'פעולה זו לא ניתנת לביטול';
	@override String get unsavedChanges => 'יש לך שינויים שלא נשמרו';
	@override String get discardChanges => 'לבטל שינויים?';
	@override String get locationDisabled => 'שירותי מיקום מבוטלים';
	@override String get networkRequired => 'נדרש חיבור רשת';
	@override String get loginRequired => 'נדרשת התחברות כדי להמשיך';
	@override String get confirmDelete => 'האם אתה בטוח שברצונך למחוק את זה?';
	@override String get confirmLogout => 'האם אתה בטוח שברצונך להתנתק?';
	@override String get saveBeforeExit => 'האם ברצונך לשמור לפני היציאה?';
	@override String get reloadPage => 'האם ברצונך לטעון מחדש את הדף?';
	@override String get updateAvailable => 'עדכון זמין';
	@override String get restartRequired => 'נדרש אתחול כדי להחיל שינויים';
}

// Path: login.message
class TranslationsLoginMessageHe extends TranslationsLoginMessageEn {
	TranslationsLoginMessageHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get success => 'התחברות הצליחה.';
	@override String get error => 'התחברות נכשלה. אנא נסה שוב.';
	@override String get wrongPassword => 'אנא בדוק את פרטי ההתחברות שלך.';
}

// Path: login.form
class TranslationsLoginFormHe extends TranslationsLoginFormEn {
	TranslationsLoginFormHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get username => 'שם משתמש';
	@override String get password => 'סיסמה';
	@override String get submit => 'התחבר';
	@override String get createAccount => 'צור חשבון חדש';
	@override String get forgotPassword => 'שכחת סיסמה';
}

// Path: login.tooltip
class TranslationsLoginTooltipHe extends TranslationsLoginTooltipEn {
	TranslationsLoginTooltipHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get username => 'הזן את שם המשתמש שלך';
	@override String get password => 'הזן את הסיסמה שלך';
	@override String get submit => 'לחץ להתחברות';
}

// Path: login.validation
class TranslationsLoginValidationHe extends TranslationsLoginValidationEn {
	TranslationsLoginValidationHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginValidationUsernameHe username = TranslationsLoginValidationUsernameHe._(_root);
	@override late final TranslationsLoginValidationPasswordHe password = TranslationsLoginValidationPasswordHe._(_root);
}

// Path: register.message
class TranslationsRegisterMessageHe extends TranslationsRegisterMessageEn {
	TranslationsRegisterMessageHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get success => 'הרשמה הצליחה.';
	@override String get error => 'הרשמה נכשלה. אנא נסה שוב.';
}

// Path: register.form
class TranslationsRegisterFormHe extends TranslationsRegisterFormEn {
	TranslationsRegisterFormHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get username => 'שם משתמש';
	@override String get email => 'דוא"ל';
	@override String get password => 'סיסמה';
	@override String get submit => 'הירשם';
	@override String get acceptTos => 'אני מסכים לתנאי השירות';
}

// Path: register.tooltip
class TranslationsRegisterTooltipHe extends TranslationsRegisterTooltipEn {
	TranslationsRegisterTooltipHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get username => 'הזן את שם המשתמש שלך';
	@override String get email => 'הזן את הדוא"ל שלך';
	@override String get password => 'הזן את הסיסמה שלך';
	@override String get submit => 'לחץ להירשם';
}

// Path: register.validation
class TranslationsRegisterValidationHe extends TranslationsRegisterValidationEn {
	TranslationsRegisterValidationHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterValidationUsernameHe username = TranslationsRegisterValidationUsernameHe._(_root);
	@override late final TranslationsRegisterValidationEmailHe email = TranslationsRegisterValidationEmailHe._(_root);
	@override late final TranslationsRegisterValidationPasswordHe password = TranslationsRegisterValidationPasswordHe._(_root);
}

// Path: passwordReset.message
class TranslationsPasswordResetMessageHe extends TranslationsPasswordResetMessageEn {
	TranslationsPasswordResetMessageHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get success => 'דוא"ל לאיפוס סיסמה נשלח.';
	@override String get error => 'איפוס סיסמה נכשל. אנא נסה שוב.';
}

// Path: passwordReset.form
class TranslationsPasswordResetFormHe extends TranslationsPasswordResetFormEn {
	TranslationsPasswordResetFormHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get email => 'דוא"ל';
	@override String get submit => 'איפוס סיסמה';
}

// Path: passwordReset.tooltip
class TranslationsPasswordResetTooltipHe extends TranslationsPasswordResetTooltipEn {
	TranslationsPasswordResetTooltipHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get email => 'הזן את הדוא"ל שלך';
	@override String get submit => 'לחץ לאיפוס סיסמה';
}

// Path: passwordReset.validation
class TranslationsPasswordResetValidationHe extends TranslationsPasswordResetValidationEn {
	TranslationsPasswordResetValidationHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetValidationEmailHe email = TranslationsPasswordResetValidationEmailHe._(_root);
}

// Path: common.units.length
class TranslationsCommonUnitsLengthHe extends TranslationsCommonUnitsLengthEn {
	TranslationsCommonUnitsLengthHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get kilometer => 'קילומטר';
	@override String get meter => 'מטר';
	@override String get centimeter => 'סנטימטר';
	@override String get millimeter => 'מילימטר';
	@override String get micrometer => 'מיקרומטר';
	@override String get nanometer => 'נאנומטר';
}

// Path: common.units.weight
class TranslationsCommonUnitsWeightHe extends TranslationsCommonUnitsWeightEn {
	TranslationsCommonUnitsWeightHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get kilogram => 'קילוגרם';
	@override String get gram => 'גרם';
	@override String get milligram => 'מיליגרם';
	@override String get ton => 'טון';
}

// Path: common.units.volume
class TranslationsCommonUnitsVolumeHe extends TranslationsCommonUnitsVolumeEn {
	TranslationsCommonUnitsVolumeHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get liter => 'ליטר';
	@override String get milliliter => 'מיליליטר';
	@override String get cubicMeter => 'מטר מעוקב';
}

// Path: common.units.time
class TranslationsCommonUnitsTimeHe extends TranslationsCommonUnitsTimeEn {
	TranslationsCommonUnitsTimeHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get second => 'שנייה';
	@override String get minute => 'דקה';
	@override String get hour => 'שעה';
	@override String get day => 'יום';
	@override String get week => 'שבוע';
	@override String get month => 'חודש';
	@override String get year => 'שנה';
}

// Path: common.units.area
class TranslationsCommonUnitsAreaHe extends TranslationsCommonUnitsAreaEn {
	TranslationsCommonUnitsAreaHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get squareMeter => 'מטר רבוע';
	@override String get hectare => 'הקטר';
	@override String get acre => 'אקר';
}

// Path: common.weekdays.full
class TranslationsCommonWeekdaysFullHe extends TranslationsCommonWeekdaysFullEn {
	TranslationsCommonWeekdaysFullHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get sunday => 'ראשון';
	@override String get monday => 'שני';
	@override String get tuesday => 'שלישי';
	@override String get wednesday => 'רביעי';
	@override String get thursday => 'חמישי';
	@override String get friday => 'שישי';
	@override String get saturday => 'שבת';
}

// Path: common.weekdays.short
class TranslationsCommonWeekdaysShortHe extends TranslationsCommonWeekdaysShortEn {
	TranslationsCommonWeekdaysShortHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get sunday => 'א\'';
	@override String get monday => 'ב\'';
	@override String get tuesday => 'ג\'';
	@override String get wednesday => 'ד\'';
	@override String get thursday => 'ה\'';
	@override String get friday => 'ו\'';
	@override String get saturday => 'ש\'';
}

// Path: login.validation.username
class TranslationsLoginValidationUsernameHe extends TranslationsLoginValidationUsernameEn {
	TranslationsLoginValidationUsernameHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get required => 'שם משתמש הוא חובה.';
}

// Path: login.validation.password
class TranslationsLoginValidationPasswordHe extends TranslationsLoginValidationPasswordEn {
	TranslationsLoginValidationPasswordHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get required => 'סיסמה היא חובה.';
}

// Path: register.validation.username
class TranslationsRegisterValidationUsernameHe extends TranslationsRegisterValidationUsernameEn {
	TranslationsRegisterValidationUsernameHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get required => 'שם משתמש הוא חובה.';
	@override String minLength({required Object min}) => 'שם משתמש חייב להיות באורך של לפחות ${min} תווים.';
	@override String maxLength({required Object max}) => 'שם משתמש חייב להיות באורך של לכל היותר ${max} תווים.';
}

// Path: register.validation.email
class TranslationsRegisterValidationEmailHe extends TranslationsRegisterValidationEmailEn {
	TranslationsRegisterValidationEmailHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get required => 'דוא"ל הוא חובה.';
	@override String get invalid => 'דוא"ל לא תקין.';
}

// Path: register.validation.password
class TranslationsRegisterValidationPasswordHe extends TranslationsRegisterValidationPasswordEn {
	TranslationsRegisterValidationPasswordHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get required => 'סיסמה היא חובה.';
	@override String minLength({required Object min}) => 'סיסמה חייבת להיות באורך של לפחות ${min} תווים.';
}

// Path: passwordReset.validation.email
class TranslationsPasswordResetValidationEmailHe extends TranslationsPasswordResetValidationEmailEn {
	TranslationsPasswordResetValidationEmailHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get required => 'דוא"ל הוא חובה.';
	@override String get invalid => 'דוא"ל לא תקין.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsHe {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.message.loading': return 'טוען';
			case 'common.message.somethingWentWrong': return 'משהו השתבש';
			case 'common.message.networkProblem': return 'יש בעיית רשת';
			case 'common.message.noDataFound': return 'לא נמצאו נתונים';
			case 'common.message.noResultsFound': return 'לא נמצאו תוצאות';
			case 'common.message.unsupportedFileType': return 'סוג קובץ לא נתמך';
			case 'common.message.fileTooLarge': return 'הקובץ גדול מדי';
			case 'common.message.operationTimedOut': return 'הפעולה תמה בהקצאת הזמן';
			case 'common.message.sessionExpired': return 'ההפעלה פגה';
			case 'common.message.unsavableChanges': return 'לא ניתן לשמור את השינויים';
			case 'common.message.noServerConnect': return 'לא ניתן להתחבר לשרת';
			case 'common.message.accessDenied': return 'הגישה נדחתה';
			case 'common.game.start': return 'התחל משחק';
			case 'common.game.pause': return 'השהה משחק';
			case 'common.game.resume': return 'המשך משחק';
			case 'common.game.end': return 'סיים משחק';
			case 'common.game.levelUp': return 'עלייה ברמה';
			case 'common.game.gameOver': return 'המשחק הסתיים';
			case 'common.game.nextLevel': return 'הרמה הבאה';
			case 'common.game.previousLevel': return 'הרמה הקודמת';
			case 'common.game.restart': return 'הפעל מחדש את המשחק';
			case 'common.social.like': return 'אהבתי';
			case 'common.social.share': return 'שתף';
			case 'common.social.comment': return 'הגב';
			case 'common.social.follow': return 'עקוב';
			case 'common.social.unfollow': return 'הפסק לעקוב';
			case 'common.social.unlike': return 'ביטול אהבתי';
			case 'common.social.reply': return 'השב';
			case 'common.social.dislike': return 'לא אהבתי';
			case 'common.social.block': return 'חסום';
			case 'common.social.blockUser': return 'חסום משתמש';
			case 'common.social.report': return 'דווח';
			case 'common.social.mute': return 'השתק';
			case 'common.social.uSentFriendRequest': return 'שלחת בקשת חברות';
			case 'common.social.uReceivedFriendRequest': return 'קיבלת בקשת חברות';
			case 'common.social.sentFriendRequest': return 'שלח בקשת חברות';
			case 'common.social.receivedFriendRequest': return 'קיבל בקשת חברות';
			case 'common.social.acceptedFriendRequest': return 'אישר בקשת חברות';
			case 'common.social.uAcceptedFriendRequest': return 'אישרת בקשת חברות';
			case 'common.views.list': return 'רשימה';
			case 'common.views.grid': return 'רשת';
			case 'common.views.table': return 'טבלה';
			case 'common.views.form': return 'טופס';
			case 'common.units.length.kilometer': return 'קילומטר';
			case 'common.units.length.meter': return 'מטר';
			case 'common.units.length.centimeter': return 'סנטימטר';
			case 'common.units.length.millimeter': return 'מילימטר';
			case 'common.units.length.micrometer': return 'מיקרומטר';
			case 'common.units.length.nanometer': return 'נאנומטר';
			case 'common.units.weight.kilogram': return 'קילוגרם';
			case 'common.units.weight.gram': return 'גרם';
			case 'common.units.weight.milligram': return 'מיליגרם';
			case 'common.units.weight.ton': return 'טון';
			case 'common.units.volume.liter': return 'ליטר';
			case 'common.units.volume.milliliter': return 'מיליליטר';
			case 'common.units.volume.cubicMeter': return 'מטר מעוקב';
			case 'common.units.time.second': return 'שנייה';
			case 'common.units.time.minute': return 'דקה';
			case 'common.units.time.hour': return 'שעה';
			case 'common.units.time.day': return 'יום';
			case 'common.units.time.week': return 'שבוע';
			case 'common.units.time.month': return 'חודש';
			case 'common.units.time.year': return 'שנה';
			case 'common.units.area.squareMeter': return 'מטר רבוע';
			case 'common.units.area.hectare': return 'הקטר';
			case 'common.units.area.acre': return 'אקר';
			case 'common.numbers.k1': return 'אחד';
			case 'common.numbers.k2': return 'שניים';
			case 'common.numbers.k3': return 'שלושה';
			case 'common.numbers.k4': return 'ארבעה';
			case 'common.numbers.k5': return 'חמישה';
			case 'common.numbers.k6': return 'שישה';
			case 'common.numbers.k7': return 'שבעה';
			case 'common.numbers.k8': return 'שמונה';
			case 'common.numbers.k9': return 'תשעה';
			case 'common.numbers.k10': return 'עשרה';
			case 'common.ranks.k1': return 'ראשון';
			case 'common.ranks.k2': return 'שני';
			case 'common.ranks.k3': return 'שלישי';
			case 'common.ranks.k4': return 'רביעי';
			case 'common.ranks.k5': return 'חמישי';
			case 'common.ranks.k6': return 'שישי';
			case 'common.ranks.k7': return 'שביעי';
			case 'common.ranks.k8': return 'שמיני';
			case 'common.ranks.k9': return 'תשיעי';
			case 'common.ranks.k10': return 'עשירי';
			case 'common.control.on': return 'פועל';
			case 'common.control.off': return 'כבוי';
			case 'common.control.yes': return 'כן';
			case 'common.control.no': return 'לא';
			case 'common.control.confirm': return 'אישור';
			case 'common.control.cancel': return 'ביטול';
			case 'common.control.retry': return 'נסה שוב';
			case 'common.control.logout': return 'התנתק';
			case 'common.control.edit': return 'ערוך';
			case 'common.control.delete': return 'מחק';
			case 'common.control.revert': return 'החזר';
			case 'common.control.save': return 'שמור';
			case 'common.response.success': return 'הצלחה';
			case 'common.response.error': return 'שגיאה';
			case 'common.response.info': return 'מידע';
			case 'common.response.warning': return 'אזהרה';
			case 'common.response.tbd': return 'עוד לא הוחלט';
			case 'common.response.wip': return 'בעבודה';
			case 'common.priority.high': return 'גבוהה';
			case 'common.priority.medium': return 'בינונית';
			case 'common.priority.low': return 'נמוכה';
			case 'common.date.today': return 'היום';
			case 'common.date.yesterday': return 'אתמול';
			case 'common.date.tomorrow': return 'מחר';
			case 'common.date.justNow': return 'עכשיו';
			case 'common.date.aMomentAgo': return 'לפני רגע';
			case 'common.date.minutesAgo': return 'לפני דקות';
			case 'common.date.hoursAgo': return 'לפני שעות';
			case 'common.date.daysAgo': return ({required Object days}) => 'לפני ${days} ימים';
			case 'common.date.weeksAgo': return 'לפני שבועות';
			case 'common.date.thisWeek': return 'השבוע';
			case 'common.date.lastWeek': return 'השבוע שעבר';
			case 'common.date.thisMonth': return 'החודש';
			case 'common.date.lastMonth': return 'החודש שעבר';
			case 'common.date.thisYear': return 'השנה';
			case 'common.date.lastYear': return 'השנה שעברה';
			case 'common.date.daysAhead': return ({required Object days}) => 'בעוד ${days} ימים';
			case 'common.weekdays.full.sunday': return 'ראשון';
			case 'common.weekdays.full.monday': return 'שני';
			case 'common.weekdays.full.tuesday': return 'שלישי';
			case 'common.weekdays.full.wednesday': return 'רביעי';
			case 'common.weekdays.full.thursday': return 'חמישי';
			case 'common.weekdays.full.friday': return 'שישי';
			case 'common.weekdays.full.saturday': return 'שבת';
			case 'common.weekdays.short.sunday': return 'א\'';
			case 'common.weekdays.short.monday': return 'ב\'';
			case 'common.weekdays.short.tuesday': return 'ג\'';
			case 'common.weekdays.short.wednesday': return 'ד\'';
			case 'common.weekdays.short.thursday': return 'ה\'';
			case 'common.weekdays.short.friday': return 'ו\'';
			case 'common.weekdays.short.saturday': return 'ש\'';
			case 'common.formRestrictions.required': return 'שדה זה הוא חובה.';
			case 'common.formRestrictions.minLength': return ({required Object min}) => 'האורך המינימלי הוא ${min} תווים.';
			case 'common.formRestrictions.maxLength': return ({required Object max}) => 'האורך המקסימלי הוא ${max} תווים.';
			case 'common.formRestrictions.invalidFormat': return 'הפורמט לא תקין.';
			case 'common.formRestrictions.pattern': return ({required Object pattern}) => 'שדה זה חייב לעקוב אחר התבנית ${pattern}.';
			case 'common.tos.accept': return 'אני מסכים לתנאי השימוש';
			case 'common.tos.readAccept': return 'אנא קרא ואשר את תנאי השימוש שלנו';
			case 'common.tos.title': return 'תנאי השימוש';
			case 'common.tos.service': return 'תנאי השירות';
			case 'common.tos.privacy': return 'מדיניות פרטיות';
			case 'common.tos.continueAgree': return 'המשך פעולה מהווה הסכמה לתנאי השימוש שלנו';
			case 'common.tos.mustAccept': return 'עליך לאשר את תנאי השימוש כדי להמשיך';
			case 'common.tos.view': return 'צפה בתנאי השימוש';
			case 'common.tos.lastUpdated': return ({required Object date}) => 'עודכן לאחרונה: ${date}';
			case 'common.tos.contactInfo': return 'צור קשר למידע נוסף על תנאי השימוש שלנו';
			case 'common.permissions.allowLocation': return 'לאפשר גישה למיקום?';
			case 'common.permissions.allowCamera': return 'לאפשר גישה למצלמה?';
			case 'common.permissions.allowMicrophone': return 'לאפשר גישה למיקרופון?';
			case 'common.permissions.allowNotifications': return 'לאפשר התראות?';
			case 'common.permissions.allowContacts': return 'לאפשר גישה לאנשי קשר?';
			case 'common.permissions.allowPhotos': return 'לאפשר גישה לתמונות?';
			case 'common.permissions.allowStorage': return 'לאפשר גישה לאחסון?';
			case 'common.permissions.allowBluetooth': return 'לאפשר גישה לבלוטות\'?';
			case 'common.permissions.needPermission': return 'אנחנו זקוקים להרשאה שלך כדי להמשיך';
			case 'common.permissions.permissionDenied': return 'ההרשאה נדחתה';
			case 'common.permissions.permissionRequired': return 'הרשאה זו נדרשת';
			case 'common.permissions.enableInSettings': return 'אנא הפעל בהגדרות';
			case 'common.prompts.sessionExpired': return 'ההפעלה שלך פגה';
			case 'common.prompts.areYouSure': return 'האם אתה בטוח?';
			case 'common.prompts.cannotBeUndone': return 'פעולה זו לא ניתנת לביטול';
			case 'common.prompts.unsavedChanges': return 'יש לך שינויים שלא נשמרו';
			case 'common.prompts.discardChanges': return 'לבטל שינויים?';
			case 'common.prompts.locationDisabled': return 'שירותי מיקום מבוטלים';
			case 'common.prompts.networkRequired': return 'נדרש חיבור רשת';
			case 'common.prompts.loginRequired': return 'נדרשת התחברות כדי להמשיך';
			case 'common.prompts.confirmDelete': return 'האם אתה בטוח שברצונך למחוק את זה?';
			case 'common.prompts.confirmLogout': return 'האם אתה בטוח שברצונך להתנתק?';
			case 'common.prompts.saveBeforeExit': return 'האם ברצונך לשמור לפני היציאה?';
			case 'common.prompts.reloadPage': return 'האם ברצונך לטעון מחדש את הדף?';
			case 'common.prompts.updateAvailable': return 'עדכון זמין';
			case 'common.prompts.restartRequired': return 'נדרש אתחול כדי להחיל שינויים';
			case 'login.message.success': return 'התחברות הצליחה.';
			case 'login.message.error': return 'התחברות נכשלה. אנא נסה שוב.';
			case 'login.message.wrongPassword': return 'אנא בדוק את פרטי ההתחברות שלך.';
			case 'login.form.username': return 'שם משתמש';
			case 'login.form.password': return 'סיסמה';
			case 'login.form.submit': return 'התחבר';
			case 'login.form.createAccount': return 'צור חשבון חדש';
			case 'login.form.forgotPassword': return 'שכחת סיסמה';
			case 'login.tooltip.username': return 'הזן את שם המשתמש שלך';
			case 'login.tooltip.password': return 'הזן את הסיסמה שלך';
			case 'login.tooltip.submit': return 'לחץ להתחברות';
			case 'login.validation.username.required': return 'שם משתמש הוא חובה.';
			case 'login.validation.password.required': return 'סיסמה היא חובה.';
			case 'register.message.success': return 'הרשמה הצליחה.';
			case 'register.message.error': return 'הרשמה נכשלה. אנא נסה שוב.';
			case 'register.form.username': return 'שם משתמש';
			case 'register.form.email': return 'דוא"ל';
			case 'register.form.password': return 'סיסמה';
			case 'register.form.submit': return 'הירשם';
			case 'register.form.acceptTos': return 'אני מסכים לתנאי השירות';
			case 'register.tooltip.username': return 'הזן את שם המשתמש שלך';
			case 'register.tooltip.email': return 'הזן את הדוא"ל שלך';
			case 'register.tooltip.password': return 'הזן את הסיסמה שלך';
			case 'register.tooltip.submit': return 'לחץ להירשם';
			case 'register.validation.username.required': return 'שם משתמש הוא חובה.';
			case 'register.validation.username.minLength': return ({required Object min}) => 'שם משתמש חייב להיות באורך של לפחות ${min} תווים.';
			case 'register.validation.username.maxLength': return ({required Object max}) => 'שם משתמש חייב להיות באורך של לכל היותר ${max} תווים.';
			case 'register.validation.email.required': return 'דוא"ל הוא חובה.';
			case 'register.validation.email.invalid': return 'דוא"ל לא תקין.';
			case 'register.validation.password.required': return 'סיסמה היא חובה.';
			case 'register.validation.password.minLength': return ({required Object min}) => 'סיסמה חייבת להיות באורך של לפחות ${min} תווים.';
			case 'passwordReset.message.success': return 'דוא"ל לאיפוס סיסמה נשלח.';
			case 'passwordReset.message.error': return 'איפוס סיסמה נכשל. אנא נסה שוב.';
			case 'passwordReset.form.email': return 'דוא"ל';
			case 'passwordReset.form.submit': return 'איפוס סיסמה';
			case 'passwordReset.tooltip.email': return 'הזן את הדוא"ל שלך';
			case 'passwordReset.tooltip.submit': return 'לחץ לאיפוס סיסמה';
			case 'passwordReset.validation.email.required': return 'דוא"ל הוא חובה.';
			case 'passwordReset.validation.email.invalid': return 'דוא"ל לא תקין.';
			default: return null;
		}
	}
}

