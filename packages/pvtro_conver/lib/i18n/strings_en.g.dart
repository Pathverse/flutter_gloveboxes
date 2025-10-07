///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final pvtroConver = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsNumbersEn numbers = TranslationsNumbersEn.internal(_root);
	late final TranslationsLengthEn length = TranslationsLengthEn.internal(_root);
	late final TranslationsLengthUsEn lengthUs = TranslationsLengthUsEn.internal(_root);
	late final TranslationsLengthAbbrEn lengthAbbr = TranslationsLengthAbbrEn.internal(_root);
	late final TranslationsLengthAbbrUsEn lengthAbbrUs = TranslationsLengthAbbrUsEn.internal(_root);
	late final TranslationsLengthPluralEn lengthPlural = TranslationsLengthPluralEn.internal(_root);
	late final TranslationsWeightEn weight = TranslationsWeightEn.internal(_root);
	late final TranslationsWeightUsEn weightUs = TranslationsWeightUsEn.internal(_root);
	late final TranslationsWeightAbbrEn weightAbbr = TranslationsWeightAbbrEn.internal(_root);
	late final TranslationsWeightAbbrUsEn weightAbbrUs = TranslationsWeightAbbrUsEn.internal(_root);
	late final TranslationsWeightPluralEn weightPlural = TranslationsWeightPluralEn.internal(_root);
	late final TranslationsVolumeEn volume = TranslationsVolumeEn.internal(_root);
	late final TranslationsVolumeUsEn volumeUs = TranslationsVolumeUsEn.internal(_root);
	late final TranslationsVolumeAbbrEn volumeAbbr = TranslationsVolumeAbbrEn.internal(_root);
	late final TranslationsVolumeAbbrUsEn volumeAbbrUs = TranslationsVolumeAbbrUsEn.internal(_root);
	late final TranslationsSpeedEn speed = TranslationsSpeedEn.internal(_root);
	late final TranslationsTemperatureEn temperature = TranslationsTemperatureEn.internal(_root);
	late final TranslationsDigitalEn digital = TranslationsDigitalEn.internal(_root);
	late final TranslationsDigitalAbbrEn digitalAbbr = TranslationsDigitalAbbrEn.internal(_root);
	late final TranslationsNetworkSpeedEn networkSpeed = TranslationsNetworkSpeedEn.internal(_root);
	late final TranslationsNetworkSpeedAbbrEn networkSpeedAbbr = TranslationsNetworkSpeedAbbrEn.internal(_root);
}

// Path: numbers
class TranslationsNumbersEn {
	TranslationsNumbersEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tens'
	String get tens => 'Tens';

	/// en: 'Hundreds'
	String get hundreds => 'Hundreds';

	/// en: 'Thousands'
	String get thousands => 'Thousands';

	/// en: 'Millions'
	String get millions => 'Millions';

	/// en: 'Billions'
	String get billions => 'Billions';

	/// en: 'Trillions'
	String get trillions => 'Trillions';

	/// en: 'Quadrillions'
	String get quadrillions => 'Quadrillions';

	/// en: 'Quintillions'
	String get quintillions => 'Quintillions';

	/// en: 'Sextillions'
	String get sextillions => 'Sextillions';

	/// en: 'Septillions'
	String get septillions => 'Septillions';

	/// en: 'Octillions'
	String get octillions => 'Octillions';

	/// en: 'Nonillions'
	String get nonillions => 'Nonillions';
}

// Path: length
class TranslationsLengthEn {
	TranslationsLengthEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Nanometer'
	String get nanometer => 'Nanometer';

	/// en: 'Micrometer'
	String get micrometer => 'Micrometer';

	/// en: 'Millimeter'
	String get millimeter => 'Millimeter';

	/// en: 'Centimeter'
	String get centimeter => 'Centimeter';

	/// en: 'Meter'
	String get meter => 'Meter';

	/// en: 'Kilometer'
	String get kilometer => 'Kilometer';
}

// Path: lengthUs
class TranslationsLengthUsEn {
	TranslationsLengthUsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Inch'
	String get inch => 'Inch';

	/// en: 'Foot'
	String get foot => 'Foot';

	/// en: 'Yard'
	String get yard => 'Yard';

	/// en: 'Mile'
	String get mile => 'Mile';
}

// Path: lengthAbbr
class TranslationsLengthAbbrEn {
	TranslationsLengthAbbrEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'nm'
	String get nm => 'nm';

	/// en: 'μm'
	String get um => 'μm';

	/// en: 'mm'
	String get mm => 'mm';

	/// en: 'cm'
	String get cm => 'cm';

	/// en: 'm'
	String get m => 'm';

	/// en: 'km'
	String get km => 'km';
}

// Path: lengthAbbrUs
class TranslationsLengthAbbrUsEn {
	TranslationsLengthAbbrUsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'in'
	String get kIn => 'in';

	/// en: 'ft'
	String get ft => 'ft';

	/// en: 'yd'
	String get yd => 'yd';

	/// en: 'mi'
	String get mi => 'mi';
}

// Path: lengthPlural
class TranslationsLengthPluralEn {
	TranslationsLengthPluralEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Nanometers'
	String get nanometer => 'Nanometers';

	/// en: 'Micrometers'
	String get micrometer => 'Micrometers';

	/// en: 'Millimeters'
	String get millimeter => 'Millimeters';

	/// en: 'Centimeters'
	String get centimeter => 'Centimeters';

	/// en: 'Meters'
	String get meter => 'Meters';

	/// en: 'Kilometers'
	String get kilometer => 'Kilometers';
}

// Path: weight
class TranslationsWeightEn {
	TranslationsWeightEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Microgram'
	String get microgram => 'Microgram';

	/// en: 'Milligram'
	String get milligram => 'Milligram';

	/// en: 'Gram'
	String get gram => 'Gram';

	/// en: 'Kilogram'
	String get kilogram => 'Kilogram';

	/// en: 'Tonne'
	String get tonne => 'Tonne';
}

// Path: weightUs
class TranslationsWeightUsEn {
	TranslationsWeightUsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Ounce'
	String get ounce => 'Ounce';

	/// en: 'Pound'
	String get pound => 'Pound';

	/// en: 'Stone'
	String get stone => 'Stone';

	/// en: 'Short Ton'
	String get shortTon => 'Short Ton';

	/// en: 'Long Ton'
	String get longTon => 'Long Ton';
}

// Path: weightAbbr
class TranslationsWeightAbbrEn {
	TranslationsWeightAbbrEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'μg'
	String get ug => 'μg';

	/// en: 'mg'
	String get mg => 'mg';

	/// en: 'g'
	String get g => 'g';

	/// en: 'kg'
	String get kg => 'kg';

	/// en: 't'
	String get t => 't';
}

// Path: weightAbbrUs
class TranslationsWeightAbbrUsEn {
	TranslationsWeightAbbrUsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'oz'
	String get oz => 'oz';

	/// en: 'lb'
	String get lb => 'lb';

	/// en: 'st'
	String get st => 'st';

	/// en: 'short tn'
	String get shortTon => 'short tn';

	/// en: 'long tn'
	String get longTon => 'long tn';
}

// Path: weightPlural
class TranslationsWeightPluralEn {
	TranslationsWeightPluralEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Micrograms'
	String get microgram => 'Micrograms';

	/// en: 'Milligrams'
	String get milligram => 'Milligrams';

	/// en: 'Grams'
	String get gram => 'Grams';

	/// en: 'Kilograms'
	String get kilogram => 'Kilograms';

	/// en: 'Tonnes'
	String get tonne => 'Tonnes';
}

// Path: volume
class TranslationsVolumeEn {
	TranslationsVolumeEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Milliliter'
	String get milliliter => 'Milliliter';

	/// en: 'Liter'
	String get liter => 'Liter';

	/// en: 'Cubic Meter'
	String get cubicMeter => 'Cubic Meter';
}

// Path: volumeUs
class TranslationsVolumeUsEn {
	TranslationsVolumeUsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Teaspoon'
	String get teaspoon => 'Teaspoon';

	/// en: 'Tablespoon'
	String get tablespoon => 'Tablespoon';

	/// en: 'Fluid Ounce'
	String get fluidOunce => 'Fluid Ounce';

	/// en: 'Cup'
	String get cup => 'Cup';

	/// en: 'Pint'
	String get pint => 'Pint';

	/// en: 'Quart'
	String get quart => 'Quart';

	/// en: 'Gallon'
	String get gallon => 'Gallon';
}

// Path: volumeAbbr
class TranslationsVolumeAbbrEn {
	TranslationsVolumeAbbrEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'mL'
	String get mL => 'mL';

	/// en: 'L'
	String get l => 'L';

	/// en: 'm³'
	String get m3 => 'm³';
}

// Path: volumeAbbrUs
class TranslationsVolumeAbbrUsEn {
	TranslationsVolumeAbbrUsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'tsp'
	String get tsp => 'tsp';

	/// en: 'tbsp'
	String get tbsp => 'tbsp';

	/// en: 'fl oz'
	String get flOz => 'fl oz';

	/// en: 'cup'
	String get cup => 'cup';

	/// en: 'pt'
	String get pt => 'pt';

	/// en: 'qt'
	String get qt => 'qt';

	/// en: 'gal'
	String get gal => 'gal';
}

// Path: speed
class TranslationsSpeedEn {
	TranslationsSpeedEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Kilometers per hour'
	String get kph => 'Kilometers per hour';

	/// en: 'Miles per hour'
	String get mph => 'Miles per hour';
}

// Path: temperature
class TranslationsTemperatureEn {
	TranslationsTemperatureEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Celsius'
	String get celsius => 'Celsius';

	/// en: 'Fahrenheit'
	String get fahrenheit => 'Fahrenheit';
}

// Path: digital
class TranslationsDigitalEn {
	TranslationsDigitalEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Bit'
	String get bit => 'Bit';

	/// en: 'Byte'
	String get byte => 'Byte';

	/// en: 'Kilobyte'
	String get kilobyte => 'Kilobyte';

	/// en: 'Megabyte'
	String get megabyte => 'Megabyte';

	/// en: 'Gigabyte'
	String get gigabyte => 'Gigabyte';

	/// en: 'Terabyte'
	String get terabyte => 'Terabyte';

	/// en: 'Petabyte'
	String get petabyte => 'Petabyte';

	/// en: 'Exabyte'
	String get exabyte => 'Exabyte';
}

// Path: digitalAbbr
class TranslationsDigitalAbbrEn {
	TranslationsDigitalAbbrEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'B'
	String get b => 'B';

	/// en: 'KB'
	String get kb => 'KB';

	/// en: 'MB'
	String get mb => 'MB';

	/// en: 'GB'
	String get gb => 'GB';

	/// en: 'TB'
	String get tb => 'TB';

	/// en: 'PB'
	String get pb => 'PB';

	/// en: 'EB'
	String get eb => 'EB';
}

// Path: networkSpeed
class TranslationsNetworkSpeedEn {
	TranslationsNetworkSpeedEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Bits per second'
	String get bps => 'Bits per second';

	/// en: 'Kilobits per second'
	String get kbps => 'Kilobits per second';

	/// en: 'Megabits per second'
	String get mbps => 'Megabits per second';

	/// en: 'Gigabits per second'
	String get gbps => 'Gigabits per second';
}

// Path: networkSpeedAbbr
class TranslationsNetworkSpeedAbbrEn {
	TranslationsNetworkSpeedAbbrEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'bps'
	String get bps => 'bps';

	/// en: 'kbps'
	String get kbps => 'kbps';

	/// en: 'mbps'
	String get mbps => 'mbps';

	/// en: 'gbps'
	String get gbps => 'gbps';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.tens': return 'Tens';
			case 'numbers.hundreds': return 'Hundreds';
			case 'numbers.thousands': return 'Thousands';
			case 'numbers.millions': return 'Millions';
			case 'numbers.billions': return 'Billions';
			case 'numbers.trillions': return 'Trillions';
			case 'numbers.quadrillions': return 'Quadrillions';
			case 'numbers.quintillions': return 'Quintillions';
			case 'numbers.sextillions': return 'Sextillions';
			case 'numbers.septillions': return 'Septillions';
			case 'numbers.octillions': return 'Octillions';
			case 'numbers.nonillions': return 'Nonillions';
			case 'length.nanometer': return 'Nanometer';
			case 'length.micrometer': return 'Micrometer';
			case 'length.millimeter': return 'Millimeter';
			case 'length.centimeter': return 'Centimeter';
			case 'length.meter': return 'Meter';
			case 'length.kilometer': return 'Kilometer';
			case 'lengthUs.inch': return 'Inch';
			case 'lengthUs.foot': return 'Foot';
			case 'lengthUs.yard': return 'Yard';
			case 'lengthUs.mile': return 'Mile';
			case 'lengthAbbr.nm': return 'nm';
			case 'lengthAbbr.um': return 'μm';
			case 'lengthAbbr.mm': return 'mm';
			case 'lengthAbbr.cm': return 'cm';
			case 'lengthAbbr.m': return 'm';
			case 'lengthAbbr.km': return 'km';
			case 'lengthAbbrUs.kIn': return 'in';
			case 'lengthAbbrUs.ft': return 'ft';
			case 'lengthAbbrUs.yd': return 'yd';
			case 'lengthAbbrUs.mi': return 'mi';
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
			case 'weight.tonne': return 'Tonne';
			case 'weightUs.ounce': return 'Ounce';
			case 'weightUs.pound': return 'Pound';
			case 'weightUs.stone': return 'Stone';
			case 'weightUs.shortTon': return 'Short Ton';
			case 'weightUs.longTon': return 'Long Ton';
			case 'weightAbbr.ug': return 'μg';
			case 'weightAbbr.mg': return 'mg';
			case 'weightAbbr.g': return 'g';
			case 'weightAbbr.kg': return 'kg';
			case 'weightAbbr.t': return 't';
			case 'weightAbbrUs.oz': return 'oz';
			case 'weightAbbrUs.lb': return 'lb';
			case 'weightAbbrUs.st': return 'st';
			case 'weightAbbrUs.shortTon': return 'short tn';
			case 'weightAbbrUs.longTon': return 'long tn';
			case 'weightPlural.microgram': return 'Micrograms';
			case 'weightPlural.milligram': return 'Milligrams';
			case 'weightPlural.gram': return 'Grams';
			case 'weightPlural.kilogram': return 'Kilograms';
			case 'weightPlural.tonne': return 'Tonnes';
			case 'volume.milliliter': return 'Milliliter';
			case 'volume.liter': return 'Liter';
			case 'volume.cubicMeter': return 'Cubic Meter';
			case 'volumeUs.teaspoon': return 'Teaspoon';
			case 'volumeUs.tablespoon': return 'Tablespoon';
			case 'volumeUs.fluidOunce': return 'Fluid Ounce';
			case 'volumeUs.cup': return 'Cup';
			case 'volumeUs.pint': return 'Pint';
			case 'volumeUs.quart': return 'Quart';
			case 'volumeUs.gallon': return 'Gallon';
			case 'volumeAbbr.mL': return 'mL';
			case 'volumeAbbr.l': return 'L';
			case 'volumeAbbr.m3': return 'm³';
			case 'volumeAbbrUs.tsp': return 'tsp';
			case 'volumeAbbrUs.tbsp': return 'tbsp';
			case 'volumeAbbrUs.flOz': return 'fl oz';
			case 'volumeAbbrUs.cup': return 'cup';
			case 'volumeAbbrUs.pt': return 'pt';
			case 'volumeAbbrUs.qt': return 'qt';
			case 'volumeAbbrUs.gal': return 'gal';
			case 'speed.kph': return 'Kilometers per hour';
			case 'speed.mph': return 'Miles per hour';
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
			case 'digitalAbbr.b': return 'B';
			case 'digitalAbbr.kb': return 'KB';
			case 'digitalAbbr.mb': return 'MB';
			case 'digitalAbbr.gb': return 'GB';
			case 'digitalAbbr.tb': return 'TB';
			case 'digitalAbbr.pb': return 'PB';
			case 'digitalAbbr.eb': return 'EB';
			case 'networkSpeed.bps': return 'Bits per second';
			case 'networkSpeed.kbps': return 'Kilobits per second';
			case 'networkSpeed.mbps': return 'Megabits per second';
			case 'networkSpeed.gbps': return 'Gigabits per second';
			case 'networkSpeedAbbr.bps': return 'bps';
			case 'networkSpeedAbbr.kbps': return 'kbps';
			case 'networkSpeedAbbr.mbps': return 'mbps';
			case 'networkSpeedAbbr.gbps': return 'gbps';
			default: return null;
		}
	}
}

