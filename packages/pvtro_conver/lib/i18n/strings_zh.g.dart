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
class TranslationsZh extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsZh _root = this; // ignore: unused_field

	@override 
	TranslationsZh $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZh(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsNumbersZh numbers = TranslationsNumbersZh._(_root);
	@override late final TranslationsLengthZh length = TranslationsLengthZh._(_root);
	@override late final TranslationsLengthUsZh lengthUs = TranslationsLengthUsZh._(_root);
	@override late final TranslationsLengthPluralZh lengthPlural = TranslationsLengthPluralZh._(_root);
	@override late final TranslationsWeightZh weight = TranslationsWeightZh._(_root);
	@override late final TranslationsWeightUsZh weightUs = TranslationsWeightUsZh._(_root);
	@override late final TranslationsWeightPluralZh weightPlural = TranslationsWeightPluralZh._(_root);
	@override late final TranslationsVolumeZh volume = TranslationsVolumeZh._(_root);
	@override late final TranslationsVolumeUsZh volumeUs = TranslationsVolumeUsZh._(_root);
	@override late final TranslationsSpeedZh speed = TranslationsSpeedZh._(_root);
	@override late final TranslationsTemperatureZh temperature = TranslationsTemperatureZh._(_root);
	@override late final TranslationsDigitalZh digital = TranslationsDigitalZh._(_root);
	@override late final TranslationsNetworkSpeedZh networkSpeed = TranslationsNetworkSpeedZh._(_root);
}

// Path: numbers
class TranslationsNumbersZh extends TranslationsNumbersEn {
	TranslationsNumbersZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get tens => '十位';
	@override String get hundreds => '百位';
	@override String get thousands => '千位';
	@override String get millions => '百萬';
	@override String get billions => '十億';
	@override String get trillions => '萬億';
	@override String get quadrillions => '千萬億';
	@override String get quintillions => '百京';
	@override String get sextillions => '十垓';
	@override String get septillions => '萬垓';
	@override String get octillions => '千萬垓';
	@override String get nonillions => '百秭';
}

// Path: length
class TranslationsLengthZh extends TranslationsLengthEn {
	TranslationsLengthZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get nanometer => '奈米';
	@override String get micrometer => '微米';
	@override String get millimeter => '毫米';
	@override String get centimeter => '公分';
	@override String get meter => '公尺';
	@override String get kilometer => '公里';
}

// Path: lengthUs
class TranslationsLengthUsZh extends TranslationsLengthUsEn {
	TranslationsLengthUsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get inch => '英吋';
	@override String get foot => '英尺';
	@override String get yard => '碼';
	@override String get mile => '英里';
}

// Path: lengthPlural
class TranslationsLengthPluralZh extends TranslationsLengthPluralEn {
	TranslationsLengthPluralZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get nanometer => '奈米';
	@override String get micrometer => '微米';
	@override String get millimeter => '毫米';
	@override String get centimeter => '公分';
	@override String get meter => '公尺';
	@override String get kilometer => '公里';
}

// Path: weight
class TranslationsWeightZh extends TranslationsWeightEn {
	TranslationsWeightZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get microgram => '微克';
	@override String get milligram => '毫克';
	@override String get gram => '克';
	@override String get kilogram => '公斤';
	@override String get tonne => '公噸';
}

// Path: weightUs
class TranslationsWeightUsZh extends TranslationsWeightUsEn {
	TranslationsWeightUsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get ounce => '盎司';
	@override String get pound => '磅';
	@override String get stone => '英石';
	@override String get shortTon => '短噸';
	@override String get longTon => '長噸';
}

// Path: weightPlural
class TranslationsWeightPluralZh extends TranslationsWeightPluralEn {
	TranslationsWeightPluralZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get microgram => '微克';
	@override String get milligram => '毫克';
	@override String get gram => '克';
	@override String get kilogram => '公斤';
	@override String get tonne => '公噸';
}

// Path: volume
class TranslationsVolumeZh extends TranslationsVolumeEn {
	TranslationsVolumeZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get milliliter => '毫升';
	@override String get liter => '公升';
	@override String get cubicMeter => '立方公尺';
}

// Path: volumeUs
class TranslationsVolumeUsZh extends TranslationsVolumeUsEn {
	TranslationsVolumeUsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get teaspoon => '茶匙';
	@override String get tablespoon => '湯匙';
	@override String get fluidOunce => '液體盎司';
	@override String get cup => '杯';
	@override String get pint => '品脫';
	@override String get quart => '夸脫';
	@override String get gallon => '加侖';
}

// Path: speed
class TranslationsSpeedZh extends TranslationsSpeedEn {
	TranslationsSpeedZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get kph => '公里每小時';
	@override String get mph => '英里每小時';
}

// Path: temperature
class TranslationsTemperatureZh extends TranslationsTemperatureEn {
	TranslationsTemperatureZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get celsius => '攝氏度';
	@override String get fahrenheit => '華氏度';
}

// Path: digital
class TranslationsDigitalZh extends TranslationsDigitalEn {
	TranslationsDigitalZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get bit => '位元';
	@override String get byte => '位元組';
	@override String get kilobyte => '千位元組';
	@override String get megabyte => '百萬位元組';
	@override String get gigabyte => '十億位元組';
	@override String get terabyte => '兆位元組';
	@override String get petabyte => '千兆位元組';
	@override String get exabyte => '百京位元組';
}

// Path: networkSpeed
class TranslationsNetworkSpeedZh extends TranslationsNetworkSpeedEn {
	TranslationsNetworkSpeedZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get bps => '位元每秒';
	@override String get kbps => '千位元每秒';
	@override String get mbps => '百萬位元每秒';
	@override String get gbps => '十億位元每秒';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsZh {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.tens': return '十位';
			case 'numbers.hundreds': return '百位';
			case 'numbers.thousands': return '千位';
			case 'numbers.millions': return '百萬';
			case 'numbers.billions': return '十億';
			case 'numbers.trillions': return '萬億';
			case 'numbers.quadrillions': return '千萬億';
			case 'numbers.quintillions': return '百京';
			case 'numbers.sextillions': return '十垓';
			case 'numbers.septillions': return '萬垓';
			case 'numbers.octillions': return '千萬垓';
			case 'numbers.nonillions': return '百秭';
			case 'length.nanometer': return '奈米';
			case 'length.micrometer': return '微米';
			case 'length.millimeter': return '毫米';
			case 'length.centimeter': return '公分';
			case 'length.meter': return '公尺';
			case 'length.kilometer': return '公里';
			case 'lengthUs.inch': return '英吋';
			case 'lengthUs.foot': return '英尺';
			case 'lengthUs.yard': return '碼';
			case 'lengthUs.mile': return '英里';
			case 'lengthPlural.nanometer': return '奈米';
			case 'lengthPlural.micrometer': return '微米';
			case 'lengthPlural.millimeter': return '毫米';
			case 'lengthPlural.centimeter': return '公分';
			case 'lengthPlural.meter': return '公尺';
			case 'lengthPlural.kilometer': return '公里';
			case 'weight.microgram': return '微克';
			case 'weight.milligram': return '毫克';
			case 'weight.gram': return '克';
			case 'weight.kilogram': return '公斤';
			case 'weight.tonne': return '公噸';
			case 'weightUs.ounce': return '盎司';
			case 'weightUs.pound': return '磅';
			case 'weightUs.stone': return '英石';
			case 'weightUs.shortTon': return '短噸';
			case 'weightUs.longTon': return '長噸';
			case 'weightPlural.microgram': return '微克';
			case 'weightPlural.milligram': return '毫克';
			case 'weightPlural.gram': return '克';
			case 'weightPlural.kilogram': return '公斤';
			case 'weightPlural.tonne': return '公噸';
			case 'volume.milliliter': return '毫升';
			case 'volume.liter': return '公升';
			case 'volume.cubicMeter': return '立方公尺';
			case 'volumeUs.teaspoon': return '茶匙';
			case 'volumeUs.tablespoon': return '湯匙';
			case 'volumeUs.fluidOunce': return '液體盎司';
			case 'volumeUs.cup': return '杯';
			case 'volumeUs.pint': return '品脫';
			case 'volumeUs.quart': return '夸脫';
			case 'volumeUs.gallon': return '加侖';
			case 'speed.kph': return '公里每小時';
			case 'speed.mph': return '英里每小時';
			case 'temperature.celsius': return '攝氏度';
			case 'temperature.fahrenheit': return '華氏度';
			case 'digital.bit': return '位元';
			case 'digital.byte': return '位元組';
			case 'digital.kilobyte': return '千位元組';
			case 'digital.megabyte': return '百萬位元組';
			case 'digital.gigabyte': return '十億位元組';
			case 'digital.terabyte': return '兆位元組';
			case 'digital.petabyte': return '千兆位元組';
			case 'digital.exabyte': return '百京位元組';
			case 'networkSpeed.bps': return '位元每秒';
			case 'networkSpeed.kbps': return '千位元每秒';
			case 'networkSpeed.mbps': return '百萬位元每秒';
			case 'networkSpeed.gbps': return '十億位元每秒';
			default: return null;
		}
	}
}

