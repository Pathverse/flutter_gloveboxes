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
class TranslationsEs extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsCommonEs common = TranslationsCommonEs._(_root);
	@override late final TranslationsLoginEs login = TranslationsLoginEs._(_root);
	@override late final TranslationsRegisterEs register = TranslationsRegisterEs._(_root);
	@override late final TranslationsPasswordResetEs passwordReset = TranslationsPasswordResetEs._(_root);
	@override late final TranslationsLanguagesEs languages = TranslationsLanguagesEs._(_root);
}

// Path: common
class TranslationsCommonEs extends TranslationsCommonEn {
	TranslationsCommonEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonMessageEs message = TranslationsCommonMessageEs._(_root);
	@override late final TranslationsCommonGameEs game = TranslationsCommonGameEs._(_root);
	@override late final TranslationsCommonSocialEs social = TranslationsCommonSocialEs._(_root);
	@override late final TranslationsCommonViewsEs views = TranslationsCommonViewsEs._(_root);
	@override late final TranslationsCommonUnitsEs units = TranslationsCommonUnitsEs._(_root);
	@override late final TranslationsCommonNumbersEs numbers = TranslationsCommonNumbersEs._(_root);
	@override late final TranslationsCommonRanksEs ranks = TranslationsCommonRanksEs._(_root);
	@override late final TranslationsCommonControlEs control = TranslationsCommonControlEs._(_root);
	@override late final TranslationsCommonButtonsEs buttons = TranslationsCommonButtonsEs._(_root);
	@override late final TranslationsCommonLabelsEs labels = TranslationsCommonLabelsEs._(_root);
	@override late final TranslationsCommonResponseEs response = TranslationsCommonResponseEs._(_root);
	@override late final TranslationsCommonPriorityEs priority = TranslationsCommonPriorityEs._(_root);
	@override late final TranslationsCommonDateEs date = TranslationsCommonDateEs._(_root);
	@override late final TranslationsCommonWeekdaysEs weekdays = TranslationsCommonWeekdaysEs._(_root);
	@override late final TranslationsCommonFormRestrictionsEs formRestrictions = TranslationsCommonFormRestrictionsEs._(_root);
	@override late final TranslationsCommonTosEs tos = TranslationsCommonTosEs._(_root);
	@override late final TranslationsCommonPermissionsEs permissions = TranslationsCommonPermissionsEs._(_root);
	@override late final TranslationsCommonPromptsEs prompts = TranslationsCommonPromptsEs._(_root);
}

// Path: login
class TranslationsLoginEs extends TranslationsLoginEn {
	TranslationsLoginEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginMessageEs message = TranslationsLoginMessageEs._(_root);
	@override late final TranslationsLoginFormEs form = TranslationsLoginFormEs._(_root);
	@override late final TranslationsLoginTooltipEs tooltip = TranslationsLoginTooltipEs._(_root);
	@override late final TranslationsLoginValidationEs validation = TranslationsLoginValidationEs._(_root);
}

// Path: register
class TranslationsRegisterEs extends TranslationsRegisterEn {
	TranslationsRegisterEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterMessageEs message = TranslationsRegisterMessageEs._(_root);
	@override late final TranslationsRegisterFormEs form = TranslationsRegisterFormEs._(_root);
	@override late final TranslationsRegisterTooltipEs tooltip = TranslationsRegisterTooltipEs._(_root);
	@override late final TranslationsRegisterValidationEs validation = TranslationsRegisterValidationEs._(_root);
}

// Path: passwordReset
class TranslationsPasswordResetEs extends TranslationsPasswordResetEn {
	TranslationsPasswordResetEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetMessageEs message = TranslationsPasswordResetMessageEs._(_root);
	@override late final TranslationsPasswordResetFormEs form = TranslationsPasswordResetFormEs._(_root);
	@override late final TranslationsPasswordResetTooltipEs tooltip = TranslationsPasswordResetTooltipEs._(_root);
	@override late final TranslationsPasswordResetValidationEs validation = TranslationsPasswordResetValidationEs._(_root);
}

// Path: languages
class TranslationsLanguagesEs extends TranslationsLanguagesEn {
	TranslationsLanguagesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLanguagesCurrentEs current = TranslationsLanguagesCurrentEs._(_root);
}

// Path: common.message
class TranslationsCommonMessageEs extends TranslationsCommonMessageEn {
	TranslationsCommonMessageEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get loading => 'Cargando';
	@override String get somethingWentWrong => 'Algo salió mal';
	@override String get networkProblem => 'Hay un problema de red';
	@override String get noDataFound => 'No se encontraron datos';
	@override String get noResultsFound => 'No se encontraron resultados';
	@override String get unsupportedFileType => 'Tipo de archivo no compatible';
	@override String get fileTooLarge => 'El archivo es demasiado grande';
	@override String get operationTimedOut => 'La operación expiró';
	@override String get sessionExpired => 'La sesión expiró';
	@override String get unsavableChanges => 'No se pudieron guardar los cambios';
	@override String get noServerConnect => 'No se pudo conectar al servidor';
	@override String get accessDenied => 'Acceso denegado';
}

// Path: common.game
class TranslationsCommonGameEs extends TranslationsCommonGameEn {
	TranslationsCommonGameEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get start => 'Iniciar Juego';
	@override String get pause => 'Pausar Juego';
	@override String get resume => 'Reanudar Juego';
	@override String get end => 'Terminar Juego';
	@override String get levelUp => 'Subir de Nivel';
	@override String get gameOver => 'Juego Terminado';
	@override String get nextLevel => 'Siguiente Nivel';
	@override String get previousLevel => 'Nivel Anterior';
	@override String get restart => 'Reiniciar Juego';
}

// Path: common.social
class TranslationsCommonSocialEs extends TranslationsCommonSocialEn {
	TranslationsCommonSocialEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get like => 'Me gusta';
	@override String get share => 'Compartir';
	@override String get comment => 'Comentar';
	@override String get follow => 'Seguir';
	@override String get unfollow => 'Dejar de seguir';
	@override String get unlike => 'No me gusta';
	@override String get reply => 'Responder';
	@override String get dislike => 'No me gusta';
	@override String get block => 'Bloquear';
	@override String get blockUser => 'Bloquear Usuario';
	@override String get report => 'Reportar';
	@override String get mute => 'Silenciar';
	@override String get uSentFriendRequest => 'Enviaste una solicitud de amistad';
	@override String get uReceivedFriendRequest => 'Recibiste una solicitud de amistad';
	@override String get sentFriendRequest => 'envió una solicitud de amistad';
	@override String get receivedFriendRequest => 'recibió una solicitud de amistad';
	@override String get acceptedFriendRequest => 'aceptó una solicitud de amistad';
	@override String get uAcceptedFriendRequest => 'Aceptaste una solicitud de amistad';
}

// Path: common.views
class TranslationsCommonViewsEs extends TranslationsCommonViewsEn {
	TranslationsCommonViewsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get list => 'Lista';
	@override String get grid => 'Cuadrícula';
	@override String get table => 'Tabla';
	@override String get form => 'Formulario';
}

// Path: common.units
class TranslationsCommonUnitsEs extends TranslationsCommonUnitsEn {
	TranslationsCommonUnitsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonUnitsLengthEs length = TranslationsCommonUnitsLengthEs._(_root);
	@override late final TranslationsCommonUnitsWeightEs weight = TranslationsCommonUnitsWeightEs._(_root);
	@override late final TranslationsCommonUnitsVolumeEs volume = TranslationsCommonUnitsVolumeEs._(_root);
	@override late final TranslationsCommonUnitsTimeEs time = TranslationsCommonUnitsTimeEs._(_root);
	@override late final TranslationsCommonUnitsAreaEs area = TranslationsCommonUnitsAreaEs._(_root);
}

// Path: common.numbers
class TranslationsCommonNumbersEs extends TranslationsCommonNumbersEn {
	TranslationsCommonNumbersEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'Uno';
	@override String get k2 => 'Dos';
	@override String get k3 => 'Tres';
	@override String get k4 => 'Cuatro';
	@override String get k5 => 'Cinco';
	@override String get k6 => 'Seis';
	@override String get k7 => 'Siete';
	@override String get k8 => 'Ocho';
	@override String get k9 => 'Nueve';
	@override String get k10 => 'Diez';
}

// Path: common.ranks
class TranslationsCommonRanksEs extends TranslationsCommonRanksEn {
	TranslationsCommonRanksEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'primero';
	@override String get k2 => 'segundo';
	@override String get k3 => 'tercero';
	@override String get k4 => 'cuarto';
	@override String get k5 => 'quinto';
	@override String get k6 => 'sexto';
	@override String get k7 => 'séptimo';
	@override String get k8 => 'octavo';
	@override String get k9 => 'noveno';
	@override String get k10 => 'décimo';
}

// Path: common.control
class TranslationsCommonControlEs extends TranslationsCommonControlEn {
	TranslationsCommonControlEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get on => 'Encendido';
	@override String get off => 'Apagado';
	@override String get yes => 'Sí';
	@override String get no => 'No';
	@override String get confirm => 'Confirmar';
	@override String get cancel => 'Cancelar';
	@override String get retry => 'Reintentar';
	@override String get logout => 'Cerrar sesión';
	@override String get edit => 'Editar';
	@override String get delete => 'Eliminar';
	@override String get revert => 'Revertir';
	@override String get save => 'Guardar';
}

// Path: common.buttons
class TranslationsCommonButtonsEs extends TranslationsCommonButtonsEn {
	TranslationsCommonButtonsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get submit => 'Enviar';
	@override String get close => 'Cerrar';
	@override String get reset => 'Restablecer';
	@override String get cancel => 'Cancelar';
	@override String get kContinue => 'Continuar';
	@override String get back => 'Atrás';
	@override String get next => 'Siguiente';
	@override String get done => 'Hecho';
	@override String get upload => 'Subir';
	@override String get choose => 'Elegir';
	@override String get select => 'Seleccionar';
	@override String get clear => 'Limpiar';
	@override String get start => 'Iniciar';
}

// Path: common.labels
class TranslationsCommonLabelsEs extends TranslationsCommonLabelsEn {
	TranslationsCommonLabelsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get required => 'Requerido';
	@override String get optional => 'Opcional';
	@override String get instructions => 'Instrucciones:';
	@override String get status => 'Estado';
	@override String get progress => 'Progreso';
	@override String get question => 'Pregunta';
	@override String get answer => 'Respuesta';
	@override String get response => 'Respuesta';
	@override String get loading => 'Cargando...';
	@override String get error => 'Error';
	@override String get success => 'Éxito';
	@override String get warning => 'Advertencia';
}

// Path: common.response
class TranslationsCommonResponseEs extends TranslationsCommonResponseEn {
	TranslationsCommonResponseEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get success => 'Éxito';
	@override String get error => 'Error';
	@override String get info => 'Información';
	@override String get warning => 'Advertencia';
	@override String get tbd => 'Por Determinar';
	@override String get wip => 'Trabajo en Progreso';
}

// Path: common.priority
class TranslationsCommonPriorityEs extends TranslationsCommonPriorityEn {
	TranslationsCommonPriorityEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get high => 'Alta';
	@override String get medium => 'Media';
	@override String get low => 'Baja';
}

// Path: common.date
class TranslationsCommonDateEs extends TranslationsCommonDateEn {
	TranslationsCommonDateEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get today => 'Hoy';
	@override String get yesterday => 'Ayer';
	@override String get tomorrow => 'Mañana';
	@override String get justNow => 'Justo ahora';
	@override String get aMomentAgo => 'Hace un momento';
	@override String get minutesAgo => 'Hace minutos';
	@override String get hoursAgo => 'Hace horas';
	@override String daysAgo({required Object days}) => 'Hace ${days} días';
	@override String get weeksAgo => 'Hace semanas';
	@override String get thisWeek => 'Esta semana';
	@override String get lastWeek => 'La semana pasada';
	@override String get thisMonth => 'Este mes';
	@override String get lastMonth => 'El mes pasado';
	@override String get thisYear => 'Este año';
	@override String get lastYear => 'El año pasado';
	@override String daysAhead({required Object days}) => 'En ${days} días';
}

// Path: common.weekdays
class TranslationsCommonWeekdaysEs extends TranslationsCommonWeekdaysEn {
	TranslationsCommonWeekdaysEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsCommonWeekdaysFullEs full = TranslationsCommonWeekdaysFullEs._(_root);
	@override late final TranslationsCommonWeekdaysShortEs short = TranslationsCommonWeekdaysShortEs._(_root);
}

// Path: common.formRestrictions
class TranslationsCommonFormRestrictionsEs extends TranslationsCommonFormRestrictionsEn {
	TranslationsCommonFormRestrictionsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get required => 'Este campo es obligatorio.';
	@override String minLength({required Object min}) => 'La longitud mínima es ${min} caracteres.';
	@override String maxLength({required Object max}) => 'La longitud máxima es ${max} caracteres.';
	@override String get invalidFormat => 'El formato es inválido.';
	@override String pattern({required Object pattern}) => 'Este campo debe seguir el patrón ${pattern}.';
}

// Path: common.tos
class TranslationsCommonTosEs extends TranslationsCommonTosEn {
	TranslationsCommonTosEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get accept => 'Acepto los Términos y Condiciones';
	@override String get readAccept => 'Por favor lee y acepta nuestros Términos y Condiciones';
	@override String get title => 'Términos y Condiciones';
	@override String get service => 'Términos de Servicio';
	@override String get privacy => 'Política de Privacidad';
	@override String get continueAgree => 'Al continuar, aceptas nuestros Términos y Condiciones';
	@override String get mustAccept => 'Debes aceptar los Términos y Condiciones para continuar';
	@override String get view => 'Ver Términos y Condiciones';
	@override String lastUpdated({required Object date}) => 'Última actualización: ${date}';
	@override String get contactInfo => 'Contáctanos para más información sobre nuestros Términos y Condiciones';
}

// Path: common.permissions
class TranslationsCommonPermissionsEs extends TranslationsCommonPermissionsEn {
	TranslationsCommonPermissionsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get allowLocation => '¿Permitir acceso a la ubicación?';
	@override String get allowCamera => '¿Permitir acceso a la cámara?';
	@override String get allowMicrophone => '¿Permitir acceso al micrófono?';
	@override String get allowNotifications => '¿Permitir notificaciones?';
	@override String get allowContacts => '¿Permitir acceso a los contactos?';
	@override String get allowPhotos => '¿Permitir acceso a las fotos?';
	@override String get allowStorage => '¿Permitir acceso al almacenamiento?';
	@override String get allowBluetooth => '¿Permitir acceso Bluetooth?';
	@override String get needPermission => 'Necesitamos tu permiso para continuar';
	@override String get permissionDenied => 'Permiso denegado';
	@override String get permissionRequired => 'Este permiso es requerido';
	@override String get enableInSettings => 'Por favor habilita en Configuración';
}

// Path: common.prompts
class TranslationsCommonPromptsEs extends TranslationsCommonPromptsEn {
	TranslationsCommonPromptsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get sessionExpired => 'Tu sesión ha expirado';
	@override String get areYouSure => '¿Estás seguro?';
	@override String get cannotBeUndone => 'Esta acción no se puede deshacer';
	@override String get unsavedChanges => 'Tienes cambios sin guardar';
	@override String get discardChanges => '¿Descartar cambios?';
	@override String get locationDisabled => 'Los servicios de ubicación están deshabilitados';
	@override String get networkRequired => 'Se requiere conexión de red';
	@override String get loginRequired => 'Se requiere iniciar sesión para continuar';
	@override String get confirmDelete => '¿Estás seguro de que quieres eliminar esto?';
	@override String get confirmLogout => '¿Estás seguro de que quieres cerrar sesión?';
	@override String get saveBeforeExit => '¿Quieres guardar antes de salir?';
	@override String get reloadPage => '¿Te gustaría recargar la página?';
	@override String get updateAvailable => 'Hay una actualización disponible';
	@override String get restartRequired => 'Se requiere reiniciar para aplicar los cambios';
}

// Path: login.message
class TranslationsLoginMessageEs extends TranslationsLoginMessageEn {
	TranslationsLoginMessageEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get success => 'Inicio de sesión exitoso.';
	@override String get error => 'Error al iniciar sesión. Por favor intenta de nuevo.';
	@override String get wrongPassword => 'Por favor verifica tus credenciales.';
}

// Path: login.form
class TranslationsLoginFormEs extends TranslationsLoginFormEn {
	TranslationsLoginFormEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get username => 'Usuario';
	@override String get password => 'Contraseña';
	@override String get submit => 'Iniciar Sesión';
	@override String get createAccount => 'Crear nueva cuenta';
	@override String get forgotPassword => '¿Olvidaste tu contraseña?';
}

// Path: login.tooltip
class TranslationsLoginTooltipEs extends TranslationsLoginTooltipEn {
	TranslationsLoginTooltipEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get username => 'Ingresa tu usuario';
	@override String get password => 'Ingresa tu contraseña';
	@override String get submit => 'Haz clic para iniciar sesión';
}

// Path: login.validation
class TranslationsLoginValidationEs extends TranslationsLoginValidationEn {
	TranslationsLoginValidationEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsLoginValidationUsernameEs username = TranslationsLoginValidationUsernameEs._(_root);
	@override late final TranslationsLoginValidationPasswordEs password = TranslationsLoginValidationPasswordEs._(_root);
}

// Path: register.message
class TranslationsRegisterMessageEs extends TranslationsRegisterMessageEn {
	TranslationsRegisterMessageEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get success => 'Registro exitoso.';
	@override String get error => 'Error en el registro. Por favor intenta de nuevo.';
}

// Path: register.form
class TranslationsRegisterFormEs extends TranslationsRegisterFormEn {
	TranslationsRegisterFormEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get username => 'Usuario';
	@override String get email => 'Correo electrónico';
	@override String get password => 'Contraseña';
	@override String get submit => 'Registrarse';
	@override String get acceptTos => 'Acepto los Términos de Servicio';
}

// Path: register.tooltip
class TranslationsRegisterTooltipEs extends TranslationsRegisterTooltipEn {
	TranslationsRegisterTooltipEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get username => 'Ingresa tu usuario';
	@override String get email => 'Ingresa tu correo electrónico';
	@override String get password => 'Ingresa tu contraseña';
	@override String get submit => 'Haz clic para registrarte';
}

// Path: register.validation
class TranslationsRegisterValidationEs extends TranslationsRegisterValidationEn {
	TranslationsRegisterValidationEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsRegisterValidationUsernameEs username = TranslationsRegisterValidationUsernameEs._(_root);
	@override late final TranslationsRegisterValidationEmailEs email = TranslationsRegisterValidationEmailEs._(_root);
	@override late final TranslationsRegisterValidationPasswordEs password = TranslationsRegisterValidationPasswordEs._(_root);
}

// Path: passwordReset.message
class TranslationsPasswordResetMessageEs extends TranslationsPasswordResetMessageEn {
	TranslationsPasswordResetMessageEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get success => 'Correo de restablecimiento de contraseña enviado.';
	@override String get error => 'Error al restablecer contraseña. Por favor intenta de nuevo.';
}

// Path: passwordReset.form
class TranslationsPasswordResetFormEs extends TranslationsPasswordResetFormEn {
	TranslationsPasswordResetFormEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get email => 'Correo electrónico';
	@override String get submit => 'Restablecer Contraseña';
}

// Path: passwordReset.tooltip
class TranslationsPasswordResetTooltipEs extends TranslationsPasswordResetTooltipEn {
	TranslationsPasswordResetTooltipEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get email => 'Ingresa tu correo electrónico';
	@override String get submit => 'Haz clic para restablecer contraseña';
}

// Path: passwordReset.validation
class TranslationsPasswordResetValidationEs extends TranslationsPasswordResetValidationEn {
	TranslationsPasswordResetValidationEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final TranslationsPasswordResetValidationEmailEs email = TranslationsPasswordResetValidationEmailEs._(_root);
}

// Path: languages.current
class TranslationsLanguagesCurrentEs extends TranslationsLanguagesCurrentEn {
	TranslationsLanguagesCurrentEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get en => 'Inglés';
	@override String get da => 'Danés';
	@override String get es => 'Español';
	@override String get fr => 'Francés';
	@override String get he => 'Hebreo';
	@override String get isIS => 'Islandés';
	@override String get ko => 'Coreano';
	@override String get nb => 'Noruego (Bokmål)';
	@override String get nl => 'Holandés';
	@override String get no => 'Noruego';
	@override String get sv => 'Sueco';
	@override String get zhHans => 'Chino (Simplificado)';
	@override String get zh => 'Chino (Tradicional)';
}

// Path: common.units.length
class TranslationsCommonUnitsLengthEs extends TranslationsCommonUnitsLengthEn {
	TranslationsCommonUnitsLengthEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get kilometer => 'Kilómetro';
	@override String get meter => 'Metro';
	@override String get centimeter => 'Centímetro';
	@override String get millimeter => 'Milímetro';
	@override String get micrometer => 'Micrómetro';
	@override String get nanometer => 'Nanómetro';
}

// Path: common.units.weight
class TranslationsCommonUnitsWeightEs extends TranslationsCommonUnitsWeightEn {
	TranslationsCommonUnitsWeightEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get kilogram => 'Kilogramo';
	@override String get gram => 'Gramo';
	@override String get milligram => 'Miligramo';
	@override String get ton => 'Tonelada';
}

// Path: common.units.volume
class TranslationsCommonUnitsVolumeEs extends TranslationsCommonUnitsVolumeEn {
	TranslationsCommonUnitsVolumeEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get liter => 'Litro';
	@override String get milliliter => 'Mililitro';
	@override String get cubicMeter => 'Metro Cúbico';
}

// Path: common.units.time
class TranslationsCommonUnitsTimeEs extends TranslationsCommonUnitsTimeEn {
	TranslationsCommonUnitsTimeEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get second => 'Segundo';
	@override String get minute => 'Minuto';
	@override String get hour => 'Hora';
	@override String get day => 'Día';
	@override String get week => 'Semana';
	@override String get month => 'Mes';
	@override String get year => 'Año';
}

// Path: common.units.area
class TranslationsCommonUnitsAreaEs extends TranslationsCommonUnitsAreaEn {
	TranslationsCommonUnitsAreaEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get squareMeter => 'Metro Cuadrado';
	@override String get hectare => 'Hectárea';
	@override String get acre => 'Acre';
}

// Path: common.weekdays.full
class TranslationsCommonWeekdaysFullEs extends TranslationsCommonWeekdaysFullEn {
	TranslationsCommonWeekdaysFullEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get sunday => 'Domingo';
	@override String get monday => 'Lunes';
	@override String get tuesday => 'Martes';
	@override String get wednesday => 'Miércoles';
	@override String get thursday => 'Jueves';
	@override String get friday => 'Viernes';
	@override String get saturday => 'Sábado';
}

// Path: common.weekdays.short
class TranslationsCommonWeekdaysShortEs extends TranslationsCommonWeekdaysShortEn {
	TranslationsCommonWeekdaysShortEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get sunday => 'Dom';
	@override String get monday => 'Lun';
	@override String get tuesday => 'Mar';
	@override String get wednesday => 'Mié';
	@override String get thursday => 'Jue';
	@override String get friday => 'Vie';
	@override String get saturday => 'Sáb';
}

// Path: login.validation.username
class TranslationsLoginValidationUsernameEs extends TranslationsLoginValidationUsernameEn {
	TranslationsLoginValidationUsernameEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get required => 'El usuario es obligatorio.';
}

// Path: login.validation.password
class TranslationsLoginValidationPasswordEs extends TranslationsLoginValidationPasswordEn {
	TranslationsLoginValidationPasswordEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get required => 'La contraseña es obligatoria.';
}

// Path: register.validation.username
class TranslationsRegisterValidationUsernameEs extends TranslationsRegisterValidationUsernameEn {
	TranslationsRegisterValidationUsernameEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get required => 'El usuario es obligatorio.';
	@override String minLength({required Object min}) => 'El usuario debe tener al menos ${min} caracteres.';
	@override String maxLength({required Object max}) => 'El usuario debe tener como máximo ${max} caracteres.';
}

// Path: register.validation.email
class TranslationsRegisterValidationEmailEs extends TranslationsRegisterValidationEmailEn {
	TranslationsRegisterValidationEmailEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get required => 'El correo electrónico es obligatorio.';
	@override String get invalid => 'El correo electrónico no es válido.';
}

// Path: register.validation.password
class TranslationsRegisterValidationPasswordEs extends TranslationsRegisterValidationPasswordEn {
	TranslationsRegisterValidationPasswordEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get required => 'La contraseña es obligatoria.';
	@override String minLength({required Object min}) => 'La contraseña debe tener al menos ${min} caracteres.';
}

// Path: passwordReset.validation.email
class TranslationsPasswordResetValidationEmailEs extends TranslationsPasswordResetValidationEmailEn {
	TranslationsPasswordResetValidationEmailEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get required => 'El correo electrónico es obligatorio.';
	@override String get invalid => 'El correo electrónico no es válido.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'common.message.loading': return 'Cargando';
			case 'common.message.somethingWentWrong': return 'Algo salió mal';
			case 'common.message.networkProblem': return 'Hay un problema de red';
			case 'common.message.noDataFound': return 'No se encontraron datos';
			case 'common.message.noResultsFound': return 'No se encontraron resultados';
			case 'common.message.unsupportedFileType': return 'Tipo de archivo no compatible';
			case 'common.message.fileTooLarge': return 'El archivo es demasiado grande';
			case 'common.message.operationTimedOut': return 'La operación expiró';
			case 'common.message.sessionExpired': return 'La sesión expiró';
			case 'common.message.unsavableChanges': return 'No se pudieron guardar los cambios';
			case 'common.message.noServerConnect': return 'No se pudo conectar al servidor';
			case 'common.message.accessDenied': return 'Acceso denegado';
			case 'common.game.start': return 'Iniciar Juego';
			case 'common.game.pause': return 'Pausar Juego';
			case 'common.game.resume': return 'Reanudar Juego';
			case 'common.game.end': return 'Terminar Juego';
			case 'common.game.levelUp': return 'Subir de Nivel';
			case 'common.game.gameOver': return 'Juego Terminado';
			case 'common.game.nextLevel': return 'Siguiente Nivel';
			case 'common.game.previousLevel': return 'Nivel Anterior';
			case 'common.game.restart': return 'Reiniciar Juego';
			case 'common.social.like': return 'Me gusta';
			case 'common.social.share': return 'Compartir';
			case 'common.social.comment': return 'Comentar';
			case 'common.social.follow': return 'Seguir';
			case 'common.social.unfollow': return 'Dejar de seguir';
			case 'common.social.unlike': return 'No me gusta';
			case 'common.social.reply': return 'Responder';
			case 'common.social.dislike': return 'No me gusta';
			case 'common.social.block': return 'Bloquear';
			case 'common.social.blockUser': return 'Bloquear Usuario';
			case 'common.social.report': return 'Reportar';
			case 'common.social.mute': return 'Silenciar';
			case 'common.social.uSentFriendRequest': return 'Enviaste una solicitud de amistad';
			case 'common.social.uReceivedFriendRequest': return 'Recibiste una solicitud de amistad';
			case 'common.social.sentFriendRequest': return 'envió una solicitud de amistad';
			case 'common.social.receivedFriendRequest': return 'recibió una solicitud de amistad';
			case 'common.social.acceptedFriendRequest': return 'aceptó una solicitud de amistad';
			case 'common.social.uAcceptedFriendRequest': return 'Aceptaste una solicitud de amistad';
			case 'common.views.list': return 'Lista';
			case 'common.views.grid': return 'Cuadrícula';
			case 'common.views.table': return 'Tabla';
			case 'common.views.form': return 'Formulario';
			case 'common.units.length.kilometer': return 'Kilómetro';
			case 'common.units.length.meter': return 'Metro';
			case 'common.units.length.centimeter': return 'Centímetro';
			case 'common.units.length.millimeter': return 'Milímetro';
			case 'common.units.length.micrometer': return 'Micrómetro';
			case 'common.units.length.nanometer': return 'Nanómetro';
			case 'common.units.weight.kilogram': return 'Kilogramo';
			case 'common.units.weight.gram': return 'Gramo';
			case 'common.units.weight.milligram': return 'Miligramo';
			case 'common.units.weight.ton': return 'Tonelada';
			case 'common.units.volume.liter': return 'Litro';
			case 'common.units.volume.milliliter': return 'Mililitro';
			case 'common.units.volume.cubicMeter': return 'Metro Cúbico';
			case 'common.units.time.second': return 'Segundo';
			case 'common.units.time.minute': return 'Minuto';
			case 'common.units.time.hour': return 'Hora';
			case 'common.units.time.day': return 'Día';
			case 'common.units.time.week': return 'Semana';
			case 'common.units.time.month': return 'Mes';
			case 'common.units.time.year': return 'Año';
			case 'common.units.area.squareMeter': return 'Metro Cuadrado';
			case 'common.units.area.hectare': return 'Hectárea';
			case 'common.units.area.acre': return 'Acre';
			case 'common.numbers.k1': return 'Uno';
			case 'common.numbers.k2': return 'Dos';
			case 'common.numbers.k3': return 'Tres';
			case 'common.numbers.k4': return 'Cuatro';
			case 'common.numbers.k5': return 'Cinco';
			case 'common.numbers.k6': return 'Seis';
			case 'common.numbers.k7': return 'Siete';
			case 'common.numbers.k8': return 'Ocho';
			case 'common.numbers.k9': return 'Nueve';
			case 'common.numbers.k10': return 'Diez';
			case 'common.ranks.k1': return 'primero';
			case 'common.ranks.k2': return 'segundo';
			case 'common.ranks.k3': return 'tercero';
			case 'common.ranks.k4': return 'cuarto';
			case 'common.ranks.k5': return 'quinto';
			case 'common.ranks.k6': return 'sexto';
			case 'common.ranks.k7': return 'séptimo';
			case 'common.ranks.k8': return 'octavo';
			case 'common.ranks.k9': return 'noveno';
			case 'common.ranks.k10': return 'décimo';
			case 'common.control.on': return 'Encendido';
			case 'common.control.off': return 'Apagado';
			case 'common.control.yes': return 'Sí';
			case 'common.control.no': return 'No';
			case 'common.control.confirm': return 'Confirmar';
			case 'common.control.cancel': return 'Cancelar';
			case 'common.control.retry': return 'Reintentar';
			case 'common.control.logout': return 'Cerrar sesión';
			case 'common.control.edit': return 'Editar';
			case 'common.control.delete': return 'Eliminar';
			case 'common.control.revert': return 'Revertir';
			case 'common.control.save': return 'Guardar';
			case 'common.buttons.submit': return 'Enviar';
			case 'common.buttons.close': return 'Cerrar';
			case 'common.buttons.reset': return 'Restablecer';
			case 'common.buttons.cancel': return 'Cancelar';
			case 'common.buttons.kContinue': return 'Continuar';
			case 'common.buttons.back': return 'Atrás';
			case 'common.buttons.next': return 'Siguiente';
			case 'common.buttons.done': return 'Hecho';
			case 'common.buttons.upload': return 'Subir';
			case 'common.buttons.choose': return 'Elegir';
			case 'common.buttons.select': return 'Seleccionar';
			case 'common.buttons.clear': return 'Limpiar';
			case 'common.buttons.start': return 'Iniciar';
			case 'common.labels.required': return 'Requerido';
			case 'common.labels.optional': return 'Opcional';
			case 'common.labels.instructions': return 'Instrucciones:';
			case 'common.labels.status': return 'Estado';
			case 'common.labels.progress': return 'Progreso';
			case 'common.labels.question': return 'Pregunta';
			case 'common.labels.answer': return 'Respuesta';
			case 'common.labels.response': return 'Respuesta';
			case 'common.labels.loading': return 'Cargando...';
			case 'common.labels.error': return 'Error';
			case 'common.labels.success': return 'Éxito';
			case 'common.labels.warning': return 'Advertencia';
			case 'common.response.success': return 'Éxito';
			case 'common.response.error': return 'Error';
			case 'common.response.info': return 'Información';
			case 'common.response.warning': return 'Advertencia';
			case 'common.response.tbd': return 'Por Determinar';
			case 'common.response.wip': return 'Trabajo en Progreso';
			case 'common.priority.high': return 'Alta';
			case 'common.priority.medium': return 'Media';
			case 'common.priority.low': return 'Baja';
			case 'common.date.today': return 'Hoy';
			case 'common.date.yesterday': return 'Ayer';
			case 'common.date.tomorrow': return 'Mañana';
			case 'common.date.justNow': return 'Justo ahora';
			case 'common.date.aMomentAgo': return 'Hace un momento';
			case 'common.date.minutesAgo': return 'Hace minutos';
			case 'common.date.hoursAgo': return 'Hace horas';
			case 'common.date.daysAgo': return ({required Object days}) => 'Hace ${days} días';
			case 'common.date.weeksAgo': return 'Hace semanas';
			case 'common.date.thisWeek': return 'Esta semana';
			case 'common.date.lastWeek': return 'La semana pasada';
			case 'common.date.thisMonth': return 'Este mes';
			case 'common.date.lastMonth': return 'El mes pasado';
			case 'common.date.thisYear': return 'Este año';
			case 'common.date.lastYear': return 'El año pasado';
			case 'common.date.daysAhead': return ({required Object days}) => 'En ${days} días';
			case 'common.weekdays.full.sunday': return 'Domingo';
			case 'common.weekdays.full.monday': return 'Lunes';
			case 'common.weekdays.full.tuesday': return 'Martes';
			case 'common.weekdays.full.wednesday': return 'Miércoles';
			case 'common.weekdays.full.thursday': return 'Jueves';
			case 'common.weekdays.full.friday': return 'Viernes';
			case 'common.weekdays.full.saturday': return 'Sábado';
			case 'common.weekdays.short.sunday': return 'Dom';
			case 'common.weekdays.short.monday': return 'Lun';
			case 'common.weekdays.short.tuesday': return 'Mar';
			case 'common.weekdays.short.wednesday': return 'Mié';
			case 'common.weekdays.short.thursday': return 'Jue';
			case 'common.weekdays.short.friday': return 'Vie';
			case 'common.weekdays.short.saturday': return 'Sáb';
			case 'common.formRestrictions.required': return 'Este campo es obligatorio.';
			case 'common.formRestrictions.minLength': return ({required Object min}) => 'La longitud mínima es ${min} caracteres.';
			case 'common.formRestrictions.maxLength': return ({required Object max}) => 'La longitud máxima es ${max} caracteres.';
			case 'common.formRestrictions.invalidFormat': return 'El formato es inválido.';
			case 'common.formRestrictions.pattern': return ({required Object pattern}) => 'Este campo debe seguir el patrón ${pattern}.';
			case 'common.tos.accept': return 'Acepto los Términos y Condiciones';
			case 'common.tos.readAccept': return 'Por favor lee y acepta nuestros Términos y Condiciones';
			case 'common.tos.title': return 'Términos y Condiciones';
			case 'common.tos.service': return 'Términos de Servicio';
			case 'common.tos.privacy': return 'Política de Privacidad';
			case 'common.tos.continueAgree': return 'Al continuar, aceptas nuestros Términos y Condiciones';
			case 'common.tos.mustAccept': return 'Debes aceptar los Términos y Condiciones para continuar';
			case 'common.tos.view': return 'Ver Términos y Condiciones';
			case 'common.tos.lastUpdated': return ({required Object date}) => 'Última actualización: ${date}';
			case 'common.tos.contactInfo': return 'Contáctanos para más información sobre nuestros Términos y Condiciones';
			case 'common.permissions.allowLocation': return '¿Permitir acceso a la ubicación?';
			case 'common.permissions.allowCamera': return '¿Permitir acceso a la cámara?';
			case 'common.permissions.allowMicrophone': return '¿Permitir acceso al micrófono?';
			case 'common.permissions.allowNotifications': return '¿Permitir notificaciones?';
			case 'common.permissions.allowContacts': return '¿Permitir acceso a los contactos?';
			case 'common.permissions.allowPhotos': return '¿Permitir acceso a las fotos?';
			case 'common.permissions.allowStorage': return '¿Permitir acceso al almacenamiento?';
			case 'common.permissions.allowBluetooth': return '¿Permitir acceso Bluetooth?';
			case 'common.permissions.needPermission': return 'Necesitamos tu permiso para continuar';
			case 'common.permissions.permissionDenied': return 'Permiso denegado';
			case 'common.permissions.permissionRequired': return 'Este permiso es requerido';
			case 'common.permissions.enableInSettings': return 'Por favor habilita en Configuración';
			case 'common.prompts.sessionExpired': return 'Tu sesión ha expirado';
			case 'common.prompts.areYouSure': return '¿Estás seguro?';
			case 'common.prompts.cannotBeUndone': return 'Esta acción no se puede deshacer';
			case 'common.prompts.unsavedChanges': return 'Tienes cambios sin guardar';
			case 'common.prompts.discardChanges': return '¿Descartar cambios?';
			case 'common.prompts.locationDisabled': return 'Los servicios de ubicación están deshabilitados';
			case 'common.prompts.networkRequired': return 'Se requiere conexión de red';
			case 'common.prompts.loginRequired': return 'Se requiere iniciar sesión para continuar';
			case 'common.prompts.confirmDelete': return '¿Estás seguro de que quieres eliminar esto?';
			case 'common.prompts.confirmLogout': return '¿Estás seguro de que quieres cerrar sesión?';
			case 'common.prompts.saveBeforeExit': return '¿Quieres guardar antes de salir?';
			case 'common.prompts.reloadPage': return '¿Te gustaría recargar la página?';
			case 'common.prompts.updateAvailable': return 'Hay una actualización disponible';
			case 'common.prompts.restartRequired': return 'Se requiere reiniciar para aplicar los cambios';
			case 'login.message.success': return 'Inicio de sesión exitoso.';
			case 'login.message.error': return 'Error al iniciar sesión. Por favor intenta de nuevo.';
			case 'login.message.wrongPassword': return 'Por favor verifica tus credenciales.';
			case 'login.form.username': return 'Usuario';
			case 'login.form.password': return 'Contraseña';
			case 'login.form.submit': return 'Iniciar Sesión';
			case 'login.form.createAccount': return 'Crear nueva cuenta';
			case 'login.form.forgotPassword': return '¿Olvidaste tu contraseña?';
			case 'login.tooltip.username': return 'Ingresa tu usuario';
			case 'login.tooltip.password': return 'Ingresa tu contraseña';
			case 'login.tooltip.submit': return 'Haz clic para iniciar sesión';
			case 'login.validation.username.required': return 'El usuario es obligatorio.';
			case 'login.validation.password.required': return 'La contraseña es obligatoria.';
			case 'register.message.success': return 'Registro exitoso.';
			case 'register.message.error': return 'Error en el registro. Por favor intenta de nuevo.';
			case 'register.form.username': return 'Usuario';
			case 'register.form.email': return 'Correo electrónico';
			case 'register.form.password': return 'Contraseña';
			case 'register.form.submit': return 'Registrarse';
			case 'register.form.acceptTos': return 'Acepto los Términos de Servicio';
			case 'register.tooltip.username': return 'Ingresa tu usuario';
			case 'register.tooltip.email': return 'Ingresa tu correo electrónico';
			case 'register.tooltip.password': return 'Ingresa tu contraseña';
			case 'register.tooltip.submit': return 'Haz clic para registrarte';
			case 'register.validation.username.required': return 'El usuario es obligatorio.';
			case 'register.validation.username.minLength': return ({required Object min}) => 'El usuario debe tener al menos ${min} caracteres.';
			case 'register.validation.username.maxLength': return ({required Object max}) => 'El usuario debe tener como máximo ${max} caracteres.';
			case 'register.validation.email.required': return 'El correo electrónico es obligatorio.';
			case 'register.validation.email.invalid': return 'El correo electrónico no es válido.';
			case 'register.validation.password.required': return 'La contraseña es obligatoria.';
			case 'register.validation.password.minLength': return ({required Object min}) => 'La contraseña debe tener al menos ${min} caracteres.';
			case 'passwordReset.message.success': return 'Correo de restablecimiento de contraseña enviado.';
			case 'passwordReset.message.error': return 'Error al restablecer contraseña. Por favor intenta de nuevo.';
			case 'passwordReset.form.email': return 'Correo electrónico';
			case 'passwordReset.form.submit': return 'Restablecer Contraseña';
			case 'passwordReset.tooltip.email': return 'Ingresa tu correo electrónico';
			case 'passwordReset.tooltip.submit': return 'Haz clic para restablecer contraseña';
			case 'passwordReset.validation.email.required': return 'El correo electrónico es obligatorio.';
			case 'passwordReset.validation.email.invalid': return 'El correo electrónico no es válido.';
			case 'languages.current.en': return 'Inglés';
			case 'languages.current.da': return 'Danés';
			case 'languages.current.es': return 'Español';
			case 'languages.current.fr': return 'Francés';
			case 'languages.current.he': return 'Hebreo';
			case 'languages.current.isIS': return 'Islandés';
			case 'languages.current.ko': return 'Coreano';
			case 'languages.current.nb': return 'Noruego (Bokmål)';
			case 'languages.current.nl': return 'Holandés';
			case 'languages.current.no': return 'Noruego';
			case 'languages.current.sv': return 'Sueco';
			case 'languages.current.zhHans': return 'Chino (Simplificado)';
			case 'languages.current.zh': return 'Chino (Tradicional)';
			default: return null;
		}
	}
}

