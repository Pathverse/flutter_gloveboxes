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
	@override late final TranslationsNumbersIsIs numbers = TranslationsNumbersIsIs._(_root);
	@override late final TranslationsLengthIsIs length = TranslationsLengthIsIs._(_root);
	@override late final TranslationsLengthUsIsIs lengthUs = TranslationsLengthUsIsIs._(_root);
	@override late final TranslationsLengthPluralIsIs lengthPlural = TranslationsLengthPluralIsIs._(_root);
	@override late final TranslationsWeightIsIs weight = TranslationsWeightIsIs._(_root);
	@override late final TranslationsWeightUsIsIs weightUs = TranslationsWeightUsIsIs._(_root);
	@override late final TranslationsWeightPluralIsIs weightPlural = TranslationsWeightPluralIsIs._(_root);
	@override late final TranslationsVolumeIsIs volume = TranslationsVolumeIsIs._(_root);
	@override late final TranslationsVolumeUsIsIs volumeUs = TranslationsVolumeUsIsIs._(_root);
	@override late final TranslationsSpeedIsIs speed = TranslationsSpeedIsIs._(_root);
	@override late final TranslationsTemperatureIsIs temperature = TranslationsTemperatureIsIs._(_root);
	@override late final TranslationsDigitalIsIs digital = TranslationsDigitalIsIs._(_root);
	@override late final TranslationsNetworkSpeedIsIs networkSpeed = TranslationsNetworkSpeedIsIs._(_root);
}

// Path: numbers
class TranslationsNumbersIsIs extends TranslationsNumbersEn {
	TranslationsNumbersIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get tens => 'Tugir';
	@override String get hundreds => 'Hundruð';
	@override String get thousands => 'Þúsundir';
	@override String get millions => 'Milljónir';
	@override String get billions => 'Milljarðar';
	@override String get trillions => 'Billjónir';
	@override String get quadrillions => 'Billjarðar';
	@override String get quintillions => 'Trilljónir';
	@override String get sextillions => 'Trilljarðar';
	@override String get septillions => 'Kvadrilljónir';
	@override String get octillions => 'Kvadrilljarðar';
	@override String get nonillions => 'Kvintilljónir';
}

// Path: length
class TranslationsLengthIsIs extends TranslationsLengthEn {
	TranslationsLengthIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get nanometer => 'Nanómetri';
	@override String get micrometer => 'Míkrómetri';
	@override String get millimeter => 'Millímetri';
	@override String get centimeter => 'Sentímetri';
	@override String get meter => 'Metri';
	@override String get kilometer => 'Kílómetri';
}

// Path: lengthUs
class TranslationsLengthUsIsIs extends TranslationsLengthUsEn {
	TranslationsLengthUsIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get inch => 'Tomma';
	@override String get foot => 'Fet';
	@override String get yard => 'Yard';
	@override String get mile => 'Míla';
}

// Path: lengthPlural
class TranslationsLengthPluralIsIs extends TranslationsLengthPluralEn {
	TranslationsLengthPluralIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get nanometer => 'Nanómetrar';
	@override String get micrometer => 'Míkrómetrar';
	@override String get millimeter => 'Millímetrar';
	@override String get centimeter => 'Sentímetrar';
	@override String get meter => 'Metrar';
	@override String get kilometer => 'Kílómetrar';
}

// Path: weight
class TranslationsWeightIsIs extends TranslationsWeightEn {
	TranslationsWeightIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get microgram => 'Míkrógramm';
	@override String get milligram => 'Milligramm';
	@override String get gram => 'Gramm';
	@override String get kilogram => 'Kílógramm';
	@override String get tonne => 'Tonn';
}

// Path: weightUs
class TranslationsWeightUsIsIs extends TranslationsWeightUsEn {
	TranslationsWeightUsIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get ounce => 'Únsa';
	@override String get pound => 'Pund';
	@override String get stone => 'Steinn';
	@override String get shortTon => 'Stutt tonn';
	@override String get longTon => 'Langt tonn';
}

// Path: weightPlural
class TranslationsWeightPluralIsIs extends TranslationsWeightPluralEn {
	TranslationsWeightPluralIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get microgram => 'Míkrógrömm';
	@override String get milligram => 'Milligrömm';
	@override String get gram => 'Grömm';
	@override String get kilogram => 'Kílógrömm';
	@override String get tonne => 'Tonn';
}

// Path: volume
class TranslationsVolumeIsIs extends TranslationsVolumeEn {
	TranslationsVolumeIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get milliliter => 'Millílítri';
	@override String get liter => 'Lítri';
	@override String get cubicMeter => 'Rúmmetri';
}

// Path: volumeUs
class TranslationsVolumeUsIsIs extends TranslationsVolumeUsEn {
	TranslationsVolumeUsIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get teaspoon => 'Teskeiða';
	@override String get tablespoon => 'Matskeiða';
	@override String get fluidOunce => 'Vökvaúnsa';
	@override String get cup => 'Bolli';
	@override String get pint => 'Pint';
	@override String get quart => 'Kvart';
	@override String get gallon => 'Gallon';
}

// Path: speed
class TranslationsSpeedIsIs extends TranslationsSpeedEn {
	TranslationsSpeedIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get kph => 'Kílómetrar á klukkustund';
	@override String get mph => 'Mílur á klukkustund';
}

// Path: temperature
class TranslationsTemperatureIsIs extends TranslationsTemperatureEn {
	TranslationsTemperatureIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get celsius => 'Selsjus';
	@override String get fahrenheit => 'Fahrenheit';
}

// Path: digital
class TranslationsDigitalIsIs extends TranslationsDigitalEn {
	TranslationsDigitalIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get bit => 'Biti';
	@override String get byte => 'Bæti';
	@override String get kilobyte => 'Kílóbæti';
	@override String get megabyte => 'Megabæti';
	@override String get gigabyte => 'Gígabæti';
	@override String get terabyte => 'Terabæti';
	@override String get petabyte => 'Petabæti';
	@override String get exabyte => 'Exabæti';
}

// Path: networkSpeed
class TranslationsNetworkSpeedIsIs extends TranslationsNetworkSpeedEn {
	TranslationsNetworkSpeedIsIs._(TranslationsIsIs root) : this._root = root, super.internal(root);

	final TranslationsIsIs _root; // ignore: unused_field

	// Translations
	@override String get bps => 'Bitar á sekúndu';
	@override String get kbps => 'Kílóbitar á sekúndu';
	@override String get mbps => 'Megabitar á sekúndu';
	@override String get gbps => 'Gígabitar á sekúndu';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsIsIs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.tens': return 'Tugir';
			case 'numbers.hundreds': return 'Hundruð';
			case 'numbers.thousands': return 'Þúsundir';
			case 'numbers.millions': return 'Milljónir';
			case 'numbers.billions': return 'Milljarðar';
			case 'numbers.trillions': return 'Billjónir';
			case 'numbers.quadrillions': return 'Billjarðar';
			case 'numbers.quintillions': return 'Trilljónir';
			case 'numbers.sextillions': return 'Trilljarðar';
			case 'numbers.septillions': return 'Kvadrilljónir';
			case 'numbers.octillions': return 'Kvadrilljarðar';
			case 'numbers.nonillions': return 'Kvintilljónir';
			case 'length.nanometer': return 'Nanómetri';
			case 'length.micrometer': return 'Míkrómetri';
			case 'length.millimeter': return 'Millímetri';
			case 'length.centimeter': return 'Sentímetri';
			case 'length.meter': return 'Metri';
			case 'length.kilometer': return 'Kílómetri';
			case 'lengthUs.inch': return 'Tomma';
			case 'lengthUs.foot': return 'Fet';
			case 'lengthUs.yard': return 'Yard';
			case 'lengthUs.mile': return 'Míla';
			case 'lengthPlural.nanometer': return 'Nanómetrar';
			case 'lengthPlural.micrometer': return 'Míkrómetrar';
			case 'lengthPlural.millimeter': return 'Millímetrar';
			case 'lengthPlural.centimeter': return 'Sentímetrar';
			case 'lengthPlural.meter': return 'Metrar';
			case 'lengthPlural.kilometer': return 'Kílómetrar';
			case 'weight.microgram': return 'Míkrógramm';
			case 'weight.milligram': return 'Milligramm';
			case 'weight.gram': return 'Gramm';
			case 'weight.kilogram': return 'Kílógramm';
			case 'weight.tonne': return 'Tonn';
			case 'weightUs.ounce': return 'Únsa';
			case 'weightUs.pound': return 'Pund';
			case 'weightUs.stone': return 'Steinn';
			case 'weightUs.shortTon': return 'Stutt tonn';
			case 'weightUs.longTon': return 'Langt tonn';
			case 'weightPlural.microgram': return 'Míkrógrömm';
			case 'weightPlural.milligram': return 'Milligrömm';
			case 'weightPlural.gram': return 'Grömm';
			case 'weightPlural.kilogram': return 'Kílógrömm';
			case 'weightPlural.tonne': return 'Tonn';
			case 'volume.milliliter': return 'Millílítri';
			case 'volume.liter': return 'Lítri';
			case 'volume.cubicMeter': return 'Rúmmetri';
			case 'volumeUs.teaspoon': return 'Teskeiða';
			case 'volumeUs.tablespoon': return 'Matskeiða';
			case 'volumeUs.fluidOunce': return 'Vökvaúnsa';
			case 'volumeUs.cup': return 'Bolli';
			case 'volumeUs.pint': return 'Pint';
			case 'volumeUs.quart': return 'Kvart';
			case 'volumeUs.gallon': return 'Gallon';
			case 'speed.kph': return 'Kílómetrar á klukkustund';
			case 'speed.mph': return 'Mílur á klukkustund';
			case 'temperature.celsius': return 'Selsjus';
			case 'temperature.fahrenheit': return 'Fahrenheit';
			case 'digital.bit': return 'Biti';
			case 'digital.byte': return 'Bæti';
			case 'digital.kilobyte': return 'Kílóbæti';
			case 'digital.megabyte': return 'Megabæti';
			case 'digital.gigabyte': return 'Gígabæti';
			case 'digital.terabyte': return 'Terabæti';
			case 'digital.petabyte': return 'Petabæti';
			case 'digital.exabyte': return 'Exabæti';
			case 'networkSpeed.bps': return 'Bitar á sekúndu';
			case 'networkSpeed.kbps': return 'Kílóbitar á sekúndu';
			case 'networkSpeed.mbps': return 'Megabitar á sekúndu';
			case 'networkSpeed.gbps': return 'Gígabitar á sekúndu';
			default: return null;
		}
	}
}

