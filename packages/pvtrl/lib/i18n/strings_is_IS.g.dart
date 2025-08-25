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
class TranslationsIsIs extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsIsIs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.isIs,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <is-IS>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsIsIs _root = this; // ignore: unused_field

	@override 
	TranslationsIsIs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsIsIs(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsCommonIsIs common = TranslationsCommonIsIs._(_root);
	@override late final TranslationsLoginIsIs login = TranslationsLoginIsIs._(_root);
	@override late final TranslationsRegisterIsIs register = TranslationsRegisterIsIs._(_root);
	@override late final TranslationsPasswordResetIsIs passwordReset = TranslationsPasswordResetIsIs._(_root);
}

// Path: common
class TranslationsCommonIsIs extends TranslationsCommonEn {
	TranslationsCommonIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMessageIsIs message = TranslationsCommonMessageIsIs._(_root);
	@override late final TranslationsCommonGameIsIs game = TranslationsCommonGameIsIs._(_root);
	@override late final TranslationsCommonSocialIsIs social = TranslationsCommonSocialIsIs._(_root);
	@override late final TranslationsCommonViewsIsIs views = TranslationsCommonViewsIsIs._(_root);
	@override late final TranslationsCommonUnitsIsIs units = TranslationsCommonUnitsIsIs._(_root);
	@override late final TranslationsCommonNumbersIsIs numbers = TranslationsCommonNumbersIsIs._(_root);
	@override late final TranslationsCommonRanksIsIs ranks = TranslationsCommonRanksIsIs._(_root);
	@override late final TranslationsCommonControlIsIs control = TranslationsCommonControlIsIs._(_root);
	@override late final TranslationsCommonButtonsIsIs buttons = TranslationsCommonButtonsIsIs._(_root);
	@override late final TranslationsCommonLabelsIsIs labels = TranslationsCommonLabelsIsIs._(_root);
	@override late final TranslationsCommonResponseIsIs response = TranslationsCommonResponseIsIs._(_root);
	@override late final TranslationsCommonPriorityIsIs priority = TranslationsCommonPriorityIsIs._(_root);
	@override late final TranslationsCommonDateIsIs date = TranslationsCommonDateIsIs._(_root);
	@override late final TranslationsCommonWeekdaysIsIs weekdays = TranslationsCommonWeekdaysIsIs._(_root);
	@override late final TranslationsCommonFormRestrictionsIsIs formRestrictions = TranslationsCommonFormRestrictionsIsIs._(_root);
	@override late final TranslationsCommonTosIsIs tos = TranslationsCommonTosIsIs._(_root);
	@override late final TranslationsCommonPermissionsIsIs permissions = TranslationsCommonPermissionsIsIs._(_root);
	@override late final TranslationsCommonPromptsIsIs prompts = TranslationsCommonPromptsIsIs._(_root);
}

// Path: login
class TranslationsLoginIsIs extends TranslationsLoginEn {
	TranslationsLoginIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginMessageIsIs message = TranslationsLoginMessageIsIs._(_root);
	@override late final TranslationsLoginFormIsIs form = TranslationsLoginFormIsIs._(_root);
	@override late final TranslationsLoginTooltipIsIs tooltip = TranslationsLoginTooltipIsIs._(_root);
	@override late final TranslationsLoginValidationIsIs validation = TranslationsLoginValidationIsIs._(_root);
}

// Path: register
class TranslationsRegisterIsIs extends TranslationsRegisterEn {
	TranslationsRegisterIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterMessageIsIs message = TranslationsRegisterMessageIsIs._(_root);
	@override late final TranslationsRegisterFormIsIs form = TranslationsRegisterFormIsIs._(_root);
	@override late final TranslationsRegisterTooltipIsIs tooltip = TranslationsRegisterTooltipIsIs._(_root);
	@override late final TranslationsRegisterValidationIsIs validation = TranslationsRegisterValidationIsIs._(_root);
}

// Path: passwordReset
class TranslationsPasswordResetIsIs extends TranslationsPasswordResetEn {
	TranslationsPasswordResetIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetMessageIsIs message = TranslationsPasswordResetMessageIsIs._(_root);
	@override late final TranslationsPasswordResetFormIsIs form = TranslationsPasswordResetFormIsIs._(_root);
	@override late final TranslationsPasswordResetTooltipIsIs tooltip = TranslationsPasswordResetTooltipIsIs._(_root);
	@override late final TranslationsPasswordResetValidationIsIs validation = TranslationsPasswordResetValidationIsIs._(_root);
}

// Path: common.message
class TranslationsCommonMessageIsIs extends TranslationsCommonMessageEn {
	TranslationsCommonMessageIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get loading => 'Hleður';
	@override String get somethingWentWrong => 'Eitthvað fór úrskeiðis';
	@override String get networkProblem => 'Það er netverksvandi';
	@override String get noDataFound => 'Engin gögn fundust';
	@override String get noResultsFound => 'Engar niðurstöður fundust';
	@override String get unsupportedFileType => 'Óstudd skráargerð';
	@override String get fileTooLarge => 'Skráin er of stór';
	@override String get operationTimedOut => 'Aðgerð rann út á tíma';
	@override String get sessionExpired => 'Lota er útrunnin';
	@override String get unsavableChanges => 'Ekki var hægt að vista breytingar';
	@override String get noServerConnect => 'Gat ekki tengst þjóninum';
	@override String get accessDenied => 'Aðgangi hafnað';
}

// Path: common.game
class TranslationsCommonGameIsIs extends TranslationsCommonGameEn {
	TranslationsCommonGameIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get start => 'Byrja leik';
	@override String get pause => 'Gera hlé á leik';
	@override String get resume => 'Halda áfram með leik';
	@override String get end => 'Enda leik';
	@override String get levelUp => 'Stig upp';
	@override String get gameOver => 'Leik lokið';
	@override String get nextLevel => 'Næsta stig';
	@override String get previousLevel => 'Fyrra stig';
	@override String get restart => 'Endurræsa leik';
}

// Path: common.social
class TranslationsCommonSocialIsIs extends TranslationsCommonSocialEn {
	TranslationsCommonSocialIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get like => 'Líkar';
	@override String get share => 'Deila';
	@override String get comment => 'Athugasemd';
	@override String get follow => 'Fylgja';
	@override String get unfollow => 'Hætta að fylgja';
	@override String get unlike => 'Líkar ekki';
	@override String get reply => 'Svara';
	@override String get dislike => 'Líkar ekki';
	@override String get block => 'Loka á';
	@override String get blockUser => 'Loka á notanda';
	@override String get report => 'Tilkynna';
	@override String get mute => 'Þagga';
	@override String get uSentFriendRequest => 'Þú sendir vinabeiðni';
	@override String get uReceivedFriendRequest => 'Þú fékkst vinabeiðni';
	@override String get sentFriendRequest => 'sendi vinabeiðni';
	@override String get receivedFriendRequest => 'fékk vinabeiðni';
	@override String get acceptedFriendRequest => 'samþykkti vinabeiðni';
	@override String get uAcceptedFriendRequest => 'Þú samþykktir vinabeiðni';
}

// Path: common.views
class TranslationsCommonViewsIsIs extends TranslationsCommonViewsEn {
	TranslationsCommonViewsIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get list => 'Listi';
	@override String get grid => 'Net';
	@override String get table => 'Tafla';
	@override String get form => 'Eyðublað';
}

// Path: common.units
class TranslationsCommonUnitsIsIs extends TranslationsCommonUnitsEn {
	TranslationsCommonUnitsIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonUnitsLengthIsIs length = TranslationsCommonUnitsLengthIsIs._(_root);
	@override late final TranslationsCommonUnitsWeightIsIs weight = TranslationsCommonUnitsWeightIsIs._(_root);
	@override late final TranslationsCommonUnitsVolumeIsIs volume = TranslationsCommonUnitsVolumeIsIs._(_root);
	@override late final TranslationsCommonUnitsTimeIsIs time = TranslationsCommonUnitsTimeIsIs._(_root);
	@override late final TranslationsCommonUnitsAreaIsIs area = TranslationsCommonUnitsAreaIsIs._(_root);
}

// Path: common.numbers
class TranslationsCommonNumbersIsIs extends TranslationsCommonNumbersEn {
	TranslationsCommonNumbersIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'Einn';
	@override String get k2 => 'Tveir';
	@override String get k3 => 'Þrír';
	@override String get k4 => 'Fjórir';
	@override String get k5 => 'Fimm';
	@override String get k6 => 'Sex';
	@override String get k7 => 'Sjö';
	@override String get k8 => 'Átta';
	@override String get k9 => 'Níu';
	@override String get k10 => 'Tíu';
}

// Path: common.ranks
class TranslationsCommonRanksIsIs extends TranslationsCommonRanksEn {
	TranslationsCommonRanksIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'fyrsti';
	@override String get k2 => 'annar';
	@override String get k3 => 'þriðji';
	@override String get k4 => 'fjórði';
	@override String get k5 => 'fimmti';
	@override String get k6 => 'sjötti';
	@override String get k7 => 'sjöundi';
	@override String get k8 => 'áttundi';
	@override String get k9 => 'níundi';
	@override String get k10 => 'tíundi';
}

// Path: common.control
class TranslationsCommonControlIsIs extends TranslationsCommonControlEn {
	TranslationsCommonControlIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get on => 'Kveikt';
	@override String get off => 'Slökkt';
	@override String get yes => 'Já';
	@override String get no => 'Nei';
	@override String get confirm => 'Staðfesta';
	@override String get cancel => 'Hætta við';
	@override String get retry => 'Reyna aftur';
	@override String get logout => 'Skrá út';
	@override String get edit => 'Breyta';
	@override String get delete => 'Eyða';
	@override String get revert => 'Afturkalla';
	@override String get save => 'Vista';
}

// Path: common.buttons
class TranslationsCommonButtonsIsIs extends TranslationsCommonButtonsEn {
	TranslationsCommonButtonsIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get submit => 'Senda';
	@override String get close => 'Loka';
	@override String get reset => 'Endurstilla';
	@override String get cancel => 'Hætta við';
	@override String get kContinue => 'Halda áfram';
	@override String get back => 'Til baka';
	@override String get next => 'Næsta';
	@override String get done => 'Lokið';
	@override String get upload => 'Hlaða upp';
	@override String get choose => 'Velja';
	@override String get select => 'Velja';
	@override String get clear => 'Hreinsa';
	@override String get start => 'Byrja';
}

// Path: common.labels
class TranslationsCommonLabelsIsIs extends TranslationsCommonLabelsEn {
	TranslationsCommonLabelsIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get required => 'Nauðsynlegt';
	@override String get optional => 'Valfrjálst';
	@override String get instructions => 'Leiðbeiningar:';
	@override String get status => 'Staða';
	@override String get progress => 'Framvindu';
	@override String get question => 'Spurning';
	@override String get answer => 'Svar';
	@override String get response => 'Svörun';
	@override String get loading => 'Hleður...';
	@override String get error => 'Villa';
	@override String get success => 'Árangur';
	@override String get warning => 'Viðvörun';
}

// Path: common.response
class TranslationsCommonResponseIsIs extends TranslationsCommonResponseEn {
	TranslationsCommonResponseIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get success => 'Árangur';
	@override String get error => 'Villa';
	@override String get info => 'Upplýsingar';
	@override String get warning => 'Viðvörun';
	@override String get tbd => 'Á eftir að ákveða';
	@override String get wip => 'Í vinnslu';
}

// Path: common.priority
class TranslationsCommonPriorityIsIs extends TranslationsCommonPriorityEn {
	TranslationsCommonPriorityIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get high => 'Hátt';
	@override String get medium => 'Miðlungs';
	@override String get low => 'Lágt';
}

// Path: common.date
class TranslationsCommonDateIsIs extends TranslationsCommonDateEn {
	TranslationsCommonDateIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get today => 'Í dag';
	@override String get yesterday => 'Í gær';
	@override String get tomorrow => 'Á morgun';
	@override String get justNow => 'Akkúrat núna';
	@override String get aMomentAgo => 'Fyrir augnablik';
	@override String get minutesAgo => 'Fyrir mínútum';
	@override String get hoursAgo => 'Fyrir klukkustundum';
	@override String daysAgo({required Object days}) => 'Fyrir ${days} dögum';
	@override String get weeksAgo => 'Fyrir vikum';
	@override String get thisWeek => 'Þessa viku';
	@override String get lastWeek => 'Síðustu viku';
	@override String get thisMonth => 'Þennan mánuð';
	@override String get lastMonth => 'Síðasta mánuð';
	@override String get thisYear => 'Þetta ár';
	@override String get lastYear => 'Síðasta ár';
	@override String daysAhead({required Object days}) => 'Eftir ${days} daga';
}

// Path: common.weekdays
class TranslationsCommonWeekdaysIsIs extends TranslationsCommonWeekdaysEn {
	TranslationsCommonWeekdaysIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonWeekdaysFullIsIs full = TranslationsCommonWeekdaysFullIsIs._(_root);
	@override late final TranslationsCommonWeekdaysShortIsIs short = TranslationsCommonWeekdaysShortIsIs._(_root);
}

// Path: common.formRestrictions
class TranslationsCommonFormRestrictionsIsIs extends TranslationsCommonFormRestrictionsEn {
	TranslationsCommonFormRestrictionsIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get required => 'Þessi reitur er nauðsynlegur.';
	@override String minLength({required Object min}) => 'Lágmarkslengd er ${min} stafir.';
	@override String maxLength({required Object max}) => 'Hámarkslengd er ${max} stafir.';
	@override String get invalidFormat => 'Snið er ógilt.';
	@override String pattern({required Object pattern}) => 'Þessi reitur verður að fylgja mynstrinu ${pattern}.';
}

// Path: common.tos
class TranslationsCommonTosIsIs extends TranslationsCommonTosEn {
	TranslationsCommonTosIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Ég samþykki Skilmála og Skilyrði';
	@override String get readAccept => 'Vinsamlegast lestu og samþykktu Skilmála og Skilyrði okkar';
	@override String get title => 'Skilmálar og Skilyrði';
	@override String get service => 'Þjónustuskilmálar';
	@override String get privacy => 'Persónuverndarstefna';
	@override String get continueAgree => 'Með því að halda áfram samþykkir þú Skilmála og Skilyrði okkar';
	@override String get mustAccept => 'Þú verður að samþykkja Skilmála og Skilyrði til að halda áfram';
	@override String get view => 'Skoða Skilmála og Skilyrði';
	@override String lastUpdated({required Object date}) => 'Síðast uppfært: ${date}';
	@override String get contactInfo => 'Hafðu samband við okkur fyrir frekari upplýsingar um Skilmála og Skilyrði okkar';
}

// Path: common.permissions
class TranslationsCommonPermissionsIsIs extends TranslationsCommonPermissionsEn {
	TranslationsCommonPermissionsIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get allowLocation => 'Leyfa aðgang að staðsetningu?';
	@override String get allowCamera => 'Leyfa aðgang að myndavél?';
	@override String get allowMicrophone => 'Leyfa aðgang að hljóðnema?';
	@override String get allowNotifications => 'Leyfa tilkynningar?';
	@override String get allowContacts => 'Leyfa aðgang að tengiliðum?';
	@override String get allowPhotos => 'Leyfa aðgang að myndum?';
	@override String get allowStorage => 'Leyfa aðgang að geymslu?';
	@override String get allowBluetooth => 'Leyfa Bluetooth aðgang?';
	@override String get needPermission => 'Við þurfum þitt leyfi til að halda áfram';
	@override String get permissionDenied => 'Leyfi hafnað';
	@override String get permissionRequired => 'Þetta leyfi er nauðsynlegt';
	@override String get enableInSettings => 'Vinsamlegast virkjaðu í stillingum';
}

// Path: common.prompts
class TranslationsCommonPromptsIsIs extends TranslationsCommonPromptsEn {
	TranslationsCommonPromptsIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get sessionExpired => 'Lota þín er útrunnin';
	@override String get areYouSure => 'Ertu viss?';
	@override String get cannotBeUndone => 'Þessa aðgerð er ekki hægt að afturkalla';
	@override String get unsavedChanges => 'Þú ert með óvistaðar breytingar';
	@override String get discardChanges => 'Hafna breytingum?';
	@override String get locationDisabled => 'Staðsetningarþjónusta er óvirk';
	@override String get networkRequired => 'Nettenging nauðsynleg';
	@override String get loginRequired => 'Innskráning nauðsynleg til að halda áfram';
	@override String get confirmDelete => 'Ertu viss um að þú viljir eyða þessu?';
	@override String get confirmLogout => 'Ertu viss um að þú viljir skrá þig út?';
	@override String get saveBeforeExit => 'Viltu vista áður en þú ferð út?';
	@override String get reloadPage => 'Viltu endurhlaða síðunni?';
	@override String get updateAvailable => 'Uppfærsla er í boði';
	@override String get restartRequired => 'Endurræsing nauðsynleg til að virkja breytingar';
}

// Path: login.message
class TranslationsLoginMessageIsIs extends TranslationsLoginMessageEn {
	TranslationsLoginMessageIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get success => 'Innskráning tókst.';
	@override String get error => 'Innskráning mistókst. Vinsamlegast reyndu aftur.';
	@override String get wrongPassword => 'Vinsamlegast staðfestu innskráningarupplýsingarnar þínar.';
}

// Path: login.form
class TranslationsLoginFormIsIs extends TranslationsLoginFormEn {
	TranslationsLoginFormIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get username => 'Notandanafn';
	@override String get password => 'Lykilorð';
	@override String get submit => 'Skrá inn';
	@override String get createAccount => 'Búa til nýjan reikning';
	@override String get forgotPassword => 'Gleymt lykilorð';
}

// Path: login.tooltip
class TranslationsLoginTooltipIsIs extends TranslationsLoginTooltipEn {
	TranslationsLoginTooltipIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get username => 'Sláðu inn notandanafnið þitt';
	@override String get password => 'Sláðu inn lykilorðið þitt';
	@override String get submit => 'Smelltu til að skrá inn';
}

// Path: login.validation
class TranslationsLoginValidationIsIs extends TranslationsLoginValidationEn {
	TranslationsLoginValidationIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginValidationUsernameIsIs username = TranslationsLoginValidationUsernameIsIs._(_root);
	@override late final TranslationsLoginValidationPasswordIsIs password = TranslationsLoginValidationPasswordIsIs._(_root);
}

// Path: register.message
class TranslationsRegisterMessageIsIs extends TranslationsRegisterMessageEn {
	TranslationsRegisterMessageIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get success => 'Skráning tókst.';
	@override String get error => 'Skráning mistókst. Vinsamlegast reyndu aftur.';
}

// Path: register.form
class TranslationsRegisterFormIsIs extends TranslationsRegisterFormEn {
	TranslationsRegisterFormIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get username => 'Notandanafn';
	@override String get email => 'Netfang';
	@override String get password => 'Lykilorð';
	@override String get submit => 'Skrá sig';
	@override String get acceptTos => 'Ég samþykki þjónustuskilmálana';
}

// Path: register.tooltip
class TranslationsRegisterTooltipIsIs extends TranslationsRegisterTooltipEn {
	TranslationsRegisterTooltipIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get username => 'Sláðu inn notandanafnið þitt';
	@override String get email => 'Sláðu inn netfangið þitt';
	@override String get password => 'Sláðu inn lykilorðið þitt';
	@override String get submit => 'Smelltu til að skrá þig';
}

// Path: register.validation
class TranslationsRegisterValidationIsIs extends TranslationsRegisterValidationEn {
	TranslationsRegisterValidationIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterValidationUsernameIsIs username = TranslationsRegisterValidationUsernameIsIs._(_root);
	@override late final TranslationsRegisterValidationEmailIsIs email = TranslationsRegisterValidationEmailIsIs._(_root);
	@override late final TranslationsRegisterValidationPasswordIsIs password = TranslationsRegisterValidationPasswordIsIs._(_root);
}

// Path: passwordReset.message
class TranslationsPasswordResetMessageIsIs extends TranslationsPasswordResetMessageEn {
	TranslationsPasswordResetMessageIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get success => 'Netfang fyrir endurstillingu lykilorðs sent.';
	@override String get error => 'Endurstilling lykilorðs mistókst. Vinsamlegast reyndu aftur.';
}

// Path: passwordReset.form
class TranslationsPasswordResetFormIsIs extends TranslationsPasswordResetFormEn {
	TranslationsPasswordResetFormIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get email => 'Netfang';
	@override String get submit => 'Endurstilla lykilorð';
}

// Path: passwordReset.tooltip
class TranslationsPasswordResetTooltipIsIs extends TranslationsPasswordResetTooltipEn {
	TranslationsPasswordResetTooltipIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get email => 'Sláðu inn netfangið þitt';
	@override String get submit => 'Smelltu til að endurstilla lykilorð';
}

// Path: passwordReset.validation
class TranslationsPasswordResetValidationIsIs extends TranslationsPasswordResetValidationEn {
	TranslationsPasswordResetValidationIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetValidationEmailIsIs email = TranslationsPasswordResetValidationEmailIsIs._(_root);
}

// Path: common.units.length
class TranslationsCommonUnitsLengthIsIs extends TranslationsCommonUnitsLengthEn {
	TranslationsCommonUnitsLengthIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get kilometer => 'Kílómetri';
	@override String get meter => 'Metri';
	@override String get centimeter => 'Sentímetri';
	@override String get millimeter => 'Millímetri';
	@override String get micrometer => 'Míkrómetri';
	@override String get nanometer => 'Nanómetri';
}

// Path: common.units.weight
class TranslationsCommonUnitsWeightIsIs extends TranslationsCommonUnitsWeightEn {
	TranslationsCommonUnitsWeightIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get kilogram => 'Kílógramm';
	@override String get gram => 'Gramm';
	@override String get milligram => 'Milligramm';
	@override String get ton => 'Tonn';
}

// Path: common.units.volume
class TranslationsCommonUnitsVolumeIsIs extends TranslationsCommonUnitsVolumeEn {
	TranslationsCommonUnitsVolumeIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get liter => 'Lítri';
	@override String get milliliter => 'Millilítri';
	@override String get cubicMeter => 'Rúmmetri';
}

// Path: common.units.time
class TranslationsCommonUnitsTimeIsIs extends TranslationsCommonUnitsTimeEn {
	TranslationsCommonUnitsTimeIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get second => 'Sekúnda';
	@override String get minute => 'Mínúta';
	@override String get hour => 'Klukkustund';
	@override String get day => 'Dagur';
	@override String get week => 'Vika';
	@override String get month => 'Mánuður';
	@override String get year => 'Ár';
}

// Path: common.units.area
class TranslationsCommonUnitsAreaIsIs extends TranslationsCommonUnitsAreaEn {
	TranslationsCommonUnitsAreaIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get squareMeter => 'Fermetri';
	@override String get hectare => 'Hektari';
	@override String get acre => 'Ekra';
}

// Path: common.weekdays.full
class TranslationsCommonWeekdaysFullIsIs extends TranslationsCommonWeekdaysFullEn {
	TranslationsCommonWeekdaysFullIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get sunday => 'Sunnudagur';
	@override String get monday => 'Mánudagur';
	@override String get tuesday => 'Þriðjudagur';
	@override String get wednesday => 'Miðvikudagur';
	@override String get thursday => 'Fimmtudagur';
	@override String get friday => 'Föstudagur';
	@override String get saturday => 'Laugardagur';
}

// Path: common.weekdays.short
class TranslationsCommonWeekdaysShortIsIs extends TranslationsCommonWeekdaysShortEn {
	TranslationsCommonWeekdaysShortIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get sunday => 'Sun';
	@override String get monday => 'Mán';
	@override String get tuesday => 'Þri';
	@override String get wednesday => 'Mið';
	@override String get thursday => 'Fim';
	@override String get friday => 'Fös';
	@override String get saturday => 'Lau';
}

// Path: login.validation.username
class TranslationsLoginValidationUsernameIsIs extends TranslationsLoginValidationUsernameEn {
	TranslationsLoginValidationUsernameIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get required => 'Notandanafn er nauðsynlegt.';
}

// Path: login.validation.password
class TranslationsLoginValidationPasswordIsIs extends TranslationsLoginValidationPasswordEn {
	TranslationsLoginValidationPasswordIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get required => 'Lykilorð er nauðsynlegt.';
}

// Path: register.validation.username
class TranslationsRegisterValidationUsernameIsIs extends TranslationsRegisterValidationUsernameEn {
	TranslationsRegisterValidationUsernameIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get required => 'Notandanafn er nauðsynlegt.';
	@override String minLength({required Object min}) => 'Notandanafn verður að vera að minnsta kosti ${min} stafir að lengd.';
	@override String maxLength({required Object max}) => 'Notandanafn má vera að hámarki ${max} stafir að lengd.';
}

// Path: register.validation.email
class TranslationsRegisterValidationEmailIsIs extends TranslationsRegisterValidationEmailEn {
	TranslationsRegisterValidationEmailIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get required => 'Netfang er nauðsynlegt.';
	@override String get invalid => 'Netfang er ekki gilt.';
}

// Path: register.validation.password
class TranslationsRegisterValidationPasswordIsIs extends TranslationsRegisterValidationPasswordEn {
	TranslationsRegisterValidationPasswordIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get required => 'Lykilorð er nauðsynlegt.';
	@override String minLength({required Object min}) => 'Lykilorð verður að vera að minnsta kosti ${min} stafir að lengd.';
}

// Path: passwordReset.validation.email
class TranslationsPasswordResetValidationEmailIsIs extends TranslationsPasswordResetValidationEmailEn {
	TranslationsPasswordResetValidationEmailIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get required => 'Netfang er nauðsynlegt.';
	@override String get invalid => 'Netfang er ekki gilt.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsIsIs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.message.loading': return 'Hleður';
			case 'common.message.somethingWentWrong': return 'Eitthvað fór úrskeiðis';
			case 'common.message.networkProblem': return 'Það er netverksvandi';
			case 'common.message.noDataFound': return 'Engin gögn fundust';
			case 'common.message.noResultsFound': return 'Engar niðurstöður fundust';
			case 'common.message.unsupportedFileType': return 'Óstudd skráargerð';
			case 'common.message.fileTooLarge': return 'Skráin er of stór';
			case 'common.message.operationTimedOut': return 'Aðgerð rann út á tíma';
			case 'common.message.sessionExpired': return 'Lota er útrunnin';
			case 'common.message.unsavableChanges': return 'Ekki var hægt að vista breytingar';
			case 'common.message.noServerConnect': return 'Gat ekki tengst þjóninum';
			case 'common.message.accessDenied': return 'Aðgangi hafnað';
			case 'common.game.start': return 'Byrja leik';
			case 'common.game.pause': return 'Gera hlé á leik';
			case 'common.game.resume': return 'Halda áfram með leik';
			case 'common.game.end': return 'Enda leik';
			case 'common.game.levelUp': return 'Stig upp';
			case 'common.game.gameOver': return 'Leik lokið';
			case 'common.game.nextLevel': return 'Næsta stig';
			case 'common.game.previousLevel': return 'Fyrra stig';
			case 'common.game.restart': return 'Endurræsa leik';
			case 'common.social.like': return 'Líkar';
			case 'common.social.share': return 'Deila';
			case 'common.social.comment': return 'Athugasemd';
			case 'common.social.follow': return 'Fylgja';
			case 'common.social.unfollow': return 'Hætta að fylgja';
			case 'common.social.unlike': return 'Líkar ekki';
			case 'common.social.reply': return 'Svara';
			case 'common.social.dislike': return 'Líkar ekki';
			case 'common.social.block': return 'Loka á';
			case 'common.social.blockUser': return 'Loka á notanda';
			case 'common.social.report': return 'Tilkynna';
			case 'common.social.mute': return 'Þagga';
			case 'common.social.uSentFriendRequest': return 'Þú sendir vinabeiðni';
			case 'common.social.uReceivedFriendRequest': return 'Þú fékkst vinabeiðni';
			case 'common.social.sentFriendRequest': return 'sendi vinabeiðni';
			case 'common.social.receivedFriendRequest': return 'fékk vinabeiðni';
			case 'common.social.acceptedFriendRequest': return 'samþykkti vinabeiðni';
			case 'common.social.uAcceptedFriendRequest': return 'Þú samþykktir vinabeiðni';
			case 'common.views.list': return 'Listi';
			case 'common.views.grid': return 'Net';
			case 'common.views.table': return 'Tafla';
			case 'common.views.form': return 'Eyðublað';
			case 'common.units.length.kilometer': return 'Kílómetri';
			case 'common.units.length.meter': return 'Metri';
			case 'common.units.length.centimeter': return 'Sentímetri';
			case 'common.units.length.millimeter': return 'Millímetri';
			case 'common.units.length.micrometer': return 'Míkrómetri';
			case 'common.units.length.nanometer': return 'Nanómetri';
			case 'common.units.weight.kilogram': return 'Kílógramm';
			case 'common.units.weight.gram': return 'Gramm';
			case 'common.units.weight.milligram': return 'Milligramm';
			case 'common.units.weight.ton': return 'Tonn';
			case 'common.units.volume.liter': return 'Lítri';
			case 'common.units.volume.milliliter': return 'Millilítri';
			case 'common.units.volume.cubicMeter': return 'Rúmmetri';
			case 'common.units.time.second': return 'Sekúnda';
			case 'common.units.time.minute': return 'Mínúta';
			case 'common.units.time.hour': return 'Klukkustund';
			case 'common.units.time.day': return 'Dagur';
			case 'common.units.time.week': return 'Vika';
			case 'common.units.time.month': return 'Mánuður';
			case 'common.units.time.year': return 'Ár';
			case 'common.units.area.squareMeter': return 'Fermetri';
			case 'common.units.area.hectare': return 'Hektari';
			case 'common.units.area.acre': return 'Ekra';
			case 'common.numbers.k1': return 'Einn';
			case 'common.numbers.k2': return 'Tveir';
			case 'common.numbers.k3': return 'Þrír';
			case 'common.numbers.k4': return 'Fjórir';
			case 'common.numbers.k5': return 'Fimm';
			case 'common.numbers.k6': return 'Sex';
			case 'common.numbers.k7': return 'Sjö';
			case 'common.numbers.k8': return 'Átta';
			case 'common.numbers.k9': return 'Níu';
			case 'common.numbers.k10': return 'Tíu';
			case 'common.ranks.k1': return 'fyrsti';
			case 'common.ranks.k2': return 'annar';
			case 'common.ranks.k3': return 'þriðji';
			case 'common.ranks.k4': return 'fjórði';
			case 'common.ranks.k5': return 'fimmti';
			case 'common.ranks.k6': return 'sjötti';
			case 'common.ranks.k7': return 'sjöundi';
			case 'common.ranks.k8': return 'áttundi';
			case 'common.ranks.k9': return 'níundi';
			case 'common.ranks.k10': return 'tíundi';
			case 'common.control.on': return 'Kveikt';
			case 'common.control.off': return 'Slökkt';
			case 'common.control.yes': return 'Já';
			case 'common.control.no': return 'Nei';
			case 'common.control.confirm': return 'Staðfesta';
			case 'common.control.cancel': return 'Hætta við';
			case 'common.control.retry': return 'Reyna aftur';
			case 'common.control.logout': return 'Skrá út';
			case 'common.control.edit': return 'Breyta';
			case 'common.control.delete': return 'Eyða';
			case 'common.control.revert': return 'Afturkalla';
			case 'common.control.save': return 'Vista';
			case 'common.buttons.submit': return 'Senda';
			case 'common.buttons.close': return 'Loka';
			case 'common.buttons.reset': return 'Endurstilla';
			case 'common.buttons.cancel': return 'Hætta við';
			case 'common.buttons.kContinue': return 'Halda áfram';
			case 'common.buttons.back': return 'Til baka';
			case 'common.buttons.next': return 'Næsta';
			case 'common.buttons.done': return 'Lokið';
			case 'common.buttons.upload': return 'Hlaða upp';
			case 'common.buttons.choose': return 'Velja';
			case 'common.buttons.select': return 'Velja';
			case 'common.buttons.clear': return 'Hreinsa';
			case 'common.buttons.start': return 'Byrja';
			case 'common.labels.required': return 'Nauðsynlegt';
			case 'common.labels.optional': return 'Valfrjálst';
			case 'common.labels.instructions': return 'Leiðbeiningar:';
			case 'common.labels.status': return 'Staða';
			case 'common.labels.progress': return 'Framvindu';
			case 'common.labels.question': return 'Spurning';
			case 'common.labels.answer': return 'Svar';
			case 'common.labels.response': return 'Svörun';
			case 'common.labels.loading': return 'Hleður...';
			case 'common.labels.error': return 'Villa';
			case 'common.labels.success': return 'Árangur';
			case 'common.labels.warning': return 'Viðvörun';
			case 'common.response.success': return 'Árangur';
			case 'common.response.error': return 'Villa';
			case 'common.response.info': return 'Upplýsingar';
			case 'common.response.warning': return 'Viðvörun';
			case 'common.response.tbd': return 'Á eftir að ákveða';
			case 'common.response.wip': return 'Í vinnslu';
			case 'common.priority.high': return 'Hátt';
			case 'common.priority.medium': return 'Miðlungs';
			case 'common.priority.low': return 'Lágt';
			case 'common.date.today': return 'Í dag';
			case 'common.date.yesterday': return 'Í gær';
			case 'common.date.tomorrow': return 'Á morgun';
			case 'common.date.justNow': return 'Akkúrat núna';
			case 'common.date.aMomentAgo': return 'Fyrir augnablik';
			case 'common.date.minutesAgo': return 'Fyrir mínútum';
			case 'common.date.hoursAgo': return 'Fyrir klukkustundum';
			case 'common.date.daysAgo': return ({required Object days}) => 'Fyrir ${days} dögum';
			case 'common.date.weeksAgo': return 'Fyrir vikum';
			case 'common.date.thisWeek': return 'Þessa viku';
			case 'common.date.lastWeek': return 'Síðustu viku';
			case 'common.date.thisMonth': return 'Þennan mánuð';
			case 'common.date.lastMonth': return 'Síðasta mánuð';
			case 'common.date.thisYear': return 'Þetta ár';
			case 'common.date.lastYear': return 'Síðasta ár';
			case 'common.date.daysAhead': return ({required Object days}) => 'Eftir ${days} daga';
			case 'common.weekdays.full.sunday': return 'Sunnudagur';
			case 'common.weekdays.full.monday': return 'Mánudagur';
			case 'common.weekdays.full.tuesday': return 'Þriðjudagur';
			case 'common.weekdays.full.wednesday': return 'Miðvikudagur';
			case 'common.weekdays.full.thursday': return 'Fimmtudagur';
			case 'common.weekdays.full.friday': return 'Föstudagur';
			case 'common.weekdays.full.saturday': return 'Laugardagur';
			case 'common.weekdays.short.sunday': return 'Sun';
			case 'common.weekdays.short.monday': return 'Mán';
			case 'common.weekdays.short.tuesday': return 'Þri';
			case 'common.weekdays.short.wednesday': return 'Mið';
			case 'common.weekdays.short.thursday': return 'Fim';
			case 'common.weekdays.short.friday': return 'Fös';
			case 'common.weekdays.short.saturday': return 'Lau';
			case 'common.formRestrictions.required': return 'Þessi reitur er nauðsynlegur.';
			case 'common.formRestrictions.minLength': return ({required Object min}) => 'Lágmarkslengd er ${min} stafir.';
			case 'common.formRestrictions.maxLength': return ({required Object max}) => 'Hámarkslengd er ${max} stafir.';
			case 'common.formRestrictions.invalidFormat': return 'Snið er ógilt.';
			case 'common.formRestrictions.pattern': return ({required Object pattern}) => 'Þessi reitur verður að fylgja mynstrinu ${pattern}.';
			case 'common.tos.accept': return 'Ég samþykki Skilmála og Skilyrði';
			case 'common.tos.readAccept': return 'Vinsamlegast lestu og samþykktu Skilmála og Skilyrði okkar';
			case 'common.tos.title': return 'Skilmálar og Skilyrði';
			case 'common.tos.service': return 'Þjónustuskilmálar';
			case 'common.tos.privacy': return 'Persónuverndarstefna';
			case 'common.tos.continueAgree': return 'Með því að halda áfram samþykkir þú Skilmála og Skilyrði okkar';
			case 'common.tos.mustAccept': return 'Þú verður að samþykkja Skilmála og Skilyrði til að halda áfram';
			case 'common.tos.view': return 'Skoða Skilmála og Skilyrði';
			case 'common.tos.lastUpdated': return ({required Object date}) => 'Síðast uppfært: ${date}';
			case 'common.tos.contactInfo': return 'Hafðu samband við okkur fyrir frekari upplýsingar um Skilmála og Skilyrði okkar';
			case 'common.permissions.allowLocation': return 'Leyfa aðgang að staðsetningu?';
			case 'common.permissions.allowCamera': return 'Leyfa aðgang að myndavél?';
			case 'common.permissions.allowMicrophone': return 'Leyfa aðgang að hljóðnema?';
			case 'common.permissions.allowNotifications': return 'Leyfa tilkynningar?';
			case 'common.permissions.allowContacts': return 'Leyfa aðgang að tengiliðum?';
			case 'common.permissions.allowPhotos': return 'Leyfa aðgang að myndum?';
			case 'common.permissions.allowStorage': return 'Leyfa aðgang að geymslu?';
			case 'common.permissions.allowBluetooth': return 'Leyfa Bluetooth aðgang?';
			case 'common.permissions.needPermission': return 'Við þurfum þitt leyfi til að halda áfram';
			case 'common.permissions.permissionDenied': return 'Leyfi hafnað';
			case 'common.permissions.permissionRequired': return 'Þetta leyfi er nauðsynlegt';
			case 'common.permissions.enableInSettings': return 'Vinsamlegast virkjaðu í stillingum';
			case 'common.prompts.sessionExpired': return 'Lota þín er útrunnin';
			case 'common.prompts.areYouSure': return 'Ertu viss?';
			case 'common.prompts.cannotBeUndone': return 'Þessa aðgerð er ekki hægt að afturkalla';
			case 'common.prompts.unsavedChanges': return 'Þú ert með óvistaðar breytingar';
			case 'common.prompts.discardChanges': return 'Hafna breytingum?';
			case 'common.prompts.locationDisabled': return 'Staðsetningarþjónusta er óvirk';
			case 'common.prompts.networkRequired': return 'Nettenging nauðsynleg';
			case 'common.prompts.loginRequired': return 'Innskráning nauðsynleg til að halda áfram';
			case 'common.prompts.confirmDelete': return 'Ertu viss um að þú viljir eyða þessu?';
			case 'common.prompts.confirmLogout': return 'Ertu viss um að þú viljir skrá þig út?';
			case 'common.prompts.saveBeforeExit': return 'Viltu vista áður en þú ferð út?';
			case 'common.prompts.reloadPage': return 'Viltu endurhlaða síðunni?';
			case 'common.prompts.updateAvailable': return 'Uppfærsla er í boði';
			case 'common.prompts.restartRequired': return 'Endurræsing nauðsynleg til að virkja breytingar';
			case 'login.message.success': return 'Innskráning tókst.';
			case 'login.message.error': return 'Innskráning mistókst. Vinsamlegast reyndu aftur.';
			case 'login.message.wrongPassword': return 'Vinsamlegast staðfestu innskráningarupplýsingarnar þínar.';
			case 'login.form.username': return 'Notandanafn';
			case 'login.form.password': return 'Lykilorð';
			case 'login.form.submit': return 'Skrá inn';
			case 'login.form.createAccount': return 'Búa til nýjan reikning';
			case 'login.form.forgotPassword': return 'Gleymt lykilorð';
			case 'login.tooltip.username': return 'Sláðu inn notandanafnið þitt';
			case 'login.tooltip.password': return 'Sláðu inn lykilorðið þitt';
			case 'login.tooltip.submit': return 'Smelltu til að skrá inn';
			case 'login.validation.username.required': return 'Notandanafn er nauðsynlegt.';
			case 'login.validation.password.required': return 'Lykilorð er nauðsynlegt.';
			case 'register.message.success': return 'Skráning tókst.';
			case 'register.message.error': return 'Skráning mistókst. Vinsamlegast reyndu aftur.';
			case 'register.form.username': return 'Notandanafn';
			case 'register.form.email': return 'Netfang';
			case 'register.form.password': return 'Lykilorð';
			case 'register.form.submit': return 'Skrá sig';
			case 'register.form.acceptTos': return 'Ég samþykki þjónustuskilmálana';
			case 'register.tooltip.username': return 'Sláðu inn notandanafnið þitt';
			case 'register.tooltip.email': return 'Sláðu inn netfangið þitt';
			case 'register.tooltip.password': return 'Sláðu inn lykilorðið þitt';
			case 'register.tooltip.submit': return 'Smelltu til að skrá þig';
			case 'register.validation.username.required': return 'Notandanafn er nauðsynlegt.';
			case 'register.validation.username.minLength': return ({required Object min}) => 'Notandanafn verður að vera að minnsta kosti ${min} stafir að lengd.';
			case 'register.validation.username.maxLength': return ({required Object max}) => 'Notandanafn má vera að hámarki ${max} stafir að lengd.';
			case 'register.validation.email.required': return 'Netfang er nauðsynlegt.';
			case 'register.validation.email.invalid': return 'Netfang er ekki gilt.';
			case 'register.validation.password.required': return 'Lykilorð er nauðsynlegt.';
			case 'register.validation.password.minLength': return ({required Object min}) => 'Lykilorð verður að vera að minnsta kosti ${min} stafir að lengd.';
			case 'passwordReset.message.success': return 'Netfang fyrir endurstillingu lykilorðs sent.';
			case 'passwordReset.message.error': return 'Endurstilling lykilorðs mistókst. Vinsamlegast reyndu aftur.';
			case 'passwordReset.form.email': return 'Netfang';
			case 'passwordReset.form.submit': return 'Endurstilla lykilorð';
			case 'passwordReset.tooltip.email': return 'Sláðu inn netfangið þitt';
			case 'passwordReset.tooltip.submit': return 'Smelltu til að endurstilla lykilorð';
			case 'passwordReset.validation.email.required': return 'Netfang er nauðsynlegt.';
			case 'passwordReset.validation.email.invalid': return 'Netfang er ekki gilt.';
			default: return null;
		}
	}
}

