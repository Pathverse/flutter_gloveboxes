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
class TranslationsNl extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsNl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.nl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <nl>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsNl _root = this; // ignore: unused_field

	@override 
	TranslationsNl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsNl(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsCommonNl common = TranslationsCommonNl._(_root);
	@override late final TranslationsLoginNl login = TranslationsLoginNl._(_root);
	@override late final TranslationsRegisterNl register = TranslationsRegisterNl._(_root);
	@override late final TranslationsPasswordResetNl passwordReset = TranslationsPasswordResetNl._(_root);
	@override late final TranslationsLanguagesNl languages = TranslationsLanguagesNl._(_root);
}

// Path: common
class TranslationsCommonNl extends TranslationsCommonEn {
	TranslationsCommonNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMessageNl message = TranslationsCommonMessageNl._(_root);
	@override late final TranslationsCommonGameNl game = TranslationsCommonGameNl._(_root);
	@override late final TranslationsCommonSocialNl social = TranslationsCommonSocialNl._(_root);
	@override late final TranslationsCommonViewsNl views = TranslationsCommonViewsNl._(_root);
	@override late final TranslationsCommonUnitsNl units = TranslationsCommonUnitsNl._(_root);
	@override late final TranslationsCommonNumbersNl numbers = TranslationsCommonNumbersNl._(_root);
	@override late final TranslationsCommonRanksNl ranks = TranslationsCommonRanksNl._(_root);
	@override late final TranslationsCommonControlNl control = TranslationsCommonControlNl._(_root);
	@override late final TranslationsCommonButtonsNl buttons = TranslationsCommonButtonsNl._(_root);
	@override late final TranslationsCommonLabelsNl labels = TranslationsCommonLabelsNl._(_root);
	@override late final TranslationsCommonResponseNl response = TranslationsCommonResponseNl._(_root);
	@override late final TranslationsCommonPriorityNl priority = TranslationsCommonPriorityNl._(_root);
	@override late final TranslationsCommonDateNl date = TranslationsCommonDateNl._(_root);
	@override late final TranslationsCommonWeekdaysNl weekdays = TranslationsCommonWeekdaysNl._(_root);
	@override late final TranslationsCommonFormRestrictionsNl formRestrictions = TranslationsCommonFormRestrictionsNl._(_root);
	@override late final TranslationsCommonTosNl tos = TranslationsCommonTosNl._(_root);
	@override late final TranslationsCommonPermissionsNl permissions = TranslationsCommonPermissionsNl._(_root);
	@override late final TranslationsCommonPromptsNl prompts = TranslationsCommonPromptsNl._(_root);
}

// Path: login
class TranslationsLoginNl extends TranslationsLoginEn {
	TranslationsLoginNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginMessageNl message = TranslationsLoginMessageNl._(_root);
	@override late final TranslationsLoginFormNl form = TranslationsLoginFormNl._(_root);
	@override late final TranslationsLoginTooltipNl tooltip = TranslationsLoginTooltipNl._(_root);
	@override late final TranslationsLoginValidationNl validation = TranslationsLoginValidationNl._(_root);
}

// Path: register
class TranslationsRegisterNl extends TranslationsRegisterEn {
	TranslationsRegisterNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterMessageNl message = TranslationsRegisterMessageNl._(_root);
	@override late final TranslationsRegisterFormNl form = TranslationsRegisterFormNl._(_root);
	@override late final TranslationsRegisterTooltipNl tooltip = TranslationsRegisterTooltipNl._(_root);
	@override late final TranslationsRegisterValidationNl validation = TranslationsRegisterValidationNl._(_root);
}

// Path: passwordReset
class TranslationsPasswordResetNl extends TranslationsPasswordResetEn {
	TranslationsPasswordResetNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetMessageNl message = TranslationsPasswordResetMessageNl._(_root);
	@override late final TranslationsPasswordResetFormNl form = TranslationsPasswordResetFormNl._(_root);
	@override late final TranslationsPasswordResetTooltipNl tooltip = TranslationsPasswordResetTooltipNl._(_root);
	@override late final TranslationsPasswordResetValidationNl validation = TranslationsPasswordResetValidationNl._(_root);
}

// Path: languages
class TranslationsLanguagesNl extends TranslationsLanguagesEn {
	TranslationsLanguagesNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLanguagesCurrentNl current = TranslationsLanguagesCurrentNl._(_root);
}

// Path: common.message
class TranslationsCommonMessageNl extends TranslationsCommonMessageEn {
	TranslationsCommonMessageNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get loading => 'Laden';
	@override String get somethingWentWrong => 'Er is iets misgegaan';
	@override String get networkProblem => 'Er is een netwerkprobleem';
	@override String get noDataFound => 'Geen gegevens gevonden';
	@override String get noResultsFound => 'Geen resultaten gevonden';
	@override String get unsupportedFileType => 'Niet-ondersteund bestandstype';
	@override String get fileTooLarge => 'Bestand is te groot';
	@override String get operationTimedOut => 'Bewerking is verlopen';
	@override String get sessionExpired => 'Sessie is verlopen';
	@override String get unsavableChanges => 'Wijzigingen konden niet worden opgeslagen';
	@override String get noServerConnect => 'Kon geen verbinding maken met de server';
	@override String get accessDenied => 'Toegang geweigerd';
}

// Path: common.game
class TranslationsCommonGameNl extends TranslationsCommonGameEn {
	TranslationsCommonGameNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get start => 'Spel Starten';
	@override String get pause => 'Spel Pauzeren';
	@override String get resume => 'Spel Hervatten';
	@override String get end => 'Spel Beëindigen';
	@override String get levelUp => 'Level Omhoog';
	@override String get gameOver => 'Spel Voorbij';
	@override String get nextLevel => 'Volgend Level';
	@override String get previousLevel => 'Vorig Level';
	@override String get restart => 'Spel Herstarten';
}

// Path: common.social
class TranslationsCommonSocialNl extends TranslationsCommonSocialEn {
	TranslationsCommonSocialNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get like => 'Leuk vinden';
	@override String get share => 'Delen';
	@override String get comment => 'Reactie';
	@override String get follow => 'Volgen';
	@override String get unfollow => 'Ontvolgen';
	@override String get unlike => 'Niet meer leuk vinden';
	@override String get reply => 'Antwoorden';
	@override String get dislike => 'Niet leuk vinden';
	@override String get block => 'Blokkeren';
	@override String get blockUser => 'Gebruiker Blokkeren';
	@override String get report => 'Rapporteren';
	@override String get mute => 'Dempen';
	@override String get uSentFriendRequest => 'Je hebt een vriendschapsverzoek gestuurd';
	@override String get uReceivedFriendRequest => 'Je hebt een vriendschapsverzoek ontvangen';
	@override String get sentFriendRequest => 'heeft een vriendschapsverzoek gestuurd';
	@override String get receivedFriendRequest => 'heeft een vriendschapsverzoek ontvangen';
	@override String get acceptedFriendRequest => 'heeft een vriendschapsverzoek geaccepteerd';
	@override String get uAcceptedFriendRequest => 'Je hebt een vriendschapsverzoek geaccepteerd';
}

// Path: common.views
class TranslationsCommonViewsNl extends TranslationsCommonViewsEn {
	TranslationsCommonViewsNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get list => 'Lijst';
	@override String get grid => 'Raster';
	@override String get table => 'Tabel';
	@override String get form => 'Formulier';
}

// Path: common.units
class TranslationsCommonUnitsNl extends TranslationsCommonUnitsEn {
	TranslationsCommonUnitsNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonUnitsLengthNl length = TranslationsCommonUnitsLengthNl._(_root);
	@override late final TranslationsCommonUnitsWeightNl weight = TranslationsCommonUnitsWeightNl._(_root);
	@override late final TranslationsCommonUnitsVolumeNl volume = TranslationsCommonUnitsVolumeNl._(_root);
	@override late final TranslationsCommonUnitsTimeNl time = TranslationsCommonUnitsTimeNl._(_root);
	@override late final TranslationsCommonUnitsAreaNl area = TranslationsCommonUnitsAreaNl._(_root);
}

// Path: common.numbers
class TranslationsCommonNumbersNl extends TranslationsCommonNumbersEn {
	TranslationsCommonNumbersNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'Een';
	@override String get k2 => 'Twee';
	@override String get k3 => 'Drie';
	@override String get k4 => 'Vier';
	@override String get k5 => 'Vijf';
	@override String get k6 => 'Zes';
	@override String get k7 => 'Zeven';
	@override String get k8 => 'Acht';
	@override String get k9 => 'Negen';
	@override String get k10 => 'Tien';
}

// Path: common.ranks
class TranslationsCommonRanksNl extends TranslationsCommonRanksEn {
	TranslationsCommonRanksNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'eerste';
	@override String get k2 => 'tweede';
	@override String get k3 => 'derde';
	@override String get k4 => 'vierde';
	@override String get k5 => 'vijfde';
	@override String get k6 => 'zesde';
	@override String get k7 => 'zevende';
	@override String get k8 => 'achtste';
	@override String get k9 => 'negende';
	@override String get k10 => 'tiende';
}

// Path: common.control
class TranslationsCommonControlNl extends TranslationsCommonControlEn {
	TranslationsCommonControlNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get on => 'Aan';
	@override String get off => 'Uit';
	@override String get yes => 'Ja';
	@override String get no => 'Nee';
	@override String get confirm => 'Bevestigen';
	@override String get cancel => 'Annuleren';
	@override String get retry => 'Opnieuw proberen';
	@override String get logout => 'Uitloggen';
	@override String get edit => 'Bewerken';
	@override String get delete => 'Verwijderen';
	@override String get revert => 'Terugzetten';
	@override String get save => 'Opslaan';
}

// Path: common.buttons
class TranslationsCommonButtonsNl extends TranslationsCommonButtonsEn {
	TranslationsCommonButtonsNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get submit => 'Verzenden';
	@override String get close => 'Sluiten';
	@override String get reset => 'Resetten';
	@override String get cancel => 'Annuleren';
	@override String get kContinue => 'Doorgaan';
	@override String get back => 'Terug';
	@override String get next => 'Volgende';
	@override String get done => 'Klaar';
	@override String get upload => 'Uploaden';
	@override String get choose => 'Kiezen';
	@override String get select => 'Selecteren';
	@override String get clear => 'Wissen';
	@override String get start => 'Starten';
}

// Path: common.labels
class TranslationsCommonLabelsNl extends TranslationsCommonLabelsEn {
	TranslationsCommonLabelsNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get required => 'Verplicht';
	@override String get optional => 'Optioneel';
	@override String get instructions => 'Instructies:';
	@override String get status => 'Status';
	@override String get progress => 'Voortgang';
	@override String get question => 'Vraag';
	@override String get answer => 'Antwoord';
	@override String get response => 'Reactie';
	@override String get loading => 'Laden...';
	@override String get error => 'Fout';
	@override String get success => 'Succes';
	@override String get warning => 'Waarschuwing';
}

// Path: common.response
class TranslationsCommonResponseNl extends TranslationsCommonResponseEn {
	TranslationsCommonResponseNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get success => 'Succes';
	@override String get error => 'Fout';
	@override String get info => 'Informatie';
	@override String get warning => 'Waarschuwing';
	@override String get tbd => 'Nog Te Bepalen';
	@override String get wip => 'In Bewerking';
}

// Path: common.priority
class TranslationsCommonPriorityNl extends TranslationsCommonPriorityEn {
	TranslationsCommonPriorityNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get high => 'Hoog';
	@override String get medium => 'Gemiddeld';
	@override String get low => 'Laag';
}

// Path: common.date
class TranslationsCommonDateNl extends TranslationsCommonDateEn {
	TranslationsCommonDateNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get today => 'Vandaag';
	@override String get yesterday => 'Gisteren';
	@override String get tomorrow => 'Morgen';
	@override String get justNow => 'Zojuist';
	@override String get aMomentAgo => 'Een moment geleden';
	@override String get minutesAgo => 'Minuten geleden';
	@override String get hoursAgo => 'Uren geleden';
	@override String daysAgo({required Object days}) => '${days} dagen geleden';
	@override String get weeksAgo => 'Weken geleden';
	@override String get thisWeek => 'Deze week';
	@override String get lastWeek => 'Vorige week';
	@override String get thisMonth => 'Deze maand';
	@override String get lastMonth => 'Vorige maand';
	@override String get thisYear => 'Dit jaar';
	@override String get lastYear => 'Vorig jaar';
	@override String daysAhead({required Object days}) => 'Over ${days} dagen';
}

// Path: common.weekdays
class TranslationsCommonWeekdaysNl extends TranslationsCommonWeekdaysEn {
	TranslationsCommonWeekdaysNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonWeekdaysFullNl full = TranslationsCommonWeekdaysFullNl._(_root);
	@override late final TranslationsCommonWeekdaysShortNl short = TranslationsCommonWeekdaysShortNl._(_root);
}

// Path: common.formRestrictions
class TranslationsCommonFormRestrictionsNl extends TranslationsCommonFormRestrictionsEn {
	TranslationsCommonFormRestrictionsNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get required => 'Dit veld is verplicht.';
	@override String minLength({required Object min}) => 'Minimale lengte is ${min} karakters.';
	@override String maxLength({required Object max}) => 'Maximale lengte is ${max} karakters.';
	@override String get invalidFormat => 'Het formaat is ongeldig.';
	@override String pattern({required Object pattern}) => 'Dit veld moet het patroon ${pattern} volgen.';
}

// Path: common.tos
class TranslationsCommonTosNl extends TranslationsCommonTosEn {
	TranslationsCommonTosNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Ik accepteer de Algemene Voorwaarden';
	@override String get readAccept => 'Lees en accepteer onze Algemene Voorwaarden';
	@override String get title => 'Algemene Voorwaarden';
	@override String get service => 'Servicevoorwaarden';
	@override String get privacy => 'Privacybeleid';
	@override String get continueAgree => 'Door door te gaan, ga je akkoord met onze Algemene Voorwaarden';
	@override String get mustAccept => 'Je moet de Algemene Voorwaarden accepteren om door te gaan';
	@override String get view => 'Bekijk Algemene Voorwaarden';
	@override String lastUpdated({required Object date}) => 'Laatst bijgewerkt: ${date}';
	@override String get contactInfo => 'Neem contact met ons op voor meer informatie over onze Algemene Voorwaarden';
}

// Path: common.permissions
class TranslationsCommonPermissionsNl extends TranslationsCommonPermissionsEn {
	TranslationsCommonPermissionsNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get allowLocation => 'Toegang tot locatie toestaan?';
	@override String get allowCamera => 'Toegang tot camera toestaan?';
	@override String get allowMicrophone => 'Toegang tot microfoon toestaan?';
	@override String get allowNotifications => 'Meldingen toestaan?';
	@override String get allowContacts => 'Toegang tot contacten toestaan?';
	@override String get allowPhotos => 'Toegang tot foto\'s toestaan?';
	@override String get allowStorage => 'Toegang tot opslag toestaan?';
	@override String get allowBluetooth => 'Bluetooth-toegang toestaan?';
	@override String get needPermission => 'We hebben je toestemming nodig om door te gaan';
	@override String get permissionDenied => 'Toestemming geweigerd';
	@override String get permissionRequired => 'Deze toestemming is vereist';
	@override String get enableInSettings => 'Schakel in bij Instellingen';
}

// Path: common.prompts
class TranslationsCommonPromptsNl extends TranslationsCommonPromptsEn {
	TranslationsCommonPromptsNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get sessionExpired => 'Je sessie is verlopen';
	@override String get areYouSure => 'Weet je het zeker?';
	@override String get cannotBeUndone => 'Deze actie kan niet ongedaan worden gemaakt';
	@override String get unsavedChanges => 'Je hebt niet-opgeslagen wijzigingen';
	@override String get discardChanges => 'Wijzigingen verwerpen?';
	@override String get locationDisabled => 'Locatieservices zijn uitgeschakeld';
	@override String get networkRequired => 'Netwerkverbinding vereist';
	@override String get loginRequired => 'Inloggen vereist om door te gaan';
	@override String get confirmDelete => 'Weet je zeker dat je dit wilt verwijderen?';
	@override String get confirmLogout => 'Weet je zeker dat je wilt uitloggen?';
	@override String get saveBeforeExit => 'Wil je opslaan voordat je afsluit?';
	@override String get reloadPage => 'Wil je de pagina herladen?';
	@override String get updateAvailable => 'Er is een update beschikbaar';
	@override String get restartRequired => 'Herstart vereist om wijzigingen toe te passen';
}

// Path: login.message
class TranslationsLoginMessageNl extends TranslationsLoginMessageEn {
	TranslationsLoginMessageNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get success => 'Inloggen succesvol.';
	@override String get error => 'Inloggen mislukt. Probeer opnieuw.';
	@override String get wrongPassword => 'Controleer je inloggegevens.';
}

// Path: login.form
class TranslationsLoginFormNl extends TranslationsLoginFormEn {
	TranslationsLoginFormNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get username => 'Gebruikersnaam';
	@override String get password => 'Wachtwoord';
	@override String get submit => 'Inloggen';
	@override String get createAccount => 'Nieuw account aanmaken';
	@override String get forgotPassword => 'Wachtwoord vergeten';
}

// Path: login.tooltip
class TranslationsLoginTooltipNl extends TranslationsLoginTooltipEn {
	TranslationsLoginTooltipNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get username => 'Voer je gebruikersnaam in';
	@override String get password => 'Voer je wachtwoord in';
	@override String get submit => 'Klik om in te loggen';
}

// Path: login.validation
class TranslationsLoginValidationNl extends TranslationsLoginValidationEn {
	TranslationsLoginValidationNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginValidationUsernameNl username = TranslationsLoginValidationUsernameNl._(_root);
	@override late final TranslationsLoginValidationPasswordNl password = TranslationsLoginValidationPasswordNl._(_root);
}

// Path: register.message
class TranslationsRegisterMessageNl extends TranslationsRegisterMessageEn {
	TranslationsRegisterMessageNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get success => 'Registratie succesvol.';
	@override String get error => 'Registratie mislukt. Probeer opnieuw.';
}

// Path: register.form
class TranslationsRegisterFormNl extends TranslationsRegisterFormEn {
	TranslationsRegisterFormNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get username => 'Gebruikersnaam';
	@override String get email => 'E-mail';
	@override String get password => 'Wachtwoord';
	@override String get submit => 'Registreren';
	@override String get acceptTos => 'Ik accepteer de Servicevoorwaarden';
}

// Path: register.tooltip
class TranslationsRegisterTooltipNl extends TranslationsRegisterTooltipEn {
	TranslationsRegisterTooltipNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get username => 'Voer je gebruikersnaam in';
	@override String get email => 'Voer je e-mail in';
	@override String get password => 'Voer je wachtwoord in';
	@override String get submit => 'Klik om te registreren';
}

// Path: register.validation
class TranslationsRegisterValidationNl extends TranslationsRegisterValidationEn {
	TranslationsRegisterValidationNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterValidationUsernameNl username = TranslationsRegisterValidationUsernameNl._(_root);
	@override late final TranslationsRegisterValidationEmailNl email = TranslationsRegisterValidationEmailNl._(_root);
	@override late final TranslationsRegisterValidationPasswordNl password = TranslationsRegisterValidationPasswordNl._(_root);
}

// Path: passwordReset.message
class TranslationsPasswordResetMessageNl extends TranslationsPasswordResetMessageEn {
	TranslationsPasswordResetMessageNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get success => 'Wachtwoord reset e-mail verzonden.';
	@override String get error => 'Wachtwoord reset mislukt. Probeer opnieuw.';
}

// Path: passwordReset.form
class TranslationsPasswordResetFormNl extends TranslationsPasswordResetFormEn {
	TranslationsPasswordResetFormNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get email => 'E-mail';
	@override String get submit => 'Wachtwoord Resetten';
}

// Path: passwordReset.tooltip
class TranslationsPasswordResetTooltipNl extends TranslationsPasswordResetTooltipEn {
	TranslationsPasswordResetTooltipNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get email => 'Voer je e-mail in';
	@override String get submit => 'Klik om wachtwoord te resetten';
}

// Path: passwordReset.validation
class TranslationsPasswordResetValidationNl extends TranslationsPasswordResetValidationEn {
	TranslationsPasswordResetValidationNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetValidationEmailNl email = TranslationsPasswordResetValidationEmailNl._(_root);
}

// Path: languages.current
class TranslationsLanguagesCurrentNl extends TranslationsLanguagesCurrentEn {
	TranslationsLanguagesCurrentNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get en => 'Engels';
	@override String get da => 'Deens';
	@override String get es => 'Spaans';
	@override String get fr => 'Frans';
	@override String get he => 'Hebreeuws';
	@override String get isIS => 'IJslands';
	@override String get ko => 'Koreaans';
	@override String get nb => 'Noors (Bokmål)';
	@override String get nl => 'Nederlands';
	@override String get no => 'Noors';
	@override String get sv => 'Zweeds';
	@override String get zhHans => 'Chinees (Vereenvoudigd)';
	@override String get zh => 'Chinees (Traditioneel)';
}

// Path: common.units.length
class TranslationsCommonUnitsLengthNl extends TranslationsCommonUnitsLengthEn {
	TranslationsCommonUnitsLengthNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get kilometer => 'Kilometer';
	@override String get meter => 'Meter';
	@override String get centimeter => 'Centimeter';
	@override String get millimeter => 'Millimeter';
	@override String get micrometer => 'Micrometer';
	@override String get nanometer => 'Nanometer';
}

// Path: common.units.weight
class TranslationsCommonUnitsWeightNl extends TranslationsCommonUnitsWeightEn {
	TranslationsCommonUnitsWeightNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get kilogram => 'Kilogram';
	@override String get gram => 'Gram';
	@override String get milligram => 'Milligram';
	@override String get ton => 'Ton';
}

// Path: common.units.volume
class TranslationsCommonUnitsVolumeNl extends TranslationsCommonUnitsVolumeEn {
	TranslationsCommonUnitsVolumeNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get liter => 'Liter';
	@override String get milliliter => 'Milliliter';
	@override String get cubicMeter => 'Kubieke Meter';
}

// Path: common.units.time
class TranslationsCommonUnitsTimeNl extends TranslationsCommonUnitsTimeEn {
	TranslationsCommonUnitsTimeNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get second => 'Seconde';
	@override String get minute => 'Minuut';
	@override String get hour => 'Uur';
	@override String get day => 'Dag';
	@override String get week => 'Week';
	@override String get month => 'Maand';
	@override String get year => 'Jaar';
}

// Path: common.units.area
class TranslationsCommonUnitsAreaNl extends TranslationsCommonUnitsAreaEn {
	TranslationsCommonUnitsAreaNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get squareMeter => 'Vierkante Meter';
	@override String get hectare => 'Hectare';
	@override String get acre => 'Acre';
}

// Path: common.weekdays.full
class TranslationsCommonWeekdaysFullNl extends TranslationsCommonWeekdaysFullEn {
	TranslationsCommonWeekdaysFullNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get sunday => 'Zondag';
	@override String get monday => 'Maandag';
	@override String get tuesday => 'Dinsdag';
	@override String get wednesday => 'Woensdag';
	@override String get thursday => 'Donderdag';
	@override String get friday => 'Vrijdag';
	@override String get saturday => 'Zaterdag';
}

// Path: common.weekdays.short
class TranslationsCommonWeekdaysShortNl extends TranslationsCommonWeekdaysShortEn {
	TranslationsCommonWeekdaysShortNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get sunday => 'Zo';
	@override String get monday => 'Ma';
	@override String get tuesday => 'Di';
	@override String get wednesday => 'Wo';
	@override String get thursday => 'Do';
	@override String get friday => 'Vr';
	@override String get saturday => 'Za';
}

// Path: login.validation.username
class TranslationsLoginValidationUsernameNl extends TranslationsLoginValidationUsernameEn {
	TranslationsLoginValidationUsernameNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get required => 'Gebruikersnaam is verplicht.';
}

// Path: login.validation.password
class TranslationsLoginValidationPasswordNl extends TranslationsLoginValidationPasswordEn {
	TranslationsLoginValidationPasswordNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get required => 'Wachtwoord is verplicht.';
}

// Path: register.validation.username
class TranslationsRegisterValidationUsernameNl extends TranslationsRegisterValidationUsernameEn {
	TranslationsRegisterValidationUsernameNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get required => 'Gebruikersnaam is verplicht.';
	@override String minLength({required Object min}) => 'Gebruikersnaam moet minimaal ${min} karakters lang zijn.';
	@override String maxLength({required Object max}) => 'Gebruikersnaam mag maximaal ${max} karakters lang zijn.';
}

// Path: register.validation.email
class TranslationsRegisterValidationEmailNl extends TranslationsRegisterValidationEmailEn {
	TranslationsRegisterValidationEmailNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get required => 'E-mail is verplicht.';
	@override String get invalid => 'E-mail is niet geldig.';
}

// Path: register.validation.password
class TranslationsRegisterValidationPasswordNl extends TranslationsRegisterValidationPasswordEn {
	TranslationsRegisterValidationPasswordNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get required => 'Wachtwoord is verplicht.';
	@override String minLength({required Object min}) => 'Wachtwoord moet minimaal ${min} karakters lang zijn.';
}

// Path: passwordReset.validation.email
class TranslationsPasswordResetValidationEmailNl extends TranslationsPasswordResetValidationEmailEn {
	TranslationsPasswordResetValidationEmailNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get required => 'E-mail is verplicht.';
	@override String get invalid => 'E-mail is niet geldig.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsNl {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.message.loading': return 'Laden';
			case 'common.message.somethingWentWrong': return 'Er is iets misgegaan';
			case 'common.message.networkProblem': return 'Er is een netwerkprobleem';
			case 'common.message.noDataFound': return 'Geen gegevens gevonden';
			case 'common.message.noResultsFound': return 'Geen resultaten gevonden';
			case 'common.message.unsupportedFileType': return 'Niet-ondersteund bestandstype';
			case 'common.message.fileTooLarge': return 'Bestand is te groot';
			case 'common.message.operationTimedOut': return 'Bewerking is verlopen';
			case 'common.message.sessionExpired': return 'Sessie is verlopen';
			case 'common.message.unsavableChanges': return 'Wijzigingen konden niet worden opgeslagen';
			case 'common.message.noServerConnect': return 'Kon geen verbinding maken met de server';
			case 'common.message.accessDenied': return 'Toegang geweigerd';
			case 'common.game.start': return 'Spel Starten';
			case 'common.game.pause': return 'Spel Pauzeren';
			case 'common.game.resume': return 'Spel Hervatten';
			case 'common.game.end': return 'Spel Beëindigen';
			case 'common.game.levelUp': return 'Level Omhoog';
			case 'common.game.gameOver': return 'Spel Voorbij';
			case 'common.game.nextLevel': return 'Volgend Level';
			case 'common.game.previousLevel': return 'Vorig Level';
			case 'common.game.restart': return 'Spel Herstarten';
			case 'common.social.like': return 'Leuk vinden';
			case 'common.social.share': return 'Delen';
			case 'common.social.comment': return 'Reactie';
			case 'common.social.follow': return 'Volgen';
			case 'common.social.unfollow': return 'Ontvolgen';
			case 'common.social.unlike': return 'Niet meer leuk vinden';
			case 'common.social.reply': return 'Antwoorden';
			case 'common.social.dislike': return 'Niet leuk vinden';
			case 'common.social.block': return 'Blokkeren';
			case 'common.social.blockUser': return 'Gebruiker Blokkeren';
			case 'common.social.report': return 'Rapporteren';
			case 'common.social.mute': return 'Dempen';
			case 'common.social.uSentFriendRequest': return 'Je hebt een vriendschapsverzoek gestuurd';
			case 'common.social.uReceivedFriendRequest': return 'Je hebt een vriendschapsverzoek ontvangen';
			case 'common.social.sentFriendRequest': return 'heeft een vriendschapsverzoek gestuurd';
			case 'common.social.receivedFriendRequest': return 'heeft een vriendschapsverzoek ontvangen';
			case 'common.social.acceptedFriendRequest': return 'heeft een vriendschapsverzoek geaccepteerd';
			case 'common.social.uAcceptedFriendRequest': return 'Je hebt een vriendschapsverzoek geaccepteerd';
			case 'common.views.list': return 'Lijst';
			case 'common.views.grid': return 'Raster';
			case 'common.views.table': return 'Tabel';
			case 'common.views.form': return 'Formulier';
			case 'common.units.length.kilometer': return 'Kilometer';
			case 'common.units.length.meter': return 'Meter';
			case 'common.units.length.centimeter': return 'Centimeter';
			case 'common.units.length.millimeter': return 'Millimeter';
			case 'common.units.length.micrometer': return 'Micrometer';
			case 'common.units.length.nanometer': return 'Nanometer';
			case 'common.units.weight.kilogram': return 'Kilogram';
			case 'common.units.weight.gram': return 'Gram';
			case 'common.units.weight.milligram': return 'Milligram';
			case 'common.units.weight.ton': return 'Ton';
			case 'common.units.volume.liter': return 'Liter';
			case 'common.units.volume.milliliter': return 'Milliliter';
			case 'common.units.volume.cubicMeter': return 'Kubieke Meter';
			case 'common.units.time.second': return 'Seconde';
			case 'common.units.time.minute': return 'Minuut';
			case 'common.units.time.hour': return 'Uur';
			case 'common.units.time.day': return 'Dag';
			case 'common.units.time.week': return 'Week';
			case 'common.units.time.month': return 'Maand';
			case 'common.units.time.year': return 'Jaar';
			case 'common.units.area.squareMeter': return 'Vierkante Meter';
			case 'common.units.area.hectare': return 'Hectare';
			case 'common.units.area.acre': return 'Acre';
			case 'common.numbers.k1': return 'Een';
			case 'common.numbers.k2': return 'Twee';
			case 'common.numbers.k3': return 'Drie';
			case 'common.numbers.k4': return 'Vier';
			case 'common.numbers.k5': return 'Vijf';
			case 'common.numbers.k6': return 'Zes';
			case 'common.numbers.k7': return 'Zeven';
			case 'common.numbers.k8': return 'Acht';
			case 'common.numbers.k9': return 'Negen';
			case 'common.numbers.k10': return 'Tien';
			case 'common.ranks.k1': return 'eerste';
			case 'common.ranks.k2': return 'tweede';
			case 'common.ranks.k3': return 'derde';
			case 'common.ranks.k4': return 'vierde';
			case 'common.ranks.k5': return 'vijfde';
			case 'common.ranks.k6': return 'zesde';
			case 'common.ranks.k7': return 'zevende';
			case 'common.ranks.k8': return 'achtste';
			case 'common.ranks.k9': return 'negende';
			case 'common.ranks.k10': return 'tiende';
			case 'common.control.on': return 'Aan';
			case 'common.control.off': return 'Uit';
			case 'common.control.yes': return 'Ja';
			case 'common.control.no': return 'Nee';
			case 'common.control.confirm': return 'Bevestigen';
			case 'common.control.cancel': return 'Annuleren';
			case 'common.control.retry': return 'Opnieuw proberen';
			case 'common.control.logout': return 'Uitloggen';
			case 'common.control.edit': return 'Bewerken';
			case 'common.control.delete': return 'Verwijderen';
			case 'common.control.revert': return 'Terugzetten';
			case 'common.control.save': return 'Opslaan';
			case 'common.buttons.submit': return 'Verzenden';
			case 'common.buttons.close': return 'Sluiten';
			case 'common.buttons.reset': return 'Resetten';
			case 'common.buttons.cancel': return 'Annuleren';
			case 'common.buttons.kContinue': return 'Doorgaan';
			case 'common.buttons.back': return 'Terug';
			case 'common.buttons.next': return 'Volgende';
			case 'common.buttons.done': return 'Klaar';
			case 'common.buttons.upload': return 'Uploaden';
			case 'common.buttons.choose': return 'Kiezen';
			case 'common.buttons.select': return 'Selecteren';
			case 'common.buttons.clear': return 'Wissen';
			case 'common.buttons.start': return 'Starten';
			case 'common.labels.required': return 'Verplicht';
			case 'common.labels.optional': return 'Optioneel';
			case 'common.labels.instructions': return 'Instructies:';
			case 'common.labels.status': return 'Status';
			case 'common.labels.progress': return 'Voortgang';
			case 'common.labels.question': return 'Vraag';
			case 'common.labels.answer': return 'Antwoord';
			case 'common.labels.response': return 'Reactie';
			case 'common.labels.loading': return 'Laden...';
			case 'common.labels.error': return 'Fout';
			case 'common.labels.success': return 'Succes';
			case 'common.labels.warning': return 'Waarschuwing';
			case 'common.response.success': return 'Succes';
			case 'common.response.error': return 'Fout';
			case 'common.response.info': return 'Informatie';
			case 'common.response.warning': return 'Waarschuwing';
			case 'common.response.tbd': return 'Nog Te Bepalen';
			case 'common.response.wip': return 'In Bewerking';
			case 'common.priority.high': return 'Hoog';
			case 'common.priority.medium': return 'Gemiddeld';
			case 'common.priority.low': return 'Laag';
			case 'common.date.today': return 'Vandaag';
			case 'common.date.yesterday': return 'Gisteren';
			case 'common.date.tomorrow': return 'Morgen';
			case 'common.date.justNow': return 'Zojuist';
			case 'common.date.aMomentAgo': return 'Een moment geleden';
			case 'common.date.minutesAgo': return 'Minuten geleden';
			case 'common.date.hoursAgo': return 'Uren geleden';
			case 'common.date.daysAgo': return ({required Object days}) => '${days} dagen geleden';
			case 'common.date.weeksAgo': return 'Weken geleden';
			case 'common.date.thisWeek': return 'Deze week';
			case 'common.date.lastWeek': return 'Vorige week';
			case 'common.date.thisMonth': return 'Deze maand';
			case 'common.date.lastMonth': return 'Vorige maand';
			case 'common.date.thisYear': return 'Dit jaar';
			case 'common.date.lastYear': return 'Vorig jaar';
			case 'common.date.daysAhead': return ({required Object days}) => 'Over ${days} dagen';
			case 'common.weekdays.full.sunday': return 'Zondag';
			case 'common.weekdays.full.monday': return 'Maandag';
			case 'common.weekdays.full.tuesday': return 'Dinsdag';
			case 'common.weekdays.full.wednesday': return 'Woensdag';
			case 'common.weekdays.full.thursday': return 'Donderdag';
			case 'common.weekdays.full.friday': return 'Vrijdag';
			case 'common.weekdays.full.saturday': return 'Zaterdag';
			case 'common.weekdays.short.sunday': return 'Zo';
			case 'common.weekdays.short.monday': return 'Ma';
			case 'common.weekdays.short.tuesday': return 'Di';
			case 'common.weekdays.short.wednesday': return 'Wo';
			case 'common.weekdays.short.thursday': return 'Do';
			case 'common.weekdays.short.friday': return 'Vr';
			case 'common.weekdays.short.saturday': return 'Za';
			case 'common.formRestrictions.required': return 'Dit veld is verplicht.';
			case 'common.formRestrictions.minLength': return ({required Object min}) => 'Minimale lengte is ${min} karakters.';
			case 'common.formRestrictions.maxLength': return ({required Object max}) => 'Maximale lengte is ${max} karakters.';
			case 'common.formRestrictions.invalidFormat': return 'Het formaat is ongeldig.';
			case 'common.formRestrictions.pattern': return ({required Object pattern}) => 'Dit veld moet het patroon ${pattern} volgen.';
			case 'common.tos.accept': return 'Ik accepteer de Algemene Voorwaarden';
			case 'common.tos.readAccept': return 'Lees en accepteer onze Algemene Voorwaarden';
			case 'common.tos.title': return 'Algemene Voorwaarden';
			case 'common.tos.service': return 'Servicevoorwaarden';
			case 'common.tos.privacy': return 'Privacybeleid';
			case 'common.tos.continueAgree': return 'Door door te gaan, ga je akkoord met onze Algemene Voorwaarden';
			case 'common.tos.mustAccept': return 'Je moet de Algemene Voorwaarden accepteren om door te gaan';
			case 'common.tos.view': return 'Bekijk Algemene Voorwaarden';
			case 'common.tos.lastUpdated': return ({required Object date}) => 'Laatst bijgewerkt: ${date}';
			case 'common.tos.contactInfo': return 'Neem contact met ons op voor meer informatie over onze Algemene Voorwaarden';
			case 'common.permissions.allowLocation': return 'Toegang tot locatie toestaan?';
			case 'common.permissions.allowCamera': return 'Toegang tot camera toestaan?';
			case 'common.permissions.allowMicrophone': return 'Toegang tot microfoon toestaan?';
			case 'common.permissions.allowNotifications': return 'Meldingen toestaan?';
			case 'common.permissions.allowContacts': return 'Toegang tot contacten toestaan?';
			case 'common.permissions.allowPhotos': return 'Toegang tot foto\'s toestaan?';
			case 'common.permissions.allowStorage': return 'Toegang tot opslag toestaan?';
			case 'common.permissions.allowBluetooth': return 'Bluetooth-toegang toestaan?';
			case 'common.permissions.needPermission': return 'We hebben je toestemming nodig om door te gaan';
			case 'common.permissions.permissionDenied': return 'Toestemming geweigerd';
			case 'common.permissions.permissionRequired': return 'Deze toestemming is vereist';
			case 'common.permissions.enableInSettings': return 'Schakel in bij Instellingen';
			case 'common.prompts.sessionExpired': return 'Je sessie is verlopen';
			case 'common.prompts.areYouSure': return 'Weet je het zeker?';
			case 'common.prompts.cannotBeUndone': return 'Deze actie kan niet ongedaan worden gemaakt';
			case 'common.prompts.unsavedChanges': return 'Je hebt niet-opgeslagen wijzigingen';
			case 'common.prompts.discardChanges': return 'Wijzigingen verwerpen?';
			case 'common.prompts.locationDisabled': return 'Locatieservices zijn uitgeschakeld';
			case 'common.prompts.networkRequired': return 'Netwerkverbinding vereist';
			case 'common.prompts.loginRequired': return 'Inloggen vereist om door te gaan';
			case 'common.prompts.confirmDelete': return 'Weet je zeker dat je dit wilt verwijderen?';
			case 'common.prompts.confirmLogout': return 'Weet je zeker dat je wilt uitloggen?';
			case 'common.prompts.saveBeforeExit': return 'Wil je opslaan voordat je afsluit?';
			case 'common.prompts.reloadPage': return 'Wil je de pagina herladen?';
			case 'common.prompts.updateAvailable': return 'Er is een update beschikbaar';
			case 'common.prompts.restartRequired': return 'Herstart vereist om wijzigingen toe te passen';
			case 'login.message.success': return 'Inloggen succesvol.';
			case 'login.message.error': return 'Inloggen mislukt. Probeer opnieuw.';
			case 'login.message.wrongPassword': return 'Controleer je inloggegevens.';
			case 'login.form.username': return 'Gebruikersnaam';
			case 'login.form.password': return 'Wachtwoord';
			case 'login.form.submit': return 'Inloggen';
			case 'login.form.createAccount': return 'Nieuw account aanmaken';
			case 'login.form.forgotPassword': return 'Wachtwoord vergeten';
			case 'login.tooltip.username': return 'Voer je gebruikersnaam in';
			case 'login.tooltip.password': return 'Voer je wachtwoord in';
			case 'login.tooltip.submit': return 'Klik om in te loggen';
			case 'login.validation.username.required': return 'Gebruikersnaam is verplicht.';
			case 'login.validation.password.required': return 'Wachtwoord is verplicht.';
			case 'register.message.success': return 'Registratie succesvol.';
			case 'register.message.error': return 'Registratie mislukt. Probeer opnieuw.';
			case 'register.form.username': return 'Gebruikersnaam';
			case 'register.form.email': return 'E-mail';
			case 'register.form.password': return 'Wachtwoord';
			case 'register.form.submit': return 'Registreren';
			case 'register.form.acceptTos': return 'Ik accepteer de Servicevoorwaarden';
			case 'register.tooltip.username': return 'Voer je gebruikersnaam in';
			case 'register.tooltip.email': return 'Voer je e-mail in';
			case 'register.tooltip.password': return 'Voer je wachtwoord in';
			case 'register.tooltip.submit': return 'Klik om te registreren';
			case 'register.validation.username.required': return 'Gebruikersnaam is verplicht.';
			case 'register.validation.username.minLength': return ({required Object min}) => 'Gebruikersnaam moet minimaal ${min} karakters lang zijn.';
			case 'register.validation.username.maxLength': return ({required Object max}) => 'Gebruikersnaam mag maximaal ${max} karakters lang zijn.';
			case 'register.validation.email.required': return 'E-mail is verplicht.';
			case 'register.validation.email.invalid': return 'E-mail is niet geldig.';
			case 'register.validation.password.required': return 'Wachtwoord is verplicht.';
			case 'register.validation.password.minLength': return ({required Object min}) => 'Wachtwoord moet minimaal ${min} karakters lang zijn.';
			case 'passwordReset.message.success': return 'Wachtwoord reset e-mail verzonden.';
			case 'passwordReset.message.error': return 'Wachtwoord reset mislukt. Probeer opnieuw.';
			case 'passwordReset.form.email': return 'E-mail';
			case 'passwordReset.form.submit': return 'Wachtwoord Resetten';
			case 'passwordReset.tooltip.email': return 'Voer je e-mail in';
			case 'passwordReset.tooltip.submit': return 'Klik om wachtwoord te resetten';
			case 'passwordReset.validation.email.required': return 'E-mail is verplicht.';
			case 'passwordReset.validation.email.invalid': return 'E-mail is niet geldig.';
			case 'languages.current.en': return 'Engels';
			case 'languages.current.da': return 'Deens';
			case 'languages.current.es': return 'Spaans';
			case 'languages.current.fr': return 'Frans';
			case 'languages.current.he': return 'Hebreeuws';
			case 'languages.current.isIS': return 'IJslands';
			case 'languages.current.ko': return 'Koreaans';
			case 'languages.current.nb': return 'Noors (Bokmål)';
			case 'languages.current.nl': return 'Nederlands';
			case 'languages.current.no': return 'Noors';
			case 'languages.current.sv': return 'Zweeds';
			case 'languages.current.zhHans': return 'Chinees (Vereenvoudigd)';
			case 'languages.current.zh': return 'Chinees (Traditioneel)';
			default: return null;
		}
	}
}

