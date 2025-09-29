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
class TranslationsSv extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsSv({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.sv,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <sv>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsSv _root = this; // ignore: unused_field

	@override 
	TranslationsSv $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsSv(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsNumbersSv numbers = TranslationsNumbersSv._(_root);
	@override late final TranslationsLengthSv length = TranslationsLengthSv._(_root);
	@override late final TranslationsLengthUsSv lengthUs = TranslationsLengthUsSv._(_root);
	@override late final TranslationsLengthPluralSv lengthPlural = TranslationsLengthPluralSv._(_root);
	@override late final TranslationsWeightSv weight = TranslationsWeightSv._(_root);
	@override late final TranslationsWeightUsSv weightUs = TranslationsWeightUsSv._(_root);
	@override late final TranslationsWeightPluralSv weightPlural = TranslationsWeightPluralSv._(_root);
	@override late final TranslationsVolumeSv volume = TranslationsVolumeSv._(_root);
	@override late final TranslationsVolumeUsSv volumeUs = TranslationsVolumeUsSv._(_root);
	@override late final TranslationsSpeedSv speed = TranslationsSpeedSv._(_root);
	@override late final TranslationsTemperatureSv temperature = TranslationsTemperatureSv._(_root);
	@override late final TranslationsDigitalSv digital = TranslationsDigitalSv._(_root);
	@override late final TranslationsNetworkSpeedSv networkSpeed = TranslationsNetworkSpeedSv._(_root);
}

// Path: numbers
class TranslationsNumbersSv extends TranslationsNumbersEn {
	TranslationsNumbersSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get tens => 'Tiotals';
	@override String get hundreds => 'Hundratal';
	@override String get thousands => 'Tusentals';
	@override String get millions => 'Miljoner';
	@override String get billions => 'Miljarder';
	@override String get trillions => 'Biljoner';
	@override String get quadrillions => 'Biljarder';
	@override String get quintillions => 'Triljoner';
	@override String get sextillions => 'Triljarder';
	@override String get septillions => 'Kvadriljoner';
	@override String get octillions => 'Kvadriljarder';
	@override String get nonillions => 'Kvintiljoner';
}

// Path: length
class TranslationsLengthSv extends TranslationsLengthEn {
	TranslationsLengthSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get nanometer => 'Nanometer';
	@override String get micrometer => 'Mikrometer';
	@override String get millimeter => 'Millimeter';
	@override String get centimeter => 'Centimeter';
	@override String get meter => 'Meter';
	@override String get kilometer => 'Kilometer';
}

// Path: lengthUs
class TranslationsLengthUsSv extends TranslationsLengthUsEn {
	TranslationsLengthUsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get inch => 'Tum';
	@override String get foot => 'Fot';
	@override String get yard => 'Yard';
	@override String get mile => 'Mil';
}

// Path: lengthPlural
class TranslationsLengthPluralSv extends TranslationsLengthPluralEn {
	TranslationsLengthPluralSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get nanometer => 'Nanometer';
	@override String get micrometer => 'Mikrometer';
	@override String get millimeter => 'Millimeter';
	@override String get centimeter => 'Centimeter';
	@override String get meter => 'Meter';
	@override String get kilometer => 'Kilometer';
}

// Path: weight
class TranslationsWeightSv extends TranslationsWeightEn {
	TranslationsWeightSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get microgram => 'Mikrogram';
	@override String get milligram => 'Milligram';
	@override String get gram => 'Gram';
	@override String get kilogram => 'Kilogram';
	@override String get tonne => 'Ton';
}

// Path: weightUs
class TranslationsWeightUsSv extends TranslationsWeightUsEn {
	TranslationsWeightUsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get ounce => 'Uns';
	@override String get pound => 'Pund';
	@override String get stone => 'Sten';
	@override String get shortTon => 'Kort ton';
	@override String get longTon => 'Lång ton';
}

// Path: weightPlural
class TranslationsWeightPluralSv extends TranslationsWeightPluralEn {
	TranslationsWeightPluralSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get microgram => 'Mikrogram';
	@override String get milligram => 'Milligram';
	@override String get gram => 'Gram';
	@override String get kilogram => 'Kilogram';
	@override String get tonne => 'Ton';
}

// Path: volume
class TranslationsVolumeSv extends TranslationsVolumeEn {
	TranslationsVolumeSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get milliliter => 'Milliliter';
	@override String get liter => 'Liter';
	@override String get cubicMeter => 'Kubikmeter';
}

// Path: volumeUs
class TranslationsVolumeUsSv extends TranslationsVolumeUsEn {
	TranslationsVolumeUsSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get teaspoon => 'Tesked';
	@override String get tablespoon => 'Matsked';
	@override String get fluidOunce => 'Vätskeuns';
	@override String get cup => 'Kopp';
	@override String get pint => 'Pint';
	@override String get quart => 'Kvart';
	@override String get gallon => 'Gallon';
}

// Path: speed
class TranslationsSpeedSv extends TranslationsSpeedEn {
	TranslationsSpeedSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get kph => 'Kilometer per timme';
	@override String get mph => 'Engelska mil per timme';
}

// Path: temperature
class TranslationsTemperatureSv extends TranslationsTemperatureEn {
	TranslationsTemperatureSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get celsius => 'Celsius';
	@override String get fahrenheit => 'Fahrenheit';
}

// Path: digital
class TranslationsDigitalSv extends TranslationsDigitalEn {
	TranslationsDigitalSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

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
class TranslationsNetworkSpeedSv extends TranslationsNetworkSpeedEn {
	TranslationsNetworkSpeedSv._(TranslationsSv root) : this._root = root, super.internal(root);

	final TranslationsSv _root; // ignore: unused_field

	// Translations
	@override String get bps => 'Bitar per sekund';
	@override String get kbps => 'Kilobitar per sekund';
	@override String get mbps => 'Megabitar per sekund';
	@override String get gbps => 'Gigabitar per sekund';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsSv {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.tens': return 'Tiotals';
			case 'numbers.hundreds': return 'Hundratal';
			case 'numbers.thousands': return 'Tusentals';
			case 'numbers.millions': return 'Miljoner';
			case 'numbers.billions': return 'Miljarder';
			case 'numbers.trillions': return 'Biljoner';
			case 'numbers.quadrillions': return 'Biljarder';
			case 'numbers.quintillions': return 'Triljoner';
			case 'numbers.sextillions': return 'Triljarder';
			case 'numbers.septillions': return 'Kvadriljoner';
			case 'numbers.octillions': return 'Kvadriljarder';
			case 'numbers.nonillions': return 'Kvintiljoner';
			case 'length.nanometer': return 'Nanometer';
			case 'length.micrometer': return 'Mikrometer';
			case 'length.millimeter': return 'Millimeter';
			case 'length.centimeter': return 'Centimeter';
			case 'length.meter': return 'Meter';
			case 'length.kilometer': return 'Kilometer';
			case 'lengthUs.inch': return 'Tum';
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
			case 'weight.tonne': return 'Ton';
			case 'weightUs.ounce': return 'Uns';
			case 'weightUs.pound': return 'Pund';
			case 'weightUs.stone': return 'Sten';
			case 'weightUs.shortTon': return 'Kort ton';
			case 'weightUs.longTon': return 'Lång ton';
			case 'weightPlural.microgram': return 'Mikrogram';
			case 'weightPlural.milligram': return 'Milligram';
			case 'weightPlural.gram': return 'Gram';
			case 'weightPlural.kilogram': return 'Kilogram';
			case 'weightPlural.tonne': return 'Ton';
			case 'volume.milliliter': return 'Milliliter';
			case 'volume.liter': return 'Liter';
			case 'volume.cubicMeter': return 'Kubikmeter';
			case 'volumeUs.teaspoon': return 'Tesked';
			case 'volumeUs.tablespoon': return 'Matsked';
			case 'volumeUs.fluidOunce': return 'Vätskeuns';
			case 'volumeUs.cup': return 'Kopp';
			case 'volumeUs.pint': return 'Pint';
			case 'volumeUs.quart': return 'Kvart';
			case 'volumeUs.gallon': return 'Gallon';
			case 'speed.kph': return 'Kilometer per timme';
			case 'speed.mph': return 'Engelska mil per timme';
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
			case 'networkSpeed.bps': return 'Bitar per sekund';
			case 'networkSpeed.kbps': return 'Kilobitar per sekund';
			case 'networkSpeed.mbps': return 'Megabitar per sekund';
			case 'networkSpeed.gbps': return 'Gigabitar per sekund';
			default: return null;
		}
	}
}

