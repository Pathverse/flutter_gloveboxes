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
class TranslationsFr extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsCommonFr common = TranslationsCommonFr._(_root);
	@override late final TranslationsLoginFr login = TranslationsLoginFr._(_root);
	@override late final TranslationsRegisterFr register = TranslationsRegisterFr._(_root);
	@override late final TranslationsPasswordResetFr passwordReset = TranslationsPasswordResetFr._(_root);
}

// Path: common
class TranslationsCommonFr extends TranslationsCommonEn {
	TranslationsCommonFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMessageFr message = TranslationsCommonMessageFr._(_root);
	@override late final TranslationsCommonGameFr game = TranslationsCommonGameFr._(_root);
	@override late final TranslationsCommonSocialFr social = TranslationsCommonSocialFr._(_root);
	@override late final TranslationsCommonViewsFr views = TranslationsCommonViewsFr._(_root);
	@override late final TranslationsCommonUnitsFr units = TranslationsCommonUnitsFr._(_root);
	@override late final TranslationsCommonNumbersFr numbers = TranslationsCommonNumbersFr._(_root);
	@override late final TranslationsCommonRanksFr ranks = TranslationsCommonRanksFr._(_root);
	@override late final TranslationsCommonControlFr control = TranslationsCommonControlFr._(_root);
	@override late final TranslationsCommonButtonsFr buttons = TranslationsCommonButtonsFr._(_root);
	@override late final TranslationsCommonLabelsFr labels = TranslationsCommonLabelsFr._(_root);
	@override late final TranslationsCommonResponseFr response = TranslationsCommonResponseFr._(_root);
	@override late final TranslationsCommonPriorityFr priority = TranslationsCommonPriorityFr._(_root);
	@override late final TranslationsCommonDateFr date = TranslationsCommonDateFr._(_root);
	@override late final TranslationsCommonWeekdaysFr weekdays = TranslationsCommonWeekdaysFr._(_root);
	@override late final TranslationsCommonFormRestrictionsFr formRestrictions = TranslationsCommonFormRestrictionsFr._(_root);
	@override late final TranslationsCommonTosFr tos = TranslationsCommonTosFr._(_root);
	@override late final TranslationsCommonPermissionsFr permissions = TranslationsCommonPermissionsFr._(_root);
	@override late final TranslationsCommonPromptsFr prompts = TranslationsCommonPromptsFr._(_root);
}

// Path: login
class TranslationsLoginFr extends TranslationsLoginEn {
	TranslationsLoginFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginMessageFr message = TranslationsLoginMessageFr._(_root);
	@override late final TranslationsLoginFormFr form = TranslationsLoginFormFr._(_root);
	@override late final TranslationsLoginTooltipFr tooltip = TranslationsLoginTooltipFr._(_root);
	@override late final TranslationsLoginValidationFr validation = TranslationsLoginValidationFr._(_root);
}

// Path: register
class TranslationsRegisterFr extends TranslationsRegisterEn {
	TranslationsRegisterFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterMessageFr message = TranslationsRegisterMessageFr._(_root);
	@override late final TranslationsRegisterFormFr form = TranslationsRegisterFormFr._(_root);
	@override late final TranslationsRegisterTooltipFr tooltip = TranslationsRegisterTooltipFr._(_root);
	@override late final TranslationsRegisterValidationFr validation = TranslationsRegisterValidationFr._(_root);
}

// Path: passwordReset
class TranslationsPasswordResetFr extends TranslationsPasswordResetEn {
	TranslationsPasswordResetFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetMessageFr message = TranslationsPasswordResetMessageFr._(_root);
	@override late final TranslationsPasswordResetFormFr form = TranslationsPasswordResetFormFr._(_root);
	@override late final TranslationsPasswordResetTooltipFr tooltip = TranslationsPasswordResetTooltipFr._(_root);
	@override late final TranslationsPasswordResetValidationFr validation = TranslationsPasswordResetValidationFr._(_root);
}

// Path: common.message
class TranslationsCommonMessageFr extends TranslationsCommonMessageEn {
	TranslationsCommonMessageFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get loading => 'Chargement';
	@override String get somethingWentWrong => 'Quelque chose s\'est mal passé';
	@override String get networkProblem => 'Il y a un problème de réseau';
	@override String get noDataFound => 'Aucune donnée trouvée';
	@override String get noResultsFound => 'Aucun résultat trouvé';
	@override String get unsupportedFileType => 'Type de fichier non pris en charge';
	@override String get fileTooLarge => 'Le fichier est trop volumineux';
	@override String get operationTimedOut => 'L\'opération a expiré';
	@override String get sessionExpired => 'La session a expiré';
	@override String get unsavableChanges => 'Les modifications n\'ont pas pu être sauvegardées';
	@override String get noServerConnect => 'Impossible de se connecter au serveur';
	@override String get accessDenied => 'Accès refusé';
}

// Path: common.game
class TranslationsCommonGameFr extends TranslationsCommonGameEn {
	TranslationsCommonGameFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get start => 'Commencer le Jeu';
	@override String get pause => 'Mettre en Pause';
	@override String get resume => 'Reprendre le Jeu';
	@override String get end => 'Terminer le Jeu';
	@override String get levelUp => 'Niveau Supérieur';
	@override String get gameOver => 'Fin du Jeu';
	@override String get nextLevel => 'Niveau Suivant';
	@override String get previousLevel => 'Niveau Précédent';
	@override String get restart => 'Redémarrer le Jeu';
}

// Path: common.social
class TranslationsCommonSocialFr extends TranslationsCommonSocialEn {
	TranslationsCommonSocialFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get like => 'J\'aime';
	@override String get share => 'Partager';
	@override String get comment => 'Commenter';
	@override String get follow => 'Suivre';
	@override String get unfollow => 'Ne plus suivre';
	@override String get unlike => 'Je n\'aime plus';
	@override String get reply => 'Répondre';
	@override String get dislike => 'Je n\'aime pas';
	@override String get block => 'Bloquer';
	@override String get blockUser => 'Bloquer l\'utilisateur';
	@override String get report => 'Signaler';
	@override String get mute => 'Muet';
	@override String get uSentFriendRequest => 'Vous avez envoyé une demande d\'ami';
	@override String get uReceivedFriendRequest => 'Vous avez reçu une demande d\'ami';
	@override String get sentFriendRequest => 'a envoyé une demande d\'ami';
	@override String get receivedFriendRequest => 'a reçu une demande d\'ami';
	@override String get acceptedFriendRequest => 'a accepté une demande d\'ami';
	@override String get uAcceptedFriendRequest => 'Vous avez accepté une demande d\'ami';
}

// Path: common.views
class TranslationsCommonViewsFr extends TranslationsCommonViewsEn {
	TranslationsCommonViewsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get list => 'Liste';
	@override String get grid => 'Grille';
	@override String get table => 'Tableau';
	@override String get form => 'Formulaire';
}

// Path: common.units
class TranslationsCommonUnitsFr extends TranslationsCommonUnitsEn {
	TranslationsCommonUnitsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonUnitsLengthFr length = TranslationsCommonUnitsLengthFr._(_root);
	@override late final TranslationsCommonUnitsWeightFr weight = TranslationsCommonUnitsWeightFr._(_root);
	@override late final TranslationsCommonUnitsVolumeFr volume = TranslationsCommonUnitsVolumeFr._(_root);
	@override late final TranslationsCommonUnitsTimeFr time = TranslationsCommonUnitsTimeFr._(_root);
	@override late final TranslationsCommonUnitsAreaFr area = TranslationsCommonUnitsAreaFr._(_root);
}

// Path: common.numbers
class TranslationsCommonNumbersFr extends TranslationsCommonNumbersEn {
	TranslationsCommonNumbersFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'Un';
	@override String get k2 => 'Deux';
	@override String get k3 => 'Trois';
	@override String get k4 => 'Quatre';
	@override String get k5 => 'Cinq';
	@override String get k6 => 'Six';
	@override String get k7 => 'Sept';
	@override String get k8 => 'Huit';
	@override String get k9 => 'Neuf';
	@override String get k10 => 'Dix';
}

// Path: common.ranks
class TranslationsCommonRanksFr extends TranslationsCommonRanksEn {
	TranslationsCommonRanksFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'premier';
	@override String get k2 => 'deuxième';
	@override String get k3 => 'troisième';
	@override String get k4 => 'quatrième';
	@override String get k5 => 'cinquième';
	@override String get k6 => 'sixième';
	@override String get k7 => 'septième';
	@override String get k8 => 'huitième';
	@override String get k9 => 'neuvième';
	@override String get k10 => 'dixième';
}

// Path: common.control
class TranslationsCommonControlFr extends TranslationsCommonControlEn {
	TranslationsCommonControlFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get on => 'Activé';
	@override String get off => 'Désactivé';
	@override String get yes => 'Oui';
	@override String get no => 'Non';
	@override String get confirm => 'Confirmer';
	@override String get cancel => 'Annuler';
	@override String get retry => 'Réessayer';
	@override String get logout => 'Se déconnecter';
	@override String get edit => 'Modifier';
	@override String get delete => 'Supprimer';
	@override String get revert => 'Annuler';
	@override String get save => 'Sauvegarder';
}

// Path: common.buttons
class TranslationsCommonButtonsFr extends TranslationsCommonButtonsEn {
	TranslationsCommonButtonsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get submit => 'Soumettre';
	@override String get close => 'Fermer';
	@override String get reset => 'Réinitialiser';
	@override String get cancel => 'Annuler';
	@override String get kContinue => 'Continuer';
	@override String get back => 'Retour';
	@override String get next => 'Suivant';
	@override String get done => 'Terminé';
	@override String get upload => 'Télécharger';
	@override String get choose => 'Choisir';
	@override String get select => 'Sélectionner';
	@override String get clear => 'Effacer';
}

// Path: common.labels
class TranslationsCommonLabelsFr extends TranslationsCommonLabelsEn {
	TranslationsCommonLabelsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get required => 'Requis';
	@override String get optional => 'Optionnel';
	@override String get instructions => 'Instructions:';
	@override String get status => 'Statut';
	@override String get progress => 'Progrès';
	@override String get question => 'Question';
	@override String get answer => 'Réponse';
	@override String get response => 'Réponse';
	@override String get loading => 'Chargement...';
	@override String get error => 'Erreur';
	@override String get success => 'Succès';
	@override String get warning => 'Avertissement';
}

// Path: common.response
class TranslationsCommonResponseFr extends TranslationsCommonResponseEn {
	TranslationsCommonResponseFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Succès';
	@override String get error => 'Erreur';
	@override String get info => 'Information';
	@override String get warning => 'Avertissement';
	@override String get tbd => 'À Déterminer';
	@override String get wip => 'Travail en Cours';
}

// Path: common.priority
class TranslationsCommonPriorityFr extends TranslationsCommonPriorityEn {
	TranslationsCommonPriorityFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get high => 'Élevée';
	@override String get medium => 'Moyenne';
	@override String get low => 'Faible';
}

// Path: common.date
class TranslationsCommonDateFr extends TranslationsCommonDateEn {
	TranslationsCommonDateFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get today => 'Aujourd\'hui';
	@override String get yesterday => 'Hier';
	@override String get tomorrow => 'Demain';
	@override String get justNow => 'À l\'instant';
	@override String get aMomentAgo => 'Il y a un moment';
	@override String get minutesAgo => 'Il y a quelques minutes';
	@override String get hoursAgo => 'Il y a quelques heures';
	@override String daysAgo({required Object days}) => 'Il y a ${days} jours';
	@override String get weeksAgo => 'Il y a quelques semaines';
	@override String get thisWeek => 'Cette semaine';
	@override String get lastWeek => 'La semaine dernière';
	@override String get thisMonth => 'Ce mois-ci';
	@override String get lastMonth => 'Le mois dernier';
	@override String get thisYear => 'Cette année';
	@override String get lastYear => 'L\'année dernière';
	@override String daysAhead({required Object days}) => 'Dans ${days} jours';
}

// Path: common.weekdays
class TranslationsCommonWeekdaysFr extends TranslationsCommonWeekdaysEn {
	TranslationsCommonWeekdaysFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonWeekdaysFullFr full = TranslationsCommonWeekdaysFullFr._(_root);
	@override late final TranslationsCommonWeekdaysShortFr short = TranslationsCommonWeekdaysShortFr._(_root);
}

// Path: common.formRestrictions
class TranslationsCommonFormRestrictionsFr extends TranslationsCommonFormRestrictionsEn {
	TranslationsCommonFormRestrictionsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get required => 'Ce champ est obligatoire.';
	@override String minLength({required Object min}) => 'La longueur minimale est ${min} caractères.';
	@override String maxLength({required Object max}) => 'La longueur maximale est ${max} caractères.';
	@override String get invalidFormat => 'Le format est invalide.';
	@override String pattern({required Object pattern}) => 'Ce champ doit suivre le modèle ${pattern}.';
}

// Path: common.tos
class TranslationsCommonTosFr extends TranslationsCommonTosEn {
	TranslationsCommonTosFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get accept => 'J\'accepte les Conditions Générales';
	@override String get readAccept => 'Veuillez lire et accepter nos Conditions Générales';
	@override String get title => 'Conditions Générales';
	@override String get service => 'Conditions de Service';
	@override String get privacy => 'Politique de Confidentialité';
	@override String get continueAgree => 'En continuant, vous acceptez nos Conditions Générales';
	@override String get mustAccept => 'Vous devez accepter les Conditions Générales pour continuer';
	@override String get view => 'Voir les Conditions Générales';
	@override String lastUpdated({required Object date}) => 'Dernière mise à jour : ${date}';
	@override String get contactInfo => 'Contactez-nous pour plus d\'informations sur nos Conditions Générales';
}

// Path: common.permissions
class TranslationsCommonPermissionsFr extends TranslationsCommonPermissionsEn {
	TranslationsCommonPermissionsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get allowLocation => 'Autoriser l\'accès à la localisation ?';
	@override String get allowCamera => 'Autoriser l\'accès à la caméra ?';
	@override String get allowMicrophone => 'Autoriser l\'accès au microphone ?';
	@override String get allowNotifications => 'Autoriser les notifications ?';
	@override String get allowContacts => 'Autoriser l\'accès aux contacts ?';
	@override String get allowPhotos => 'Autoriser l\'accès aux photos ?';
	@override String get allowStorage => 'Autoriser l\'accès au stockage ?';
	@override String get allowBluetooth => 'Autoriser l\'accès Bluetooth ?';
	@override String get needPermission => 'Nous avons besoin de votre permission pour continuer';
	@override String get permissionDenied => 'Permission refusée';
	@override String get permissionRequired => 'Cette permission est requise';
	@override String get enableInSettings => 'Veuillez activer dans les Paramètres';
}

// Path: common.prompts
class TranslationsCommonPromptsFr extends TranslationsCommonPromptsEn {
	TranslationsCommonPromptsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get sessionExpired => 'Votre session a expiré';
	@override String get areYouSure => 'Êtes-vous sûr ?';
	@override String get cannotBeUndone => 'Cette action ne peut pas être annulée';
	@override String get unsavedChanges => 'Vous avez des modifications non sauvegardées';
	@override String get discardChanges => 'Abandonner les modifications ?';
	@override String get locationDisabled => 'Les services de localisation sont désactivés';
	@override String get networkRequired => 'Connexion réseau requise';
	@override String get loginRequired => 'Connexion requise pour continuer';
	@override String get confirmDelete => 'Êtes-vous sûr de vouloir supprimer ceci ?';
	@override String get confirmLogout => 'Êtes-vous sûr de vouloir vous déconnecter ?';
	@override String get saveBeforeExit => 'Voulez-vous sauvegarder avant de quitter ?';
	@override String get reloadPage => 'Souhaitez-vous recharger la page ?';
	@override String get updateAvailable => 'Une mise à jour est disponible';
	@override String get restartRequired => 'Redémarrage requis pour appliquer les modifications';
}

// Path: login.message
class TranslationsLoginMessageFr extends TranslationsLoginMessageEn {
	TranslationsLoginMessageFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Connexion réussie.';
	@override String get error => 'Échec de la connexion. Veuillez réessayer.';
	@override String get wrongPassword => 'Veuillez vérifier vos identifiants.';
}

// Path: login.form
class TranslationsLoginFormFr extends TranslationsLoginFormEn {
	TranslationsLoginFormFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get username => 'Nom d\'utilisateur';
	@override String get password => 'Mot de passe';
	@override String get submit => 'Se connecter';
	@override String get createAccount => 'Créer un nouveau compte';
	@override String get forgotPassword => 'Mot de passe oublié';
}

// Path: login.tooltip
class TranslationsLoginTooltipFr extends TranslationsLoginTooltipEn {
	TranslationsLoginTooltipFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get username => 'Entrez votre nom d\'utilisateur';
	@override String get password => 'Entrez votre mot de passe';
	@override String get submit => 'Cliquez pour vous connecter';
}

// Path: login.validation
class TranslationsLoginValidationFr extends TranslationsLoginValidationEn {
	TranslationsLoginValidationFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginValidationUsernameFr username = TranslationsLoginValidationUsernameFr._(_root);
	@override late final TranslationsLoginValidationPasswordFr password = TranslationsLoginValidationPasswordFr._(_root);
}

// Path: register.message
class TranslationsRegisterMessageFr extends TranslationsRegisterMessageEn {
	TranslationsRegisterMessageFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get success => 'Inscription réussie.';
	@override String get error => 'Échec de l\'inscription. Veuillez réessayer.';
}

// Path: register.form
class TranslationsRegisterFormFr extends TranslationsRegisterFormEn {
	TranslationsRegisterFormFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get username => 'Nom d\'utilisateur';
	@override String get email => 'E-mail';
	@override String get password => 'Mot de passe';
	@override String get submit => 'S\'inscrire';
	@override String get acceptTos => 'J\'accepte les Conditions de Service';
}

// Path: register.tooltip
class TranslationsRegisterTooltipFr extends TranslationsRegisterTooltipEn {
	TranslationsRegisterTooltipFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get username => 'Entrez votre nom d\'utilisateur';
	@override String get email => 'Entrez votre e-mail';
	@override String get password => 'Entrez votre mot de passe';
	@override String get submit => 'Cliquez pour vous inscrire';
}

// Path: register.validation
class TranslationsRegisterValidationFr extends TranslationsRegisterValidationEn {
	TranslationsRegisterValidationFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterValidationUsernameFr username = TranslationsRegisterValidationUsernameFr._(_root);
	@override late final TranslationsRegisterValidationEmailFr email = TranslationsRegisterValidationEmailFr._(_root);
	@override late final TranslationsRegisterValidationPasswordFr password = TranslationsRegisterValidationPasswordFr._(_root);
}

// Path: passwordReset.message
class TranslationsPasswordResetMessageFr extends TranslationsPasswordResetMessageEn {
	TranslationsPasswordResetMessageFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get success => 'E-mail de réinitialisation du mot de passe envoyé.';
	@override String get error => 'Échec de la réinitialisation du mot de passe. Veuillez réessayer.';
}

// Path: passwordReset.form
class TranslationsPasswordResetFormFr extends TranslationsPasswordResetFormEn {
	TranslationsPasswordResetFormFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get email => 'E-mail';
	@override String get submit => 'Réinitialiser le Mot de Passe';
}

// Path: passwordReset.tooltip
class TranslationsPasswordResetTooltipFr extends TranslationsPasswordResetTooltipEn {
	TranslationsPasswordResetTooltipFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get email => 'Entrez votre e-mail';
	@override String get submit => 'Cliquez pour réinitialiser le mot de passe';
}

// Path: passwordReset.validation
class TranslationsPasswordResetValidationFr extends TranslationsPasswordResetValidationEn {
	TranslationsPasswordResetValidationFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetValidationEmailFr email = TranslationsPasswordResetValidationEmailFr._(_root);
}

// Path: common.units.length
class TranslationsCommonUnitsLengthFr extends TranslationsCommonUnitsLengthEn {
	TranslationsCommonUnitsLengthFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get kilometer => 'Kilomètre';
	@override String get meter => 'Mètre';
	@override String get centimeter => 'Centimètre';
	@override String get millimeter => 'Millimètre';
	@override String get micrometer => 'Micromètre';
	@override String get nanometer => 'Nanomètre';
}

// Path: common.units.weight
class TranslationsCommonUnitsWeightFr extends TranslationsCommonUnitsWeightEn {
	TranslationsCommonUnitsWeightFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get kilogram => 'Kilogramme';
	@override String get gram => 'Gramme';
	@override String get milligram => 'Milligramme';
	@override String get ton => 'Tonne';
}

// Path: common.units.volume
class TranslationsCommonUnitsVolumeFr extends TranslationsCommonUnitsVolumeEn {
	TranslationsCommonUnitsVolumeFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get liter => 'Litre';
	@override String get milliliter => 'Millilitre';
	@override String get cubicMeter => 'Mètre Cube';
}

// Path: common.units.time
class TranslationsCommonUnitsTimeFr extends TranslationsCommonUnitsTimeEn {
	TranslationsCommonUnitsTimeFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get second => 'Seconde';
	@override String get minute => 'Minute';
	@override String get hour => 'Heure';
	@override String get day => 'Jour';
	@override String get week => 'Semaine';
	@override String get month => 'Mois';
	@override String get year => 'Année';
}

// Path: common.units.area
class TranslationsCommonUnitsAreaFr extends TranslationsCommonUnitsAreaEn {
	TranslationsCommonUnitsAreaFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get squareMeter => 'Mètre Carré';
	@override String get hectare => 'Hectare';
	@override String get acre => 'Acre';
}

// Path: common.weekdays.full
class TranslationsCommonWeekdaysFullFr extends TranslationsCommonWeekdaysFullEn {
	TranslationsCommonWeekdaysFullFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get sunday => 'Dimanche';
	@override String get monday => 'Lundi';
	@override String get tuesday => 'Mardi';
	@override String get wednesday => 'Mercredi';
	@override String get thursday => 'Jeudi';
	@override String get friday => 'Vendredi';
	@override String get saturday => 'Samedi';
}

// Path: common.weekdays.short
class TranslationsCommonWeekdaysShortFr extends TranslationsCommonWeekdaysShortEn {
	TranslationsCommonWeekdaysShortFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get sunday => 'Dim';
	@override String get monday => 'Lun';
	@override String get tuesday => 'Mar';
	@override String get wednesday => 'Mer';
	@override String get thursday => 'Jeu';
	@override String get friday => 'Ven';
	@override String get saturday => 'Sam';
}

// Path: login.validation.username
class TranslationsLoginValidationUsernameFr extends TranslationsLoginValidationUsernameEn {
	TranslationsLoginValidationUsernameFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get required => 'Le nom d\'utilisateur est obligatoire.';
}

// Path: login.validation.password
class TranslationsLoginValidationPasswordFr extends TranslationsLoginValidationPasswordEn {
	TranslationsLoginValidationPasswordFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get required => 'Le mot de passe est obligatoire.';
}

// Path: register.validation.username
class TranslationsRegisterValidationUsernameFr extends TranslationsRegisterValidationUsernameEn {
	TranslationsRegisterValidationUsernameFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get required => 'Le nom d\'utilisateur est obligatoire.';
	@override String minLength({required Object min}) => 'Le nom d\'utilisateur doit contenir au moins ${min} caractères.';
	@override String maxLength({required Object max}) => 'Le nom d\'utilisateur doit contenir au maximum ${max} caractères.';
}

// Path: register.validation.email
class TranslationsRegisterValidationEmailFr extends TranslationsRegisterValidationEmailEn {
	TranslationsRegisterValidationEmailFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get required => 'L\'e-mail est obligatoire.';
	@override String get invalid => 'L\'e-mail n\'est pas valide.';
}

// Path: register.validation.password
class TranslationsRegisterValidationPasswordFr extends TranslationsRegisterValidationPasswordEn {
	TranslationsRegisterValidationPasswordFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get required => 'Le mot de passe est obligatoire.';
	@override String minLength({required Object min}) => 'Le mot de passe doit contenir au moins ${min} caractères.';
}

// Path: passwordReset.validation.email
class TranslationsPasswordResetValidationEmailFr extends TranslationsPasswordResetValidationEmailEn {
	TranslationsPasswordResetValidationEmailFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get required => 'L\'e-mail est obligatoire.';
	@override String get invalid => 'L\'e-mail n\'est pas valide.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.message.loading': return 'Chargement';
			case 'common.message.somethingWentWrong': return 'Quelque chose s\'est mal passé';
			case 'common.message.networkProblem': return 'Il y a un problème de réseau';
			case 'common.message.noDataFound': return 'Aucune donnée trouvée';
			case 'common.message.noResultsFound': return 'Aucun résultat trouvé';
			case 'common.message.unsupportedFileType': return 'Type de fichier non pris en charge';
			case 'common.message.fileTooLarge': return 'Le fichier est trop volumineux';
			case 'common.message.operationTimedOut': return 'L\'opération a expiré';
			case 'common.message.sessionExpired': return 'La session a expiré';
			case 'common.message.unsavableChanges': return 'Les modifications n\'ont pas pu être sauvegardées';
			case 'common.message.noServerConnect': return 'Impossible de se connecter au serveur';
			case 'common.message.accessDenied': return 'Accès refusé';
			case 'common.game.start': return 'Commencer le Jeu';
			case 'common.game.pause': return 'Mettre en Pause';
			case 'common.game.resume': return 'Reprendre le Jeu';
			case 'common.game.end': return 'Terminer le Jeu';
			case 'common.game.levelUp': return 'Niveau Supérieur';
			case 'common.game.gameOver': return 'Fin du Jeu';
			case 'common.game.nextLevel': return 'Niveau Suivant';
			case 'common.game.previousLevel': return 'Niveau Précédent';
			case 'common.game.restart': return 'Redémarrer le Jeu';
			case 'common.social.like': return 'J\'aime';
			case 'common.social.share': return 'Partager';
			case 'common.social.comment': return 'Commenter';
			case 'common.social.follow': return 'Suivre';
			case 'common.social.unfollow': return 'Ne plus suivre';
			case 'common.social.unlike': return 'Je n\'aime plus';
			case 'common.social.reply': return 'Répondre';
			case 'common.social.dislike': return 'Je n\'aime pas';
			case 'common.social.block': return 'Bloquer';
			case 'common.social.blockUser': return 'Bloquer l\'utilisateur';
			case 'common.social.report': return 'Signaler';
			case 'common.social.mute': return 'Muet';
			case 'common.social.uSentFriendRequest': return 'Vous avez envoyé une demande d\'ami';
			case 'common.social.uReceivedFriendRequest': return 'Vous avez reçu une demande d\'ami';
			case 'common.social.sentFriendRequest': return 'a envoyé une demande d\'ami';
			case 'common.social.receivedFriendRequest': return 'a reçu une demande d\'ami';
			case 'common.social.acceptedFriendRequest': return 'a accepté une demande d\'ami';
			case 'common.social.uAcceptedFriendRequest': return 'Vous avez accepté une demande d\'ami';
			case 'common.views.list': return 'Liste';
			case 'common.views.grid': return 'Grille';
			case 'common.views.table': return 'Tableau';
			case 'common.views.form': return 'Formulaire';
			case 'common.units.length.kilometer': return 'Kilomètre';
			case 'common.units.length.meter': return 'Mètre';
			case 'common.units.length.centimeter': return 'Centimètre';
			case 'common.units.length.millimeter': return 'Millimètre';
			case 'common.units.length.micrometer': return 'Micromètre';
			case 'common.units.length.nanometer': return 'Nanomètre';
			case 'common.units.weight.kilogram': return 'Kilogramme';
			case 'common.units.weight.gram': return 'Gramme';
			case 'common.units.weight.milligram': return 'Milligramme';
			case 'common.units.weight.ton': return 'Tonne';
			case 'common.units.volume.liter': return 'Litre';
			case 'common.units.volume.milliliter': return 'Millilitre';
			case 'common.units.volume.cubicMeter': return 'Mètre Cube';
			case 'common.units.time.second': return 'Seconde';
			case 'common.units.time.minute': return 'Minute';
			case 'common.units.time.hour': return 'Heure';
			case 'common.units.time.day': return 'Jour';
			case 'common.units.time.week': return 'Semaine';
			case 'common.units.time.month': return 'Mois';
			case 'common.units.time.year': return 'Année';
			case 'common.units.area.squareMeter': return 'Mètre Carré';
			case 'common.units.area.hectare': return 'Hectare';
			case 'common.units.area.acre': return 'Acre';
			case 'common.numbers.k1': return 'Un';
			case 'common.numbers.k2': return 'Deux';
			case 'common.numbers.k3': return 'Trois';
			case 'common.numbers.k4': return 'Quatre';
			case 'common.numbers.k5': return 'Cinq';
			case 'common.numbers.k6': return 'Six';
			case 'common.numbers.k7': return 'Sept';
			case 'common.numbers.k8': return 'Huit';
			case 'common.numbers.k9': return 'Neuf';
			case 'common.numbers.k10': return 'Dix';
			case 'common.ranks.k1': return 'premier';
			case 'common.ranks.k2': return 'deuxième';
			case 'common.ranks.k3': return 'troisième';
			case 'common.ranks.k4': return 'quatrième';
			case 'common.ranks.k5': return 'cinquième';
			case 'common.ranks.k6': return 'sixième';
			case 'common.ranks.k7': return 'septième';
			case 'common.ranks.k8': return 'huitième';
			case 'common.ranks.k9': return 'neuvième';
			case 'common.ranks.k10': return 'dixième';
			case 'common.control.on': return 'Activé';
			case 'common.control.off': return 'Désactivé';
			case 'common.control.yes': return 'Oui';
			case 'common.control.no': return 'Non';
			case 'common.control.confirm': return 'Confirmer';
			case 'common.control.cancel': return 'Annuler';
			case 'common.control.retry': return 'Réessayer';
			case 'common.control.logout': return 'Se déconnecter';
			case 'common.control.edit': return 'Modifier';
			case 'common.control.delete': return 'Supprimer';
			case 'common.control.revert': return 'Annuler';
			case 'common.control.save': return 'Sauvegarder';
			case 'common.buttons.submit': return 'Soumettre';
			case 'common.buttons.close': return 'Fermer';
			case 'common.buttons.reset': return 'Réinitialiser';
			case 'common.buttons.cancel': return 'Annuler';
			case 'common.buttons.kContinue': return 'Continuer';
			case 'common.buttons.back': return 'Retour';
			case 'common.buttons.next': return 'Suivant';
			case 'common.buttons.done': return 'Terminé';
			case 'common.buttons.upload': return 'Télécharger';
			case 'common.buttons.choose': return 'Choisir';
			case 'common.buttons.select': return 'Sélectionner';
			case 'common.buttons.clear': return 'Effacer';
			case 'common.labels.required': return 'Requis';
			case 'common.labels.optional': return 'Optionnel';
			case 'common.labels.instructions': return 'Instructions:';
			case 'common.labels.status': return 'Statut';
			case 'common.labels.progress': return 'Progrès';
			case 'common.labels.question': return 'Question';
			case 'common.labels.answer': return 'Réponse';
			case 'common.labels.response': return 'Réponse';
			case 'common.labels.loading': return 'Chargement...';
			case 'common.labels.error': return 'Erreur';
			case 'common.labels.success': return 'Succès';
			case 'common.labels.warning': return 'Avertissement';
			case 'common.response.success': return 'Succès';
			case 'common.response.error': return 'Erreur';
			case 'common.response.info': return 'Information';
			case 'common.response.warning': return 'Avertissement';
			case 'common.response.tbd': return 'À Déterminer';
			case 'common.response.wip': return 'Travail en Cours';
			case 'common.priority.high': return 'Élevée';
			case 'common.priority.medium': return 'Moyenne';
			case 'common.priority.low': return 'Faible';
			case 'common.date.today': return 'Aujourd\'hui';
			case 'common.date.yesterday': return 'Hier';
			case 'common.date.tomorrow': return 'Demain';
			case 'common.date.justNow': return 'À l\'instant';
			case 'common.date.aMomentAgo': return 'Il y a un moment';
			case 'common.date.minutesAgo': return 'Il y a quelques minutes';
			case 'common.date.hoursAgo': return 'Il y a quelques heures';
			case 'common.date.daysAgo': return ({required Object days}) => 'Il y a ${days} jours';
			case 'common.date.weeksAgo': return 'Il y a quelques semaines';
			case 'common.date.thisWeek': return 'Cette semaine';
			case 'common.date.lastWeek': return 'La semaine dernière';
			case 'common.date.thisMonth': return 'Ce mois-ci';
			case 'common.date.lastMonth': return 'Le mois dernier';
			case 'common.date.thisYear': return 'Cette année';
			case 'common.date.lastYear': return 'L\'année dernière';
			case 'common.date.daysAhead': return ({required Object days}) => 'Dans ${days} jours';
			case 'common.weekdays.full.sunday': return 'Dimanche';
			case 'common.weekdays.full.monday': return 'Lundi';
			case 'common.weekdays.full.tuesday': return 'Mardi';
			case 'common.weekdays.full.wednesday': return 'Mercredi';
			case 'common.weekdays.full.thursday': return 'Jeudi';
			case 'common.weekdays.full.friday': return 'Vendredi';
			case 'common.weekdays.full.saturday': return 'Samedi';
			case 'common.weekdays.short.sunday': return 'Dim';
			case 'common.weekdays.short.monday': return 'Lun';
			case 'common.weekdays.short.tuesday': return 'Mar';
			case 'common.weekdays.short.wednesday': return 'Mer';
			case 'common.weekdays.short.thursday': return 'Jeu';
			case 'common.weekdays.short.friday': return 'Ven';
			case 'common.weekdays.short.saturday': return 'Sam';
			case 'common.formRestrictions.required': return 'Ce champ est obligatoire.';
			case 'common.formRestrictions.minLength': return ({required Object min}) => 'La longueur minimale est ${min} caractères.';
			case 'common.formRestrictions.maxLength': return ({required Object max}) => 'La longueur maximale est ${max} caractères.';
			case 'common.formRestrictions.invalidFormat': return 'Le format est invalide.';
			case 'common.formRestrictions.pattern': return ({required Object pattern}) => 'Ce champ doit suivre le modèle ${pattern}.';
			case 'common.tos.accept': return 'J\'accepte les Conditions Générales';
			case 'common.tos.readAccept': return 'Veuillez lire et accepter nos Conditions Générales';
			case 'common.tos.title': return 'Conditions Générales';
			case 'common.tos.service': return 'Conditions de Service';
			case 'common.tos.privacy': return 'Politique de Confidentialité';
			case 'common.tos.continueAgree': return 'En continuant, vous acceptez nos Conditions Générales';
			case 'common.tos.mustAccept': return 'Vous devez accepter les Conditions Générales pour continuer';
			case 'common.tos.view': return 'Voir les Conditions Générales';
			case 'common.tos.lastUpdated': return ({required Object date}) => 'Dernière mise à jour : ${date}';
			case 'common.tos.contactInfo': return 'Contactez-nous pour plus d\'informations sur nos Conditions Générales';
			case 'common.permissions.allowLocation': return 'Autoriser l\'accès à la localisation ?';
			case 'common.permissions.allowCamera': return 'Autoriser l\'accès à la caméra ?';
			case 'common.permissions.allowMicrophone': return 'Autoriser l\'accès au microphone ?';
			case 'common.permissions.allowNotifications': return 'Autoriser les notifications ?';
			case 'common.permissions.allowContacts': return 'Autoriser l\'accès aux contacts ?';
			case 'common.permissions.allowPhotos': return 'Autoriser l\'accès aux photos ?';
			case 'common.permissions.allowStorage': return 'Autoriser l\'accès au stockage ?';
			case 'common.permissions.allowBluetooth': return 'Autoriser l\'accès Bluetooth ?';
			case 'common.permissions.needPermission': return 'Nous avons besoin de votre permission pour continuer';
			case 'common.permissions.permissionDenied': return 'Permission refusée';
			case 'common.permissions.permissionRequired': return 'Cette permission est requise';
			case 'common.permissions.enableInSettings': return 'Veuillez activer dans les Paramètres';
			case 'common.prompts.sessionExpired': return 'Votre session a expiré';
			case 'common.prompts.areYouSure': return 'Êtes-vous sûr ?';
			case 'common.prompts.cannotBeUndone': return 'Cette action ne peut pas être annulée';
			case 'common.prompts.unsavedChanges': return 'Vous avez des modifications non sauvegardées';
			case 'common.prompts.discardChanges': return 'Abandonner les modifications ?';
			case 'common.prompts.locationDisabled': return 'Les services de localisation sont désactivés';
			case 'common.prompts.networkRequired': return 'Connexion réseau requise';
			case 'common.prompts.loginRequired': return 'Connexion requise pour continuer';
			case 'common.prompts.confirmDelete': return 'Êtes-vous sûr de vouloir supprimer ceci ?';
			case 'common.prompts.confirmLogout': return 'Êtes-vous sûr de vouloir vous déconnecter ?';
			case 'common.prompts.saveBeforeExit': return 'Voulez-vous sauvegarder avant de quitter ?';
			case 'common.prompts.reloadPage': return 'Souhaitez-vous recharger la page ?';
			case 'common.prompts.updateAvailable': return 'Une mise à jour est disponible';
			case 'common.prompts.restartRequired': return 'Redémarrage requis pour appliquer les modifications';
			case 'login.message.success': return 'Connexion réussie.';
			case 'login.message.error': return 'Échec de la connexion. Veuillez réessayer.';
			case 'login.message.wrongPassword': return 'Veuillez vérifier vos identifiants.';
			case 'login.form.username': return 'Nom d\'utilisateur';
			case 'login.form.password': return 'Mot de passe';
			case 'login.form.submit': return 'Se connecter';
			case 'login.form.createAccount': return 'Créer un nouveau compte';
			case 'login.form.forgotPassword': return 'Mot de passe oublié';
			case 'login.tooltip.username': return 'Entrez votre nom d\'utilisateur';
			case 'login.tooltip.password': return 'Entrez votre mot de passe';
			case 'login.tooltip.submit': return 'Cliquez pour vous connecter';
			case 'login.validation.username.required': return 'Le nom d\'utilisateur est obligatoire.';
			case 'login.validation.password.required': return 'Le mot de passe est obligatoire.';
			case 'register.message.success': return 'Inscription réussie.';
			case 'register.message.error': return 'Échec de l\'inscription. Veuillez réessayer.';
			case 'register.form.username': return 'Nom d\'utilisateur';
			case 'register.form.email': return 'E-mail';
			case 'register.form.password': return 'Mot de passe';
			case 'register.form.submit': return 'S\'inscrire';
			case 'register.form.acceptTos': return 'J\'accepte les Conditions de Service';
			case 'register.tooltip.username': return 'Entrez votre nom d\'utilisateur';
			case 'register.tooltip.email': return 'Entrez votre e-mail';
			case 'register.tooltip.password': return 'Entrez votre mot de passe';
			case 'register.tooltip.submit': return 'Cliquez pour vous inscrire';
			case 'register.validation.username.required': return 'Le nom d\'utilisateur est obligatoire.';
			case 'register.validation.username.minLength': return ({required Object min}) => 'Le nom d\'utilisateur doit contenir au moins ${min} caractères.';
			case 'register.validation.username.maxLength': return ({required Object max}) => 'Le nom d\'utilisateur doit contenir au maximum ${max} caractères.';
			case 'register.validation.email.required': return 'L\'e-mail est obligatoire.';
			case 'register.validation.email.invalid': return 'L\'e-mail n\'est pas valide.';
			case 'register.validation.password.required': return 'Le mot de passe est obligatoire.';
			case 'register.validation.password.minLength': return ({required Object min}) => 'Le mot de passe doit contenir au moins ${min} caractères.';
			case 'passwordReset.message.success': return 'E-mail de réinitialisation du mot de passe envoyé.';
			case 'passwordReset.message.error': return 'Échec de la réinitialisation du mot de passe. Veuillez réessayer.';
			case 'passwordReset.form.email': return 'E-mail';
			case 'passwordReset.form.submit': return 'Réinitialiser le Mot de Passe';
			case 'passwordReset.tooltip.email': return 'Entrez votre e-mail';
			case 'passwordReset.tooltip.submit': return 'Cliquez pour réinitialiser le mot de passe';
			case 'passwordReset.validation.email.required': return 'L\'e-mail est obligatoire.';
			case 'passwordReset.validation.email.invalid': return 'L\'e-mail n\'est pas valide.';
			default: return null;
		}
	}
}

