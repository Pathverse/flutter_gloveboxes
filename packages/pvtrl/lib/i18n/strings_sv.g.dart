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
	@override late final TranslationsCommonSv common = TranslationsCommonSv._(_root);
	@override late final TranslationsLoginSv login = TranslationsLoginSv._(_root);
	@override late final TranslationsRegisterSv register = TranslationsRegisterSv._(_root);
	@override late final TranslationsPasswordResetSv passwordReset = TranslationsPasswordResetSv._(_root);
}

// Path: common
class TranslationsCommonSv extends TranslationsCommonEn {
	TranslationsCommonSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMessageSv message = TranslationsCommonMessageSv._(_root);
	@override late final TranslationsCommonGameSv game = TranslationsCommonGameSv._(_root);
	@override late final TranslationsCommonSocialSv social = TranslationsCommonSocialSv._(_root);
	@override late final TranslationsCommonViewsSv views = TranslationsCommonViewsSv._(_root);
	@override late final TranslationsCommonUnitsSv units = TranslationsCommonUnitsSv._(_root);
	@override late final TranslationsCommonNumbersSv numbers = TranslationsCommonNumbersSv._(_root);
	@override late final TranslationsCommonRanksSv ranks = TranslationsCommonRanksSv._(_root);
	@override late final TranslationsCommonControlSv control = TranslationsCommonControlSv._(_root);
	@override late final TranslationsCommonButtonsSv buttons = TranslationsCommonButtonsSv._(_root);
	@override late final TranslationsCommonLabelsSv labels = TranslationsCommonLabelsSv._(_root);
	@override late final TranslationsCommonResponseSv response = TranslationsCommonResponseSv._(_root);
	@override late final TranslationsCommonPrioritySv priority = TranslationsCommonPrioritySv._(_root);
	@override late final TranslationsCommonDateSv date = TranslationsCommonDateSv._(_root);
	@override late final TranslationsCommonWeekdaysSv weekdays = TranslationsCommonWeekdaysSv._(_root);
	@override late final TranslationsCommonFormRestrictionsSv formRestrictions = TranslationsCommonFormRestrictionsSv._(_root);
	@override late final TranslationsCommonTosSv tos = TranslationsCommonTosSv._(_root);
	@override late final TranslationsCommonPermissionsSv permissions = TranslationsCommonPermissionsSv._(_root);
	@override late final TranslationsCommonPromptsSv prompts = TranslationsCommonPromptsSv._(_root);
}

// Path: login
class TranslationsLoginSv extends TranslationsLoginEn {
	TranslationsLoginSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginMessageSv message = TranslationsLoginMessageSv._(_root);
	@override late final TranslationsLoginFormSv form = TranslationsLoginFormSv._(_root);
	@override late final TranslationsLoginTooltipSv tooltip = TranslationsLoginTooltipSv._(_root);
	@override late final TranslationsLoginValidationSv validation = TranslationsLoginValidationSv._(_root);
}

// Path: register
class TranslationsRegisterSv extends TranslationsRegisterEn {
	TranslationsRegisterSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterMessageSv message = TranslationsRegisterMessageSv._(_root);
	@override late final TranslationsRegisterFormSv form = TranslationsRegisterFormSv._(_root);
	@override late final TranslationsRegisterTooltipSv tooltip = TranslationsRegisterTooltipSv._(_root);
	@override late final TranslationsRegisterValidationSv validation = TranslationsRegisterValidationSv._(_root);
}

// Path: passwordReset
class TranslationsPasswordResetSv extends TranslationsPasswordResetEn {
	TranslationsPasswordResetSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetMessageSv message = TranslationsPasswordResetMessageSv._(_root);
	@override late final TranslationsPasswordResetFormSv form = TranslationsPasswordResetFormSv._(_root);
	@override late final TranslationsPasswordResetTooltipSv tooltip = TranslationsPasswordResetTooltipSv._(_root);
	@override late final TranslationsPasswordResetValidationSv validation = TranslationsPasswordResetValidationSv._(_root);
}

// Path: common.message
class TranslationsCommonMessageSv extends TranslationsCommonMessageEn {
	TranslationsCommonMessageSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get loading => 'Laddar';
	@override String get somethingWentWrong => 'Något gick fel';
	@override String get networkProblem => 'Det finns ett nätverksproblem';
	@override String get noDataFound => 'Ingen data hittades';
	@override String get noResultsFound => 'Inga resultat hittades';
	@override String get unsupportedFileType => 'Filtyp som inte stöds';
	@override String get fileTooLarge => 'Filen är för stor';
	@override String get operationTimedOut => 'Operationen tog för lång tid';
	@override String get sessionExpired => 'Sessionen har löpt ut';
	@override String get unsavableChanges => 'Ändringar kunde inte sparas';
	@override String get noServerConnect => 'Kunde inte ansluta till servern';
	@override String get accessDenied => 'Åtkomst nekad';
}

// Path: common.game
class TranslationsCommonGameSv extends TranslationsCommonGameEn {
	TranslationsCommonGameSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get start => 'Starta Spel';
	@override String get pause => 'Pausa Spel';
	@override String get resume => 'Återuppta Spel';
	@override String get end => 'Avsluta Spel';
	@override String get levelUp => 'Nivå Upp';
	@override String get gameOver => 'Spel Slut';
	@override String get nextLevel => 'Nästa Nivå';
	@override String get previousLevel => 'Föregående Nivå';
	@override String get restart => 'Starta Om Spel';
}

// Path: common.social
class TranslationsCommonSocialSv extends TranslationsCommonSocialEn {
	TranslationsCommonSocialSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get like => 'Gilla';
	@override String get share => 'Dela';
	@override String get comment => 'Kommentera';
	@override String get follow => 'Följ';
	@override String get unfollow => 'Sluta följa';
	@override String get unlike => 'Ogilla';
	@override String get reply => 'Svara';
	@override String get dislike => 'Ogilla';
	@override String get block => 'Blockera';
	@override String get blockUser => 'Blockera Användare';
	@override String get report => 'Rapportera';
	@override String get mute => 'Tysta';
	@override String get uSentFriendRequest => 'Du skickade en vänförfrågan';
	@override String get uReceivedFriendRequest => 'Du fick en vänförfrågan';
	@override String get sentFriendRequest => 'skickade en vänförfrågan';
	@override String get receivedFriendRequest => 'fick en vänförfrågan';
	@override String get acceptedFriendRequest => 'accepterade en vänförfrågan';
	@override String get uAcceptedFriendRequest => 'Du accepterade en vänförfrågan';
}

// Path: common.views
class TranslationsCommonViewsSv extends TranslationsCommonViewsEn {
	TranslationsCommonViewsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get list => 'Lista';
	@override String get grid => 'Rutnät';
	@override String get table => 'Tabell';
	@override String get form => 'Formulär';
}

// Path: common.units
class TranslationsCommonUnitsSv extends TranslationsCommonUnitsEn {
	TranslationsCommonUnitsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonUnitsLengthSv length = TranslationsCommonUnitsLengthSv._(_root);
	@override late final TranslationsCommonUnitsWeightSv weight = TranslationsCommonUnitsWeightSv._(_root);
	@override late final TranslationsCommonUnitsVolumeSv volume = TranslationsCommonUnitsVolumeSv._(_root);
	@override late final TranslationsCommonUnitsTimeSv time = TranslationsCommonUnitsTimeSv._(_root);
	@override late final TranslationsCommonUnitsAreaSv area = TranslationsCommonUnitsAreaSv._(_root);
}

// Path: common.numbers
class TranslationsCommonNumbersSv extends TranslationsCommonNumbersEn {
	TranslationsCommonNumbersSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'Ett';
	@override String get k2 => 'Två';
	@override String get k3 => 'Tre';
	@override String get k4 => 'Fyra';
	@override String get k5 => 'Fem';
	@override String get k6 => 'Sex';
	@override String get k7 => 'Sju';
	@override String get k8 => 'Åtta';
	@override String get k9 => 'Nio';
	@override String get k10 => 'Tio';
}

// Path: common.ranks
class TranslationsCommonRanksSv extends TranslationsCommonRanksEn {
	TranslationsCommonRanksSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'första';
	@override String get k2 => 'andra';
	@override String get k3 => 'tredje';
	@override String get k4 => 'fjärde';
	@override String get k5 => 'femte';
	@override String get k6 => 'sjätte';
	@override String get k7 => 'sjunde';
	@override String get k8 => 'åttonde';
	@override String get k9 => 'nionde';
	@override String get k10 => 'tionde';
}

// Path: common.control
class TranslationsCommonControlSv extends TranslationsCommonControlEn {
	TranslationsCommonControlSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get on => 'På';
	@override String get off => 'Av';
	@override String get yes => 'Ja';
	@override String get no => 'Nej';
	@override String get confirm => 'Bekräfta';
	@override String get cancel => 'Avbryt';
	@override String get retry => 'Försök igen';
	@override String get logout => 'Logga ut';
	@override String get edit => 'Redigera';
	@override String get delete => 'Ta bort';
	@override String get revert => 'Återställ';
	@override String get save => 'Spara';
}

// Path: common.buttons
class TranslationsCommonButtonsSv extends TranslationsCommonButtonsEn {
	TranslationsCommonButtonsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get submit => 'Skicka';
	@override String get close => 'Stäng';
	@override String get reset => 'Återställ';
	@override String get cancel => 'Avbryt';
	@override String get kContinue => 'Fortsätt';
	@override String get back => 'Tillbaka';
	@override String get next => 'Nästa';
	@override String get done => 'Klar';
	@override String get upload => 'Ladda upp';
	@override String get choose => 'Välj';
	@override String get select => 'Välj';
	@override String get clear => 'Rensa';
	@override String get start => 'Starta';
}

// Path: common.labels
class TranslationsCommonLabelsSv extends TranslationsCommonLabelsEn {
	TranslationsCommonLabelsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get required => 'Obligatorisk';
	@override String get optional => 'Valfritt';
	@override String get instructions => 'Instruktioner:';
	@override String get status => 'Status';
	@override String get progress => 'Framsteg';
	@override String get question => 'Fråga';
	@override String get answer => 'Svar';
	@override String get response => 'Respons';
	@override String get loading => 'Laddar...';
	@override String get error => 'Fel';
	@override String get success => 'Framgång';
	@override String get warning => 'Varning';
}

// Path: common.response
class TranslationsCommonResponseSv extends TranslationsCommonResponseEn {
	TranslationsCommonResponseSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get success => 'Framgång';
	@override String get error => 'Fel';
	@override String get info => 'Information';
	@override String get warning => 'Varning';
	@override String get tbd => 'Att Bestämma';
	@override String get wip => 'Pågående Arbete';
}

// Path: common.priority
class TranslationsCommonPrioritySv extends TranslationsCommonPriorityEn {
	TranslationsCommonPrioritySv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get high => 'Hög';
	@override String get medium => 'Medium';
	@override String get low => 'Låg';
}

// Path: common.date
class TranslationsCommonDateSv extends TranslationsCommonDateEn {
	TranslationsCommonDateSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get today => 'Idag';
	@override String get yesterday => 'Igår';
	@override String get tomorrow => 'Imorgon';
	@override String get justNow => 'Just nu';
	@override String get aMomentAgo => 'För en stund sedan';
	@override String get minutesAgo => 'Minuter sedan';
	@override String get hoursAgo => 'Timmar sedan';
	@override String daysAgo({required Object days}) => '${days} dagar sedan';
	@override String get weeksAgo => 'Veckor sedan';
	@override String get thisWeek => 'Denna vecka';
	@override String get lastWeek => 'Förra veckan';
	@override String get thisMonth => 'Denna månad';
	@override String get lastMonth => 'Förra månaden';
	@override String get thisYear => 'Detta år';
	@override String get lastYear => 'Förra året';
	@override String daysAhead({required Object days}) => 'Om ${days} dagar';
}

// Path: common.weekdays
class TranslationsCommonWeekdaysSv extends TranslationsCommonWeekdaysEn {
	TranslationsCommonWeekdaysSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonWeekdaysFullSv full = TranslationsCommonWeekdaysFullSv._(_root);
	@override late final TranslationsCommonWeekdaysShortSv short = TranslationsCommonWeekdaysShortSv._(_root);
}

// Path: common.formRestrictions
class TranslationsCommonFormRestrictionsSv extends TranslationsCommonFormRestrictionsEn {
	TranslationsCommonFormRestrictionsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get required => 'Detta fält är obligatoriskt.';
	@override String minLength({required Object min}) => 'Minimilängd är ${min} tecken.';
	@override String maxLength({required Object max}) => 'Maxlängd är ${max} tecken.';
	@override String get invalidFormat => 'Formatet är ogiltigt.';
	@override String pattern({required Object pattern}) => 'Detta fält måste följa mönstret ${pattern}.';
}

// Path: common.tos
class TranslationsCommonTosSv extends TranslationsCommonTosEn {
	TranslationsCommonTosSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Jag accepterar Användarvillkoren';
	@override String get readAccept => 'Läs och acceptera våra Användarvillkor';
	@override String get title => 'Användarvillkor';
	@override String get service => 'Tjänstvillkor';
	@override String get privacy => 'Integritetspolicy';
	@override String get continueAgree => 'Genom att fortsätta godkänner du våra Användarvillkor';
	@override String get mustAccept => 'Du måste acceptera Användarvillkoren för att fortsätta';
	@override String get view => 'Visa Användarvillkor';
	@override String lastUpdated({required Object date}) => 'Senast uppdaterad: ${date}';
	@override String get contactInfo => 'Kontakta oss för mer information om våra Användarvillkor';
}

// Path: common.permissions
class TranslationsCommonPermissionsSv extends TranslationsCommonPermissionsEn {
	TranslationsCommonPermissionsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get allowLocation => 'Tillåt åtkomst till plats?';
	@override String get allowCamera => 'Tillåt åtkomst till kamera?';
	@override String get allowMicrophone => 'Tillåt åtkomst till mikrofon?';
	@override String get allowNotifications => 'Tillåt notifieringar?';
	@override String get allowContacts => 'Tillåt åtkomst till kontakter?';
	@override String get allowPhotos => 'Tillåt åtkomst till foton?';
	@override String get allowStorage => 'Tillåt åtkomst till lagring?';
	@override String get allowBluetooth => 'Tillåt Bluetooth-åtkomst?';
	@override String get needPermission => 'Vi behöver din tillåtelse för att fortsätta';
	@override String get permissionDenied => 'Tillstånd nekat';
	@override String get permissionRequired => 'Detta tillstånd krävs';
	@override String get enableInSettings => 'Aktivera i Inställningar';
}

// Path: common.prompts
class TranslationsCommonPromptsSv extends TranslationsCommonPromptsEn {
	TranslationsCommonPromptsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get sessionExpired => 'Din session har löpt ut';
	@override String get areYouSure => 'Är du säker?';
	@override String get cannotBeUndone => 'Denna åtgärd kan inte ångras';
	@override String get unsavedChanges => 'Du har osparade ändringar';
	@override String get discardChanges => 'Kassera ändringar?';
	@override String get locationDisabled => 'Platstjänster är inaktiverade';
	@override String get networkRequired => 'Nätverksanslutning krävs';
	@override String get loginRequired => 'Inloggning krävs för att fortsätta';
	@override String get confirmDelete => 'Är du säker på att du vill ta bort detta?';
	@override String get confirmLogout => 'Är du säker på att du vill logga ut?';
	@override String get saveBeforeExit => 'Vill du spara innan du avslutar?';
	@override String get reloadPage => 'Vill du ladda om sidan?';
	@override String get updateAvailable => 'En uppdatering är tillgänglig';
	@override String get restartRequired => 'Omstart krävs för att tillämpa ändringar';
}

// Path: login.message
class TranslationsLoginMessageSv extends TranslationsLoginMessageEn {
	TranslationsLoginMessageSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get success => 'Inloggning lyckades.';
	@override String get error => 'Inloggning misslyckades. Försök igen.';
	@override String get wrongPassword => 'Verifiera dina uppgifter.';
}

// Path: login.form
class TranslationsLoginFormSv extends TranslationsLoginFormEn {
	TranslationsLoginFormSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get username => 'Användarnamn';
	@override String get password => 'Lösenord';
	@override String get submit => 'Logga in';
	@override String get createAccount => 'Skapa nytt konto';
	@override String get forgotPassword => 'Glömt lösenord';
}

// Path: login.tooltip
class TranslationsLoginTooltipSv extends TranslationsLoginTooltipEn {
	TranslationsLoginTooltipSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get username => 'Ange ditt användarnamn';
	@override String get password => 'Ange ditt lösenord';
	@override String get submit => 'Klicka för att logga in';
}

// Path: login.validation
class TranslationsLoginValidationSv extends TranslationsLoginValidationEn {
	TranslationsLoginValidationSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginValidationUsernameSv username = TranslationsLoginValidationUsernameSv._(_root);
	@override late final TranslationsLoginValidationPasswordSv password = TranslationsLoginValidationPasswordSv._(_root);
}

// Path: register.message
class TranslationsRegisterMessageSv extends TranslationsRegisterMessageEn {
	TranslationsRegisterMessageSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get success => 'Registrering lyckades.';
	@override String get error => 'Registrering misslyckades. Försök igen.';
}

// Path: register.form
class TranslationsRegisterFormSv extends TranslationsRegisterFormEn {
	TranslationsRegisterFormSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get username => 'Användarnamn';
	@override String get email => 'E-post';
	@override String get password => 'Lösenord';
	@override String get submit => 'Registrera';
	@override String get acceptTos => 'Jag accepterar Tjänstvillkoren';
}

// Path: register.tooltip
class TranslationsRegisterTooltipSv extends TranslationsRegisterTooltipEn {
	TranslationsRegisterTooltipSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get username => 'Ange ditt användarnamn';
	@override String get email => 'Ange din e-post';
	@override String get password => 'Ange ditt lösenord';
	@override String get submit => 'Klicka för att registrera';
}

// Path: register.validation
class TranslationsRegisterValidationSv extends TranslationsRegisterValidationEn {
	TranslationsRegisterValidationSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterValidationUsernameSv username = TranslationsRegisterValidationUsernameSv._(_root);
	@override late final TranslationsRegisterValidationEmailSv email = TranslationsRegisterValidationEmailSv._(_root);
	@override late final TranslationsRegisterValidationPasswordSv password = TranslationsRegisterValidationPasswordSv._(_root);
}

// Path: passwordReset.message
class TranslationsPasswordResetMessageSv extends TranslationsPasswordResetMessageEn {
	TranslationsPasswordResetMessageSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get success => 'E-post för lösenordsåterställning skickad.';
	@override String get error => 'Lösenordsåterställning misslyckades. Försök igen.';
}

// Path: passwordReset.form
class TranslationsPasswordResetFormSv extends TranslationsPasswordResetFormEn {
	TranslationsPasswordResetFormSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get email => 'E-post';
	@override String get submit => 'Återställ Lösenord';
}

// Path: passwordReset.tooltip
class TranslationsPasswordResetTooltipSv extends TranslationsPasswordResetTooltipEn {
	TranslationsPasswordResetTooltipSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get email => 'Ange din e-post';
	@override String get submit => 'Klicka för att återställa lösenord';
}

// Path: passwordReset.validation
class TranslationsPasswordResetValidationSv extends TranslationsPasswordResetValidationEn {
	TranslationsPasswordResetValidationSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetValidationEmailSv email = TranslationsPasswordResetValidationEmailSv._(_root);
}

// Path: common.units.length
class TranslationsCommonUnitsLengthSv extends TranslationsCommonUnitsLengthEn {
	TranslationsCommonUnitsLengthSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get kilometer => 'Kilometer';
	@override String get meter => 'Meter';
	@override String get centimeter => 'Centimeter';
	@override String get millimeter => 'Millimeter';
	@override String get micrometer => 'Mikrometer';
	@override String get nanometer => 'Nanometer';
}

// Path: common.units.weight
class TranslationsCommonUnitsWeightSv extends TranslationsCommonUnitsWeightEn {
	TranslationsCommonUnitsWeightSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get kilogram => 'Kilogram';
	@override String get gram => 'Gram';
	@override String get milligram => 'Milligram';
	@override String get ton => 'Ton';
}

// Path: common.units.volume
class TranslationsCommonUnitsVolumeSv extends TranslationsCommonUnitsVolumeEn {
	TranslationsCommonUnitsVolumeSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get liter => 'Liter';
	@override String get milliliter => 'Milliliter';
	@override String get cubicMeter => 'Kubikmeter';
}

// Path: common.units.time
class TranslationsCommonUnitsTimeSv extends TranslationsCommonUnitsTimeEn {
	TranslationsCommonUnitsTimeSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get second => 'Sekund';
	@override String get minute => 'Minut';
	@override String get hour => 'Timme';
	@override String get day => 'Dag';
	@override String get week => 'Vecka';
	@override String get month => 'Månad';
	@override String get year => 'År';
}

// Path: common.units.area
class TranslationsCommonUnitsAreaSv extends TranslationsCommonUnitsAreaEn {
	TranslationsCommonUnitsAreaSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get squareMeter => 'Kvadratmeter';
	@override String get hectare => 'Hektar';
	@override String get acre => 'Acre';
}

// Path: common.weekdays.full
class TranslationsCommonWeekdaysFullSv extends TranslationsCommonWeekdaysFullEn {
	TranslationsCommonWeekdaysFullSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get sunday => 'Söndag';
	@override String get monday => 'Måndag';
	@override String get tuesday => 'Tisdag';
	@override String get wednesday => 'Onsdag';
	@override String get thursday => 'Torsdag';
	@override String get friday => 'Fredag';
	@override String get saturday => 'Lördag';
}

// Path: common.weekdays.short
class TranslationsCommonWeekdaysShortSv extends TranslationsCommonWeekdaysShortEn {
	TranslationsCommonWeekdaysShortSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get sunday => 'Sön';
	@override String get monday => 'Mån';
	@override String get tuesday => 'Tis';
	@override String get wednesday => 'Ons';
	@override String get thursday => 'Tor';
	@override String get friday => 'Fre';
	@override String get saturday => 'Lör';
}

// Path: login.validation.username
class TranslationsLoginValidationUsernameSv extends TranslationsLoginValidationUsernameEn {
	TranslationsLoginValidationUsernameSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get required => 'Användarnamn krävs.';
}

// Path: login.validation.password
class TranslationsLoginValidationPasswordSv extends TranslationsLoginValidationPasswordEn {
	TranslationsLoginValidationPasswordSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get required => 'Lösenord krävs.';
}

// Path: register.validation.username
class TranslationsRegisterValidationUsernameSv extends TranslationsRegisterValidationUsernameEn {
	TranslationsRegisterValidationUsernameSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get required => 'Användarnamn krävs.';
	@override String minLength({required Object min}) => 'Användarnamn måste vara minst ${min} tecken långt.';
	@override String maxLength({required Object max}) => 'Användarnamn får vara högst ${max} tecken långt.';
}

// Path: register.validation.email
class TranslationsRegisterValidationEmailSv extends TranslationsRegisterValidationEmailEn {
	TranslationsRegisterValidationEmailSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get required => 'E-post krävs.';
	@override String get invalid => 'E-post är inte giltig.';
}

// Path: register.validation.password
class TranslationsRegisterValidationPasswordSv extends TranslationsRegisterValidationPasswordEn {
	TranslationsRegisterValidationPasswordSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get required => 'Lösenord krävs.';
	@override String minLength({required Object min}) => 'Lösenord måste vara minst ${min} tecken långt.';
}

// Path: passwordReset.validation.email
class TranslationsPasswordResetValidationEmailSv extends TranslationsPasswordResetValidationEmailEn {
	TranslationsPasswordResetValidationEmailSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get required => 'E-post krävs.';
	@override String get invalid => 'E-post är inte giltig.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsSv {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.message.loading': return 'Laddar';
			case 'common.message.somethingWentWrong': return 'Något gick fel';
			case 'common.message.networkProblem': return 'Det finns ett nätverksproblem';
			case 'common.message.noDataFound': return 'Ingen data hittades';
			case 'common.message.noResultsFound': return 'Inga resultat hittades';
			case 'common.message.unsupportedFileType': return 'Filtyp som inte stöds';
			case 'common.message.fileTooLarge': return 'Filen är för stor';
			case 'common.message.operationTimedOut': return 'Operationen tog för lång tid';
			case 'common.message.sessionExpired': return 'Sessionen har löpt ut';
			case 'common.message.unsavableChanges': return 'Ändringar kunde inte sparas';
			case 'common.message.noServerConnect': return 'Kunde inte ansluta till servern';
			case 'common.message.accessDenied': return 'Åtkomst nekad';
			case 'common.game.start': return 'Starta Spel';
			case 'common.game.pause': return 'Pausa Spel';
			case 'common.game.resume': return 'Återuppta Spel';
			case 'common.game.end': return 'Avsluta Spel';
			case 'common.game.levelUp': return 'Nivå Upp';
			case 'common.game.gameOver': return 'Spel Slut';
			case 'common.game.nextLevel': return 'Nästa Nivå';
			case 'common.game.previousLevel': return 'Föregående Nivå';
			case 'common.game.restart': return 'Starta Om Spel';
			case 'common.social.like': return 'Gilla';
			case 'common.social.share': return 'Dela';
			case 'common.social.comment': return 'Kommentera';
			case 'common.social.follow': return 'Följ';
			case 'common.social.unfollow': return 'Sluta följa';
			case 'common.social.unlike': return 'Ogilla';
			case 'common.social.reply': return 'Svara';
			case 'common.social.dislike': return 'Ogilla';
			case 'common.social.block': return 'Blockera';
			case 'common.social.blockUser': return 'Blockera Användare';
			case 'common.social.report': return 'Rapportera';
			case 'common.social.mute': return 'Tysta';
			case 'common.social.uSentFriendRequest': return 'Du skickade en vänförfrågan';
			case 'common.social.uReceivedFriendRequest': return 'Du fick en vänförfrågan';
			case 'common.social.sentFriendRequest': return 'skickade en vänförfrågan';
			case 'common.social.receivedFriendRequest': return 'fick en vänförfrågan';
			case 'common.social.acceptedFriendRequest': return 'accepterade en vänförfrågan';
			case 'common.social.uAcceptedFriendRequest': return 'Du accepterade en vänförfrågan';
			case 'common.views.list': return 'Lista';
			case 'common.views.grid': return 'Rutnät';
			case 'common.views.table': return 'Tabell';
			case 'common.views.form': return 'Formulär';
			case 'common.units.length.kilometer': return 'Kilometer';
			case 'common.units.length.meter': return 'Meter';
			case 'common.units.length.centimeter': return 'Centimeter';
			case 'common.units.length.millimeter': return 'Millimeter';
			case 'common.units.length.micrometer': return 'Mikrometer';
			case 'common.units.length.nanometer': return 'Nanometer';
			case 'common.units.weight.kilogram': return 'Kilogram';
			case 'common.units.weight.gram': return 'Gram';
			case 'common.units.weight.milligram': return 'Milligram';
			case 'common.units.weight.ton': return 'Ton';
			case 'common.units.volume.liter': return 'Liter';
			case 'common.units.volume.milliliter': return 'Milliliter';
			case 'common.units.volume.cubicMeter': return 'Kubikmeter';
			case 'common.units.time.second': return 'Sekund';
			case 'common.units.time.minute': return 'Minut';
			case 'common.units.time.hour': return 'Timme';
			case 'common.units.time.day': return 'Dag';
			case 'common.units.time.week': return 'Vecka';
			case 'common.units.time.month': return 'Månad';
			case 'common.units.time.year': return 'År';
			case 'common.units.area.squareMeter': return 'Kvadratmeter';
			case 'common.units.area.hectare': return 'Hektar';
			case 'common.units.area.acre': return 'Acre';
			case 'common.numbers.k1': return 'Ett';
			case 'common.numbers.k2': return 'Två';
			case 'common.numbers.k3': return 'Tre';
			case 'common.numbers.k4': return 'Fyra';
			case 'common.numbers.k5': return 'Fem';
			case 'common.numbers.k6': return 'Sex';
			case 'common.numbers.k7': return 'Sju';
			case 'common.numbers.k8': return 'Åtta';
			case 'common.numbers.k9': return 'Nio';
			case 'common.numbers.k10': return 'Tio';
			case 'common.ranks.k1': return 'första';
			case 'common.ranks.k2': return 'andra';
			case 'common.ranks.k3': return 'tredje';
			case 'common.ranks.k4': return 'fjärde';
			case 'common.ranks.k5': return 'femte';
			case 'common.ranks.k6': return 'sjätte';
			case 'common.ranks.k7': return 'sjunde';
			case 'common.ranks.k8': return 'åttonde';
			case 'common.ranks.k9': return 'nionde';
			case 'common.ranks.k10': return 'tionde';
			case 'common.control.on': return 'På';
			case 'common.control.off': return 'Av';
			case 'common.control.yes': return 'Ja';
			case 'common.control.no': return 'Nej';
			case 'common.control.confirm': return 'Bekräfta';
			case 'common.control.cancel': return 'Avbryt';
			case 'common.control.retry': return 'Försök igen';
			case 'common.control.logout': return 'Logga ut';
			case 'common.control.edit': return 'Redigera';
			case 'common.control.delete': return 'Ta bort';
			case 'common.control.revert': return 'Återställ';
			case 'common.control.save': return 'Spara';
			case 'common.buttons.submit': return 'Skicka';
			case 'common.buttons.close': return 'Stäng';
			case 'common.buttons.reset': return 'Återställ';
			case 'common.buttons.cancel': return 'Avbryt';
			case 'common.buttons.kContinue': return 'Fortsätt';
			case 'common.buttons.back': return 'Tillbaka';
			case 'common.buttons.next': return 'Nästa';
			case 'common.buttons.done': return 'Klar';
			case 'common.buttons.upload': return 'Ladda upp';
			case 'common.buttons.choose': return 'Välj';
			case 'common.buttons.select': return 'Välj';
			case 'common.buttons.clear': return 'Rensa';
			case 'common.buttons.start': return 'Starta';
			case 'common.labels.required': return 'Obligatorisk';
			case 'common.labels.optional': return 'Valfritt';
			case 'common.labels.instructions': return 'Instruktioner:';
			case 'common.labels.status': return 'Status';
			case 'common.labels.progress': return 'Framsteg';
			case 'common.labels.question': return 'Fråga';
			case 'common.labels.answer': return 'Svar';
			case 'common.labels.response': return 'Respons';
			case 'common.labels.loading': return 'Laddar...';
			case 'common.labels.error': return 'Fel';
			case 'common.labels.success': return 'Framgång';
			case 'common.labels.warning': return 'Varning';
			case 'common.response.success': return 'Framgång';
			case 'common.response.error': return 'Fel';
			case 'common.response.info': return 'Information';
			case 'common.response.warning': return 'Varning';
			case 'common.response.tbd': return 'Att Bestämma';
			case 'common.response.wip': return 'Pågående Arbete';
			case 'common.priority.high': return 'Hög';
			case 'common.priority.medium': return 'Medium';
			case 'common.priority.low': return 'Låg';
			case 'common.date.today': return 'Idag';
			case 'common.date.yesterday': return 'Igår';
			case 'common.date.tomorrow': return 'Imorgon';
			case 'common.date.justNow': return 'Just nu';
			case 'common.date.aMomentAgo': return 'För en stund sedan';
			case 'common.date.minutesAgo': return 'Minuter sedan';
			case 'common.date.hoursAgo': return 'Timmar sedan';
			case 'common.date.daysAgo': return ({required Object days}) => '${days} dagar sedan';
			case 'common.date.weeksAgo': return 'Veckor sedan';
			case 'common.date.thisWeek': return 'Denna vecka';
			case 'common.date.lastWeek': return 'Förra veckan';
			case 'common.date.thisMonth': return 'Denna månad';
			case 'common.date.lastMonth': return 'Förra månaden';
			case 'common.date.thisYear': return 'Detta år';
			case 'common.date.lastYear': return 'Förra året';
			case 'common.date.daysAhead': return ({required Object days}) => 'Om ${days} dagar';
			case 'common.weekdays.full.sunday': return 'Söndag';
			case 'common.weekdays.full.monday': return 'Måndag';
			case 'common.weekdays.full.tuesday': return 'Tisdag';
			case 'common.weekdays.full.wednesday': return 'Onsdag';
			case 'common.weekdays.full.thursday': return 'Torsdag';
			case 'common.weekdays.full.friday': return 'Fredag';
			case 'common.weekdays.full.saturday': return 'Lördag';
			case 'common.weekdays.short.sunday': return 'Sön';
			case 'common.weekdays.short.monday': return 'Mån';
			case 'common.weekdays.short.tuesday': return 'Tis';
			case 'common.weekdays.short.wednesday': return 'Ons';
			case 'common.weekdays.short.thursday': return 'Tor';
			case 'common.weekdays.short.friday': return 'Fre';
			case 'common.weekdays.short.saturday': return 'Lör';
			case 'common.formRestrictions.required': return 'Detta fält är obligatoriskt.';
			case 'common.formRestrictions.minLength': return ({required Object min}) => 'Minimilängd är ${min} tecken.';
			case 'common.formRestrictions.maxLength': return ({required Object max}) => 'Maxlängd är ${max} tecken.';
			case 'common.formRestrictions.invalidFormat': return 'Formatet är ogiltigt.';
			case 'common.formRestrictions.pattern': return ({required Object pattern}) => 'Detta fält måste följa mönstret ${pattern}.';
			case 'common.tos.accept': return 'Jag accepterar Användarvillkoren';
			case 'common.tos.readAccept': return 'Läs och acceptera våra Användarvillkor';
			case 'common.tos.title': return 'Användarvillkor';
			case 'common.tos.service': return 'Tjänstvillkor';
			case 'common.tos.privacy': return 'Integritetspolicy';
			case 'common.tos.continueAgree': return 'Genom att fortsätta godkänner du våra Användarvillkor';
			case 'common.tos.mustAccept': return 'Du måste acceptera Användarvillkoren för att fortsätta';
			case 'common.tos.view': return 'Visa Användarvillkor';
			case 'common.tos.lastUpdated': return ({required Object date}) => 'Senast uppdaterad: ${date}';
			case 'common.tos.contactInfo': return 'Kontakta oss för mer information om våra Användarvillkor';
			case 'common.permissions.allowLocation': return 'Tillåt åtkomst till plats?';
			case 'common.permissions.allowCamera': return 'Tillåt åtkomst till kamera?';
			case 'common.permissions.allowMicrophone': return 'Tillåt åtkomst till mikrofon?';
			case 'common.permissions.allowNotifications': return 'Tillåt notifieringar?';
			case 'common.permissions.allowContacts': return 'Tillåt åtkomst till kontakter?';
			case 'common.permissions.allowPhotos': return 'Tillåt åtkomst till foton?';
			case 'common.permissions.allowStorage': return 'Tillåt åtkomst till lagring?';
			case 'common.permissions.allowBluetooth': return 'Tillåt Bluetooth-åtkomst?';
			case 'common.permissions.needPermission': return 'Vi behöver din tillåtelse för att fortsätta';
			case 'common.permissions.permissionDenied': return 'Tillstånd nekat';
			case 'common.permissions.permissionRequired': return 'Detta tillstånd krävs';
			case 'common.permissions.enableInSettings': return 'Aktivera i Inställningar';
			case 'common.prompts.sessionExpired': return 'Din session har löpt ut';
			case 'common.prompts.areYouSure': return 'Är du säker?';
			case 'common.prompts.cannotBeUndone': return 'Denna åtgärd kan inte ångras';
			case 'common.prompts.unsavedChanges': return 'Du har osparade ändringar';
			case 'common.prompts.discardChanges': return 'Kassera ändringar?';
			case 'common.prompts.locationDisabled': return 'Platstjänster är inaktiverade';
			case 'common.prompts.networkRequired': return 'Nätverksanslutning krävs';
			case 'common.prompts.loginRequired': return 'Inloggning krävs för att fortsätta';
			case 'common.prompts.confirmDelete': return 'Är du säker på att du vill ta bort detta?';
			case 'common.prompts.confirmLogout': return 'Är du säker på att du vill logga ut?';
			case 'common.prompts.saveBeforeExit': return 'Vill du spara innan du avslutar?';
			case 'common.prompts.reloadPage': return 'Vill du ladda om sidan?';
			case 'common.prompts.updateAvailable': return 'En uppdatering är tillgänglig';
			case 'common.prompts.restartRequired': return 'Omstart krävs för att tillämpa ändringar';
			case 'login.message.success': return 'Inloggning lyckades.';
			case 'login.message.error': return 'Inloggning misslyckades. Försök igen.';
			case 'login.message.wrongPassword': return 'Verifiera dina uppgifter.';
			case 'login.form.username': return 'Användarnamn';
			case 'login.form.password': return 'Lösenord';
			case 'login.form.submit': return 'Logga in';
			case 'login.form.createAccount': return 'Skapa nytt konto';
			case 'login.form.forgotPassword': return 'Glömt lösenord';
			case 'login.tooltip.username': return 'Ange ditt användarnamn';
			case 'login.tooltip.password': return 'Ange ditt lösenord';
			case 'login.tooltip.submit': return 'Klicka för att logga in';
			case 'login.validation.username.required': return 'Användarnamn krävs.';
			case 'login.validation.password.required': return 'Lösenord krävs.';
			case 'register.message.success': return 'Registrering lyckades.';
			case 'register.message.error': return 'Registrering misslyckades. Försök igen.';
			case 'register.form.username': return 'Användarnamn';
			case 'register.form.email': return 'E-post';
			case 'register.form.password': return 'Lösenord';
			case 'register.form.submit': return 'Registrera';
			case 'register.form.acceptTos': return 'Jag accepterar Tjänstvillkoren';
			case 'register.tooltip.username': return 'Ange ditt användarnamn';
			case 'register.tooltip.email': return 'Ange din e-post';
			case 'register.tooltip.password': return 'Ange ditt lösenord';
			case 'register.tooltip.submit': return 'Klicka för att registrera';
			case 'register.validation.username.required': return 'Användarnamn krävs.';
			case 'register.validation.username.minLength': return ({required Object min}) => 'Användarnamn måste vara minst ${min} tecken långt.';
			case 'register.validation.username.maxLength': return ({required Object max}) => 'Användarnamn får vara högst ${max} tecken långt.';
			case 'register.validation.email.required': return 'E-post krävs.';
			case 'register.validation.email.invalid': return 'E-post är inte giltig.';
			case 'register.validation.password.required': return 'Lösenord krävs.';
			case 'register.validation.password.minLength': return ({required Object min}) => 'Lösenord måste vara minst ${min} tecken långt.';
			case 'passwordReset.message.success': return 'E-post för lösenordsåterställning skickad.';
			case 'passwordReset.message.error': return 'Lösenordsåterställning misslyckades. Försök igen.';
			case 'passwordReset.form.email': return 'E-post';
			case 'passwordReset.form.submit': return 'Återställ Lösenord';
			case 'passwordReset.tooltip.email': return 'Ange din e-post';
			case 'passwordReset.tooltip.submit': return 'Klicka för att återställa lösenord';
			case 'passwordReset.validation.email.required': return 'E-post krävs.';
			case 'passwordReset.validation.email.invalid': return 'E-post är inte giltig.';
			default: return null;
		}
	}
}

