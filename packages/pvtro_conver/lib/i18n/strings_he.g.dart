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
	@override late final TranslationsNumbersHe numbers = TranslationsNumbersHe._(_root);
	@override late final TranslationsLengthHe length = TranslationsLengthHe._(_root);
	@override late final TranslationsLengthUsHe lengthUs = TranslationsLengthUsHe._(_root);
	@override late final TranslationsLengthPluralHe lengthPlural = TranslationsLengthPluralHe._(_root);
	@override late final TranslationsWeightHe weight = TranslationsWeightHe._(_root);
	@override late final TranslationsWeightUsHe weightUs = TranslationsWeightUsHe._(_root);
	@override late final TranslationsWeightPluralHe weightPlural = TranslationsWeightPluralHe._(_root);
	@override late final TranslationsVolumeHe volume = TranslationsVolumeHe._(_root);
	@override late final TranslationsVolumeUsHe volumeUs = TranslationsVolumeUsHe._(_root);
	@override late final TranslationsSpeedHe speed = TranslationsSpeedHe._(_root);
	@override late final TranslationsTemperatureHe temperature = TranslationsTemperatureHe._(_root);
	@override late final TranslationsDigitalHe digital = TranslationsDigitalHe._(_root);
	@override late final TranslationsNetworkSpeedHe networkSpeed = TranslationsNetworkSpeedHe._(_root);
}

// Path: numbers
class TranslationsNumbersHe extends TranslationsNumbersEn {
	TranslationsNumbersHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get tens => 'עשרות';
	@override String get hundreds => 'מאות';
	@override String get thousands => 'אלפים';
	@override String get millions => 'מיליונים';
	@override String get billions => 'מיליארדים';
	@override String get trillions => 'טריליונים';
	@override String get quadrillions => 'קוודריליונים';
	@override String get quintillions => 'קווינטיליונים';
	@override String get sextillions => 'סקסטיליונים';
	@override String get septillions => 'ספטיליונים';
	@override String get octillions => 'אוקטיליונים';
	@override String get nonillions => 'נוניליונים';
}

// Path: length
class TranslationsLengthHe extends TranslationsLengthEn {
	TranslationsLengthHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get nanometer => 'ננומטר';
	@override String get micrometer => 'מיקרומטר';
	@override String get millimeter => 'מילימטר';
	@override String get centimeter => 'סנטימטר';
	@override String get meter => 'מטר';
	@override String get kilometer => 'קילומטר';
}

// Path: lengthUs
class TranslationsLengthUsHe extends TranslationsLengthUsEn {
	TranslationsLengthUsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get inch => 'אינץ\'';
	@override String get foot => 'רגל';
	@override String get yard => 'יארד';
	@override String get mile => 'מייל';
}

// Path: lengthPlural
class TranslationsLengthPluralHe extends TranslationsLengthPluralEn {
	TranslationsLengthPluralHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get nanometer => 'ננומטרים';
	@override String get micrometer => 'מיקרומטרים';
	@override String get millimeter => 'מילימטרים';
	@override String get centimeter => 'סנטימטרים';
	@override String get meter => 'מטרים';
	@override String get kilometer => 'קילומטרים';
}

// Path: weight
class TranslationsWeightHe extends TranslationsWeightEn {
	TranslationsWeightHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get microgram => 'מיקרוגרם';
	@override String get milligram => 'מיליגרם';
	@override String get gram => 'גרם';
	@override String get kilogram => 'קילוגרם';
	@override String get tonne => 'טון';
}

// Path: weightUs
class TranslationsWeightUsHe extends TranslationsWeightUsEn {
	TranslationsWeightUsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get ounce => 'אונקיה';
	@override String get pound => 'פאונד';
	@override String get stone => 'סטון';
	@override String get shortTon => 'טון קצר';
	@override String get longTon => 'טון ארוך';
}

// Path: weightPlural
class TranslationsWeightPluralHe extends TranslationsWeightPluralEn {
	TranslationsWeightPluralHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get microgram => 'מיקרוגרמים';
	@override String get milligram => 'מיליגרמים';
	@override String get gram => 'גרמים';
	@override String get kilogram => 'קילוגרמים';
	@override String get tonne => 'טונים';
}

// Path: volume
class TranslationsVolumeHe extends TranslationsVolumeEn {
	TranslationsVolumeHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get milliliter => 'מיליליטר';
	@override String get liter => 'ליטר';
	@override String get cubicMeter => 'מטר מעוקב';
}

// Path: volumeUs
class TranslationsVolumeUsHe extends TranslationsVolumeUsEn {
	TranslationsVolumeUsHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get teaspoon => 'כפית';
	@override String get tablespoon => 'כף';
	@override String get fluidOunce => 'אונקיית נוזלים';
	@override String get cup => 'כוס';
	@override String get pint => 'פינט';
	@override String get quart => 'קוורט';
	@override String get gallon => 'גלון';
}

// Path: speed
class TranslationsSpeedHe extends TranslationsSpeedEn {
	TranslationsSpeedHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get kph => 'קילומטרים לשעה';
	@override String get mph => 'מיילים לשעה';
}

// Path: temperature
class TranslationsTemperatureHe extends TranslationsTemperatureEn {
	TranslationsTemperatureHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get celsius => 'צלזיוס';
	@override String get fahrenheit => 'פרנהייט';
}

// Path: digital
class TranslationsDigitalHe extends TranslationsDigitalEn {
	TranslationsDigitalHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get bit => 'ביט';
	@override String get byte => 'בייט';
	@override String get kilobyte => 'קילובייט';
	@override String get megabyte => 'מגהבייט';
	@override String get gigabyte => 'גיגהבייט';
	@override String get terabyte => 'טרהבייט';
	@override String get petabyte => 'פטהבייט';
	@override String get exabyte => 'אקסהבייט';
}

// Path: networkSpeed
class TranslationsNetworkSpeedHe extends TranslationsNetworkSpeedEn {
	TranslationsNetworkSpeedHe._(TranslationsHe root) : this._root = root, super.internal(root);

	final TranslationsHe _root; // ignore: unused_field

	// Translations
	@override String get bps => 'ביטים לשנייה';
	@override String get kbps => 'קילוביטים לשנייה';
	@override String get mbps => 'מגהביטים לשנייה';
	@override String get gbps => 'גיגהביטים לשנייה';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsHe {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.tens': return 'עשרות';
			case 'numbers.hundreds': return 'מאות';
			case 'numbers.thousands': return 'אלפים';
			case 'numbers.millions': return 'מיליונים';
			case 'numbers.billions': return 'מיליארדים';
			case 'numbers.trillions': return 'טריליונים';
			case 'numbers.quadrillions': return 'קוודריליונים';
			case 'numbers.quintillions': return 'קווינטיליונים';
			case 'numbers.sextillions': return 'סקסטיליונים';
			case 'numbers.septillions': return 'ספטיליונים';
			case 'numbers.octillions': return 'אוקטיליונים';
			case 'numbers.nonillions': return 'נוניליונים';
			case 'length.nanometer': return 'ננומטר';
			case 'length.micrometer': return 'מיקרומטר';
			case 'length.millimeter': return 'מילימטר';
			case 'length.centimeter': return 'סנטימטר';
			case 'length.meter': return 'מטר';
			case 'length.kilometer': return 'קילומטר';
			case 'lengthUs.inch': return 'אינץ\'';
			case 'lengthUs.foot': return 'רגל';
			case 'lengthUs.yard': return 'יארד';
			case 'lengthUs.mile': return 'מייל';
			case 'lengthPlural.nanometer': return 'ננומטרים';
			case 'lengthPlural.micrometer': return 'מיקרומטרים';
			case 'lengthPlural.millimeter': return 'מילימטרים';
			case 'lengthPlural.centimeter': return 'סנטימטרים';
			case 'lengthPlural.meter': return 'מטרים';
			case 'lengthPlural.kilometer': return 'קילומטרים';
			case 'weight.microgram': return 'מיקרוגרם';
			case 'weight.milligram': return 'מיליגרם';
			case 'weight.gram': return 'גרם';
			case 'weight.kilogram': return 'קילוגרם';
			case 'weight.tonne': return 'טון';
			case 'weightUs.ounce': return 'אונקיה';
			case 'weightUs.pound': return 'פאונד';
			case 'weightUs.stone': return 'סטון';
			case 'weightUs.shortTon': return 'טון קצר';
			case 'weightUs.longTon': return 'טון ארוך';
			case 'weightPlural.microgram': return 'מיקרוגרמים';
			case 'weightPlural.milligram': return 'מיליגרמים';
			case 'weightPlural.gram': return 'גרמים';
			case 'weightPlural.kilogram': return 'קילוגרמים';
			case 'weightPlural.tonne': return 'טונים';
			case 'volume.milliliter': return 'מיליליטר';
			case 'volume.liter': return 'ליטר';
			case 'volume.cubicMeter': return 'מטר מעוקב';
			case 'volumeUs.teaspoon': return 'כפית';
			case 'volumeUs.tablespoon': return 'כף';
			case 'volumeUs.fluidOunce': return 'אונקיית נוזלים';
			case 'volumeUs.cup': return 'כוס';
			case 'volumeUs.pint': return 'פינט';
			case 'volumeUs.quart': return 'קוורט';
			case 'volumeUs.gallon': return 'גלון';
			case 'speed.kph': return 'קילומטרים לשעה';
			case 'speed.mph': return 'מיילים לשעה';
			case 'temperature.celsius': return 'צלזיוס';
			case 'temperature.fahrenheit': return 'פרנהייט';
			case 'digital.bit': return 'ביט';
			case 'digital.byte': return 'בייט';
			case 'digital.kilobyte': return 'קילובייט';
			case 'digital.megabyte': return 'מגהבייט';
			case 'digital.gigabyte': return 'גיגהבייט';
			case 'digital.terabyte': return 'טרהבייט';
			case 'digital.petabyte': return 'פטהבייט';
			case 'digital.exabyte': return 'אקסהבייט';
			case 'networkSpeed.bps': return 'ביטים לשנייה';
			case 'networkSpeed.kbps': return 'קילוביטים לשנייה';
			case 'networkSpeed.mbps': return 'מגהביטים לשנייה';
			case 'networkSpeed.gbps': return 'גיגהביטים לשנייה';
			default: return null;
		}
	}
}

