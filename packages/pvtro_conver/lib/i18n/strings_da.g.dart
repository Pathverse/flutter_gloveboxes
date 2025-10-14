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
class TranslationsDa extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsDa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.da,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <da>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsDa _root = this; // ignore: unused_field

	@override 
	TranslationsDa $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsDa(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsNumbersDa numbers = TranslationsNumbersDa._(_root);
	@override late final TranslationsLengthDa length = TranslationsLengthDa._(_root);
	@override late final TranslationsLengthUsDa lengthUs = TranslationsLengthUsDa._(_root);
	@override late final TranslationsLengthPluralDa lengthPlural = TranslationsLengthPluralDa._(_root);
	@override late final TranslationsWeightDa weight = TranslationsWeightDa._(_root);
	@override late final TranslationsWeightUsDa weightUs = TranslationsWeightUsDa._(_root);
	@override late final TranslationsWeightPluralDa weightPlural = TranslationsWeightPluralDa._(_root);
	@override late final TranslationsVolumeDa volume = TranslationsVolumeDa._(_root);
	@override late final TranslationsVolumeUsDa volumeUs = TranslationsVolumeUsDa._(_root);
	@override late final TranslationsSpeedDa speed = TranslationsSpeedDa._(_root);
	@override late final TranslationsTemperatureDa temperature = TranslationsTemperatureDa._(_root);
	@override late final TranslationsDigitalDa digital = TranslationsDigitalDa._(_root);
	@override late final TranslationsNetworkSpeedDa networkSpeed = TranslationsNetworkSpeedDa._(_root);
}

// Path: numbers
class TranslationsNumbersDa extends TranslationsNumbersEn {
	TranslationsNumbersDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get tens => 'Tiere';
	@override String get hundreds => 'Hundreder';
	@override String get thousands => 'Tusinder';
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
class TranslationsLengthDa extends TranslationsLengthEn {
	TranslationsLengthDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get nanometer => 'Nanometer';
	@override String get micrometer => 'Mikrometer';
	@override String get millimeter => 'Millimeter';
	@override String get centimeter => 'Centimeter';
	@override String get meter => 'Meter';
	@override String get kilometer => 'Kilometer';
}

// Path: lengthUs
class TranslationsLengthUsDa extends TranslationsLengthUsEn {
	TranslationsLengthUsDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get inch => 'Tomme';
	@override String get foot => 'Fod';
	@override String get yard => 'Yard';
	@override String get mile => 'Mil';
}

// Path: lengthPlural
class TranslationsLengthPluralDa extends TranslationsLengthPluralEn {
	TranslationsLengthPluralDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get nanometer => 'Nanometer';
	@override String get micrometer => 'Mikrometer';
	@override String get millimeter => 'Millimeter';
	@override String get centimeter => 'Centimeter';
	@override String get meter => 'Meter';
	@override String get kilometer => 'Kilometer';
}

// Path: weight
class TranslationsWeightDa extends TranslationsWeightEn {
	TranslationsWeightDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get microgram => 'Mikrogram';
	@override String get milligram => 'Milligram';
	@override String get gram => 'Gram';
	@override String get kilogram => 'Kilogram';
	@override String get tonne => 'Ton';
}

// Path: weightUs
class TranslationsWeightUsDa extends TranslationsWeightUsEn {
	TranslationsWeightUsDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get ounce => 'Unse';
	@override String get pound => 'Pund';
	@override String get stone => 'Stone';
	@override String get shortTon => 'Kort ton';
	@override String get longTon => 'Lang ton';
}

// Path: weightPlural
class TranslationsWeightPluralDa extends TranslationsWeightPluralEn {
	TranslationsWeightPluralDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get microgram => 'Mikrogram';
	@override String get milligram => 'Milligram';
	@override String get gram => 'Gram';
	@override String get kilogram => 'Kilogram';
	@override String get tonne => 'Ton';
}

// Path: volume
class TranslationsVolumeDa extends TranslationsVolumeEn {
	TranslationsVolumeDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get milliliter => 'Milliliter';
	@override String get liter => 'Liter';
	@override String get cubicMeter => 'Kubikmeter';
}

// Path: volumeUs
class TranslationsVolumeUsDa extends TranslationsVolumeUsEn {
	TranslationsVolumeUsDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get teaspoon => 'Teskefuld';
	@override String get tablespoon => 'Spiseskefuld';
	@override String get fluidOunce => 'Fluid unse';
	@override String get cup => 'Kop';
	@override String get pint => 'Pint';
	@override String get quart => 'Quart';
	@override String get gallon => 'Gallon';
}

// Path: speed
class TranslationsSpeedDa extends TranslationsSpeedEn {
	TranslationsSpeedDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get kph => 'Kilometer i timen';
	@override String get mph => 'Miles i timen';
}

// Path: temperature
class TranslationsTemperatureDa extends TranslationsTemperatureEn {
	TranslationsTemperatureDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get celsius => 'Celsius';
	@override String get fahrenheit => 'Fahrenheit';
}

// Path: digital
class TranslationsDigitalDa extends TranslationsDigitalEn {
	TranslationsDigitalDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

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
class TranslationsNetworkSpeedDa extends TranslationsNetworkSpeedEn {
	TranslationsNetworkSpeedDa._(TranslationsDa root) : this._root = root, super.internal(root);

	final TranslationsDa _root; // ignore: unused_field

	// Translations
	@override String get bps => 'Bits per sekund';
	@override String get kbps => 'Kilobits per sekund';
	@override String get mbps => 'Megabits per sekund';
	@override String get gbps => 'Gigabits per sekund';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsDa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.tens': return 'Tiere';
			case 'numbers.hundreds': return 'Hundreder';
			case 'numbers.thousands': return 'Tusinder';
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
			case 'lengthUs.foot': return 'Fod';
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
			case 'weight.tonne': return 'Ton';
			case 'weightUs.ounce': return 'Unse';
			case 'weightUs.pound': return 'Pund';
			case 'weightUs.stone': return 'Stone';
			case 'weightUs.shortTon': return 'Kort ton';
			case 'weightUs.longTon': return 'Lang ton';
			case 'weightPlural.microgram': return 'Mikrogram';
			case 'weightPlural.milligram': return 'Milligram';
			case 'weightPlural.gram': return 'Gram';
			case 'weightPlural.kilogram': return 'Kilogram';
			case 'weightPlural.tonne': return 'Ton';
			case 'volume.milliliter': return 'Milliliter';
			case 'volume.liter': return 'Liter';
			case 'volume.cubicMeter': return 'Kubikmeter';
			case 'volumeUs.teaspoon': return 'Teskefuld';
			case 'volumeUs.tablespoon': return 'Spiseskefuld';
			case 'volumeUs.fluidOunce': return 'Fluid unse';
			case 'volumeUs.cup': return 'Kop';
			case 'volumeUs.pint': return 'Pint';
			case 'volumeUs.quart': return 'Quart';
			case 'volumeUs.gallon': return 'Gallon';
			case 'speed.kph': return 'Kilometer i timen';
			case 'speed.mph': return 'Miles i timen';
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

