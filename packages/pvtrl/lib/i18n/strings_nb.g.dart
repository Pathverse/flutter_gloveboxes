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
class TranslationsNb extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsNb({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.nb,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <nb>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsNb _root = this; // ignore: unused_field

	@override 
	TranslationsNb $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsNb(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsCommonNb common = TranslationsCommonNb._(_root);
	@override late final TranslationsLoginNb login = TranslationsLoginNb._(_root);
	@override late final TranslationsRegisterNb register = TranslationsRegisterNb._(_root);
	@override late final TranslationsPasswordResetNb passwordReset = TranslationsPasswordResetNb._(_root);
}

// Path: common
class TranslationsCommonNb extends TranslationsCommonEn {
	TranslationsCommonNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMessageNb message = TranslationsCommonMessageNb._(_root);
	@override late final TranslationsCommonGameNb game = TranslationsCommonGameNb._(_root);
	@override late final TranslationsCommonSocialNb social = TranslationsCommonSocialNb._(_root);
	@override late final TranslationsCommonViewsNb views = TranslationsCommonViewsNb._(_root);
	@override late final TranslationsCommonUnitsNb units = TranslationsCommonUnitsNb._(_root);
	@override late final TranslationsCommonNumbersNb numbers = TranslationsCommonNumbersNb._(_root);
	@override late final TranslationsCommonRanksNb ranks = TranslationsCommonRanksNb._(_root);
	@override late final TranslationsCommonControlNb control = TranslationsCommonControlNb._(_root);
	@override late final TranslationsCommonResponseNb response = TranslationsCommonResponseNb._(_root);
	@override late final TranslationsCommonPriorityNb priority = TranslationsCommonPriorityNb._(_root);
	@override late final TranslationsCommonDateNb date = TranslationsCommonDateNb._(_root);
	@override late final TranslationsCommonWeekdaysNb weekdays = TranslationsCommonWeekdaysNb._(_root);
	@override late final TranslationsCommonFormRestrictionsNb formRestrictions = TranslationsCommonFormRestrictionsNb._(_root);
	@override late final TranslationsCommonTosNb tos = TranslationsCommonTosNb._(_root);
	@override late final TranslationsCommonPermissionsNb permissions = TranslationsCommonPermissionsNb._(_root);
	@override late final TranslationsCommonPromptsNb prompts = TranslationsCommonPromptsNb._(_root);
}

// Path: login
class TranslationsLoginNb extends TranslationsLoginEn {
	TranslationsLoginNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginMessageNb message = TranslationsLoginMessageNb._(_root);
	@override late final TranslationsLoginFormNb form = TranslationsLoginFormNb._(_root);
	@override late final TranslationsLoginTooltipNb tooltip = TranslationsLoginTooltipNb._(_root);
	@override late final TranslationsLoginValidationNb validation = TranslationsLoginValidationNb._(_root);
}

// Path: register
class TranslationsRegisterNb extends TranslationsRegisterEn {
	TranslationsRegisterNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterMessageNb message = TranslationsRegisterMessageNb._(_root);
	@override late final TranslationsRegisterFormNb form = TranslationsRegisterFormNb._(_root);
	@override late final TranslationsRegisterTooltipNb tooltip = TranslationsRegisterTooltipNb._(_root);
	@override late final TranslationsRegisterValidationNb validation = TranslationsRegisterValidationNb._(_root);
}

// Path: passwordReset
class TranslationsPasswordResetNb extends TranslationsPasswordResetEn {
	TranslationsPasswordResetNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetMessageNb message = TranslationsPasswordResetMessageNb._(_root);
	@override late final TranslationsPasswordResetFormNb form = TranslationsPasswordResetFormNb._(_root);
	@override late final TranslationsPasswordResetTooltipNb tooltip = TranslationsPasswordResetTooltipNb._(_root);
	@override late final TranslationsPasswordResetValidationNb validation = TranslationsPasswordResetValidationNb._(_root);
}

// Path: common.message
class TranslationsCommonMessageNb extends TranslationsCommonMessageEn {
	TranslationsCommonMessageNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get loading => 'Laster';
	@override String get somethingWentWrong => 'Noe gikk galt';
	@override String get networkProblem => 'Det er et nettverksproblem';
	@override String get noDataFound => 'Ingen data funnet';
	@override String get noResultsFound => 'Ingen resultater funnet';
	@override String get unsupportedFileType => 'Ikke-støttet filtype';
	@override String get fileTooLarge => 'Filen er for stor';
	@override String get operationTimedOut => 'Operasjonen fikk tidsavbrudd';
	@override String get sessionExpired => 'Sesjonen er utløpt';
	@override String get unsavableChanges => 'Endringer kunne ikke lagres';
	@override String get noServerConnect => 'Kunne ikke koble til serveren';
	@override String get accessDenied => 'Tilgang nektet';
}

// Path: common.game
class TranslationsCommonGameNb extends TranslationsCommonGameEn {
	TranslationsCommonGameNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get start => 'Start Spill';
	@override String get pause => 'Pause Spill';
	@override String get resume => 'Gjenoppta Spill';
	@override String get end => 'Avslutt Spill';
	@override String get levelUp => 'Nivå Opp';
	@override String get gameOver => 'Spill Over';
	@override String get nextLevel => 'Neste Nivå';
	@override String get previousLevel => 'Forrige Nivå';
	@override String get restart => 'Start Spill På Nytt';
}

// Path: common.social
class TranslationsCommonSocialNb extends TranslationsCommonSocialEn {
	TranslationsCommonSocialNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get like => 'Lik';
	@override String get share => 'Del';
	@override String get comment => 'Kommenter';
	@override String get follow => 'Følg';
	@override String get unfollow => 'Slutt å følge';
	@override String get unlike => 'Ikke lik';
	@override String get reply => 'Svar';
	@override String get dislike => 'Lik ikke';
	@override String get block => 'Blokker';
	@override String get blockUser => 'Blokker Bruker';
	@override String get report => 'Rapporter';
	@override String get mute => 'Demp';
	@override String get uSentFriendRequest => 'Du sendte en venneforespørsel';
	@override String get uReceivedFriendRequest => 'Du mottok en venneforespørsel';
	@override String get sentFriendRequest => 'sendte en venneforespørsel';
	@override String get receivedFriendRequest => 'mottok en venneforespørsel';
	@override String get acceptedFriendRequest => 'aksepterte en venneforespørsel';
	@override String get uAcceptedFriendRequest => 'Du aksepterte en venneforespørsel';
}

// Path: common.views
class TranslationsCommonViewsNb extends TranslationsCommonViewsEn {
	TranslationsCommonViewsNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get list => 'Liste';
	@override String get grid => 'Rutenett';
	@override String get table => 'Tabell';
	@override String get form => 'Skjema';
}

// Path: common.units
class TranslationsCommonUnitsNb extends TranslationsCommonUnitsEn {
	TranslationsCommonUnitsNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonUnitsLengthNb length = TranslationsCommonUnitsLengthNb._(_root);
	@override late final TranslationsCommonUnitsWeightNb weight = TranslationsCommonUnitsWeightNb._(_root);
	@override late final TranslationsCommonUnitsVolumeNb volume = TranslationsCommonUnitsVolumeNb._(_root);
	@override late final TranslationsCommonUnitsTimeNb time = TranslationsCommonUnitsTimeNb._(_root);
	@override late final TranslationsCommonUnitsAreaNb area = TranslationsCommonUnitsAreaNb._(_root);
}

// Path: common.numbers
class TranslationsCommonNumbersNb extends TranslationsCommonNumbersEn {
	TranslationsCommonNumbersNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'En';
	@override String get k2 => 'To';
	@override String get k3 => 'Tre';
	@override String get k4 => 'Fire';
	@override String get k5 => 'Fem';
	@override String get k6 => 'Seks';
	@override String get k7 => 'Syv';
	@override String get k8 => 'Åtte';
	@override String get k9 => 'Ni';
	@override String get k10 => 'Ti';
}

// Path: common.ranks
class TranslationsCommonRanksNb extends TranslationsCommonRanksEn {
	TranslationsCommonRanksNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'første';
	@override String get k2 => 'andre';
	@override String get k3 => 'tredje';
	@override String get k4 => 'fjerde';
	@override String get k5 => 'femte';
	@override String get k6 => 'sjette';
	@override String get k7 => 'syvende';
	@override String get k8 => 'åttende';
	@override String get k9 => 'niende';
	@override String get k10 => 'tiende';
}

// Path: common.control
class TranslationsCommonControlNb extends TranslationsCommonControlEn {
	TranslationsCommonControlNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get on => 'På';
	@override String get off => 'Av';
	@override String get yes => 'Ja';
	@override String get no => 'Nei';
	@override String get confirm => 'Bekreft';
	@override String get cancel => 'Avbryt';
	@override String get retry => 'Prøv igjen';
	@override String get logout => 'Logg ut';
	@override String get edit => 'Rediger';
	@override String get delete => 'Slett';
	@override String get revert => 'Tilbakestill';
	@override String get save => 'Lagre';
}

// Path: common.response
class TranslationsCommonResponseNb extends TranslationsCommonResponseEn {
	TranslationsCommonResponseNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get success => 'Suksess';
	@override String get error => 'Feil';
	@override String get info => 'Informasjon';
	@override String get warning => 'Advarsel';
	@override String get tbd => 'Skal Bestemmes';
	@override String get wip => 'Pågående Arbeid';
}

// Path: common.priority
class TranslationsCommonPriorityNb extends TranslationsCommonPriorityEn {
	TranslationsCommonPriorityNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get high => 'Høy';
	@override String get medium => 'Medium';
	@override String get low => 'Lav';
}

// Path: common.date
class TranslationsCommonDateNb extends TranslationsCommonDateEn {
	TranslationsCommonDateNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get today => 'I dag';
	@override String get yesterday => 'I går';
	@override String get tomorrow => 'I morgen';
	@override String get justNow => 'Akkurat nå';
	@override String get aMomentAgo => 'Et øyeblikk siden';
	@override String get minutesAgo => 'Minutter siden';
	@override String get hoursAgo => 'Timer siden';
	@override String daysAgo({required Object days}) => '${days} dager siden';
	@override String get weeksAgo => 'Uker siden';
	@override String get thisWeek => 'Denne uken';
	@override String get lastWeek => 'Forrige uke';
	@override String get thisMonth => 'Denne måneden';
	@override String get lastMonth => 'Forrige måned';
	@override String get thisYear => 'Dette året';
	@override String get lastYear => 'I fjor';
	@override String daysAhead({required Object days}) => 'Om ${days} dager';
}

// Path: common.weekdays
class TranslationsCommonWeekdaysNb extends TranslationsCommonWeekdaysEn {
	TranslationsCommonWeekdaysNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonWeekdaysFullNb full = TranslationsCommonWeekdaysFullNb._(_root);
	@override late final TranslationsCommonWeekdaysShortNb short = TranslationsCommonWeekdaysShortNb._(_root);
}

// Path: common.formRestrictions
class TranslationsCommonFormRestrictionsNb extends TranslationsCommonFormRestrictionsEn {
	TranslationsCommonFormRestrictionsNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get required => 'Dette feltet er påkrevd.';
	@override String minLength({required Object min}) => 'Minimum lengde er ${min} tegn.';
	@override String maxLength({required Object max}) => 'Maksimum lengde er ${max} tegn.';
	@override String get invalidFormat => 'Formatet er ugyldig.';
	@override String pattern({required Object pattern}) => 'Dette feltet må følge mønsteret ${pattern}.';
}

// Path: common.tos
class TranslationsCommonTosNb extends TranslationsCommonTosEn {
	TranslationsCommonTosNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Jeg aksepterer Vilkår og Betingelser';
	@override String get readAccept => 'Les og aksepter våre Vilkår og Betingelser';
	@override String get title => 'Vilkår og Betingelser';
	@override String get service => 'Tjenestevilkår';
	@override String get privacy => 'Personvernpolicy';
	@override String get continueAgree => 'Ved å fortsette godtar du våre Vilkår og Betingelser';
	@override String get mustAccept => 'Du må akseptere Vilkår og Betingelser for å fortsette';
	@override String get view => 'Se Vilkår og Betingelser';
	@override String lastUpdated({required Object date}) => 'Sist oppdatert: ${date}';
	@override String get contactInfo => 'Kontakt oss for mer informasjon om våre Vilkår og Betingelser';
}

// Path: common.permissions
class TranslationsCommonPermissionsNb extends TranslationsCommonPermissionsEn {
	TranslationsCommonPermissionsNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get allowLocation => 'Tillat tilgang til posisjon?';
	@override String get allowCamera => 'Tillat tilgang til kamera?';
	@override String get allowMicrophone => 'Tillat tilgang til mikrofon?';
	@override String get allowNotifications => 'Tillat varsler?';
	@override String get allowContacts => 'Tillat tilgang til kontakter?';
	@override String get allowPhotos => 'Tillat tilgang til bilder?';
	@override String get allowStorage => 'Tillat tilgang til lagring?';
	@override String get allowBluetooth => 'Tillat Bluetooth-tilgang?';
	@override String get needPermission => 'Vi trenger din tillatelse for å fortsette';
	@override String get permissionDenied => 'Tillatelse nektet';
	@override String get permissionRequired => 'Denne tillatelsen er påkrevd';
	@override String get enableInSettings => 'Aktiver i Innstillinger';
}

// Path: common.prompts
class TranslationsCommonPromptsNb extends TranslationsCommonPromptsEn {
	TranslationsCommonPromptsNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get sessionExpired => 'Sesjonen din er utløpt';
	@override String get areYouSure => 'Er du sikker?';
	@override String get cannotBeUndone => 'Denne handlingen kan ikke angres';
	@override String get unsavedChanges => 'Du har ulagrede endringer';
	@override String get discardChanges => 'Forkast endringer?';
	@override String get locationDisabled => 'Posisjonstjenester er deaktivert';
	@override String get networkRequired => 'Nettverkstilkobling påkrevd';
	@override String get loginRequired => 'Innlogging påkrevd for å fortsette';
	@override String get confirmDelete => 'Er du sikker på at du vil slette dette?';
	@override String get confirmLogout => 'Er du sikker på at du vil logge ut?';
	@override String get saveBeforeExit => 'Vil du lagre før du avslutter?';
	@override String get reloadPage => 'Vil du laste siden på nytt?';
	@override String get updateAvailable => 'En oppdatering er tilgjengelig';
	@override String get restartRequired => 'Omstart påkrevd for å aktivere endringer';
}

// Path: login.message
class TranslationsLoginMessageNb extends TranslationsLoginMessageEn {
	TranslationsLoginMessageNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get success => 'Innlogging vellykket.';
	@override String get error => 'Innlogging mislyktes. Prøv igjen.';
	@override String get wrongPassword => 'Bekreft legitimasjonen din.';
}

// Path: login.form
class TranslationsLoginFormNb extends TranslationsLoginFormEn {
	TranslationsLoginFormNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get username => 'Brukernavn';
	@override String get password => 'Passord';
	@override String get submit => 'Logg inn';
	@override String get createAccount => 'Opprett ny konto';
	@override String get forgotPassword => 'Glemt passord';
}

// Path: login.tooltip
class TranslationsLoginTooltipNb extends TranslationsLoginTooltipEn {
	TranslationsLoginTooltipNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get username => 'Skriv inn brukernavnet ditt';
	@override String get password => 'Skriv inn passordet ditt';
	@override String get submit => 'Klikk for å logge inn';
}

// Path: login.validation
class TranslationsLoginValidationNb extends TranslationsLoginValidationEn {
	TranslationsLoginValidationNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginValidationUsernameNb username = TranslationsLoginValidationUsernameNb._(_root);
	@override late final TranslationsLoginValidationPasswordNb password = TranslationsLoginValidationPasswordNb._(_root);
}

// Path: register.message
class TranslationsRegisterMessageNb extends TranslationsRegisterMessageEn {
	TranslationsRegisterMessageNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get success => 'Registrering vellykket.';
	@override String get error => 'Registrering mislyktes. Prøv igjen.';
}

// Path: register.form
class TranslationsRegisterFormNb extends TranslationsRegisterFormEn {
	TranslationsRegisterFormNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get username => 'Brukernavn';
	@override String get email => 'E-post';
	@override String get password => 'Passord';
	@override String get submit => 'Registrer';
	@override String get acceptTos => 'Jeg aksepterer Tjenestevilkårene';
}

// Path: register.tooltip
class TranslationsRegisterTooltipNb extends TranslationsRegisterTooltipEn {
	TranslationsRegisterTooltipNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get username => 'Skriv inn brukernavnet ditt';
	@override String get email => 'Skriv inn e-posten din';
	@override String get password => 'Skriv inn passordet ditt';
	@override String get submit => 'Klikk for å registrere';
}

// Path: register.validation
class TranslationsRegisterValidationNb extends TranslationsRegisterValidationEn {
	TranslationsRegisterValidationNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterValidationUsernameNb username = TranslationsRegisterValidationUsernameNb._(_root);
	@override late final TranslationsRegisterValidationEmailNb email = TranslationsRegisterValidationEmailNb._(_root);
	@override late final TranslationsRegisterValidationPasswordNb password = TranslationsRegisterValidationPasswordNb._(_root);
}

// Path: passwordReset.message
class TranslationsPasswordResetMessageNb extends TranslationsPasswordResetMessageEn {
	TranslationsPasswordResetMessageNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get success => 'E-post for tilbakestilling av passord sendt.';
	@override String get error => 'Tilbakestilling av passord mislyktes. Prøv igjen.';
}

// Path: passwordReset.form
class TranslationsPasswordResetFormNb extends TranslationsPasswordResetFormEn {
	TranslationsPasswordResetFormNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get email => 'E-post';
	@override String get submit => 'Tilbakestill Passord';
}

// Path: passwordReset.tooltip
class TranslationsPasswordResetTooltipNb extends TranslationsPasswordResetTooltipEn {
	TranslationsPasswordResetTooltipNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get email => 'Skriv inn e-posten din';
	@override String get submit => 'Klikk for å tilbakestille passord';
}

// Path: passwordReset.validation
class TranslationsPasswordResetValidationNb extends TranslationsPasswordResetValidationEn {
	TranslationsPasswordResetValidationNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetValidationEmailNb email = TranslationsPasswordResetValidationEmailNb._(_root);
}

// Path: common.units.length
class TranslationsCommonUnitsLengthNb extends TranslationsCommonUnitsLengthEn {
	TranslationsCommonUnitsLengthNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get kilometer => 'Kilometer';
	@override String get meter => 'Meter';
	@override String get centimeter => 'Centimeter';
	@override String get millimeter => 'Millimeter';
	@override String get micrometer => 'Mikrometer';
	@override String get nanometer => 'Nanometer';
}

// Path: common.units.weight
class TranslationsCommonUnitsWeightNb extends TranslationsCommonUnitsWeightEn {
	TranslationsCommonUnitsWeightNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get kilogram => 'Kilogram';
	@override String get gram => 'Gram';
	@override String get milligram => 'Milligram';
	@override String get ton => 'Tonn';
}

// Path: common.units.volume
class TranslationsCommonUnitsVolumeNb extends TranslationsCommonUnitsVolumeEn {
	TranslationsCommonUnitsVolumeNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get liter => 'Liter';
	@override String get milliliter => 'Milliliter';
	@override String get cubicMeter => 'Kubikkmeter';
}

// Path: common.units.time
class TranslationsCommonUnitsTimeNb extends TranslationsCommonUnitsTimeEn {
	TranslationsCommonUnitsTimeNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get second => 'Sekund';
	@override String get minute => 'Minutt';
	@override String get hour => 'Time';
	@override String get day => 'Dag';
	@override String get week => 'Uke';
	@override String get month => 'Måned';
	@override String get year => 'År';
}

// Path: common.units.area
class TranslationsCommonUnitsAreaNb extends TranslationsCommonUnitsAreaEn {
	TranslationsCommonUnitsAreaNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get squareMeter => 'Kvadratmeter';
	@override String get hectare => 'Hektar';
	@override String get acre => 'Acre';
}

// Path: common.weekdays.full
class TranslationsCommonWeekdaysFullNb extends TranslationsCommonWeekdaysFullEn {
	TranslationsCommonWeekdaysFullNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

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
class TranslationsCommonWeekdaysShortNb extends TranslationsCommonWeekdaysShortEn {
	TranslationsCommonWeekdaysShortNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

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
class TranslationsLoginValidationUsernameNb extends TranslationsLoginValidationUsernameEn {
	TranslationsLoginValidationUsernameNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get required => 'Brukernavn er påkrevd.';
}

// Path: login.validation.password
class TranslationsLoginValidationPasswordNb extends TranslationsLoginValidationPasswordEn {
	TranslationsLoginValidationPasswordNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get required => 'Passord er påkrevd.';
}

// Path: register.validation.username
class TranslationsRegisterValidationUsernameNb extends TranslationsRegisterValidationUsernameEn {
	TranslationsRegisterValidationUsernameNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get required => 'Brukernavn er påkrevd.';
	@override String minLength({required Object min}) => 'Brukernavn må være minst ${min} tegn langt.';
	@override String maxLength({required Object max}) => 'Brukernavn må være maksimalt ${max} tegn langt.';
}

// Path: register.validation.email
class TranslationsRegisterValidationEmailNb extends TranslationsRegisterValidationEmailEn {
	TranslationsRegisterValidationEmailNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get required => 'E-post er påkrevd.';
	@override String get invalid => 'E-post er ikke gyldig.';
}

// Path: register.validation.password
class TranslationsRegisterValidationPasswordNb extends TranslationsRegisterValidationPasswordEn {
	TranslationsRegisterValidationPasswordNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get required => 'Passord er påkrevd.';
	@override String minLength({required Object min}) => 'Passord må være minst ${min} tegn langt.';
}

// Path: passwordReset.validation.email
class TranslationsPasswordResetValidationEmailNb extends TranslationsPasswordResetValidationEmailEn {
	TranslationsPasswordResetValidationEmailNb._(TranslationsNb root) : this._root = root, super.internal(root);

	final TranslationsNb _root; // ignore: unused_field

	// Translations
	@override String get required => 'E-post er påkrevd.';
	@override String get invalid => 'E-post er ikke gyldig.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsNb {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.message.loading': return 'Laster';
			case 'common.message.somethingWentWrong': return 'Noe gikk galt';
			case 'common.message.networkProblem': return 'Det er et nettverksproblem';
			case 'common.message.noDataFound': return 'Ingen data funnet';
			case 'common.message.noResultsFound': return 'Ingen resultater funnet';
			case 'common.message.unsupportedFileType': return 'Ikke-støttet filtype';
			case 'common.message.fileTooLarge': return 'Filen er for stor';
			case 'common.message.operationTimedOut': return 'Operasjonen fikk tidsavbrudd';
			case 'common.message.sessionExpired': return 'Sesjonen er utløpt';
			case 'common.message.unsavableChanges': return 'Endringer kunne ikke lagres';
			case 'common.message.noServerConnect': return 'Kunne ikke koble til serveren';
			case 'common.message.accessDenied': return 'Tilgang nektet';
			case 'common.game.start': return 'Start Spill';
			case 'common.game.pause': return 'Pause Spill';
			case 'common.game.resume': return 'Gjenoppta Spill';
			case 'common.game.end': return 'Avslutt Spill';
			case 'common.game.levelUp': return 'Nivå Opp';
			case 'common.game.gameOver': return 'Spill Over';
			case 'common.game.nextLevel': return 'Neste Nivå';
			case 'common.game.previousLevel': return 'Forrige Nivå';
			case 'common.game.restart': return 'Start Spill På Nytt';
			case 'common.social.like': return 'Lik';
			case 'common.social.share': return 'Del';
			case 'common.social.comment': return 'Kommenter';
			case 'common.social.follow': return 'Følg';
			case 'common.social.unfollow': return 'Slutt å følge';
			case 'common.social.unlike': return 'Ikke lik';
			case 'common.social.reply': return 'Svar';
			case 'common.social.dislike': return 'Lik ikke';
			case 'common.social.block': return 'Blokker';
			case 'common.social.blockUser': return 'Blokker Bruker';
			case 'common.social.report': return 'Rapporter';
			case 'common.social.mute': return 'Demp';
			case 'common.social.uSentFriendRequest': return 'Du sendte en venneforespørsel';
			case 'common.social.uReceivedFriendRequest': return 'Du mottok en venneforespørsel';
			case 'common.social.sentFriendRequest': return 'sendte en venneforespørsel';
			case 'common.social.receivedFriendRequest': return 'mottok en venneforespørsel';
			case 'common.social.acceptedFriendRequest': return 'aksepterte en venneforespørsel';
			case 'common.social.uAcceptedFriendRequest': return 'Du aksepterte en venneforespørsel';
			case 'common.views.list': return 'Liste';
			case 'common.views.grid': return 'Rutenett';
			case 'common.views.table': return 'Tabell';
			case 'common.views.form': return 'Skjema';
			case 'common.units.length.kilometer': return 'Kilometer';
			case 'common.units.length.meter': return 'Meter';
			case 'common.units.length.centimeter': return 'Centimeter';
			case 'common.units.length.millimeter': return 'Millimeter';
			case 'common.units.length.micrometer': return 'Mikrometer';
			case 'common.units.length.nanometer': return 'Nanometer';
			case 'common.units.weight.kilogram': return 'Kilogram';
			case 'common.units.weight.gram': return 'Gram';
			case 'common.units.weight.milligram': return 'Milligram';
			case 'common.units.weight.ton': return 'Tonn';
			case 'common.units.volume.liter': return 'Liter';
			case 'common.units.volume.milliliter': return 'Milliliter';
			case 'common.units.volume.cubicMeter': return 'Kubikkmeter';
			case 'common.units.time.second': return 'Sekund';
			case 'common.units.time.minute': return 'Minutt';
			case 'common.units.time.hour': return 'Time';
			case 'common.units.time.day': return 'Dag';
			case 'common.units.time.week': return 'Uke';
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
			case 'common.numbers.k8': return 'Åtte';
			case 'common.numbers.k9': return 'Ni';
			case 'common.numbers.k10': return 'Ti';
			case 'common.ranks.k1': return 'første';
			case 'common.ranks.k2': return 'andre';
			case 'common.ranks.k3': return 'tredje';
			case 'common.ranks.k4': return 'fjerde';
			case 'common.ranks.k5': return 'femte';
			case 'common.ranks.k6': return 'sjette';
			case 'common.ranks.k7': return 'syvende';
			case 'common.ranks.k8': return 'åttende';
			case 'common.ranks.k9': return 'niende';
			case 'common.ranks.k10': return 'tiende';
			case 'common.control.on': return 'På';
			case 'common.control.off': return 'Av';
			case 'common.control.yes': return 'Ja';
			case 'common.control.no': return 'Nei';
			case 'common.control.confirm': return 'Bekreft';
			case 'common.control.cancel': return 'Avbryt';
			case 'common.control.retry': return 'Prøv igjen';
			case 'common.control.logout': return 'Logg ut';
			case 'common.control.edit': return 'Rediger';
			case 'common.control.delete': return 'Slett';
			case 'common.control.revert': return 'Tilbakestill';
			case 'common.control.save': return 'Lagre';
			case 'common.response.success': return 'Suksess';
			case 'common.response.error': return 'Feil';
			case 'common.response.info': return 'Informasjon';
			case 'common.response.warning': return 'Advarsel';
			case 'common.response.tbd': return 'Skal Bestemmes';
			case 'common.response.wip': return 'Pågående Arbeid';
			case 'common.priority.high': return 'Høy';
			case 'common.priority.medium': return 'Medium';
			case 'common.priority.low': return 'Lav';
			case 'common.date.today': return 'I dag';
			case 'common.date.yesterday': return 'I går';
			case 'common.date.tomorrow': return 'I morgen';
			case 'common.date.justNow': return 'Akkurat nå';
			case 'common.date.aMomentAgo': return 'Et øyeblikk siden';
			case 'common.date.minutesAgo': return 'Minutter siden';
			case 'common.date.hoursAgo': return 'Timer siden';
			case 'common.date.daysAgo': return ({required Object days}) => '${days} dager siden';
			case 'common.date.weeksAgo': return 'Uker siden';
			case 'common.date.thisWeek': return 'Denne uken';
			case 'common.date.lastWeek': return 'Forrige uke';
			case 'common.date.thisMonth': return 'Denne måneden';
			case 'common.date.lastMonth': return 'Forrige måned';
			case 'common.date.thisYear': return 'Dette året';
			case 'common.date.lastYear': return 'I fjor';
			case 'common.date.daysAhead': return ({required Object days}) => 'Om ${days} dager';
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
			case 'common.formRestrictions.required': return 'Dette feltet er påkrevd.';
			case 'common.formRestrictions.minLength': return ({required Object min}) => 'Minimum lengde er ${min} tegn.';
			case 'common.formRestrictions.maxLength': return ({required Object max}) => 'Maksimum lengde er ${max} tegn.';
			case 'common.formRestrictions.invalidFormat': return 'Formatet er ugyldig.';
			case 'common.formRestrictions.pattern': return ({required Object pattern}) => 'Dette feltet må følge mønsteret ${pattern}.';
			case 'common.tos.accept': return 'Jeg aksepterer Vilkår og Betingelser';
			case 'common.tos.readAccept': return 'Les og aksepter våre Vilkår og Betingelser';
			case 'common.tos.title': return 'Vilkår og Betingelser';
			case 'common.tos.service': return 'Tjenestevilkår';
			case 'common.tos.privacy': return 'Personvernpolicy';
			case 'common.tos.continueAgree': return 'Ved å fortsette godtar du våre Vilkår og Betingelser';
			case 'common.tos.mustAccept': return 'Du må akseptere Vilkår og Betingelser for å fortsette';
			case 'common.tos.view': return 'Se Vilkår og Betingelser';
			case 'common.tos.lastUpdated': return ({required Object date}) => 'Sist oppdatert: ${date}';
			case 'common.tos.contactInfo': return 'Kontakt oss for mer informasjon om våre Vilkår og Betingelser';
			case 'common.permissions.allowLocation': return 'Tillat tilgang til posisjon?';
			case 'common.permissions.allowCamera': return 'Tillat tilgang til kamera?';
			case 'common.permissions.allowMicrophone': return 'Tillat tilgang til mikrofon?';
			case 'common.permissions.allowNotifications': return 'Tillat varsler?';
			case 'common.permissions.allowContacts': return 'Tillat tilgang til kontakter?';
			case 'common.permissions.allowPhotos': return 'Tillat tilgang til bilder?';
			case 'common.permissions.allowStorage': return 'Tillat tilgang til lagring?';
			case 'common.permissions.allowBluetooth': return 'Tillat Bluetooth-tilgang?';
			case 'common.permissions.needPermission': return 'Vi trenger din tillatelse for å fortsette';
			case 'common.permissions.permissionDenied': return 'Tillatelse nektet';
			case 'common.permissions.permissionRequired': return 'Denne tillatelsen er påkrevd';
			case 'common.permissions.enableInSettings': return 'Aktiver i Innstillinger';
			case 'common.prompts.sessionExpired': return 'Sesjonen din er utløpt';
			case 'common.prompts.areYouSure': return 'Er du sikker?';
			case 'common.prompts.cannotBeUndone': return 'Denne handlingen kan ikke angres';
			case 'common.prompts.unsavedChanges': return 'Du har ulagrede endringer';
			case 'common.prompts.discardChanges': return 'Forkast endringer?';
			case 'common.prompts.locationDisabled': return 'Posisjonstjenester er deaktivert';
			case 'common.prompts.networkRequired': return 'Nettverkstilkobling påkrevd';
			case 'common.prompts.loginRequired': return 'Innlogging påkrevd for å fortsette';
			case 'common.prompts.confirmDelete': return 'Er du sikker på at du vil slette dette?';
			case 'common.prompts.confirmLogout': return 'Er du sikker på at du vil logge ut?';
			case 'common.prompts.saveBeforeExit': return 'Vil du lagre før du avslutter?';
			case 'common.prompts.reloadPage': return 'Vil du laste siden på nytt?';
			case 'common.prompts.updateAvailable': return 'En oppdatering er tilgjengelig';
			case 'common.prompts.restartRequired': return 'Omstart påkrevd for å aktivere endringer';
			case 'login.message.success': return 'Innlogging vellykket.';
			case 'login.message.error': return 'Innlogging mislyktes. Prøv igjen.';
			case 'login.message.wrongPassword': return 'Bekreft legitimasjonen din.';
			case 'login.form.username': return 'Brukernavn';
			case 'login.form.password': return 'Passord';
			case 'login.form.submit': return 'Logg inn';
			case 'login.form.createAccount': return 'Opprett ny konto';
			case 'login.form.forgotPassword': return 'Glemt passord';
			case 'login.tooltip.username': return 'Skriv inn brukernavnet ditt';
			case 'login.tooltip.password': return 'Skriv inn passordet ditt';
			case 'login.tooltip.submit': return 'Klikk for å logge inn';
			case 'login.validation.username.required': return 'Brukernavn er påkrevd.';
			case 'login.validation.password.required': return 'Passord er påkrevd.';
			case 'register.message.success': return 'Registrering vellykket.';
			case 'register.message.error': return 'Registrering mislyktes. Prøv igjen.';
			case 'register.form.username': return 'Brukernavn';
			case 'register.form.email': return 'E-post';
			case 'register.form.password': return 'Passord';
			case 'register.form.submit': return 'Registrer';
			case 'register.form.acceptTos': return 'Jeg aksepterer Tjenestevilkårene';
			case 'register.tooltip.username': return 'Skriv inn brukernavnet ditt';
			case 'register.tooltip.email': return 'Skriv inn e-posten din';
			case 'register.tooltip.password': return 'Skriv inn passordet ditt';
			case 'register.tooltip.submit': return 'Klikk for å registrere';
			case 'register.validation.username.required': return 'Brukernavn er påkrevd.';
			case 'register.validation.username.minLength': return ({required Object min}) => 'Brukernavn må være minst ${min} tegn langt.';
			case 'register.validation.username.maxLength': return ({required Object max}) => 'Brukernavn må være maksimalt ${max} tegn langt.';
			case 'register.validation.email.required': return 'E-post er påkrevd.';
			case 'register.validation.email.invalid': return 'E-post er ikke gyldig.';
			case 'register.validation.password.required': return 'Passord er påkrevd.';
			case 'register.validation.password.minLength': return ({required Object min}) => 'Passord må være minst ${min} tegn langt.';
			case 'passwordReset.message.success': return 'E-post for tilbakestilling av passord sendt.';
			case 'passwordReset.message.error': return 'Tilbakestilling av passord mislyktes. Prøv igjen.';
			case 'passwordReset.form.email': return 'E-post';
			case 'passwordReset.form.submit': return 'Tilbakestill Passord';
			case 'passwordReset.tooltip.email': return 'Skriv inn e-posten din';
			case 'passwordReset.tooltip.submit': return 'Klikk for å tilbakestille passord';
			case 'passwordReset.validation.email.required': return 'E-post er påkrevd.';
			case 'passwordReset.validation.email.invalid': return 'E-post er ikke gyldig.';
			default: return null;
		}
	}
}

