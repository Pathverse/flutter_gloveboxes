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
class TranslationsNo extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsNo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.no,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <no>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsNo _root = this; // ignore: unused_field

	@override 
	TranslationsNo $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsNo(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsCommonNo common = TranslationsCommonNo._(_root);
	@override late final TranslationsLoginNo login = TranslationsLoginNo._(_root);
	@override late final TranslationsRegisterNo register = TranslationsRegisterNo._(_root);
	@override late final TranslationsPasswordResetNo passwordReset = TranslationsPasswordResetNo._(_root);
}

// Path: common
class TranslationsCommonNo extends TranslationsCommonEn {
	TranslationsCommonNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMessageNo message = TranslationsCommonMessageNo._(_root);
	@override late final TranslationsCommonGameNo game = TranslationsCommonGameNo._(_root);
	@override late final TranslationsCommonSocialNo social = TranslationsCommonSocialNo._(_root);
	@override late final TranslationsCommonViewsNo views = TranslationsCommonViewsNo._(_root);
	@override late final TranslationsCommonUnitsNo units = TranslationsCommonUnitsNo._(_root);
	@override late final TranslationsCommonNumbersNo numbers = TranslationsCommonNumbersNo._(_root);
	@override late final TranslationsCommonRanksNo ranks = TranslationsCommonRanksNo._(_root);
	@override late final TranslationsCommonControlNo control = TranslationsCommonControlNo._(_root);
	@override late final TranslationsCommonButtonsNo buttons = TranslationsCommonButtonsNo._(_root);
	@override late final TranslationsCommonLabelsNo labels = TranslationsCommonLabelsNo._(_root);
	@override late final TranslationsCommonResponseNo response = TranslationsCommonResponseNo._(_root);
	@override late final TranslationsCommonPriorityNo priority = TranslationsCommonPriorityNo._(_root);
	@override late final TranslationsCommonDateNo date = TranslationsCommonDateNo._(_root);
	@override late final TranslationsCommonWeekdaysNo weekdays = TranslationsCommonWeekdaysNo._(_root);
	@override late final TranslationsCommonFormRestrictionsNo formRestrictions = TranslationsCommonFormRestrictionsNo._(_root);
	@override late final TranslationsCommonTosNo tos = TranslationsCommonTosNo._(_root);
	@override late final TranslationsCommonPermissionsNo permissions = TranslationsCommonPermissionsNo._(_root);
	@override late final TranslationsCommonPromptsNo prompts = TranslationsCommonPromptsNo._(_root);
}

// Path: login
class TranslationsLoginNo extends TranslationsLoginEn {
	TranslationsLoginNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginMessageNo message = TranslationsLoginMessageNo._(_root);
	@override late final TranslationsLoginFormNo form = TranslationsLoginFormNo._(_root);
	@override late final TranslationsLoginTooltipNo tooltip = TranslationsLoginTooltipNo._(_root);
	@override late final TranslationsLoginValidationNo validation = TranslationsLoginValidationNo._(_root);
}

// Path: register
class TranslationsRegisterNo extends TranslationsRegisterEn {
	TranslationsRegisterNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterMessageNo message = TranslationsRegisterMessageNo._(_root);
	@override late final TranslationsRegisterFormNo form = TranslationsRegisterFormNo._(_root);
	@override late final TranslationsRegisterTooltipNo tooltip = TranslationsRegisterTooltipNo._(_root);
	@override late final TranslationsRegisterValidationNo validation = TranslationsRegisterValidationNo._(_root);
}

// Path: passwordReset
class TranslationsPasswordResetNo extends TranslationsPasswordResetEn {
	TranslationsPasswordResetNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetMessageNo message = TranslationsPasswordResetMessageNo._(_root);
	@override late final TranslationsPasswordResetFormNo form = TranslationsPasswordResetFormNo._(_root);
	@override late final TranslationsPasswordResetTooltipNo tooltip = TranslationsPasswordResetTooltipNo._(_root);
	@override late final TranslationsPasswordResetValidationNo validation = TranslationsPasswordResetValidationNo._(_root);
}

// Path: common.message
class TranslationsCommonMessageNo extends TranslationsCommonMessageEn {
	TranslationsCommonMessageNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get loading => 'Laster';
	@override String get somethingWentWrong => 'Noe gikk galt';
	@override String get networkProblem => 'Det er et nettverksproblem';
	@override String get noDataFound => 'Ingen data funnet';
	@override String get noResultsFound => 'Ingen resultat funnet';
	@override String get unsupportedFileType => 'Ikkje-støtta filtype';
	@override String get fileTooLarge => 'Fila er for stor';
	@override String get operationTimedOut => 'Operasjonen fekk tidsavbrot';
	@override String get sessionExpired => 'Sesjonen er utløpt';
	@override String get unsavableChanges => 'Endringar kunne ikkje lagrast';
	@override String get noServerConnect => 'Kunne ikkje kopla til tenaren';
	@override String get accessDenied => 'Tilgang nekta';
}

// Path: common.game
class TranslationsCommonGameNo extends TranslationsCommonGameEn {
	TranslationsCommonGameNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get start => 'Start Spel';
	@override String get pause => 'Pause Spel';
	@override String get resume => 'Gjenoppta Spel';
	@override String get end => 'Avslutt Spel';
	@override String get levelUp => 'Nivå Opp';
	@override String get gameOver => 'Spel Over';
	@override String get nextLevel => 'Neste Nivå';
	@override String get previousLevel => 'Førre Nivå';
	@override String get restart => 'Start Spel På Nytt';
}

// Path: common.social
class TranslationsCommonSocialNo extends TranslationsCommonSocialEn {
	TranslationsCommonSocialNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get like => 'Lik';
	@override String get share => 'Del';
	@override String get comment => 'Kommenter';
	@override String get follow => 'Følg';
	@override String get unfollow => 'Slutt å følgje';
	@override String get unlike => 'Ikkje lik';
	@override String get reply => 'Svar';
	@override String get dislike => 'Lik ikkje';
	@override String get block => 'Blokker';
	@override String get blockUser => 'Blokker Brukar';
	@override String get report => 'Rapporter';
	@override String get mute => 'Demp';
	@override String get uSentFriendRequest => 'Du sende ei veneførespurnad';
	@override String get uReceivedFriendRequest => 'Du fekk ei veneførespurnad';
	@override String get sentFriendRequest => 'sende ei veneførespurnad';
	@override String get receivedFriendRequest => 'fekk ei veneførespurnad';
	@override String get acceptedFriendRequest => 'aksepterte ei veneførespurnad';
	@override String get uAcceptedFriendRequest => 'Du aksepterte ei veneførespurnad';
}

// Path: common.views
class TranslationsCommonViewsNo extends TranslationsCommonViewsEn {
	TranslationsCommonViewsNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get list => 'Liste';
	@override String get grid => 'Rutenett';
	@override String get table => 'Tabell';
	@override String get form => 'Skjema';
}

// Path: common.units
class TranslationsCommonUnitsNo extends TranslationsCommonUnitsEn {
	TranslationsCommonUnitsNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonUnitsLengthNo length = TranslationsCommonUnitsLengthNo._(_root);
	@override late final TranslationsCommonUnitsWeightNo weight = TranslationsCommonUnitsWeightNo._(_root);
	@override late final TranslationsCommonUnitsVolumeNo volume = TranslationsCommonUnitsVolumeNo._(_root);
	@override late final TranslationsCommonUnitsTimeNo time = TranslationsCommonUnitsTimeNo._(_root);
	@override late final TranslationsCommonUnitsAreaNo area = TranslationsCommonUnitsAreaNo._(_root);
}

// Path: common.numbers
class TranslationsCommonNumbersNo extends TranslationsCommonNumbersEn {
	TranslationsCommonNumbersNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'Ein';
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
class TranslationsCommonRanksNo extends TranslationsCommonRanksEn {
	TranslationsCommonRanksNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'første';
	@override String get k2 => 'andre';
	@override String get k3 => 'tredje';
	@override String get k4 => 'fjerde';
	@override String get k5 => 'femte';
	@override String get k6 => 'sjette';
	@override String get k7 => 'sjuande';
	@override String get k8 => 'åttande';
	@override String get k9 => 'niande';
	@override String get k10 => 'tiande';
}

// Path: common.control
class TranslationsCommonControlNo extends TranslationsCommonControlEn {
	TranslationsCommonControlNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get on => 'På';
	@override String get off => 'Av';
	@override String get yes => 'Ja';
	@override String get no => 'Nei';
	@override String get confirm => 'Stadfest';
	@override String get cancel => 'Avbryt';
	@override String get retry => 'Prøv igjen';
	@override String get logout => 'Logg ut';
	@override String get edit => 'Rediger';
	@override String get delete => 'Slett';
	@override String get revert => 'Tilbakestill';
	@override String get save => 'Lagre';
}

// Path: common.buttons
class TranslationsCommonButtonsNo extends TranslationsCommonButtonsEn {
	TranslationsCommonButtonsNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get submit => 'Send inn';
	@override String get close => 'Lukk';
	@override String get reset => 'Tilbakestill';
	@override String get cancel => 'Avbryt';
	@override String get kContinue => 'Hald fram';
	@override String get back => 'Tilbake';
	@override String get next => 'Neste';
	@override String get done => 'Ferdig';
	@override String get upload => 'Last opp';
	@override String get choose => 'Vel';
	@override String get select => 'Vel';
	@override String get clear => 'Tøm';
	@override String get start => 'Start';
}

// Path: common.labels
class TranslationsCommonLabelsNo extends TranslationsCommonLabelsEn {
	TranslationsCommonLabelsNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get required => 'Påkravd';
	@override String get optional => 'Valfritt';
	@override String get instructions => 'Instruksjonar:';
	@override String get status => 'Status';
	@override String get progress => 'Framgang';
	@override String get question => 'Spørsmål';
	@override String get answer => 'Svar';
	@override String get response => 'Respons';
	@override String get loading => 'Lastar...';
	@override String get error => 'Feil';
	@override String get success => 'Suksess';
	@override String get warning => 'Åtvaring';
}

// Path: common.response
class TranslationsCommonResponseNo extends TranslationsCommonResponseEn {
	TranslationsCommonResponseNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get success => 'Suksess';
	@override String get error => 'Feil';
	@override String get info => 'Informasjon';
	@override String get warning => 'Åtvaring';
	@override String get tbd => 'Skal Fastsetjast';
	@override String get wip => 'Pågåande Arbeid';
}

// Path: common.priority
class TranslationsCommonPriorityNo extends TranslationsCommonPriorityEn {
	TranslationsCommonPriorityNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get high => 'Høg';
	@override String get medium => 'Medium';
	@override String get low => 'Låg';
}

// Path: common.date
class TranslationsCommonDateNo extends TranslationsCommonDateEn {
	TranslationsCommonDateNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get today => 'I dag';
	@override String get yesterday => 'I går';
	@override String get tomorrow => 'I morgon';
	@override String get justNow => 'Akkurat no';
	@override String get aMomentAgo => 'Eit augeblikk sidan';
	@override String get minutesAgo => 'Minutt sidan';
	@override String get hoursAgo => 'Timar sidan';
	@override String daysAgo({required Object days}) => '${days} dagar sidan';
	@override String get weeksAgo => 'Veker sidan';
	@override String get thisWeek => 'Denne veka';
	@override String get lastWeek => 'Førre veke';
	@override String get thisMonth => 'Denne månaden';
	@override String get lastMonth => 'Førre månad';
	@override String get thisYear => 'Dette året';
	@override String get lastYear => 'I fjor';
	@override String daysAhead({required Object days}) => 'Om ${days} dagar';
}

// Path: common.weekdays
class TranslationsCommonWeekdaysNo extends TranslationsCommonWeekdaysEn {
	TranslationsCommonWeekdaysNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonWeekdaysFullNo full = TranslationsCommonWeekdaysFullNo._(_root);
	@override late final TranslationsCommonWeekdaysShortNo short = TranslationsCommonWeekdaysShortNo._(_root);
}

// Path: common.formRestrictions
class TranslationsCommonFormRestrictionsNo extends TranslationsCommonFormRestrictionsEn {
	TranslationsCommonFormRestrictionsNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get required => 'Dette feltet er påkravd.';
	@override String minLength({required Object min}) => 'Minimum lengd er ${min} teikn.';
	@override String maxLength({required Object max}) => 'Maksimum lengd er ${max} teikn.';
	@override String get invalidFormat => 'Formatet er ugyldig.';
	@override String pattern({required Object pattern}) => 'Dette feltet må følgje mønsteret ${pattern}.';
}

// Path: common.tos
class TranslationsCommonTosNo extends TranslationsCommonTosEn {
	TranslationsCommonTosNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Eg aksepterer Vilkår og Føresetnader';
	@override String get readAccept => 'Les og aksepter våre Vilkår og Føresetnader';
	@override String get title => 'Vilkår og Føresetnader';
	@override String get service => 'Tenestvilkår';
	@override String get privacy => 'Personvernpolitikk';
	@override String get continueAgree => 'Ved å halde fram godtek du våre Vilkår og Føresetnader';
	@override String get mustAccept => 'Du må akseptere Vilkår og Føresetnader for å halde fram';
	@override String get view => 'Sjå Vilkår og Føresetnader';
	@override String lastUpdated({required Object date}) => 'Sist oppdatert: ${date}';
	@override String get contactInfo => 'Kontakt oss for meir informasjon om våre Vilkår og Føresetnader';
}

// Path: common.permissions
class TranslationsCommonPermissionsNo extends TranslationsCommonPermissionsEn {
	TranslationsCommonPermissionsNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get allowLocation => 'Tillat tilgang til posisjon?';
	@override String get allowCamera => 'Tillat tilgang til kamera?';
	@override String get allowMicrophone => 'Tillat tilgang til mikrofon?';
	@override String get allowNotifications => 'Tillat varsel?';
	@override String get allowContacts => 'Tillat tilgang til kontaktar?';
	@override String get allowPhotos => 'Tillat tilgang til bilete?';
	@override String get allowStorage => 'Tillat tilgang til lagring?';
	@override String get allowBluetooth => 'Tillat Bluetooth-tilgang?';
	@override String get needPermission => 'Vi treng din tillatelse for å halde fram';
	@override String get permissionDenied => 'Tillatelse nekta';
	@override String get permissionRequired => 'Denne tillatelsen er påkravd';
	@override String get enableInSettings => 'Aktiver i Innstillingar';
}

// Path: common.prompts
class TranslationsCommonPromptsNo extends TranslationsCommonPromptsEn {
	TranslationsCommonPromptsNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get sessionExpired => 'Sesjonen din er utløpt';
	@override String get areYouSure => 'Er du sikker?';
	@override String get cannotBeUndone => 'Denne handlinga kan ikkje angrast';
	@override String get unsavedChanges => 'Du har ulagra endringar';
	@override String get discardChanges => 'Forkast endringar?';
	@override String get locationDisabled => 'Posisjonstenester er deaktivert';
	@override String get networkRequired => 'Nettverkstilkopling påkravd';
	@override String get loginRequired => 'Innlogging påkravd for å halde fram';
	@override String get confirmDelete => 'Er du sikker på at du vil slette dette?';
	@override String get confirmLogout => 'Er du sikker på at du vil logge ut?';
	@override String get saveBeforeExit => 'Vil du lagre før du avsluttar?';
	@override String get reloadPage => 'Vil du laste sida på nytt?';
	@override String get updateAvailable => 'Ei oppdatering er tilgjengeleg';
	@override String get restartRequired => 'Omstart påkravd for å aktivere endringar';
}

// Path: login.message
class TranslationsLoginMessageNo extends TranslationsLoginMessageEn {
	TranslationsLoginMessageNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get success => 'Innlogging vellykka.';
	@override String get error => 'Innlogging mislukkast. Prøv igjen.';
	@override String get wrongPassword => 'Stadfest legitimasjonen din.';
}

// Path: login.form
class TranslationsLoginFormNo extends TranslationsLoginFormEn {
	TranslationsLoginFormNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get username => 'Brukarnamn';
	@override String get password => 'Passord';
	@override String get submit => 'Logg inn';
	@override String get createAccount => 'Opprett ny konto';
	@override String get forgotPassword => 'Gløymt passord';
}

// Path: login.tooltip
class TranslationsLoginTooltipNo extends TranslationsLoginTooltipEn {
	TranslationsLoginTooltipNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get username => 'Skriv inn brukarnamnet ditt';
	@override String get password => 'Skriv inn passordet ditt';
	@override String get submit => 'Klikk for å logge inn';
}

// Path: login.validation
class TranslationsLoginValidationNo extends TranslationsLoginValidationEn {
	TranslationsLoginValidationNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginValidationUsernameNo username = TranslationsLoginValidationUsernameNo._(_root);
	@override late final TranslationsLoginValidationPasswordNo password = TranslationsLoginValidationPasswordNo._(_root);
}

// Path: register.message
class TranslationsRegisterMessageNo extends TranslationsRegisterMessageEn {
	TranslationsRegisterMessageNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get success => 'Registrering vellykka.';
	@override String get error => 'Registrering mislukkast. Prøv igjen.';
}

// Path: register.form
class TranslationsRegisterFormNo extends TranslationsRegisterFormEn {
	TranslationsRegisterFormNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get username => 'Brukarnamn';
	@override String get email => 'E-post';
	@override String get password => 'Passord';
	@override String get submit => 'Registrer';
	@override String get acceptTos => 'Eg aksepterer Tenestvilkåra';
}

// Path: register.tooltip
class TranslationsRegisterTooltipNo extends TranslationsRegisterTooltipEn {
	TranslationsRegisterTooltipNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get username => 'Skriv inn brukarnamnet ditt';
	@override String get email => 'Skriv inn e-posten din';
	@override String get password => 'Skriv inn passordet ditt';
	@override String get submit => 'Klikk for å registrere';
}

// Path: register.validation
class TranslationsRegisterValidationNo extends TranslationsRegisterValidationEn {
	TranslationsRegisterValidationNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterValidationUsernameNo username = TranslationsRegisterValidationUsernameNo._(_root);
	@override late final TranslationsRegisterValidationEmailNo email = TranslationsRegisterValidationEmailNo._(_root);
	@override late final TranslationsRegisterValidationPasswordNo password = TranslationsRegisterValidationPasswordNo._(_root);
}

// Path: passwordReset.message
class TranslationsPasswordResetMessageNo extends TranslationsPasswordResetMessageEn {
	TranslationsPasswordResetMessageNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get success => 'E-post for tilbakestilling av passord sendt.';
	@override String get error => 'Tilbakestilling av passord mislukkast. Prøv igjen.';
}

// Path: passwordReset.form
class TranslationsPasswordResetFormNo extends TranslationsPasswordResetFormEn {
	TranslationsPasswordResetFormNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get email => 'E-post';
	@override String get submit => 'Tilbakestill Passord';
}

// Path: passwordReset.tooltip
class TranslationsPasswordResetTooltipNo extends TranslationsPasswordResetTooltipEn {
	TranslationsPasswordResetTooltipNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get email => 'Skriv inn e-posten din';
	@override String get submit => 'Klikk for å tilbakestille passord';
}

// Path: passwordReset.validation
class TranslationsPasswordResetValidationNo extends TranslationsPasswordResetValidationEn {
	TranslationsPasswordResetValidationNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetValidationEmailNo email = TranslationsPasswordResetValidationEmailNo._(_root);
}

// Path: common.units.length
class TranslationsCommonUnitsLengthNo extends TranslationsCommonUnitsLengthEn {
	TranslationsCommonUnitsLengthNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get kilometer => 'Kilometer';
	@override String get meter => 'Meter';
	@override String get centimeter => 'Centimeter';
	@override String get millimeter => 'Millimeter';
	@override String get micrometer => 'Mikrometer';
	@override String get nanometer => 'Nanometer';
}

// Path: common.units.weight
class TranslationsCommonUnitsWeightNo extends TranslationsCommonUnitsWeightEn {
	TranslationsCommonUnitsWeightNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get kilogram => 'Kilogram';
	@override String get gram => 'Gram';
	@override String get milligram => 'Milligram';
	@override String get ton => 'Tonn';
}

// Path: common.units.volume
class TranslationsCommonUnitsVolumeNo extends TranslationsCommonUnitsVolumeEn {
	TranslationsCommonUnitsVolumeNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get liter => 'Liter';
	@override String get milliliter => 'Milliliter';
	@override String get cubicMeter => 'Kubikkmeter';
}

// Path: common.units.time
class TranslationsCommonUnitsTimeNo extends TranslationsCommonUnitsTimeEn {
	TranslationsCommonUnitsTimeNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get second => 'Sekund';
	@override String get minute => 'Minutt';
	@override String get hour => 'Time';
	@override String get day => 'Dag';
	@override String get week => 'Veke';
	@override String get month => 'Månad';
	@override String get year => 'År';
}

// Path: common.units.area
class TranslationsCommonUnitsAreaNo extends TranslationsCommonUnitsAreaEn {
	TranslationsCommonUnitsAreaNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get squareMeter => 'Kvadratmeter';
	@override String get hectare => 'Hektar';
	@override String get acre => 'Acre';
}

// Path: common.weekdays.full
class TranslationsCommonWeekdaysFullNo extends TranslationsCommonWeekdaysFullEn {
	TranslationsCommonWeekdaysFullNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get sunday => 'Sundag';
	@override String get monday => 'Måndag';
	@override String get tuesday => 'Tysdag';
	@override String get wednesday => 'Onsdag';
	@override String get thursday => 'Torsdag';
	@override String get friday => 'Fredag';
	@override String get saturday => 'Laurdag';
}

// Path: common.weekdays.short
class TranslationsCommonWeekdaysShortNo extends TranslationsCommonWeekdaysShortEn {
	TranslationsCommonWeekdaysShortNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get sunday => 'Sun';
	@override String get monday => 'Mån';
	@override String get tuesday => 'Tys';
	@override String get wednesday => 'Ons';
	@override String get thursday => 'Tor';
	@override String get friday => 'Fre';
	@override String get saturday => 'Lau';
}

// Path: login.validation.username
class TranslationsLoginValidationUsernameNo extends TranslationsLoginValidationUsernameEn {
	TranslationsLoginValidationUsernameNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get required => 'Brukarnamn er påkravd.';
}

// Path: login.validation.password
class TranslationsLoginValidationPasswordNo extends TranslationsLoginValidationPasswordEn {
	TranslationsLoginValidationPasswordNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get required => 'Passord er påkravd.';
}

// Path: register.validation.username
class TranslationsRegisterValidationUsernameNo extends TranslationsRegisterValidationUsernameEn {
	TranslationsRegisterValidationUsernameNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get required => 'Brukarnamn er påkravd.';
	@override String minLength({required Object min}) => 'Brukarnamn må vere minst ${min} teikn langt.';
	@override String maxLength({required Object max}) => 'Brukarnamn må vere maksimalt ${max} teikn langt.';
}

// Path: register.validation.email
class TranslationsRegisterValidationEmailNo extends TranslationsRegisterValidationEmailEn {
	TranslationsRegisterValidationEmailNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get required => 'E-post er påkravd.';
	@override String get invalid => 'E-post er ikkje gyldig.';
}

// Path: register.validation.password
class TranslationsRegisterValidationPasswordNo extends TranslationsRegisterValidationPasswordEn {
	TranslationsRegisterValidationPasswordNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get required => 'Passord er påkravd.';
	@override String minLength({required Object min}) => 'Passord må vere minst ${min} teikn langt.';
}

// Path: passwordReset.validation.email
class TranslationsPasswordResetValidationEmailNo extends TranslationsPasswordResetValidationEmailEn {
	TranslationsPasswordResetValidationEmailNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get required => 'E-post er påkravd.';
	@override String get invalid => 'E-post er ikkje gyldig.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsNo {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.message.loading': return 'Laster';
			case 'common.message.somethingWentWrong': return 'Noe gikk galt';
			case 'common.message.networkProblem': return 'Det er et nettverksproblem';
			case 'common.message.noDataFound': return 'Ingen data funnet';
			case 'common.message.noResultsFound': return 'Ingen resultat funnet';
			case 'common.message.unsupportedFileType': return 'Ikkje-støtta filtype';
			case 'common.message.fileTooLarge': return 'Fila er for stor';
			case 'common.message.operationTimedOut': return 'Operasjonen fekk tidsavbrot';
			case 'common.message.sessionExpired': return 'Sesjonen er utløpt';
			case 'common.message.unsavableChanges': return 'Endringar kunne ikkje lagrast';
			case 'common.message.noServerConnect': return 'Kunne ikkje kopla til tenaren';
			case 'common.message.accessDenied': return 'Tilgang nekta';
			case 'common.game.start': return 'Start Spel';
			case 'common.game.pause': return 'Pause Spel';
			case 'common.game.resume': return 'Gjenoppta Spel';
			case 'common.game.end': return 'Avslutt Spel';
			case 'common.game.levelUp': return 'Nivå Opp';
			case 'common.game.gameOver': return 'Spel Over';
			case 'common.game.nextLevel': return 'Neste Nivå';
			case 'common.game.previousLevel': return 'Førre Nivå';
			case 'common.game.restart': return 'Start Spel På Nytt';
			case 'common.social.like': return 'Lik';
			case 'common.social.share': return 'Del';
			case 'common.social.comment': return 'Kommenter';
			case 'common.social.follow': return 'Følg';
			case 'common.social.unfollow': return 'Slutt å følgje';
			case 'common.social.unlike': return 'Ikkje lik';
			case 'common.social.reply': return 'Svar';
			case 'common.social.dislike': return 'Lik ikkje';
			case 'common.social.block': return 'Blokker';
			case 'common.social.blockUser': return 'Blokker Brukar';
			case 'common.social.report': return 'Rapporter';
			case 'common.social.mute': return 'Demp';
			case 'common.social.uSentFriendRequest': return 'Du sende ei veneførespurnad';
			case 'common.social.uReceivedFriendRequest': return 'Du fekk ei veneførespurnad';
			case 'common.social.sentFriendRequest': return 'sende ei veneførespurnad';
			case 'common.social.receivedFriendRequest': return 'fekk ei veneførespurnad';
			case 'common.social.acceptedFriendRequest': return 'aksepterte ei veneførespurnad';
			case 'common.social.uAcceptedFriendRequest': return 'Du aksepterte ei veneførespurnad';
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
			case 'common.units.time.week': return 'Veke';
			case 'common.units.time.month': return 'Månad';
			case 'common.units.time.year': return 'År';
			case 'common.units.area.squareMeter': return 'Kvadratmeter';
			case 'common.units.area.hectare': return 'Hektar';
			case 'common.units.area.acre': return 'Acre';
			case 'common.numbers.k1': return 'Ein';
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
			case 'common.ranks.k7': return 'sjuande';
			case 'common.ranks.k8': return 'åttande';
			case 'common.ranks.k9': return 'niande';
			case 'common.ranks.k10': return 'tiande';
			case 'common.control.on': return 'På';
			case 'common.control.off': return 'Av';
			case 'common.control.yes': return 'Ja';
			case 'common.control.no': return 'Nei';
			case 'common.control.confirm': return 'Stadfest';
			case 'common.control.cancel': return 'Avbryt';
			case 'common.control.retry': return 'Prøv igjen';
			case 'common.control.logout': return 'Logg ut';
			case 'common.control.edit': return 'Rediger';
			case 'common.control.delete': return 'Slett';
			case 'common.control.revert': return 'Tilbakestill';
			case 'common.control.save': return 'Lagre';
			case 'common.buttons.submit': return 'Send inn';
			case 'common.buttons.close': return 'Lukk';
			case 'common.buttons.reset': return 'Tilbakestill';
			case 'common.buttons.cancel': return 'Avbryt';
			case 'common.buttons.kContinue': return 'Hald fram';
			case 'common.buttons.back': return 'Tilbake';
			case 'common.buttons.next': return 'Neste';
			case 'common.buttons.done': return 'Ferdig';
			case 'common.buttons.upload': return 'Last opp';
			case 'common.buttons.choose': return 'Vel';
			case 'common.buttons.select': return 'Vel';
			case 'common.buttons.clear': return 'Tøm';
			case 'common.buttons.start': return 'Start';
			case 'common.labels.required': return 'Påkravd';
			case 'common.labels.optional': return 'Valfritt';
			case 'common.labels.instructions': return 'Instruksjonar:';
			case 'common.labels.status': return 'Status';
			case 'common.labels.progress': return 'Framgang';
			case 'common.labels.question': return 'Spørsmål';
			case 'common.labels.answer': return 'Svar';
			case 'common.labels.response': return 'Respons';
			case 'common.labels.loading': return 'Lastar...';
			case 'common.labels.error': return 'Feil';
			case 'common.labels.success': return 'Suksess';
			case 'common.labels.warning': return 'Åtvaring';
			case 'common.response.success': return 'Suksess';
			case 'common.response.error': return 'Feil';
			case 'common.response.info': return 'Informasjon';
			case 'common.response.warning': return 'Åtvaring';
			case 'common.response.tbd': return 'Skal Fastsetjast';
			case 'common.response.wip': return 'Pågåande Arbeid';
			case 'common.priority.high': return 'Høg';
			case 'common.priority.medium': return 'Medium';
			case 'common.priority.low': return 'Låg';
			case 'common.date.today': return 'I dag';
			case 'common.date.yesterday': return 'I går';
			case 'common.date.tomorrow': return 'I morgon';
			case 'common.date.justNow': return 'Akkurat no';
			case 'common.date.aMomentAgo': return 'Eit augeblikk sidan';
			case 'common.date.minutesAgo': return 'Minutt sidan';
			case 'common.date.hoursAgo': return 'Timar sidan';
			case 'common.date.daysAgo': return ({required Object days}) => '${days} dagar sidan';
			case 'common.date.weeksAgo': return 'Veker sidan';
			case 'common.date.thisWeek': return 'Denne veka';
			case 'common.date.lastWeek': return 'Førre veke';
			case 'common.date.thisMonth': return 'Denne månaden';
			case 'common.date.lastMonth': return 'Førre månad';
			case 'common.date.thisYear': return 'Dette året';
			case 'common.date.lastYear': return 'I fjor';
			case 'common.date.daysAhead': return ({required Object days}) => 'Om ${days} dagar';
			case 'common.weekdays.full.sunday': return 'Sundag';
			case 'common.weekdays.full.monday': return 'Måndag';
			case 'common.weekdays.full.tuesday': return 'Tysdag';
			case 'common.weekdays.full.wednesday': return 'Onsdag';
			case 'common.weekdays.full.thursday': return 'Torsdag';
			case 'common.weekdays.full.friday': return 'Fredag';
			case 'common.weekdays.full.saturday': return 'Laurdag';
			case 'common.weekdays.short.sunday': return 'Sun';
			case 'common.weekdays.short.monday': return 'Mån';
			case 'common.weekdays.short.tuesday': return 'Tys';
			case 'common.weekdays.short.wednesday': return 'Ons';
			case 'common.weekdays.short.thursday': return 'Tor';
			case 'common.weekdays.short.friday': return 'Fre';
			case 'common.weekdays.short.saturday': return 'Lau';
			case 'common.formRestrictions.required': return 'Dette feltet er påkravd.';
			case 'common.formRestrictions.minLength': return ({required Object min}) => 'Minimum lengd er ${min} teikn.';
			case 'common.formRestrictions.maxLength': return ({required Object max}) => 'Maksimum lengd er ${max} teikn.';
			case 'common.formRestrictions.invalidFormat': return 'Formatet er ugyldig.';
			case 'common.formRestrictions.pattern': return ({required Object pattern}) => 'Dette feltet må følgje mønsteret ${pattern}.';
			case 'common.tos.accept': return 'Eg aksepterer Vilkår og Føresetnader';
			case 'common.tos.readAccept': return 'Les og aksepter våre Vilkår og Føresetnader';
			case 'common.tos.title': return 'Vilkår og Føresetnader';
			case 'common.tos.service': return 'Tenestvilkår';
			case 'common.tos.privacy': return 'Personvernpolitikk';
			case 'common.tos.continueAgree': return 'Ved å halde fram godtek du våre Vilkår og Føresetnader';
			case 'common.tos.mustAccept': return 'Du må akseptere Vilkår og Føresetnader for å halde fram';
			case 'common.tos.view': return 'Sjå Vilkår og Føresetnader';
			case 'common.tos.lastUpdated': return ({required Object date}) => 'Sist oppdatert: ${date}';
			case 'common.tos.contactInfo': return 'Kontakt oss for meir informasjon om våre Vilkår og Føresetnader';
			case 'common.permissions.allowLocation': return 'Tillat tilgang til posisjon?';
			case 'common.permissions.allowCamera': return 'Tillat tilgang til kamera?';
			case 'common.permissions.allowMicrophone': return 'Tillat tilgang til mikrofon?';
			case 'common.permissions.allowNotifications': return 'Tillat varsel?';
			case 'common.permissions.allowContacts': return 'Tillat tilgang til kontaktar?';
			case 'common.permissions.allowPhotos': return 'Tillat tilgang til bilete?';
			case 'common.permissions.allowStorage': return 'Tillat tilgang til lagring?';
			case 'common.permissions.allowBluetooth': return 'Tillat Bluetooth-tilgang?';
			case 'common.permissions.needPermission': return 'Vi treng din tillatelse for å halde fram';
			case 'common.permissions.permissionDenied': return 'Tillatelse nekta';
			case 'common.permissions.permissionRequired': return 'Denne tillatelsen er påkravd';
			case 'common.permissions.enableInSettings': return 'Aktiver i Innstillingar';
			case 'common.prompts.sessionExpired': return 'Sesjonen din er utløpt';
			case 'common.prompts.areYouSure': return 'Er du sikker?';
			case 'common.prompts.cannotBeUndone': return 'Denne handlinga kan ikkje angrast';
			case 'common.prompts.unsavedChanges': return 'Du har ulagra endringar';
			case 'common.prompts.discardChanges': return 'Forkast endringar?';
			case 'common.prompts.locationDisabled': return 'Posisjonstenester er deaktivert';
			case 'common.prompts.networkRequired': return 'Nettverkstilkopling påkravd';
			case 'common.prompts.loginRequired': return 'Innlogging påkravd for å halde fram';
			case 'common.prompts.confirmDelete': return 'Er du sikker på at du vil slette dette?';
			case 'common.prompts.confirmLogout': return 'Er du sikker på at du vil logge ut?';
			case 'common.prompts.saveBeforeExit': return 'Vil du lagre før du avsluttar?';
			case 'common.prompts.reloadPage': return 'Vil du laste sida på nytt?';
			case 'common.prompts.updateAvailable': return 'Ei oppdatering er tilgjengeleg';
			case 'common.prompts.restartRequired': return 'Omstart påkravd for å aktivere endringar';
			case 'login.message.success': return 'Innlogging vellykka.';
			case 'login.message.error': return 'Innlogging mislukkast. Prøv igjen.';
			case 'login.message.wrongPassword': return 'Stadfest legitimasjonen din.';
			case 'login.form.username': return 'Brukarnamn';
			case 'login.form.password': return 'Passord';
			case 'login.form.submit': return 'Logg inn';
			case 'login.form.createAccount': return 'Opprett ny konto';
			case 'login.form.forgotPassword': return 'Gløymt passord';
			case 'login.tooltip.username': return 'Skriv inn brukarnamnet ditt';
			case 'login.tooltip.password': return 'Skriv inn passordet ditt';
			case 'login.tooltip.submit': return 'Klikk for å logge inn';
			case 'login.validation.username.required': return 'Brukarnamn er påkravd.';
			case 'login.validation.password.required': return 'Passord er påkravd.';
			case 'register.message.success': return 'Registrering vellykka.';
			case 'register.message.error': return 'Registrering mislukkast. Prøv igjen.';
			case 'register.form.username': return 'Brukarnamn';
			case 'register.form.email': return 'E-post';
			case 'register.form.password': return 'Passord';
			case 'register.form.submit': return 'Registrer';
			case 'register.form.acceptTos': return 'Eg aksepterer Tenestvilkåra';
			case 'register.tooltip.username': return 'Skriv inn brukarnamnet ditt';
			case 'register.tooltip.email': return 'Skriv inn e-posten din';
			case 'register.tooltip.password': return 'Skriv inn passordet ditt';
			case 'register.tooltip.submit': return 'Klikk for å registrere';
			case 'register.validation.username.required': return 'Brukarnamn er påkravd.';
			case 'register.validation.username.minLength': return ({required Object min}) => 'Brukarnamn må vere minst ${min} teikn langt.';
			case 'register.validation.username.maxLength': return ({required Object max}) => 'Brukarnamn må vere maksimalt ${max} teikn langt.';
			case 'register.validation.email.required': return 'E-post er påkravd.';
			case 'register.validation.email.invalid': return 'E-post er ikkje gyldig.';
			case 'register.validation.password.required': return 'Passord er påkravd.';
			case 'register.validation.password.minLength': return ({required Object min}) => 'Passord må vere minst ${min} teikn langt.';
			case 'passwordReset.message.success': return 'E-post for tilbakestilling av passord sendt.';
			case 'passwordReset.message.error': return 'Tilbakestilling av passord mislukkast. Prøv igjen.';
			case 'passwordReset.form.email': return 'E-post';
			case 'passwordReset.form.submit': return 'Tilbakestill Passord';
			case 'passwordReset.tooltip.email': return 'Skriv inn e-posten din';
			case 'passwordReset.tooltip.submit': return 'Klikk for å tilbakestille passord';
			case 'passwordReset.validation.email.required': return 'E-post er påkravd.';
			case 'passwordReset.validation.email.invalid': return 'E-post er ikkje gyldig.';
			default: return null;
		}
	}
}

