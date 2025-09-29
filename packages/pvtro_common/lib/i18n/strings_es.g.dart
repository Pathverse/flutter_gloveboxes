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
	@override late final TranslationsNumbersEs numbers = TranslationsNumbersEs._(_root);
	@override late final TranslationsRanksEs ranks = TranslationsRanksEs._(_root);
	@override late final TranslationsPriorityEs priority = TranslationsPriorityEs._(_root);
	@override late final TranslationsTimeEs time = TranslationsTimeEs._(_root);
	@override late final TranslationsTimeRelativeEs timeRelative = TranslationsTimeRelativeEs._(_root);
	@override late final TranslationsDayEs day = TranslationsDayEs._(_root);
	@override late final TranslationsDayTypeEs dayType = TranslationsDayTypeEs._(_root);
	@override late final TranslationsDayRelativeEs dayRelative = TranslationsDayRelativeEs._(_root);
	@override late final TranslationsLanguageEs language = TranslationsLanguageEs._(_root);
	@override late final TranslationsLanguageShortEs languageShort = TranslationsLanguageShortEs._(_root);
	@override late final TranslationsButtonsEs buttons = TranslationsButtonsEs._(_root);
	@override late final TranslationsLabelsEs labels = TranslationsLabelsEs._(_root);
	@override late final TranslationsResponseEs response = TranslationsResponseEs._(_root);
	@override late final TranslationsCommonWebFeaturesEs commonWebFeatures = TranslationsCommonWebFeaturesEs._(_root);
}

// Path: numbers
class TranslationsNumbersEs extends TranslationsNumbersEn {
	TranslationsNumbersEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get k1 => 'uno';
	@override String get k2 => 'dos';
	@override String get k3 => 'tres';
	@override String get k4 => 'cuatro';
	@override String get k5 => 'cinco';
	@override String get k6 => 'seis';
	@override String get k7 => 'siete';
	@override String get k8 => 'ocho';
	@override String get k9 => 'nueve';
	@override String get k10 => 'diez';
}

// Path: ranks
class TranslationsRanksEs extends TranslationsRanksEn {
	TranslationsRanksEs._(TranslationsEs root) : this._root = root, super.internal(root);

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

// Path: priority
class TranslationsPriorityEs extends TranslationsPriorityEn {
	TranslationsPriorityEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get low => 'Baja';
	@override String get medium => 'Media';
	@override String get high => 'Alta';
}

// Path: time
class TranslationsTimeEs extends TranslationsTimeEn {
	TranslationsTimeEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get seconds => 'segundos';
	@override String get minutes => 'minutos';
	@override String get hours => 'horas';
	@override String get days => 'días';
	@override String get weeks => 'semanas';
	@override String get months => 'meses';
	@override String get years => 'años';
	@override String get second => 'segundo';
	@override String get minute => 'minuto';
	@override String get hour => 'hora';
	@override String get day => 'día';
	@override String get week => 'semana';
	@override String get month => 'mes';
	@override String get year => 'año';
}

// Path: timeRelative
class TranslationsTimeRelativeEs extends TranslationsTimeRelativeEn {
	TranslationsTimeRelativeEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get now => 'ahora';
	@override String get later => 'después';
	@override String get soon => 'pronto';
	@override String get inAMoment => 'en un momento';
	@override String get justBefore => 'justo antes';
	@override String get before => 'antes';
	@override String get after => 'después';
}

// Path: day
class TranslationsDayEs extends TranslationsDayEn {
	TranslationsDayEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get monday => 'Lunes';
	@override String get tuesday => 'Martes';
	@override String get wednesday => 'Miércoles';
	@override String get thursday => 'Jueves';
	@override String get friday => 'Viernes';
	@override String get saturday => 'Sábado';
	@override String get sunday => 'Domingo';
}

// Path: dayType
class TranslationsDayTypeEs extends TranslationsDayTypeEn {
	TranslationsDayTypeEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get weekday => 'día laborable';
	@override String get weekend => 'fin de semana';
	@override String get everyday => 'todos los días';
}

// Path: dayRelative
class TranslationsDayRelativeEs extends TranslationsDayRelativeEn {
	TranslationsDayRelativeEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get today => 'hoy';
	@override String get tomorrow => 'mañana';
	@override String get yesterday => 'ayer';
	@override String get dayAfterTomorrow => 'pasado mañana';
	@override String get dayBeforeYesterday => 'anteayer';
}

// Path: language
class TranslationsLanguageEs extends TranslationsLanguageEn {
	TranslationsLanguageEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get en => 'Inglés';
	@override String get da => 'Danés';
	@override String get es => 'Español';
	@override String get fr => 'Francés';
	@override String get he => 'Hebreo';
	@override String get isIS => 'Islandés (Islandia)';
	@override String get ko => 'Coreano';
	@override String get nb => 'Noruego Bokmål';
	@override String get nl => 'Holandés (Flamenco)';
	@override String get no => 'Noruego';
	@override String get sv => 'Sueco';
	@override String get zhHans => 'Chino (Simplificado)';
	@override String get zh => 'Chino (Tradicional)';
}

// Path: languageShort
class TranslationsLanguageShortEs extends TranslationsLanguageShortEn {
	TranslationsLanguageShortEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get en => 'EN';
	@override String get da => 'DA';
	@override String get es => 'ES';
	@override String get fr => 'FR';
	@override String get he => 'HE';
	@override String get isIS => 'IS';
	@override String get ko => 'KO';
	@override String get nb => 'NB';
	@override String get nl => 'NL';
	@override String get no => 'NO';
	@override String get sv => 'SV';
	@override String get zhHans => 'ZH';
	@override String get zh => 'ZH';
}

// Path: buttons
class TranslationsButtonsEs extends TranslationsButtonsEn {
	TranslationsButtonsEs._(TranslationsEs root) : this._root = root, super.internal(root);

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
	@override String get previous => 'Anterior';
	@override String get finish => 'Terminar';
	@override String get edit => 'Editar';
	@override String get delete => 'Eliminar';
	@override String get save => 'Guardar';
	@override String get view => 'Ver';
	@override String get add => 'Añadir';
	@override String get remove => 'Quitar';
	@override String get update => 'Actualizar';
	@override String get confirm => 'Confirmar';
	@override String get retry => 'Reintentar';
}

// Path: labels
class TranslationsLabelsEs extends TranslationsLabelsEn {
	TranslationsLabelsEs._(TranslationsEs root) : this._root = root, super.internal(root);

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

// Path: response
class TranslationsResponseEs extends TranslationsResponseEn {
	TranslationsResponseEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get success => 'Éxito';
	@override String get error => 'Error';
	@override String get info => 'Información';
	@override String get warning => 'Advertencia';
	@override String get tbd => 'Por Determinar';
	@override String get wip => 'Trabajo en Progreso';
}

// Path: commonWebFeatures
class TranslationsCommonWebFeaturesEs extends TranslationsCommonWebFeaturesEn {
	TranslationsCommonWebFeaturesEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get search => 'Buscar';
	@override String get filter => 'Filtrar';
	@override String get sort => 'Ordenar';
	@override String get share => 'Compartir';
	@override String get download => 'Descargar';
	@override String get upload => 'Subir';
	@override String get login => 'Iniciar sesión';
	@override String get logout => 'Cerrar sesión';
	@override String get register => 'Registrarse';
	@override String get profile => 'Perfil';
	@override String get settings => 'Configuración';
	@override String get help => 'Ayuda';
	@override String get contact => 'Contacto';
	@override String get faqFull => 'Preguntas Frecuentes';
	@override String get termsOfService => 'Términos de Servicio';
	@override String get privacyPolicy => 'Política de Privacidad';
	@override String get aboutUs => 'Acerca de Nosotros';
	@override String get careers => 'Carreras';
	@override String get blog => 'Blog';
	@override String get news => 'Noticias';
	@override String get events => 'Eventos';
	@override String get community => 'Comunidad';
	@override String get forum => 'Foro';
	@override String get support => 'Soporte';
	@override String get feedback => 'Comentarios';
	@override String get subscribe => 'Suscribirse';
	@override String get unsubscribe => 'Darse de baja';
	@override String get notifications => 'Notificaciones';
	@override String get messages => 'Mensajes';
	@override String get dashboard => 'Panel de control';
	@override String get analytics => 'Analítica';
	@override String get reports => 'Informes';
	@override String get calendar => 'Calendario';
	@override String get tasks => 'Tareas';
	@override String get projects => 'Proyectos';
	@override String get teams => 'Equipos';
	@override String get members => 'Miembros';
	@override String get roles => 'Roles';
	@override String get permissions => 'Permisos';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.k1': return 'uno';
			case 'numbers.k2': return 'dos';
			case 'numbers.k3': return 'tres';
			case 'numbers.k4': return 'cuatro';
			case 'numbers.k5': return 'cinco';
			case 'numbers.k6': return 'seis';
			case 'numbers.k7': return 'siete';
			case 'numbers.k8': return 'ocho';
			case 'numbers.k9': return 'nueve';
			case 'numbers.k10': return 'diez';
			case 'ranks.k1': return 'primero';
			case 'ranks.k2': return 'segundo';
			case 'ranks.k3': return 'tercero';
			case 'ranks.k4': return 'cuarto';
			case 'ranks.k5': return 'quinto';
			case 'ranks.k6': return 'sexto';
			case 'ranks.k7': return 'séptimo';
			case 'ranks.k8': return 'octavo';
			case 'ranks.k9': return 'noveno';
			case 'ranks.k10': return 'décimo';
			case 'priority.low': return 'Baja';
			case 'priority.medium': return 'Media';
			case 'priority.high': return 'Alta';
			case 'time.seconds': return 'segundos';
			case 'time.minutes': return 'minutos';
			case 'time.hours': return 'horas';
			case 'time.days': return 'días';
			case 'time.weeks': return 'semanas';
			case 'time.months': return 'meses';
			case 'time.years': return 'años';
			case 'time.second': return 'segundo';
			case 'time.minute': return 'minuto';
			case 'time.hour': return 'hora';
			case 'time.day': return 'día';
			case 'time.week': return 'semana';
			case 'time.month': return 'mes';
			case 'time.year': return 'año';
			case 'timeRelative.now': return 'ahora';
			case 'timeRelative.later': return 'después';
			case 'timeRelative.soon': return 'pronto';
			case 'timeRelative.inAMoment': return 'en un momento';
			case 'timeRelative.justBefore': return 'justo antes';
			case 'timeRelative.before': return 'antes';
			case 'timeRelative.after': return 'después';
			case 'day.monday': return 'Lunes';
			case 'day.tuesday': return 'Martes';
			case 'day.wednesday': return 'Miércoles';
			case 'day.thursday': return 'Jueves';
			case 'day.friday': return 'Viernes';
			case 'day.saturday': return 'Sábado';
			case 'day.sunday': return 'Domingo';
			case 'dayType.weekday': return 'día laborable';
			case 'dayType.weekend': return 'fin de semana';
			case 'dayType.everyday': return 'todos los días';
			case 'dayRelative.today': return 'hoy';
			case 'dayRelative.tomorrow': return 'mañana';
			case 'dayRelative.yesterday': return 'ayer';
			case 'dayRelative.dayAfterTomorrow': return 'pasado mañana';
			case 'dayRelative.dayBeforeYesterday': return 'anteayer';
			case 'language.en': return 'Inglés';
			case 'language.da': return 'Danés';
			case 'language.es': return 'Español';
			case 'language.fr': return 'Francés';
			case 'language.he': return 'Hebreo';
			case 'language.isIS': return 'Islandés (Islandia)';
			case 'language.ko': return 'Coreano';
			case 'language.nb': return 'Noruego Bokmål';
			case 'language.nl': return 'Holandés (Flamenco)';
			case 'language.no': return 'Noruego';
			case 'language.sv': return 'Sueco';
			case 'language.zhHans': return 'Chino (Simplificado)';
			case 'language.zh': return 'Chino (Tradicional)';
			case 'languageShort.en': return 'EN';
			case 'languageShort.da': return 'DA';
			case 'languageShort.es': return 'ES';
			case 'languageShort.fr': return 'FR';
			case 'languageShort.he': return 'HE';
			case 'languageShort.isIS': return 'IS';
			case 'languageShort.ko': return 'KO';
			case 'languageShort.nb': return 'NB';
			case 'languageShort.nl': return 'NL';
			case 'languageShort.no': return 'NO';
			case 'languageShort.sv': return 'SV';
			case 'languageShort.zhHans': return 'ZH';
			case 'languageShort.zh': return 'ZH';
			case 'buttons.submit': return 'Enviar';
			case 'buttons.close': return 'Cerrar';
			case 'buttons.reset': return 'Restablecer';
			case 'buttons.cancel': return 'Cancelar';
			case 'buttons.kContinue': return 'Continuar';
			case 'buttons.back': return 'Atrás';
			case 'buttons.next': return 'Siguiente';
			case 'buttons.done': return 'Hecho';
			case 'buttons.upload': return 'Subir';
			case 'buttons.choose': return 'Elegir';
			case 'buttons.select': return 'Seleccionar';
			case 'buttons.clear': return 'Limpiar';
			case 'buttons.start': return 'Iniciar';
			case 'buttons.previous': return 'Anterior';
			case 'buttons.finish': return 'Terminar';
			case 'buttons.edit': return 'Editar';
			case 'buttons.delete': return 'Eliminar';
			case 'buttons.save': return 'Guardar';
			case 'buttons.view': return 'Ver';
			case 'buttons.add': return 'Añadir';
			case 'buttons.remove': return 'Quitar';
			case 'buttons.update': return 'Actualizar';
			case 'buttons.confirm': return 'Confirmar';
			case 'buttons.retry': return 'Reintentar';
			case 'labels.required': return 'Requerido';
			case 'labels.optional': return 'Opcional';
			case 'labels.instructions': return 'Instrucciones:';
			case 'labels.status': return 'Estado';
			case 'labels.progress': return 'Progreso';
			case 'labels.question': return 'Pregunta';
			case 'labels.answer': return 'Respuesta';
			case 'labels.response': return 'Respuesta';
			case 'labels.loading': return 'Cargando...';
			case 'labels.error': return 'Error';
			case 'labels.success': return 'Éxito';
			case 'labels.warning': return 'Advertencia';
			case 'response.success': return 'Éxito';
			case 'response.error': return 'Error';
			case 'response.info': return 'Información';
			case 'response.warning': return 'Advertencia';
			case 'response.tbd': return 'Por Determinar';
			case 'response.wip': return 'Trabajo en Progreso';
			case 'commonWebFeatures.search': return 'Buscar';
			case 'commonWebFeatures.filter': return 'Filtrar';
			case 'commonWebFeatures.sort': return 'Ordenar';
			case 'commonWebFeatures.share': return 'Compartir';
			case 'commonWebFeatures.download': return 'Descargar';
			case 'commonWebFeatures.upload': return 'Subir';
			case 'commonWebFeatures.login': return 'Iniciar sesión';
			case 'commonWebFeatures.logout': return 'Cerrar sesión';
			case 'commonWebFeatures.register': return 'Registrarse';
			case 'commonWebFeatures.profile': return 'Perfil';
			case 'commonWebFeatures.settings': return 'Configuración';
			case 'commonWebFeatures.help': return 'Ayuda';
			case 'commonWebFeatures.contact': return 'Contacto';
			case 'commonWebFeatures.faqFull': return 'Preguntas Frecuentes';
			case 'commonWebFeatures.termsOfService': return 'Términos de Servicio';
			case 'commonWebFeatures.privacyPolicy': return 'Política de Privacidad';
			case 'commonWebFeatures.aboutUs': return 'Acerca de Nosotros';
			case 'commonWebFeatures.careers': return 'Carreras';
			case 'commonWebFeatures.blog': return 'Blog';
			case 'commonWebFeatures.news': return 'Noticias';
			case 'commonWebFeatures.events': return 'Eventos';
			case 'commonWebFeatures.community': return 'Comunidad';
			case 'commonWebFeatures.forum': return 'Foro';
			case 'commonWebFeatures.support': return 'Soporte';
			case 'commonWebFeatures.feedback': return 'Comentarios';
			case 'commonWebFeatures.subscribe': return 'Suscribirse';
			case 'commonWebFeatures.unsubscribe': return 'Darse de baja';
			case 'commonWebFeatures.notifications': return 'Notificaciones';
			case 'commonWebFeatures.messages': return 'Mensajes';
			case 'commonWebFeatures.dashboard': return 'Panel de control';
			case 'commonWebFeatures.analytics': return 'Analítica';
			case 'commonWebFeatures.reports': return 'Informes';
			case 'commonWebFeatures.calendar': return 'Calendario';
			case 'commonWebFeatures.tasks': return 'Tareas';
			case 'commonWebFeatures.projects': return 'Proyectos';
			case 'commonWebFeatures.teams': return 'Equipos';
			case 'commonWebFeatures.members': return 'Miembros';
			case 'commonWebFeatures.roles': return 'Roles';
			case 'commonWebFeatures.permissions': return 'Permisos';
			default: return null;
		}
	}
}

