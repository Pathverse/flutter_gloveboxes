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
	@override late final TranslationsNumbersNo numbers = TranslationsNumbersNo._(_root);
	@override late final TranslationsLengthNo length = TranslationsLengthNo._(_root);
	@override late final TranslationsLengthUsNo lengthUs = TranslationsLengthUsNo._(_root);
	@override late final TranslationsLengthPluralNo lengthPlural = TranslationsLengthPluralNo._(_root);
	@override late final TranslationsWeightNo weight = TranslationsWeightNo._(_root);
	@override late final TranslationsWeightUsNo weightUs = TranslationsWeightUsNo._(_root);
	@override late final TranslationsWeightPluralNo weightPlural = TranslationsWeightPluralNo._(_root);
	@override late final TranslationsVolumeNo volume = TranslationsVolumeNo._(_root);
	@override late final TranslationsVolumeUsNo volumeUs = TranslationsVolumeUsNo._(_root);
	@override late final TranslationsSpeedNo speed = TranslationsSpeedNo._(_root);
	@override late final TranslationsTemperatureNo temperature = TranslationsTemperatureNo._(_root);
	@override late final TranslationsDigitalNo digital = TranslationsDigitalNo._(_root);
	@override late final TranslationsNetworkSpeedNo networkSpeed = TranslationsNetworkSpeedNo._(_root);
}

// Path: numbers
class TranslationsNumbersNo extends TranslationsNumbersEn {
	TranslationsNumbersNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get tens => 'Tiere';
	@override String get hundreds => 'Hundreder';
	@override String get thousands => 'Tusen';
	@override String get millions => 'Millioner';
	@override String get billions => 'Milliarder';
	@override String get trillions => 'Billioner';
	@override String get quadrillions => 'Billarder';
	@override String get quintillions => 'Trillioner';
	@override String get sextillions => 'Trillarder';
	@override String get septillions => 'Kvadrillioner';
	@override String get octillions => 'Kvadrillarder';
	@override String get nonillions => 'Kvintillioner';
}

// Path: length
class TranslationsLengthNo extends TranslationsLengthEn {
	TranslationsLengthNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get nanometer => 'Nanometer';
	@override String get micrometer => 'Mikrometer';
	@override String get millimeter => 'Millimeter';
	@override String get centimeter => 'Centimeter';
	@override String get meter => 'Meter';
	@override String get kilometer => 'Kilometer';
}

// Path: lengthUs
class TranslationsLengthUsNo extends TranslationsLengthUsEn {
	TranslationsLengthUsNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get inch => 'Tomme';
	@override String get foot => 'Fot';
	@override String get yard => 'Yard';
	@override String get mile => 'Mil';
}

// Path: lengthPlural
class TranslationsLengthPluralNo extends TranslationsLengthPluralEn {
	TranslationsLengthPluralNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get nanometer => 'Nanometer';
	@override String get micrometer => 'Mikrometer';
	@override String get millimeter => 'Millimeter';
	@override String get centimeter => 'Centimeter';
	@override String get meter => 'Meter';
	@override String get kilometer => 'Kilometer';
}

// Path: weight
class TranslationsWeightNo extends TranslationsWeightEn {
	TranslationsWeightNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get microgram => 'Mikrogram';
	@override String get milligram => 'Milligram';
	@override String get gram => 'Gram';
	@override String get kilogram => 'Kilogram';
	@override String get tonne => 'Tonn';
}

// Path: weightUs
class TranslationsWeightUsNo extends TranslationsWeightUsEn {
	TranslationsWeightUsNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get ounce => 'Unse';
	@override String get pound => 'Pund';
	@override String get stone => 'Stone';
	@override String get shortTon => 'Kort tonn';
	@override String get longTon => 'Lang tonn';
}

// Path: weightPlural
class TranslationsWeightPluralNo extends TranslationsWeightPluralEn {
	TranslationsWeightPluralNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get microgram => 'Mikrogram';
	@override String get milligram => 'Milligram';
	@override String get gram => 'Gram';
	@override String get kilogram => 'Kilogram';
	@override String get tonne => 'Tonn';
}

// Path: volume
class TranslationsVolumeNo extends TranslationsVolumeEn {
	TranslationsVolumeNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get milliliter => 'Milliliter';
	@override String get liter => 'Liter';
	@override String get cubicMeter => 'Kubikkmeter';
}

// Path: volumeUs
class TranslationsVolumeUsNo extends TranslationsVolumeUsEn {
	TranslationsVolumeUsNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get teaspoon => 'Teskje';
	@override String get tablespoon => 'Spiseskje';
	@override String get fluidOunce => 'Væskeunse';
	@override String get cup => 'Kopp';
	@override String get pint => 'Pint';
	@override String get quart => 'Quart';
	@override String get gallon => 'Gallon';
}

// Path: speed
class TranslationsSpeedNo extends TranslationsSpeedEn {
	TranslationsSpeedNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get kph => 'Kilometer per time';
	@override String get mph => 'Engelske mil per time';
}

// Path: temperature
class TranslationsTemperatureNo extends TranslationsTemperatureEn {
	TranslationsTemperatureNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get celsius => 'Celsius';
	@override String get fahrenheit => 'Fahrenheit';
}

// Path: digital
class TranslationsDigitalNo extends TranslationsDigitalEn {
	TranslationsDigitalNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

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
class TranslationsNetworkSpeedNo extends TranslationsNetworkSpeedEn {
	TranslationsNetworkSpeedNo._(TranslationsNo root) : this._root = root, super.internal(root);

	final TranslationsNo _root; // ignore: unused_field

	// Translations
	@override String get bps => 'Bits per sekund';
	@override String get kbps => 'Kilobits per sekund';
	@override String get mbps => 'Megabits per sekund';
	@override String get gbps => 'Gigabits per sekund';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsNo {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.tens': return 'Tiere';
			case 'numbers.hundreds': return 'Hundreder';
			case 'numbers.thousands': return 'Tusen';
			case 'numbers.millions': return 'Millioner';
			case 'numbers.billions': return 'Milliarder';
			case 'numbers.trillions': return 'Billioner';
			case 'numbers.quadrillions': return 'Billarder';
			case 'numbers.quintillions': return 'Trillioner';
			case 'numbers.sextillions': return 'Trillarder';
			case 'numbers.septillions': return 'Kvadrillioner';
			case 'numbers.octillions': return 'Kvadrillarder';
			case 'numbers.nonillions': return 'Kvintillioner';
			case 'length.nanometer': return 'Nanometer';
			case 'length.micrometer': return 'Mikrometer';
			case 'length.millimeter': return 'Millimeter';
			case 'length.centimeter': return 'Centimeter';
			case 'length.meter': return 'Meter';
			case 'length.kilometer': return 'Kilometer';
			case 'lengthUs.inch': return 'Tomme';
			case 'lengthUs.foot': return 'Fot';
			case 'lengthUs.yard': return 'Yard';
			case 'lengthUs.mile': return 'Mil';
			case 'lengthPlural.nanometer': return 'Nanometer';
			case 'lengthPlural.micrometer': return 'Mikrometer';
			case 'lengthPlural.millimeter': return 'Millimeter';
			case 'lengthPlural.centimeter': return 'Centimeter';
			case 'lengthPlural.meter': return 'Meter';
			case 'lengthPlural.kilometer': return 'Kilometer';
			case 'weight.microgram': return 'Mikrogram';
			case 'weight.milligram': return 'Milligram';
			case 'weight.gram': return 'Gram';
			case 'weight.kilogram': return 'Kilogram';
			case 'weight.tonne': return 'Tonn';
			case 'weightUs.ounce': return 'Unse';
			case 'weightUs.pound': return 'Pund';
			case 'weightUs.stone': return 'Stone';
			case 'weightUs.shortTon': return 'Kort tonn';
			case 'weightUs.longTon': return 'Lang tonn';
			case 'weightPlural.microgram': return 'Mikrogram';
			case 'weightPlural.milligram': return 'Milligram';
			case 'weightPlural.gram': return 'Gram';
			case 'weightPlural.kilogram': return 'Kilogram';
			case 'weightPlural.tonne': return 'Tonn';
			case 'volume.milliliter': return 'Milliliter';
			case 'volume.liter': return 'Liter';
			case 'volume.cubicMeter': return 'Kubikkmeter';
			case 'volumeUs.teaspoon': return 'Teskje';
			case 'volumeUs.tablespoon': return 'Spiseskje';
			case 'volumeUs.fluidOunce': return 'Væskeunse';
			case 'volumeUs.cup': return 'Kopp';
			case 'volumeUs.pint': return 'Pint';
			case 'volumeUs.quart': return 'Quart';
			case 'volumeUs.gallon': return 'Gallon';
			case 'speed.kph': return 'Kilometer per time';
			case 'speed.mph': return 'Engelske mil per time';
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
			case 'networkSpeed.bps': return 'Bits per sekund';
			case 'networkSpeed.kbps': return 'Kilobits per sekund';
			case 'networkSpeed.mbps': return 'Megabits per sekund';
			case 'networkSpeed.gbps': return 'Gigabits per sekund';
			default: return null;
		}
	}
}

