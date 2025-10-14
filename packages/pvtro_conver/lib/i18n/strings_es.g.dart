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
	@override late final TranslationsLengthEs length = TranslationsLengthEs._(_root);
	@override late final TranslationsLengthUsEs lengthUs = TranslationsLengthUsEs._(_root);
	@override late final TranslationsLengthPluralEs lengthPlural = TranslationsLengthPluralEs._(_root);
	@override late final TranslationsWeightEs weight = TranslationsWeightEs._(_root);
	@override late final TranslationsWeightUsEs weightUs = TranslationsWeightUsEs._(_root);
	@override late final TranslationsWeightPluralEs weightPlural = TranslationsWeightPluralEs._(_root);
	@override late final TranslationsVolumeEs volume = TranslationsVolumeEs._(_root);
	@override late final TranslationsVolumeUsEs volumeUs = TranslationsVolumeUsEs._(_root);
	@override late final TranslationsSpeedEs speed = TranslationsSpeedEs._(_root);
	@override late final TranslationsTemperatureEs temperature = TranslationsTemperatureEs._(_root);
	@override late final TranslationsDigitalEs digital = TranslationsDigitalEs._(_root);
	@override late final TranslationsNetworkSpeedEs networkSpeed = TranslationsNetworkSpeedEs._(_root);
}

// Path: numbers
class TranslationsNumbersEs extends TranslationsNumbersEn {
	TranslationsNumbersEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get tens => 'Decenas';
	@override String get hundreds => 'Centenas';
	@override String get thousands => 'Miles';
	@override String get millions => 'Millones';
	@override String get billions => 'Miles de millones';
	@override String get trillions => 'Billones';
	@override String get quadrillions => 'Mil billones';
	@override String get quintillions => 'Trillones';
	@override String get sextillions => 'Mil trillones';
	@override String get septillions => 'Cuatrillones';
	@override String get octillions => 'Mil cuatrillones';
	@override String get nonillions => 'Quintillones';
}

// Path: length
class TranslationsLengthEs extends TranslationsLengthEn {
	TranslationsLengthEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get nanometer => 'Nanómetro';
	@override String get micrometer => 'Micrómetro';
	@override String get millimeter => 'Milímetro';
	@override String get centimeter => 'Centímetro';
	@override String get meter => 'Metro';
	@override String get kilometer => 'Kilómetro';
}

// Path: lengthUs
class TranslationsLengthUsEs extends TranslationsLengthUsEn {
	TranslationsLengthUsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get inch => 'Pulgada';
	@override String get foot => 'Pie';
	@override String get yard => 'Yarda';
	@override String get mile => 'Milla';
}

// Path: lengthPlural
class TranslationsLengthPluralEs extends TranslationsLengthPluralEn {
	TranslationsLengthPluralEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get nanometer => 'Nanómetros';
	@override String get micrometer => 'Micrómetros';
	@override String get millimeter => 'Milímetros';
	@override String get centimeter => 'Centímetros';
	@override String get meter => 'Metros';
	@override String get kilometer => 'Kilómetros';
}

// Path: weight
class TranslationsWeightEs extends TranslationsWeightEn {
	TranslationsWeightEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get microgram => 'Microgramo';
	@override String get milligram => 'Miligramo';
	@override String get gram => 'Gramo';
	@override String get kilogram => 'Kilogramo';
	@override String get tonne => 'Tonelada';
}

// Path: weightUs
class TranslationsWeightUsEs extends TranslationsWeightUsEn {
	TranslationsWeightUsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get ounce => 'Onza';
	@override String get pound => 'Libra';
	@override String get stone => 'Piedra';
	@override String get shortTon => 'Tonelada corta';
	@override String get longTon => 'Tonelada larga';
}

// Path: weightPlural
class TranslationsWeightPluralEs extends TranslationsWeightPluralEn {
	TranslationsWeightPluralEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get microgram => 'Microgramos';
	@override String get milligram => 'Miligramos';
	@override String get gram => 'Gramos';
	@override String get kilogram => 'Kilogramos';
	@override String get tonne => 'Toneladas';
}

// Path: volume
class TranslationsVolumeEs extends TranslationsVolumeEn {
	TranslationsVolumeEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get milliliter => 'Mililitro';
	@override String get liter => 'Litro';
	@override String get cubicMeter => 'Metro cúbico';
}

// Path: volumeUs
class TranslationsVolumeUsEs extends TranslationsVolumeUsEn {
	TranslationsVolumeUsEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get teaspoon => 'Cucharadita';
	@override String get tablespoon => 'Cucharada';
	@override String get fluidOunce => 'Onza líquida';
	@override String get cup => 'Taza';
	@override String get pint => 'Pinta';
	@override String get quart => 'Cuarto';
	@override String get gallon => 'Galón';
}

// Path: speed
class TranslationsSpeedEs extends TranslationsSpeedEn {
	TranslationsSpeedEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get kph => 'Kilómetros por hora';
	@override String get mph => 'Millas por hora';
}

// Path: temperature
class TranslationsTemperatureEs extends TranslationsTemperatureEn {
	TranslationsTemperatureEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get celsius => 'Celsius';
	@override String get fahrenheit => 'Fahrenheit';
}

// Path: digital
class TranslationsDigitalEs extends TranslationsDigitalEn {
	TranslationsDigitalEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get bit => 'Bit';
	@override String get byte => 'Byte';
	@override String get kilobyte => 'Kilobyte';
	@override String get megabyte => 'Megabyte';
	@override String get gigabyte => 'Gigabyte';
	@override String get terabyte => 'Terabyte';
	@override String get petabyte => 'Petabyte';
	@override String get exabyte => 'Exabyte';
}

// Path: networkSpeed
class TranslationsNetworkSpeedEs extends TranslationsNetworkSpeedEn {
	TranslationsNetworkSpeedEs._(TranslationsEs root) : this._root = root, super.internal(root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get bps => 'Bits por segundo';
	@override String get kbps => 'Kilobits por segundo';
	@override String get mbps => 'Megabits por segundo';
	@override String get gbps => 'Gigabits por segundo';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.tens': return 'Decenas';
			case 'numbers.hundreds': return 'Centenas';
			case 'numbers.thousands': return 'Miles';
			case 'numbers.millions': return 'Millones';
			case 'numbers.billions': return 'Miles de millones';
			case 'numbers.trillions': return 'Billones';
			case 'numbers.quadrillions': return 'Mil billones';
			case 'numbers.quintillions': return 'Trillones';
			case 'numbers.sextillions': return 'Mil trillones';
			case 'numbers.septillions': return 'Cuatrillones';
			case 'numbers.octillions': return 'Mil cuatrillones';
			case 'numbers.nonillions': return 'Quintillones';
			case 'length.nanometer': return 'Nanómetro';
			case 'length.micrometer': return 'Micrómetro';
			case 'length.millimeter': return 'Milímetro';
			case 'length.centimeter': return 'Centímetro';
			case 'length.meter': return 'Metro';
			case 'length.kilometer': return 'Kilómetro';
			case 'lengthUs.inch': return 'Pulgada';
			case 'lengthUs.foot': return 'Pie';
			case 'lengthUs.yard': return 'Yarda';
			case 'lengthUs.mile': return 'Milla';
			case 'lengthPlural.nanometer': return 'Nanómetros';
			case 'lengthPlural.micrometer': return 'Micrómetros';
			case 'lengthPlural.millimeter': return 'Milímetros';
			case 'lengthPlural.centimeter': return 'Centímetros';
			case 'lengthPlural.meter': return 'Metros';
			case 'lengthPlural.kilometer': return 'Kilómetros';
			case 'weight.microgram': return 'Microgramo';
			case 'weight.milligram': return 'Miligramo';
			case 'weight.gram': return 'Gramo';
			case 'weight.kilogram': return 'Kilogramo';
			case 'weight.tonne': return 'Tonelada';
			case 'weightUs.ounce': return 'Onza';
			case 'weightUs.pound': return 'Libra';
			case 'weightUs.stone': return 'Piedra';
			case 'weightUs.shortTon': return 'Tonelada corta';
			case 'weightUs.longTon': return 'Tonelada larga';
			case 'weightPlural.microgram': return 'Microgramos';
			case 'weightPlural.milligram': return 'Miligramos';
			case 'weightPlural.gram': return 'Gramos';
			case 'weightPlural.kilogram': return 'Kilogramos';
			case 'weightPlural.tonne': return 'Toneladas';
			case 'volume.milliliter': return 'Mililitro';
			case 'volume.liter': return 'Litro';
			case 'volume.cubicMeter': return 'Metro cúbico';
			case 'volumeUs.teaspoon': return 'Cucharadita';
			case 'volumeUs.tablespoon': return 'Cucharada';
			case 'volumeUs.fluidOunce': return 'Onza líquida';
			case 'volumeUs.cup': return 'Taza';
			case 'volumeUs.pint': return 'Pinta';
			case 'volumeUs.quart': return 'Cuarto';
			case 'volumeUs.gallon': return 'Galón';
			case 'speed.kph': return 'Kilómetros por hora';
			case 'speed.mph': return 'Millas por hora';
			case 'temperature.celsius': return 'Celsius';
			case 'temperature.fahrenheit': return 'Fahrenheit';
			case 'digital.bit': return 'Bit';
			case 'digital.byte': return 'Byte';
			case 'digital.kilobyte': return 'Kilobyte';
			case 'digital.megabyte': return 'Megabyte';
			case 'digital.gigabyte': return 'Gigabyte';
			case 'digital.terabyte': return 'Terabyte';
			case 'digital.petabyte': return 'Petabyte';
			case 'digital.exabyte': return 'Exabyte';
			case 'networkSpeed.bps': return 'Bits por segundo';
			case 'networkSpeed.kbps': return 'Kilobits por segundo';
			case 'networkSpeed.mbps': return 'Megabits por segundo';
			case 'networkSpeed.gbps': return 'Gigabits por segundo';
			default: return null;
		}
	}
}

