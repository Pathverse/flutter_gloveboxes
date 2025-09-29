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
	@override late final TranslationsNumbersNl numbers = TranslationsNumbersNl._(_root);
	@override late final TranslationsLengthNl length = TranslationsLengthNl._(_root);
	@override late final TranslationsLengthUsNl lengthUs = TranslationsLengthUsNl._(_root);
	@override late final TranslationsLengthPluralNl lengthPlural = TranslationsLengthPluralNl._(_root);
	@override late final TranslationsWeightNl weight = TranslationsWeightNl._(_root);
	@override late final TranslationsWeightUsNl weightUs = TranslationsWeightUsNl._(_root);
	@override late final TranslationsWeightPluralNl weightPlural = TranslationsWeightPluralNl._(_root);
	@override late final TranslationsVolumeNl volume = TranslationsVolumeNl._(_root);
	@override late final TranslationsVolumeUsNl volumeUs = TranslationsVolumeUsNl._(_root);
	@override late final TranslationsSpeedNl speed = TranslationsSpeedNl._(_root);
	@override late final TranslationsTemperatureNl temperature = TranslationsTemperatureNl._(_root);
	@override late final TranslationsDigitalNl digital = TranslationsDigitalNl._(_root);
	@override late final TranslationsNetworkSpeedNl networkSpeed = TranslationsNetworkSpeedNl._(_root);
}

// Path: numbers
class TranslationsNumbersNl extends TranslationsNumbersEn {
	TranslationsNumbersNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get tens => 'Tientallen';
	@override String get hundreds => 'Honderden';
	@override String get thousands => 'Duizenden';
	@override String get millions => 'Miljoenen';
	@override String get billions => 'Miljarden';
	@override String get trillions => 'Biljoen';
	@override String get quadrillions => 'Biljard';
	@override String get quintillions => 'Triljoen';
	@override String get sextillions => 'Triljard';
	@override String get septillions => 'Quadriljoen';
	@override String get octillions => 'Quadriljard';
	@override String get nonillions => 'Quintiljoen';
}

// Path: length
class TranslationsLengthNl extends TranslationsLengthEn {
	TranslationsLengthNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get nanometer => 'Nanometer';
	@override String get micrometer => 'Micrometer';
	@override String get millimeter => 'Millimeter';
	@override String get centimeter => 'Centimeter';
	@override String get meter => 'Meter';
	@override String get kilometer => 'Kilometer';
}

// Path: lengthUs
class TranslationsLengthUsNl extends TranslationsLengthUsEn {
	TranslationsLengthUsNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get inch => 'Duim';
	@override String get foot => 'Voet';
	@override String get yard => 'Yard';
	@override String get mile => 'Mijl';
}

// Path: lengthPlural
class TranslationsLengthPluralNl extends TranslationsLengthPluralEn {
	TranslationsLengthPluralNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get nanometer => 'Nanometers';
	@override String get micrometer => 'Micrometers';
	@override String get millimeter => 'Millimeters';
	@override String get centimeter => 'Centimeters';
	@override String get meter => 'Meters';
	@override String get kilometer => 'Kilometers';
}

// Path: weight
class TranslationsWeightNl extends TranslationsWeightEn {
	TranslationsWeightNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get microgram => 'Microgram';
	@override String get milligram => 'Milligram';
	@override String get gram => 'Gram';
	@override String get kilogram => 'Kilogram';
	@override String get tonne => 'Ton';
}

// Path: weightUs
class TranslationsWeightUsNl extends TranslationsWeightUsEn {
	TranslationsWeightUsNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get ounce => 'Ons';
	@override String get pound => 'Pond';
	@override String get stone => 'Steen';
	@override String get shortTon => 'Korte ton';
	@override String get longTon => 'Lange ton';
}

// Path: weightPlural
class TranslationsWeightPluralNl extends TranslationsWeightPluralEn {
	TranslationsWeightPluralNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get microgram => 'Microgrammen';
	@override String get milligram => 'Milligrammen';
	@override String get gram => 'Grammen';
	@override String get kilogram => 'Kilogrammen';
	@override String get tonne => 'Tonnen';
}

// Path: volume
class TranslationsVolumeNl extends TranslationsVolumeEn {
	TranslationsVolumeNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get milliliter => 'Milliliter';
	@override String get liter => 'Liter';
	@override String get cubicMeter => 'Kubieke meter';
}

// Path: volumeUs
class TranslationsVolumeUsNl extends TranslationsVolumeUsEn {
	TranslationsVolumeUsNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get teaspoon => 'Theelepel';
	@override String get tablespoon => 'Eetlepel';
	@override String get fluidOunce => 'Vloeibare ons';
	@override String get cup => 'Beker';
	@override String get pint => 'Pint';
	@override String get quart => 'Quart';
	@override String get gallon => 'Gallon';
}

// Path: speed
class TranslationsSpeedNl extends TranslationsSpeedEn {
	TranslationsSpeedNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get kph => 'Kilometer per uur';
	@override String get mph => 'Mijlen per uur';
}

// Path: temperature
class TranslationsTemperatureNl extends TranslationsTemperatureEn {
	TranslationsTemperatureNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get celsius => 'Celsius';
	@override String get fahrenheit => 'Fahrenheit';
}

// Path: digital
class TranslationsDigitalNl extends TranslationsDigitalEn {
	TranslationsDigitalNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

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
class TranslationsNetworkSpeedNl extends TranslationsNetworkSpeedEn {
	TranslationsNetworkSpeedNl._(TranslationsNl root) : this._root = root, super.internal(root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get bps => 'Bits per seconde';
	@override String get kbps => 'Kilobits per seconde';
	@override String get mbps => 'Megabits per seconde';
	@override String get gbps => 'Gigabits per seconde';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsNl {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.tens': return 'Tientallen';
			case 'numbers.hundreds': return 'Honderden';
			case 'numbers.thousands': return 'Duizenden';
			case 'numbers.millions': return 'Miljoenen';
			case 'numbers.billions': return 'Miljarden';
			case 'numbers.trillions': return 'Biljoen';
			case 'numbers.quadrillions': return 'Biljard';
			case 'numbers.quintillions': return 'Triljoen';
			case 'numbers.sextillions': return 'Triljard';
			case 'numbers.septillions': return 'Quadriljoen';
			case 'numbers.octillions': return 'Quadriljard';
			case 'numbers.nonillions': return 'Quintiljoen';
			case 'length.nanometer': return 'Nanometer';
			case 'length.micrometer': return 'Micrometer';
			case 'length.millimeter': return 'Millimeter';
			case 'length.centimeter': return 'Centimeter';
			case 'length.meter': return 'Meter';
			case 'length.kilometer': return 'Kilometer';
			case 'lengthUs.inch': return 'Duim';
			case 'lengthUs.foot': return 'Voet';
			case 'lengthUs.yard': return 'Yard';
			case 'lengthUs.mile': return 'Mijl';
			case 'lengthPlural.nanometer': return 'Nanometers';
			case 'lengthPlural.micrometer': return 'Micrometers';
			case 'lengthPlural.millimeter': return 'Millimeters';
			case 'lengthPlural.centimeter': return 'Centimeters';
			case 'lengthPlural.meter': return 'Meters';
			case 'lengthPlural.kilometer': return 'Kilometers';
			case 'weight.microgram': return 'Microgram';
			case 'weight.milligram': return 'Milligram';
			case 'weight.gram': return 'Gram';
			case 'weight.kilogram': return 'Kilogram';
			case 'weight.tonne': return 'Ton';
			case 'weightUs.ounce': return 'Ons';
			case 'weightUs.pound': return 'Pond';
			case 'weightUs.stone': return 'Steen';
			case 'weightUs.shortTon': return 'Korte ton';
			case 'weightUs.longTon': return 'Lange ton';
			case 'weightPlural.microgram': return 'Microgrammen';
			case 'weightPlural.milligram': return 'Milligrammen';
			case 'weightPlural.gram': return 'Grammen';
			case 'weightPlural.kilogram': return 'Kilogrammen';
			case 'weightPlural.tonne': return 'Tonnen';
			case 'volume.milliliter': return 'Milliliter';
			case 'volume.liter': return 'Liter';
			case 'volume.cubicMeter': return 'Kubieke meter';
			case 'volumeUs.teaspoon': return 'Theelepel';
			case 'volumeUs.tablespoon': return 'Eetlepel';
			case 'volumeUs.fluidOunce': return 'Vloeibare ons';
			case 'volumeUs.cup': return 'Beker';
			case 'volumeUs.pint': return 'Pint';
			case 'volumeUs.quart': return 'Quart';
			case 'volumeUs.gallon': return 'Gallon';
			case 'speed.kph': return 'Kilometer per uur';
			case 'speed.mph': return 'Mijlen per uur';
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
			case 'networkSpeed.bps': return 'Bits per seconde';
			case 'networkSpeed.kbps': return 'Kilobits per seconde';
			case 'networkSpeed.mbps': return 'Megabits per seconde';
			case 'networkSpeed.gbps': return 'Gigabits per seconde';
			default: return null;
		}
	}
}

