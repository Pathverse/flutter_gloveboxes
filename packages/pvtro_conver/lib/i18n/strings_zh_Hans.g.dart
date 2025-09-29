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
class TranslationsZhHans extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhHans({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhHans,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-Hans>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsZhHans _root = this; // ignore: unused_field

	@override 
	TranslationsZhHans $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhHans(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsNumbersZhHans numbers = TranslationsNumbersZhHans._(_root);
	@override late final TranslationsLengthZhHans length = TranslationsLengthZhHans._(_root);
	@override late final TranslationsLengthUsZhHans lengthUs = TranslationsLengthUsZhHans._(_root);
	@override late final TranslationsLengthPluralZhHans lengthPlural = TranslationsLengthPluralZhHans._(_root);
	@override late final TranslationsWeightZhHans weight = TranslationsWeightZhHans._(_root);
	@override late final TranslationsWeightUsZhHans weightUs = TranslationsWeightUsZhHans._(_root);
	@override late final TranslationsWeightPluralZhHans weightPlural = TranslationsWeightPluralZhHans._(_root);
	@override late final TranslationsVolumeZhHans volume = TranslationsVolumeZhHans._(_root);
	@override late final TranslationsVolumeUsZhHans volumeUs = TranslationsVolumeUsZhHans._(_root);
	@override late final TranslationsSpeedZhHans speed = TranslationsSpeedZhHans._(_root);
	@override late final TranslationsTemperatureZhHans temperature = TranslationsTemperatureZhHans._(_root);
	@override late final TranslationsDigitalZhHans digital = TranslationsDigitalZhHans._(_root);
	@override late final TranslationsNetworkSpeedZhHans networkSpeed = TranslationsNetworkSpeedZhHans._(_root);
}

// Path: numbers
class TranslationsNumbersZhHans extends TranslationsNumbersEn {
	TranslationsNumbersZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get tens => '十位';
	@override String get hundreds => '百位';
	@override String get thousands => '千位';
	@override String get millions => '百万';
	@override String get billions => '十亿';
	@override String get trillions => '万亿';
	@override String get quadrillions => '千万亿';
	@override String get quintillions => '百京';
	@override String get sextillions => '十垓';
	@override String get septillions => '万垓';
	@override String get octillions => '千万垓';
	@override String get nonillions => '百秭';
}

// Path: length
class TranslationsLengthZhHans extends TranslationsLengthEn {
	TranslationsLengthZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get nanometer => '纳米';
	@override String get micrometer => '微米';
	@override String get millimeter => '毫米';
	@override String get centimeter => '厘米';
	@override String get meter => '米';
	@override String get kilometer => '千米';
}

// Path: lengthUs
class TranslationsLengthUsZhHans extends TranslationsLengthUsEn {
	TranslationsLengthUsZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get inch => '英寸';
	@override String get foot => '英尺';
	@override String get yard => '码';
	@override String get mile => '英里';
}

// Path: lengthPlural
class TranslationsLengthPluralZhHans extends TranslationsLengthPluralEn {
	TranslationsLengthPluralZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get nanometer => '纳米';
	@override String get micrometer => '微米';
	@override String get millimeter => '毫米';
	@override String get centimeter => '厘米';
	@override String get meter => '米';
	@override String get kilometer => '千米';
}

// Path: weight
class TranslationsWeightZhHans extends TranslationsWeightEn {
	TranslationsWeightZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get microgram => '微克';
	@override String get milligram => '毫克';
	@override String get gram => '克';
	@override String get kilogram => '千克';
	@override String get tonne => '吨';
}

// Path: weightUs
class TranslationsWeightUsZhHans extends TranslationsWeightUsEn {
	TranslationsWeightUsZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get ounce => '盎司';
	@override String get pound => '磅';
	@override String get stone => '英石';
	@override String get shortTon => '短吨';
	@override String get longTon => '长吨';
}

// Path: weightPlural
class TranslationsWeightPluralZhHans extends TranslationsWeightPluralEn {
	TranslationsWeightPluralZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get microgram => '微克';
	@override String get milligram => '毫克';
	@override String get gram => '克';
	@override String get kilogram => '千克';
	@override String get tonne => '吨';
}

// Path: volume
class TranslationsVolumeZhHans extends TranslationsVolumeEn {
	TranslationsVolumeZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get milliliter => '毫升';
	@override String get liter => '升';
	@override String get cubicMeter => '立方米';
}

// Path: volumeUs
class TranslationsVolumeUsZhHans extends TranslationsVolumeUsEn {
	TranslationsVolumeUsZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get teaspoon => '茶匙';
	@override String get tablespoon => '汤匙';
	@override String get fluidOunce => '液体盎司';
	@override String get cup => '杯';
	@override String get pint => '品脱';
	@override String get quart => '夸脱';
	@override String get gallon => '加仑';
}

// Path: speed
class TranslationsSpeedZhHans extends TranslationsSpeedEn {
	TranslationsSpeedZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get kph => '千米每小时';
	@override String get mph => '英里每小时';
}

// Path: temperature
class TranslationsTemperatureZhHans extends TranslationsTemperatureEn {
	TranslationsTemperatureZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get celsius => '摄氏度';
	@override String get fahrenheit => '华氏度';
}

// Path: digital
class TranslationsDigitalZhHans extends TranslationsDigitalEn {
	TranslationsDigitalZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get bit => '位';
	@override String get byte => '字节';
	@override String get kilobyte => '千字节';
	@override String get megabyte => '兆字节';
	@override String get gigabyte => '吉字节';
	@override String get terabyte => '太字节';
	@override String get petabyte => '拍字节';
	@override String get exabyte => '艾字节';
}

// Path: networkSpeed
class TranslationsNetworkSpeedZhHans extends TranslationsNetworkSpeedEn {
	TranslationsNetworkSpeedZhHans._(TranslationsZhHans root) : this._root = root, super.internal(root);

	final TranslationsZhHans _root; // ignore: unused_field

	// Translations
	@override String get bps => '位每秒';
	@override String get kbps => '千位每秒';
	@override String get mbps => '兆位每秒';
	@override String get gbps => '吉位每秒';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsZhHans {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.tens': return '十位';
			case 'numbers.hundreds': return '百位';
			case 'numbers.thousands': return '千位';
			case 'numbers.millions': return '百万';
			case 'numbers.billions': return '十亿';
			case 'numbers.trillions': return '万亿';
			case 'numbers.quadrillions': return '千万亿';
			case 'numbers.quintillions': return '百京';
			case 'numbers.sextillions': return '十垓';
			case 'numbers.septillions': return '万垓';
			case 'numbers.octillions': return '千万垓';
			case 'numbers.nonillions': return '百秭';
			case 'length.nanometer': return '纳米';
			case 'length.micrometer': return '微米';
			case 'length.millimeter': return '毫米';
			case 'length.centimeter': return '厘米';
			case 'length.meter': return '米';
			case 'length.kilometer': return '千米';
			case 'lengthUs.inch': return '英寸';
			case 'lengthUs.foot': return '英尺';
			case 'lengthUs.yard': return '码';
			case 'lengthUs.mile': return '英里';
			case 'lengthPlural.nanometer': return '纳米';
			case 'lengthPlural.micrometer': return '微米';
			case 'lengthPlural.millimeter': return '毫米';
			case 'lengthPlural.centimeter': return '厘米';
			case 'lengthPlural.meter': return '米';
			case 'lengthPlural.kilometer': return '千米';
			case 'weight.microgram': return '微克';
			case 'weight.milligram': return '毫克';
			case 'weight.gram': return '克';
			case 'weight.kilogram': return '千克';
			case 'weight.tonne': return '吨';
			case 'weightUs.ounce': return '盎司';
			case 'weightUs.pound': return '磅';
			case 'weightUs.stone': return '英石';
			case 'weightUs.shortTon': return '短吨';
			case 'weightUs.longTon': return '长吨';
			case 'weightPlural.microgram': return '微克';
			case 'weightPlural.milligram': return '毫克';
			case 'weightPlural.gram': return '克';
			case 'weightPlural.kilogram': return '千克';
			case 'weightPlural.tonne': return '吨';
			case 'volume.milliliter': return '毫升';
			case 'volume.liter': return '升';
			case 'volume.cubicMeter': return '立方米';
			case 'volumeUs.teaspoon': return '茶匙';
			case 'volumeUs.tablespoon': return '汤匙';
			case 'volumeUs.fluidOunce': return '液体盎司';
			case 'volumeUs.cup': return '杯';
			case 'volumeUs.pint': return '品脱';
			case 'volumeUs.quart': return '夸脱';
			case 'volumeUs.gallon': return '加仑';
			case 'speed.kph': return '千米每小时';
			case 'speed.mph': return '英里每小时';
			case 'temperature.celsius': return '摄氏度';
			case 'temperature.fahrenheit': return '华氏度';
			case 'digital.bit': return '位';
			case 'digital.byte': return '字节';
			case 'digital.kilobyte': return '千字节';
			case 'digital.megabyte': return '兆字节';
			case 'digital.gigabyte': return '吉字节';
			case 'digital.terabyte': return '太字节';
			case 'digital.petabyte': return '拍字节';
			case 'digital.exabyte': return '艾字节';
			case 'networkSpeed.bps': return '位每秒';
			case 'networkSpeed.kbps': return '千位每秒';
			case 'networkSpeed.mbps': return '兆位每秒';
			case 'networkSpeed.gbps': return '吉位每秒';
			default: return null;
		}
	}
}

