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
class TranslationsDa extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsDa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.da,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <da>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsDa _root = this; // ignore: unused_field

	@override 
	TranslationsDa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDa(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsCommonDa common = TranslationsCommonDa._(_root);
	@override late final TranslationsLoginDa login = TranslationsLoginDa._(_root);
	@override late final TranslationsRegisterDa register = TranslationsRegisterDa._(_root);
	@override late final TranslationsPasswordResetDa passwordReset = TranslationsPasswordResetDa._(_root);
}

// Path: common
class TranslationsCommonDa extends TranslationsCommonEn {
	TranslationsCommonDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMessageDa message = TranslationsCommonMessageDa._(_root);
	@override late final TranslationsCommonGameDa game = TranslationsCommonGameDa._(_root);
	@override late final TranslationsCommonSocialDa social = TranslationsCommonSocialDa._(_root);
	@override late final TranslationsCommonViewsDa views = TranslationsCommonViewsDa._(_root);
	@override late final TranslationsCommonUnitsDa units = TranslationsCommonUnitsDa._(_root);
	@override late final TranslationsCommonNumbersDa numbers = TranslationsCommonNumbersDa._(_root);
	@override late final TranslationsCommonRanksDa ranks = TranslationsCommonRanksDa._(_root);
	@override late final TranslationsCommonControlDa control = TranslationsCommonControlDa._(_root);
	@override late final TranslationsCommonButtonsDa buttons = TranslationsCommonButtonsDa._(_root);
	@override late final TranslationsCommonLabelsDa labels = TranslationsCommonLabelsDa._(_root);
	@override late final TranslationsCommonResponseDa response = TranslationsCommonResponseDa._(_root);
	@override late final TranslationsCommonPriorityDa priority = TranslationsCommonPriorityDa._(_root);
	@override late final TranslationsCommonDateDa date = TranslationsCommonDateDa._(_root);
	@override late final TranslationsCommonWeekdaysDa weekdays = TranslationsCommonWeekdaysDa._(_root);
	@override late final TranslationsCommonFormRestrictionsDa formRestrictions = TranslationsCommonFormRestrictionsDa._(_root);
	@override late final TranslationsCommonTosDa tos = TranslationsCommonTosDa._(_root);
	@override late final TranslationsCommonPermissionsDa permissions = TranslationsCommonPermissionsDa._(_root);
	@override late final TranslationsCommonPromptsDa prompts = TranslationsCommonPromptsDa._(_root);
}

// Path: login
class TranslationsLoginDa extends TranslationsLoginEn {
	TranslationsLoginDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginMessageDa message = TranslationsLoginMessageDa._(_root);
	@override late final TranslationsLoginFormDa form = TranslationsLoginFormDa._(_root);
	@override late final TranslationsLoginTooltipDa tooltip = TranslationsLoginTooltipDa._(_root);
	@override late final TranslationsLoginValidationDa validation = TranslationsLoginValidationDa._(_root);
}

// Path: register
class TranslationsRegisterDa extends TranslationsRegisterEn {
	TranslationsRegisterDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterMessageDa message = TranslationsRegisterMessageDa._(_root);
	@override late final TranslationsRegisterFormDa form = TranslationsRegisterFormDa._(_root);
	@override late final TranslationsRegisterTooltipDa tooltip = TranslationsRegisterTooltipDa._(_root);
	@override late final TranslationsRegisterValidationDa validation = TranslationsRegisterValidationDa._(_root);
}

// Path: passwordReset
class TranslationsPasswordResetDa extends TranslationsPasswordResetEn {
	TranslationsPasswordResetDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetMessageDa message = TranslationsPasswordResetMessageDa._(_root);
	@override late final TranslationsPasswordResetFormDa form = TranslationsPasswordResetFormDa._(_root);
	@override late final TranslationsPasswordResetTooltipDa tooltip = TranslationsPasswordResetTooltipDa._(_root);
	@override late final TranslationsPasswordResetValidationDa validation = TranslationsPasswordResetValidationDa._(_root);
}

// Path: common.message
class TranslationsCommonMessageDa extends TranslationsCommonMessageEn {
	TranslationsCommonMessageDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get loading => 'Indlæser';
	@override String get somethingWentWrong => 'Noget gik galt';
	@override String get networkProblem => 'Der er et netværksproblem';
	@override String get noDataFound => 'Ingen data fundet';
	@override String get noResultsFound => 'Ingen resultater fundet';
	@override String get unsupportedFileType => 'Ikke-understøttet filtype';
	@override String get fileTooLarge => 'Filen er for stor';
	@override String get operationTimedOut => 'Operationen fik timeout';
	@override String get sessionExpired => 'Sessionen er udløbet';
	@override String get unsavableChanges => 'Ændringerne kunne ikke gemmes';
	@override String get noServerConnect => 'Kunne ikke oprette forbindelse til serveren';
	@override String get accessDenied => 'Adgang nægtet';
}

// Path: common.game
class TranslationsCommonGameDa extends TranslationsCommonGameEn {
	TranslationsCommonGameDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get start => 'Start Spil';
	@override String get pause => 'Pause Spil';
	@override String get resume => 'Genoptag Spil';
	@override String get end => 'Afslut Spil';
	@override String get levelUp => 'Niveau Op';
	@override String get gameOver => 'Spil Slut';
	@override String get nextLevel => 'Næste Niveau';
	@override String get previousLevel => 'Forrige Niveau';
	@override String get restart => 'Genstart Spil';
}

// Path: common.social
class TranslationsCommonSocialDa extends TranslationsCommonSocialEn {
	TranslationsCommonSocialDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get like => 'Synes godt om';
	@override String get share => 'Del';
	@override String get comment => 'Kommentér';
	@override String get follow => 'Følg';
	@override String get unfollow => 'Stop med at følge';
	@override String get unlike => 'Synes ikke om';
	@override String get reply => 'Svar';
	@override String get dislike => 'Synes ikke om';
	@override String get block => 'Blokér';
	@override String get blockUser => 'Blokér Bruger';
	@override String get report => 'Rapportér';
	@override String get mute => 'Slå fra';
	@override String get uSentFriendRequest => 'Du sendte en venneanmodning';
	@override String get uReceivedFriendRequest => 'Du modtog en venneanmodning';
	@override String get sentFriendRequest => 'sendte en venneanmodning';
	@override String get receivedFriendRequest => 'modtog en venneanmodning';
	@override String get acceptedFriendRequest => 'accepterede en venneanmodning';
	@override String get uAcceptedFriendRequest => 'Du accepterede en venneanmodning';
}

// Path: common.views
class TranslationsCommonViewsDa extends TranslationsCommonViewsEn {
	TranslationsCommonViewsDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get list => 'Liste';
	@override String get grid => 'Gitter';
	@override String get table => 'Tabel';
	@override String get form => 'Formular';
}

// Path: common.units
class TranslationsCommonUnitsDa extends TranslationsCommonUnitsEn {
	TranslationsCommonUnitsDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonUnitsLengthDa length = TranslationsCommonUnitsLengthDa._(_root);
	@override late final TranslationsCommonUnitsWeightDa weight = TranslationsCommonUnitsWeightDa._(_root);
	@override late final TranslationsCommonUnitsVolumeDa volume = TranslationsCommonUnitsVolumeDa._(_root);
	@override late final TranslationsCommonUnitsTimeDa time = TranslationsCommonUnitsTimeDa._(_root);
	@override late final TranslationsCommonUnitsAreaDa area = TranslationsCommonUnitsAreaDa._(_root);
}

// Path: common.numbers
class TranslationsCommonNumbersDa extends TranslationsCommonNumbersEn {
	TranslationsCommonNumbersDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'En';
	@override String get k2 => 'To';
	@override String get k3 => 'Tre';
	@override String get k4 => 'Fire';
	@override String get k5 => 'Fem';
	@override String get k6 => 'Seks';
	@override String get k7 => 'Syv';
	@override String get k8 => 'Otte';
	@override String get k9 => 'Ni';
	@override String get k10 => 'Ti';
}

// Path: common.ranks
class TranslationsCommonRanksDa extends TranslationsCommonRanksEn {
	TranslationsCommonRanksDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'første';
	@override String get k2 => 'anden';
	@override String get k3 => 'tredje';
	@override String get k4 => 'fjerde';
	@override String get k5 => 'femte';
	@override String get k6 => 'sjette';
	@override String get k7 => 'syvende';
	@override String get k8 => 'ottende';
	@override String get k9 => 'niende';
	@override String get k10 => 'tiende';
}

// Path: common.control
class TranslationsCommonControlDa extends TranslationsCommonControlEn {
	TranslationsCommonControlDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get on => 'Til';
	@override String get off => 'Fra';
	@override String get yes => 'Ja';
	@override String get no => 'Nej';
	@override String get confirm => 'Bekræft';
	@override String get cancel => 'Annuller';
	@override String get retry => 'Prøv igen';
	@override String get logout => 'Log ud';
	@override String get edit => 'Rediger';
	@override String get delete => 'Slet';
	@override String get revert => 'Fortryd';
	@override String get save => 'Gem';
}

// Path: common.buttons
class TranslationsCommonButtonsDa extends TranslationsCommonButtonsEn {
	TranslationsCommonButtonsDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get submit => 'Send';
	@override String get close => 'Luk';
	@override String get reset => 'Nulstil';
	@override String get cancel => 'Annuller';
	@override String get kContinue => 'Fortsæt';
	@override String get back => 'Tilbage';
	@override String get next => 'Næste';
	@override String get done => 'Færdig';
	@override String get upload => 'Upload';
	@override String get choose => 'Vælg';
	@override String get select => 'Vælg';
	@override String get clear => 'Ryd';
}

// Path: common.labels
class TranslationsCommonLabelsDa extends TranslationsCommonLabelsEn {
	TranslationsCommonLabelsDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get required => 'Påkrævet';
	@override String get optional => 'Valgfrit';
	@override String get instructions => 'Instruktioner:';
	@override String get status => 'Status';
	@override String get progress => 'Fremskridt';
	@override String get question => 'Spørgsmål';
	@override String get answer => 'Svar';
	@override String get response => 'Respons';
	@override String get loading => 'Indlæser...';
	@override String get error => 'Fejl';
	@override String get success => 'Succes';
	@override String get warning => 'Advarsel';
}

// Path: common.response
class TranslationsCommonResponseDa extends TranslationsCommonResponseEn {
	TranslationsCommonResponseDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get success => 'Succes';
	@override String get error => 'Fejl';
	@override String get info => 'Information';
	@override String get warning => 'Advarsel';
	@override String get tbd => 'Skal Bestemmes';
	@override String get wip => 'Arbejde i Gang';
}

// Path: common.priority
class TranslationsCommonPriorityDa extends TranslationsCommonPriorityEn {
	TranslationsCommonPriorityDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get high => 'Høj';
	@override String get medium => 'Mellem';
	@override String get low => 'Lav';
}

// Path: common.date
class TranslationsCommonDateDa extends TranslationsCommonDateEn {
	TranslationsCommonDateDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get today => 'I dag';
	@override String get yesterday => 'I går';
	@override String get tomorrow => 'I morgen';
	@override String get justNow => 'Lige nu';
	@override String get aMomentAgo => 'Et øjeblik siden';
	@override String get minutesAgo => 'Minutter siden';
	@override String get hoursAgo => 'Timer siden';
	@override String daysAgo({required Object days}) => '${days} dage siden';
	@override String get weeksAgo => 'Uger siden';
	@override String get thisWeek => 'Denne uge';
	@override String get lastWeek => 'Sidste uge';
	@override String get thisMonth => 'Denne måned';
	@override String get lastMonth => 'Sidste måned';
	@override String get thisYear => 'Dette år';
	@override String get lastYear => 'Sidste år';
	@override String daysAhead({required Object days}) => 'Om ${days} dage';
}

// Path: common.weekdays
class TranslationsCommonWeekdaysDa extends TranslationsCommonWeekdaysEn {
	TranslationsCommonWeekdaysDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonWeekdaysFullDa full = TranslationsCommonWeekdaysFullDa._(_root);
	@override late final TranslationsCommonWeekdaysShortDa short = TranslationsCommonWeekdaysShortDa._(_root);
}

// Path: common.formRestrictions
class TranslationsCommonFormRestrictionsDa extends TranslationsCommonFormRestrictionsEn {
	TranslationsCommonFormRestrictionsDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get required => 'Dette felt er påkrævet.';
	@override String minLength({required Object min}) => 'Minimum længde er ${min} tegn.';
	@override String maxLength({required Object max}) => 'Maksimum længde er ${max} tegn.';
	@override String get invalidFormat => 'Formatet er ugyldigt.';
	@override String pattern({required Object pattern}) => 'Dette felt skal følge mønsteret ${pattern}.';
}

// Path: common.tos
class TranslationsCommonTosDa extends TranslationsCommonTosEn {
	TranslationsCommonTosDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Jeg accepterer Vilkår og Betingelser';
	@override String get readAccept => 'Læs og accepter venligst vores Vilkår og Betingelser';
	@override String get title => 'Vilkår og Betingelser';
	@override String get service => 'Servicevilkår';
	@override String get privacy => 'Privatlivspolitik';
	@override String get continueAgree => 'Ved at fortsætte accepterer du vores Vilkår og Betingelser';
	@override String get mustAccept => 'Du skal acceptere Vilkår og Betingelser for at fortsætte';
	@override String get view => 'Se Vilkår og Betingelser';
	@override String lastUpdated({required Object date}) => 'Sidst opdateret: ${date}';
	@override String get contactInfo => 'Kontakt os for mere information om vores Vilkår og Betingelser';
}

// Path: common.permissions
class TranslationsCommonPermissionsDa extends TranslationsCommonPermissionsEn {
	TranslationsCommonPermissionsDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get allowLocation => 'Tillad adgang til placering?';
	@override String get allowCamera => 'Tillad adgang til kamera?';
	@override String get allowMicrophone => 'Tillad adgang til mikrofon?';
	@override String get allowNotifications => 'Tillad notifikationer?';
	@override String get allowContacts => 'Tillad adgang til kontakter?';
	@override String get allowPhotos => 'Tillad adgang til billeder?';
	@override String get allowStorage => 'Tillad adgang til lager?';
	@override String get allowBluetooth => 'Tillad Bluetooth adgang?';
	@override String get needPermission => 'Vi har brug for din tilladelse for at fortsætte';
	@override String get permissionDenied => 'Tilladelse nægtet';
	@override String get permissionRequired => 'Denne tilladelse er påkrævet';
	@override String get enableInSettings => 'Aktivér venligst i Indstillinger';
}

// Path: common.prompts
class TranslationsCommonPromptsDa extends TranslationsCommonPromptsEn {
	TranslationsCommonPromptsDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get sessionExpired => 'Din session er udløbet';
	@override String get areYouSure => 'Er du sikker?';
	@override String get cannotBeUndone => 'Denne handling kan ikke fortrydes';
	@override String get unsavedChanges => 'Du har ikke-gemte ændringer';
	@override String get discardChanges => 'Kassér ændringer?';
	@override String get locationDisabled => 'Placeringstjenester er deaktiveret';
	@override String get networkRequired => 'Netværksforbindelse påkrævet';
	@override String get loginRequired => 'Login påkrævet for at fortsætte';
	@override String get confirmDelete => 'Er du sikker på, at du vil slette dette?';
	@override String get confirmLogout => 'Er du sikker på, at du vil logge ud?';
	@override String get saveBeforeExit => 'Vil du gemme før du forlader?';
	@override String get reloadPage => 'Vil du genindlæse siden?';
	@override String get updateAvailable => 'En opdatering er tilgængelig';
	@override String get restartRequired => 'Genstart påkrævet for at anvende ændringer';
}

// Path: login.message
class TranslationsLoginMessageDa extends TranslationsLoginMessageEn {
	TranslationsLoginMessageDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get success => 'Login vellykket.';
	@override String get error => 'Login fejlede. Prøv venligst igen.';
	@override String get wrongPassword => 'Verificer venligst dine legitimationsoplysninger.';
}

// Path: login.form
class TranslationsLoginFormDa extends TranslationsLoginFormEn {
	TranslationsLoginFormDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get username => 'Brugernavn';
	@override String get password => 'Adgangskode';
	@override String get submit => 'Log ind';
	@override String get createAccount => 'Opret ny konto';
	@override String get forgotPassword => 'Glemt adgangskode';
}

// Path: login.tooltip
class TranslationsLoginTooltipDa extends TranslationsLoginTooltipEn {
	TranslationsLoginTooltipDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get username => 'Indtast dit brugernavn';
	@override String get password => 'Indtast din adgangskode';
	@override String get submit => 'Klik for at logge ind';
}

// Path: login.validation
class TranslationsLoginValidationDa extends TranslationsLoginValidationEn {
	TranslationsLoginValidationDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginValidationUsernameDa username = TranslationsLoginValidationUsernameDa._(_root);
	@override late final TranslationsLoginValidationPasswordDa password = TranslationsLoginValidationPasswordDa._(_root);
}

// Path: register.message
class TranslationsRegisterMessageDa extends TranslationsRegisterMessageEn {
	TranslationsRegisterMessageDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get success => 'Registrering vellykket.';
	@override String get error => 'Registrering fejlede. Prøv venligst igen.';
}

// Path: register.form
class TranslationsRegisterFormDa extends TranslationsRegisterFormEn {
	TranslationsRegisterFormDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get username => 'Brugernavn';
	@override String get email => 'E-mail';
	@override String get password => 'Adgangskode';
	@override String get submit => 'Registrer';
	@override String get acceptTos => 'Jeg accepterer Servicevilkårene';
}

// Path: register.tooltip
class TranslationsRegisterTooltipDa extends TranslationsRegisterTooltipEn {
	TranslationsRegisterTooltipDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get username => 'Indtast dit brugernavn';
	@override String get email => 'Indtast din e-mail';
	@override String get password => 'Indtast din adgangskode';
	@override String get submit => 'Klik for at registrere';
}

// Path: register.validation
class TranslationsRegisterValidationDa extends TranslationsRegisterValidationEn {
	TranslationsRegisterValidationDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterValidationUsernameDa username = TranslationsRegisterValidationUsernameDa._(_root);
	@override late final TranslationsRegisterValidationEmailDa email = TranslationsRegisterValidationEmailDa._(_root);
	@override late final TranslationsRegisterValidationPasswordDa password = TranslationsRegisterValidationPasswordDa._(_root);
}

// Path: passwordReset.message
class TranslationsPasswordResetMessageDa extends TranslationsPasswordResetMessageEn {
	TranslationsPasswordResetMessageDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get success => 'E-mail til nulstilling af adgangskode sendt.';
	@override String get error => 'Nulstilling af adgangskode fejlede. Prøv venligst igen.';
}

// Path: passwordReset.form
class TranslationsPasswordResetFormDa extends TranslationsPasswordResetFormEn {
	TranslationsPasswordResetFormDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get email => 'E-mail';
	@override String get submit => 'Nulstil Adgangskode';
}

// Path: passwordReset.tooltip
class TranslationsPasswordResetTooltipDa extends TranslationsPasswordResetTooltipEn {
	TranslationsPasswordResetTooltipDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get email => 'Indtast din e-mail';
	@override String get submit => 'Klik for at nulstille adgangskode';
}

// Path: passwordReset.validation
class TranslationsPasswordResetValidationDa extends TranslationsPasswordResetValidationEn {
	TranslationsPasswordResetValidationDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetValidationEmailDa email = TranslationsPasswordResetValidationEmailDa._(_root);
}

// Path: common.units.length
class TranslationsCommonUnitsLengthDa extends TranslationsCommonUnitsLengthEn {
	TranslationsCommonUnitsLengthDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get kilometer => 'Kilometer';
	@override String get meter => 'Meter';
	@override String get centimeter => 'Centimeter';
	@override String get millimeter => 'Millimeter';
	@override String get micrometer => 'Mikrometer';
	@override String get nanometer => 'Nanometer';
}

// Path: common.units.weight
class TranslationsCommonUnitsWeightDa extends TranslationsCommonUnitsWeightEn {
	TranslationsCommonUnitsWeightDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get kilogram => 'Kilogram';
	@override String get gram => 'Gram';
	@override String get milligram => 'Milligram';
	@override String get ton => 'Ton';
}

// Path: common.units.volume
class TranslationsCommonUnitsVolumeDa extends TranslationsCommonUnitsVolumeEn {
	TranslationsCommonUnitsVolumeDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get liter => 'Liter';
	@override String get milliliter => 'Milliliter';
	@override String get cubicMeter => 'Kubikmeter';
}

// Path: common.units.time
class TranslationsCommonUnitsTimeDa extends TranslationsCommonUnitsTimeEn {
	TranslationsCommonUnitsTimeDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get second => 'Sekund';
	@override String get minute => 'Minut';
	@override String get hour => 'Time';
	@override String get day => 'Dag';
	@override String get week => 'Uge';
	@override String get month => 'Måned';
	@override String get year => 'År';
}

// Path: common.units.area
class TranslationsCommonUnitsAreaDa extends TranslationsCommonUnitsAreaEn {
	TranslationsCommonUnitsAreaDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get squareMeter => 'Kvadratmeter';
	@override String get hectare => 'Hektar';
	@override String get acre => 'Acre';
}

// Path: common.weekdays.full
class TranslationsCommonWeekdaysFullDa extends TranslationsCommonWeekdaysFullEn {
	TranslationsCommonWeekdaysFullDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get sunday => 'Søndag';
	@override String get monday => 'Mandag';
	@override String get tuesday => 'Tirsdag';
	@override String get wednesday => 'Onsdag';
	@override String get thursday => 'Torsdag';
	@override String get friday => 'Fredag';
	@override String get saturday => 'Lørdag';
}

// Path: common.weekdays.short
class TranslationsCommonWeekdaysShortDa extends TranslationsCommonWeekdaysShortEn {
	TranslationsCommonWeekdaysShortDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get sunday => 'Søn';
	@override String get monday => 'Man';
	@override String get tuesday => 'Tir';
	@override String get wednesday => 'Ons';
	@override String get thursday => 'Tor';
	@override String get friday => 'Fre';
	@override String get saturday => 'Lør';
}

// Path: login.validation.username
class TranslationsLoginValidationUsernameDa extends TranslationsLoginValidationUsernameEn {
	TranslationsLoginValidationUsernameDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get required => 'Brugernavn er påkrævet.';
}

// Path: login.validation.password
class TranslationsLoginValidationPasswordDa extends TranslationsLoginValidationPasswordEn {
	TranslationsLoginValidationPasswordDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get required => 'Adgangskode er påkrævet.';
}

// Path: register.validation.username
class TranslationsRegisterValidationUsernameDa extends TranslationsRegisterValidationUsernameEn {
	TranslationsRegisterValidationUsernameDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get required => 'Brugernavn er påkrævet.';
	@override String minLength({required Object min}) => 'Brugernavn skal være mindst ${min} tegn langt.';
	@override String maxLength({required Object max}) => 'Brugernavn skal være højst ${max} tegn langt.';
}

// Path: register.validation.email
class TranslationsRegisterValidationEmailDa extends TranslationsRegisterValidationEmailEn {
	TranslationsRegisterValidationEmailDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get required => 'E-mail er påkrævet.';
	@override String get invalid => 'E-mail er ikke gyldig.';
}

// Path: register.validation.password
class TranslationsRegisterValidationPasswordDa extends TranslationsRegisterValidationPasswordEn {
	TranslationsRegisterValidationPasswordDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get required => 'Adgangskode er påkrævet.';
	@override String minLength({required Object min}) => 'Adgangskode skal være mindst ${min} tegn lang.';
}

// Path: passwordReset.validation.email
class TranslationsPasswordResetValidationEmailDa extends TranslationsPasswordResetValidationEmailEn {
	TranslationsPasswordResetValidationEmailDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get required => 'E-mail er påkrævet.';
	@override String get invalid => 'E-mail er ikke gyldig.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsDa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.message.loading': return 'Indlæser';
			case 'common.message.somethingWentWrong': return 'Noget gik galt';
			case 'common.message.networkProblem': return 'Der er et netværksproblem';
			case 'common.message.noDataFound': return 'Ingen data fundet';
			case 'common.message.noResultsFound': return 'Ingen resultater fundet';
			case 'common.message.unsupportedFileType': return 'Ikke-understøttet filtype';
			case 'common.message.fileTooLarge': return 'Filen er for stor';
			case 'common.message.operationTimedOut': return 'Operationen fik timeout';
			case 'common.message.sessionExpired': return 'Sessionen er udløbet';
			case 'common.message.unsavableChanges': return 'Ændringerne kunne ikke gemmes';
			case 'common.message.noServerConnect': return 'Kunne ikke oprette forbindelse til serveren';
			case 'common.message.accessDenied': return 'Adgang nægtet';
			case 'common.game.start': return 'Start Spil';
			case 'common.game.pause': return 'Pause Spil';
			case 'common.game.resume': return 'Genoptag Spil';
			case 'common.game.end': return 'Afslut Spil';
			case 'common.game.levelUp': return 'Niveau Op';
			case 'common.game.gameOver': return 'Spil Slut';
			case 'common.game.nextLevel': return 'Næste Niveau';
			case 'common.game.previousLevel': return 'Forrige Niveau';
			case 'common.game.restart': return 'Genstart Spil';
			case 'common.social.like': return 'Synes godt om';
			case 'common.social.share': return 'Del';
			case 'common.social.comment': return 'Kommentér';
			case 'common.social.follow': return 'Følg';
			case 'common.social.unfollow': return 'Stop med at følge';
			case 'common.social.unlike': return 'Synes ikke om';
			case 'common.social.reply': return 'Svar';
			case 'common.social.dislike': return 'Synes ikke om';
			case 'common.social.block': return 'Blokér';
			case 'common.social.blockUser': return 'Blokér Bruger';
			case 'common.social.report': return 'Rapportér';
			case 'common.social.mute': return 'Slå fra';
			case 'common.social.uSentFriendRequest': return 'Du sendte en venneanmodning';
			case 'common.social.uReceivedFriendRequest': return 'Du modtog en venneanmodning';
			case 'common.social.sentFriendRequest': return 'sendte en venneanmodning';
			case 'common.social.receivedFriendRequest': return 'modtog en venneanmodning';
			case 'common.social.acceptedFriendRequest': return 'accepterede en venneanmodning';
			case 'common.social.uAcceptedFriendRequest': return 'Du accepterede en venneanmodning';
			case 'common.views.list': return 'Liste';
			case 'common.views.grid': return 'Gitter';
			case 'common.views.table': return 'Tabel';
			case 'common.views.form': return 'Formular';
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
			case 'common.units.time.hour': return 'Time';
			case 'common.units.time.day': return 'Dag';
			case 'common.units.time.week': return 'Uge';
			case 'common.units.time.month': return 'Måned';
			case 'common.units.time.year': return 'År';
			case 'common.units.area.squareMeter': return 'Kvadratmeter';
			case 'common.units.area.hectare': return 'Hektar';
			case 'common.units.area.acre': return 'Acre';
			case 'common.numbers.k1': return 'En';
			case 'common.numbers.k2': return 'To';
			case 'common.numbers.k3': return 'Tre';
			case 'common.numbers.k4': return 'Fire';
			case 'common.numbers.k5': return 'Fem';
			case 'common.numbers.k6': return 'Seks';
			case 'common.numbers.k7': return 'Syv';
			case 'common.numbers.k8': return 'Otte';
			case 'common.numbers.k9': return 'Ni';
			case 'common.numbers.k10': return 'Ti';
			case 'common.ranks.k1': return 'første';
			case 'common.ranks.k2': return 'anden';
			case 'common.ranks.k3': return 'tredje';
			case 'common.ranks.k4': return 'fjerde';
			case 'common.ranks.k5': return 'femte';
			case 'common.ranks.k6': return 'sjette';
			case 'common.ranks.k7': return 'syvende';
			case 'common.ranks.k8': return 'ottende';
			case 'common.ranks.k9': return 'niende';
			case 'common.ranks.k10': return 'tiende';
			case 'common.control.on': return 'Til';
			case 'common.control.off': return 'Fra';
			case 'common.control.yes': return 'Ja';
			case 'common.control.no': return 'Nej';
			case 'common.control.confirm': return 'Bekræft';
			case 'common.control.cancel': return 'Annuller';
			case 'common.control.retry': return 'Prøv igen';
			case 'common.control.logout': return 'Log ud';
			case 'common.control.edit': return 'Rediger';
			case 'common.control.delete': return 'Slet';
			case 'common.control.revert': return 'Fortryd';
			case 'common.control.save': return 'Gem';
			case 'common.buttons.submit': return 'Send';
			case 'common.buttons.close': return 'Luk';
			case 'common.buttons.reset': return 'Nulstil';
			case 'common.buttons.cancel': return 'Annuller';
			case 'common.buttons.kContinue': return 'Fortsæt';
			case 'common.buttons.back': return 'Tilbage';
			case 'common.buttons.next': return 'Næste';
			case 'common.buttons.done': return 'Færdig';
			case 'common.buttons.upload': return 'Upload';
			case 'common.buttons.choose': return 'Vælg';
			case 'common.buttons.select': return 'Vælg';
			case 'common.buttons.clear': return 'Ryd';
			case 'common.labels.required': return 'Påkrævet';
			case 'common.labels.optional': return 'Valgfrit';
			case 'common.labels.instructions': return 'Instruktioner:';
			case 'common.labels.status': return 'Status';
			case 'common.labels.progress': return 'Fremskridt';
			case 'common.labels.question': return 'Spørgsmål';
			case 'common.labels.answer': return 'Svar';
			case 'common.labels.response': return 'Respons';
			case 'common.labels.loading': return 'Indlæser...';
			case 'common.labels.error': return 'Fejl';
			case 'common.labels.success': return 'Succes';
			case 'common.labels.warning': return 'Advarsel';
			case 'common.response.success': return 'Succes';
			case 'common.response.error': return 'Fejl';
			case 'common.response.info': return 'Information';
			case 'common.response.warning': return 'Advarsel';
			case 'common.response.tbd': return 'Skal Bestemmes';
			case 'common.response.wip': return 'Arbejde i Gang';
			case 'common.priority.high': return 'Høj';
			case 'common.priority.medium': return 'Mellem';
			case 'common.priority.low': return 'Lav';
			case 'common.date.today': return 'I dag';
			case 'common.date.yesterday': return 'I går';
			case 'common.date.tomorrow': return 'I morgen';
			case 'common.date.justNow': return 'Lige nu';
			case 'common.date.aMomentAgo': return 'Et øjeblik siden';
			case 'common.date.minutesAgo': return 'Minutter siden';
			case 'common.date.hoursAgo': return 'Timer siden';
			case 'common.date.daysAgo': return ({required Object days}) => '${days} dage siden';
			case 'common.date.weeksAgo': return 'Uger siden';
			case 'common.date.thisWeek': return 'Denne uge';
			case 'common.date.lastWeek': return 'Sidste uge';
			case 'common.date.thisMonth': return 'Denne måned';
			case 'common.date.lastMonth': return 'Sidste måned';
			case 'common.date.thisYear': return 'Dette år';
			case 'common.date.lastYear': return 'Sidste år';
			case 'common.date.daysAhead': return ({required Object days}) => 'Om ${days} dage';
			case 'common.weekdays.full.sunday': return 'Søndag';
			case 'common.weekdays.full.monday': return 'Mandag';
			case 'common.weekdays.full.tuesday': return 'Tirsdag';
			case 'common.weekdays.full.wednesday': return 'Onsdag';
			case 'common.weekdays.full.thursday': return 'Torsdag';
			case 'common.weekdays.full.friday': return 'Fredag';
			case 'common.weekdays.full.saturday': return 'Lørdag';
			case 'common.weekdays.short.sunday': return 'Søn';
			case 'common.weekdays.short.monday': return 'Man';
			case 'common.weekdays.short.tuesday': return 'Tir';
			case 'common.weekdays.short.wednesday': return 'Ons';
			case 'common.weekdays.short.thursday': return 'Tor';
			case 'common.weekdays.short.friday': return 'Fre';
			case 'common.weekdays.short.saturday': return 'Lør';
			case 'common.formRestrictions.required': return 'Dette felt er påkrævet.';
			case 'common.formRestrictions.minLength': return ({required Object min}) => 'Minimum længde er ${min} tegn.';
			case 'common.formRestrictions.maxLength': return ({required Object max}) => 'Maksimum længde er ${max} tegn.';
			case 'common.formRestrictions.invalidFormat': return 'Formatet er ugyldigt.';
			case 'common.formRestrictions.pattern': return ({required Object pattern}) => 'Dette felt skal følge mønsteret ${pattern}.';
			case 'common.tos.accept': return 'Jeg accepterer Vilkår og Betingelser';
			case 'common.tos.readAccept': return 'Læs og accepter venligst vores Vilkår og Betingelser';
			case 'common.tos.title': return 'Vilkår og Betingelser';
			case 'common.tos.service': return 'Servicevilkår';
			case 'common.tos.privacy': return 'Privatlivspolitik';
			case 'common.tos.continueAgree': return 'Ved at fortsætte accepterer du vores Vilkår og Betingelser';
			case 'common.tos.mustAccept': return 'Du skal acceptere Vilkår og Betingelser for at fortsætte';
			case 'common.tos.view': return 'Se Vilkår og Betingelser';
			case 'common.tos.lastUpdated': return ({required Object date}) => 'Sidst opdateret: ${date}';
			case 'common.tos.contactInfo': return 'Kontakt os for mere information om vores Vilkår og Betingelser';
			case 'common.permissions.allowLocation': return 'Tillad adgang til placering?';
			case 'common.permissions.allowCamera': return 'Tillad adgang til kamera?';
			case 'common.permissions.allowMicrophone': return 'Tillad adgang til mikrofon?';
			case 'common.permissions.allowNotifications': return 'Tillad notifikationer?';
			case 'common.permissions.allowContacts': return 'Tillad adgang til kontakter?';
			case 'common.permissions.allowPhotos': return 'Tillad adgang til billeder?';
			case 'common.permissions.allowStorage': return 'Tillad adgang til lager?';
			case 'common.permissions.allowBluetooth': return 'Tillad Bluetooth adgang?';
			case 'common.permissions.needPermission': return 'Vi har brug for din tilladelse for at fortsætte';
			case 'common.permissions.permissionDenied': return 'Tilladelse nægtet';
			case 'common.permissions.permissionRequired': return 'Denne tilladelse er påkrævet';
			case 'common.permissions.enableInSettings': return 'Aktivér venligst i Indstillinger';
			case 'common.prompts.sessionExpired': return 'Din session er udløbet';
			case 'common.prompts.areYouSure': return 'Er du sikker?';
			case 'common.prompts.cannotBeUndone': return 'Denne handling kan ikke fortrydes';
			case 'common.prompts.unsavedChanges': return 'Du har ikke-gemte ændringer';
			case 'common.prompts.discardChanges': return 'Kassér ændringer?';
			case 'common.prompts.locationDisabled': return 'Placeringstjenester er deaktiveret';
			case 'common.prompts.networkRequired': return 'Netværksforbindelse påkrævet';
			case 'common.prompts.loginRequired': return 'Login påkrævet for at fortsætte';
			case 'common.prompts.confirmDelete': return 'Er du sikker på, at du vil slette dette?';
			case 'common.prompts.confirmLogout': return 'Er du sikker på, at du vil logge ud?';
			case 'common.prompts.saveBeforeExit': return 'Vil du gemme før du forlader?';
			case 'common.prompts.reloadPage': return 'Vil du genindlæse siden?';
			case 'common.prompts.updateAvailable': return 'En opdatering er tilgængelig';
			case 'common.prompts.restartRequired': return 'Genstart påkrævet for at anvende ændringer';
			case 'login.message.success': return 'Login vellykket.';
			case 'login.message.error': return 'Login fejlede. Prøv venligst igen.';
			case 'login.message.wrongPassword': return 'Verificer venligst dine legitimationsoplysninger.';
			case 'login.form.username': return 'Brugernavn';
			case 'login.form.password': return 'Adgangskode';
			case 'login.form.submit': return 'Log ind';
			case 'login.form.createAccount': return 'Opret ny konto';
			case 'login.form.forgotPassword': return 'Glemt adgangskode';
			case 'login.tooltip.username': return 'Indtast dit brugernavn';
			case 'login.tooltip.password': return 'Indtast din adgangskode';
			case 'login.tooltip.submit': return 'Klik for at logge ind';
			case 'login.validation.username.required': return 'Brugernavn er påkrævet.';
			case 'login.validation.password.required': return 'Adgangskode er påkrævet.';
			case 'register.message.success': return 'Registrering vellykket.';
			case 'register.message.error': return 'Registrering fejlede. Prøv venligst igen.';
			case 'register.form.username': return 'Brugernavn';
			case 'register.form.email': return 'E-mail';
			case 'register.form.password': return 'Adgangskode';
			case 'register.form.submit': return 'Registrer';
			case 'register.form.acceptTos': return 'Jeg accepterer Servicevilkårene';
			case 'register.tooltip.username': return 'Indtast dit brugernavn';
			case 'register.tooltip.email': return 'Indtast din e-mail';
			case 'register.tooltip.password': return 'Indtast din adgangskode';
			case 'register.tooltip.submit': return 'Klik for at registrere';
			case 'register.validation.username.required': return 'Brugernavn er påkrævet.';
			case 'register.validation.username.minLength': return ({required Object min}) => 'Brugernavn skal være mindst ${min} tegn langt.';
			case 'register.validation.username.maxLength': return ({required Object max}) => 'Brugernavn skal være højst ${max} tegn langt.';
			case 'register.validation.email.required': return 'E-mail er påkrævet.';
			case 'register.validation.email.invalid': return 'E-mail er ikke gyldig.';
			case 'register.validation.password.required': return 'Adgangskode er påkrævet.';
			case 'register.validation.password.minLength': return ({required Object min}) => 'Adgangskode skal være mindst ${min} tegn lang.';
			case 'passwordReset.message.success': return 'E-mail til nulstilling af adgangskode sendt.';
			case 'passwordReset.message.error': return 'Nulstilling af adgangskode fejlede. Prøv venligst igen.';
			case 'passwordReset.form.email': return 'E-mail';
			case 'passwordReset.form.submit': return 'Nulstil Adgangskode';
			case 'passwordReset.tooltip.email': return 'Indtast din e-mail';
			case 'passwordReset.tooltip.submit': return 'Klik for at nulstille adgangskode';
			case 'passwordReset.validation.email.required': return 'E-mail er påkrævet.';
			case 'passwordReset.validation.email.invalid': return 'E-mail er ikke gyldig.';
			default: return null;
		}
	}
}

