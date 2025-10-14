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
	@override late final TranslationsNumbersFr numbers = TranslationsNumbersFr._(_root);
	@override late final TranslationsLengthFr length = TranslationsLengthFr._(_root);
	@override late final TranslationsLengthUsFr lengthUs = TranslationsLengthUsFr._(_root);
	@override late final TranslationsLengthPluralFr lengthPlural = TranslationsLengthPluralFr._(_root);
	@override late final TranslationsWeightFr weight = TranslationsWeightFr._(_root);
	@override late final TranslationsWeightUsFr weightUs = TranslationsWeightUsFr._(_root);
	@override late final TranslationsWeightPluralFr weightPlural = TranslationsWeightPluralFr._(_root);
	@override late final TranslationsVolumeFr volume = TranslationsVolumeFr._(_root);
	@override late final TranslationsVolumeUsFr volumeUs = TranslationsVolumeUsFr._(_root);
	@override late final TranslationsSpeedFr speed = TranslationsSpeedFr._(_root);
	@override late final TranslationsTemperatureFr temperature = TranslationsTemperatureFr._(_root);
	@override late final TranslationsDigitalFr digital = TranslationsDigitalFr._(_root);
	@override late final TranslationsNetworkSpeedFr networkSpeed = TranslationsNetworkSpeedFr._(_root);
}

// Path: numbers
class TranslationsNumbersFr extends TranslationsNumbersEn {
	TranslationsNumbersFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get tens => 'Dizaines';
	@override String get hundreds => 'Centaines';
	@override String get thousands => 'Milliers';
	@override String get millions => 'Millions';
	@override String get billions => 'Milliards';
	@override String get trillions => 'Billions';
	@override String get quadrillions => 'Billiards';
	@override String get quintillions => 'Trillions';
	@override String get sextillions => 'Trilliards';
	@override String get septillions => 'Quadrillions';
	@override String get octillions => 'Quadrilliards';
	@override String get nonillions => 'Quintillions';
}

// Path: length
class TranslationsLengthFr extends TranslationsLengthEn {
	TranslationsLengthFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get nanometer => 'Nanomètre';
	@override String get micrometer => 'Micromètre';
	@override String get millimeter => 'Millimètre';
	@override String get centimeter => 'Centimètre';
	@override String get meter => 'Mètre';
	@override String get kilometer => 'Kilomètre';
}

// Path: lengthUs
class TranslationsLengthUsFr extends TranslationsLengthUsEn {
	TranslationsLengthUsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get inch => 'Pouce';
	@override String get foot => 'Pied';
	@override String get yard => 'Yard';
	@override String get mile => 'Mille';
}

// Path: lengthPlural
class TranslationsLengthPluralFr extends TranslationsLengthPluralEn {
	TranslationsLengthPluralFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get nanometer => 'Nanomètres';
	@override String get micrometer => 'Micromètres';
	@override String get millimeter => 'Millimètres';
	@override String get centimeter => 'Centimètres';
	@override String get meter => 'Mètres';
	@override String get kilometer => 'Kilomètres';
}

// Path: weight
class TranslationsWeightFr extends TranslationsWeightEn {
	TranslationsWeightFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get microgram => 'Microgramme';
	@override String get milligram => 'Milligramme';
	@override String get gram => 'Gramme';
	@override String get kilogram => 'Kilogramme';
	@override String get tonne => 'Tonne';
}

// Path: weightUs
class TranslationsWeightUsFr extends TranslationsWeightUsEn {
	TranslationsWeightUsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get ounce => 'Once';
	@override String get pound => 'Livre';
	@override String get stone => 'Stone';
	@override String get shortTon => 'Tonne courte';
	@override String get longTon => 'Tonne longue';
}

// Path: weightPlural
class TranslationsWeightPluralFr extends TranslationsWeightPluralEn {
	TranslationsWeightPluralFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get microgram => 'Microgrammes';
	@override String get milligram => 'Milligrammes';
	@override String get gram => 'Grammes';
	@override String get kilogram => 'Kilogrammes';
	@override String get tonne => 'Tonnes';
}

// Path: volume
class TranslationsVolumeFr extends TranslationsVolumeEn {
	TranslationsVolumeFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get milliliter => 'Millilitre';
	@override String get liter => 'Litre';
	@override String get cubicMeter => 'Mètre cube';
}

// Path: volumeUs
class TranslationsVolumeUsFr extends TranslationsVolumeUsEn {
	TranslationsVolumeUsFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get teaspoon => 'Cuillère à café';
	@override String get tablespoon => 'Cuillère à soupe';
	@override String get fluidOunce => 'Once liquide';
	@override String get cup => 'Tasse';
	@override String get pint => 'Pinte';
	@override String get quart => 'Quart';
	@override String get gallon => 'Gallon';
}

// Path: speed
class TranslationsSpeedFr extends TranslationsSpeedEn {
	TranslationsSpeedFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get kph => 'Kilomètres par heure';
	@override String get mph => 'Miles par heure';
}

// Path: temperature
class TranslationsTemperatureFr extends TranslationsTemperatureEn {
	TranslationsTemperatureFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get celsius => 'Celsius';
	@override String get fahrenheit => 'Fahrenheit';
}

// Path: digital
class TranslationsDigitalFr extends TranslationsDigitalEn {
	TranslationsDigitalFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get bit => 'Bit';
	@override String get byte => 'Octet';
	@override String get kilobyte => 'Kilo-octet';
	@override String get megabyte => 'Méga-octet';
	@override String get gigabyte => 'Giga-octet';
	@override String get terabyte => 'Téra-octet';
	@override String get petabyte => 'Péta-octet';
	@override String get exabyte => 'Exa-octet';
}

// Path: networkSpeed
class TranslationsNetworkSpeedFr extends TranslationsNetworkSpeedEn {
	TranslationsNetworkSpeedFr._(TranslationsFr root) : this._root = root, super.internal(root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get bps => 'Bits par seconde';
	@override String get kbps => 'Kilobits par seconde';
	@override String get mbps => 'Mégabits par seconde';
	@override String get gbps => 'Gigabits par seconde';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.tens': return 'Dizaines';
			case 'numbers.hundreds': return 'Centaines';
			case 'numbers.thousands': return 'Milliers';
			case 'numbers.millions': return 'Millions';
			case 'numbers.billions': return 'Milliards';
			case 'numbers.trillions': return 'Billions';
			case 'numbers.quadrillions': return 'Billiards';
			case 'numbers.quintillions': return 'Trillions';
			case 'numbers.sextillions': return 'Trilliards';
			case 'numbers.septillions': return 'Quadrillions';
			case 'numbers.octillions': return 'Quadrilliards';
			case 'numbers.nonillions': return 'Quintillions';
			case 'length.nanometer': return 'Nanomètre';
			case 'length.micrometer': return 'Micromètre';
			case 'length.millimeter': return 'Millimètre';
			case 'length.centimeter': return 'Centimètre';
			case 'length.meter': return 'Mètre';
			case 'length.kilometer': return 'Kilomètre';
			case 'lengthUs.inch': return 'Pouce';
			case 'lengthUs.foot': return 'Pied';
			case 'lengthUs.yard': return 'Yard';
			case 'lengthUs.mile': return 'Mille';
			case 'lengthPlural.nanometer': return 'Nanomètres';
			case 'lengthPlural.micrometer': return 'Micromètres';
			case 'lengthPlural.millimeter': return 'Millimètres';
			case 'lengthPlural.centimeter': return 'Centimètres';
			case 'lengthPlural.meter': return 'Mètres';
			case 'lengthPlural.kilometer': return 'Kilomètres';
			case 'weight.microgram': return 'Microgramme';
			case 'weight.milligram': return 'Milligramme';
			case 'weight.gram': return 'Gramme';
			case 'weight.kilogram': return 'Kilogramme';
			case 'weight.tonne': return 'Tonne';
			case 'weightUs.ounce': return 'Once';
			case 'weightUs.pound': return 'Livre';
			case 'weightUs.stone': return 'Stone';
			case 'weightUs.shortTon': return 'Tonne courte';
			case 'weightUs.longTon': return 'Tonne longue';
			case 'weightPlural.microgram': return 'Microgrammes';
			case 'weightPlural.milligram': return 'Milligrammes';
			case 'weightPlural.gram': return 'Grammes';
			case 'weightPlural.kilogram': return 'Kilogrammes';
			case 'weightPlural.tonne': return 'Tonnes';
			case 'volume.milliliter': return 'Millilitre';
			case 'volume.liter': return 'Litre';
			case 'volume.cubicMeter': return 'Mètre cube';
			case 'volumeUs.teaspoon': return 'Cuillère à café';
			case 'volumeUs.tablespoon': return 'Cuillère à soupe';
			case 'volumeUs.fluidOunce': return 'Once liquide';
			case 'volumeUs.cup': return 'Tasse';
			case 'volumeUs.pint': return 'Pinte';
			case 'volumeUs.quart': return 'Quart';
			case 'volumeUs.gallon': return 'Gallon';
			case 'speed.kph': return 'Kilomètres par heure';
			case 'speed.mph': return 'Miles par heure';
			case 'temperature.celsius': return 'Celsius';
			case 'temperature.fahrenheit': return 'Fahrenheit';
			case 'digital.bit': return 'Bit';
			case 'digital.byte': return 'Octet';
			case 'digital.kilobyte': return 'Kilo-octet';
			case 'digital.megabyte': return 'Méga-octet';
			case 'digital.gigabyte': return 'Giga-octet';
			case 'digital.terabyte': return 'Téra-octet';
			case 'digital.petabyte': return 'Péta-octet';
			case 'digital.exabyte': return 'Exa-octet';
			case 'networkSpeed.bps': return 'Bits par seconde';
			case 'networkSpeed.kbps': return 'Kilobits par seconde';
			case 'networkSpeed.mbps': return 'Mégabits par seconde';
			case 'networkSpeed.gbps': return 'Gigabits par seconde';
			default: return null;
		}
	}
}

