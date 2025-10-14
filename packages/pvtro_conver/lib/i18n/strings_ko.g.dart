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
class TranslationsKo extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsKo({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ko,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ko>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsKo _root = this; // ignore: unused_field

	@override 
	TranslationsKo $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsKo(meta: meta ?? this.$meta);

	// Translations
	@override late final TranslationsNumbersKo numbers = TranslationsNumbersKo._(_root);
	@override late final TranslationsLengthKo length = TranslationsLengthKo._(_root);
	@override late final TranslationsLengthUsKo lengthUs = TranslationsLengthUsKo._(_root);
	@override late final TranslationsLengthPluralKo lengthPlural = TranslationsLengthPluralKo._(_root);
	@override late final TranslationsWeightKo weight = TranslationsWeightKo._(_root);
	@override late final TranslationsWeightUsKo weightUs = TranslationsWeightUsKo._(_root);
	@override late final TranslationsWeightPluralKo weightPlural = TranslationsWeightPluralKo._(_root);
	@override late final TranslationsVolumeKo volume = TranslationsVolumeKo._(_root);
	@override late final TranslationsVolumeUsKo volumeUs = TranslationsVolumeUsKo._(_root);
	@override late final TranslationsSpeedKo speed = TranslationsSpeedKo._(_root);
	@override late final TranslationsTemperatureKo temperature = TranslationsTemperatureKo._(_root);
	@override late final TranslationsDigitalKo digital = TranslationsDigitalKo._(_root);
	@override late final TranslationsNetworkSpeedKo networkSpeed = TranslationsNetworkSpeedKo._(_root);
}

// Path: numbers
class TranslationsNumbersKo extends TranslationsNumbersEn {
	TranslationsNumbersKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get tens => '십의 자리';
	@override String get hundreds => '백의 자리';
	@override String get thousands => '천의 자리';
	@override String get millions => '백만';
	@override String get billions => '십억';
	@override String get trillions => '조';
	@override String get quadrillions => '천조';
	@override String get quintillions => '경';
	@override String get sextillions => '천경';
	@override String get septillions => '해';
	@override String get octillions => '천해';
	@override String get nonillions => '자';
}

// Path: length
class TranslationsLengthKo extends TranslationsLengthEn {
	TranslationsLengthKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get nanometer => '나노미터';
	@override String get micrometer => '마이크로미터';
	@override String get millimeter => '밀리미터';
	@override String get centimeter => '센티미터';
	@override String get meter => '미터';
	@override String get kilometer => '킬로미터';
}

// Path: lengthUs
class TranslationsLengthUsKo extends TranslationsLengthUsEn {
	TranslationsLengthUsKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get inch => '인치';
	@override String get foot => '피트';
	@override String get yard => '야드';
	@override String get mile => '마일';
}

// Path: lengthPlural
class TranslationsLengthPluralKo extends TranslationsLengthPluralEn {
	TranslationsLengthPluralKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get nanometer => '나노미터';
	@override String get micrometer => '마이크로미터';
	@override String get millimeter => '밀리미터';
	@override String get centimeter => '센티미터';
	@override String get meter => '미터';
	@override String get kilometer => '킬로미터';
}

// Path: weight
class TranslationsWeightKo extends TranslationsWeightEn {
	TranslationsWeightKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get microgram => '마이크로그램';
	@override String get milligram => '밀리그램';
	@override String get gram => '그램';
	@override String get kilogram => '킬로그램';
	@override String get tonne => '톤';
}

// Path: weightUs
class TranslationsWeightUsKo extends TranslationsWeightUsEn {
	TranslationsWeightUsKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get ounce => '온스';
	@override String get pound => '파운드';
	@override String get stone => '스톤';
	@override String get shortTon => '숏톤';
	@override String get longTon => '롱톤';
}

// Path: weightPlural
class TranslationsWeightPluralKo extends TranslationsWeightPluralEn {
	TranslationsWeightPluralKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get microgram => '마이크로그램';
	@override String get milligram => '밀리그램';
	@override String get gram => '그램';
	@override String get kilogram => '킬로그램';
	@override String get tonne => '톤';
}

// Path: volume
class TranslationsVolumeKo extends TranslationsVolumeEn {
	TranslationsVolumeKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get milliliter => '밀리리터';
	@override String get liter => '리터';
	@override String get cubicMeter => '세제곱미터';
}

// Path: volumeUs
class TranslationsVolumeUsKo extends TranslationsVolumeUsEn {
	TranslationsVolumeUsKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get teaspoon => '티스푼';
	@override String get tablespoon => '테이블스푼';
	@override String get fluidOunce => '플루이드 온스';
	@override String get cup => '컵';
	@override String get pint => '파인트';
	@override String get quart => '쿼트';
	@override String get gallon => '갤론';
}

// Path: speed
class TranslationsSpeedKo extends TranslationsSpeedEn {
	TranslationsSpeedKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get kph => '시간당 킬로미터';
	@override String get mph => '시간당 마일';
}

// Path: temperature
class TranslationsTemperatureKo extends TranslationsTemperatureEn {
	TranslationsTemperatureKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get celsius => '섭씨';
	@override String get fahrenheit => '화씨';
}

// Path: digital
class TranslationsDigitalKo extends TranslationsDigitalEn {
	TranslationsDigitalKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get bit => '비트';
	@override String get byte => '바이트';
	@override String get kilobyte => '킬로바이트';
	@override String get megabyte => '메가바이트';
	@override String get gigabyte => '기가바이트';
	@override String get terabyte => '테라바이트';
	@override String get petabyte => '페타바이트';
	@override String get exabyte => '엑사바이트';
}

// Path: networkSpeed
class TranslationsNetworkSpeedKo extends TranslationsNetworkSpeedEn {
	TranslationsNetworkSpeedKo._(TranslationsKo root) : this._root = root, super.internal(root);

	final TranslationsKo _root; // ignore: unused_field

	// Translations
	@override String get bps => '초당 비트';
	@override String get kbps => '초당 킬로비트';
	@override String get mbps => '초당 메가비트';
	@override String get gbps => '초당 기가비트';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsKo {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'numbers.tens': return '십의 자리';
			case 'numbers.hundreds': return '백의 자리';
			case 'numbers.thousands': return '천의 자리';
			case 'numbers.millions': return '백만';
			case 'numbers.billions': return '십억';
			case 'numbers.trillions': return '조';
			case 'numbers.quadrillions': return '천조';
			case 'numbers.quintillions': return '경';
			case 'numbers.sextillions': return '천경';
			case 'numbers.septillions': return '해';
			case 'numbers.octillions': return '천해';
			case 'numbers.nonillions': return '자';
			case 'length.nanometer': return '나노미터';
			case 'length.micrometer': return '마이크로미터';
			case 'length.millimeter': return '밀리미터';
			case 'length.centimeter': return '센티미터';
			case 'length.meter': return '미터';
			case 'length.kilometer': return '킬로미터';
			case 'lengthUs.inch': return '인치';
			case 'lengthUs.foot': return '피트';
			case 'lengthUs.yard': return '야드';
			case 'lengthUs.mile': return '마일';
			case 'lengthPlural.nanometer': return '나노미터';
			case 'lengthPlural.micrometer': return '마이크로미터';
			case 'lengthPlural.millimeter': return '밀리미터';
			case 'lengthPlural.centimeter': return '센티미터';
			case 'lengthPlural.meter': return '미터';
			case 'lengthPlural.kilometer': return '킬로미터';
			case 'weight.microgram': return '마이크로그램';
			case 'weight.milligram': return '밀리그램';
			case 'weight.gram': return '그램';
			case 'weight.kilogram': return '킬로그램';
			case 'weight.tonne': return '톤';
			case 'weightUs.ounce': return '온스';
			case 'weightUs.pound': return '파운드';
			case 'weightUs.stone': return '스톤';
			case 'weightUs.shortTon': return '숏톤';
			case 'weightUs.longTon': return '롱톤';
			case 'weightPlural.microgram': return '마이크로그램';
			case 'weightPlural.milligram': return '밀리그램';
			case 'weightPlural.gram': return '그램';
			case 'weightPlural.kilogram': return '킬로그램';
			case 'weightPlural.tonne': return '톤';
			case 'volume.milliliter': return '밀리리터';
			case 'volume.liter': return '리터';
			case 'volume.cubicMeter': return '세제곱미터';
			case 'volumeUs.teaspoon': return '티스푼';
			case 'volumeUs.tablespoon': return '테이블스푼';
			case 'volumeUs.fluidOunce': return '플루이드 온스';
			case 'volumeUs.cup': return '컵';
			case 'volumeUs.pint': return '파인트';
			case 'volumeUs.quart': return '쿼트';
			case 'volumeUs.gallon': return '갤론';
			case 'speed.kph': return '시간당 킬로미터';
			case 'speed.mph': return '시간당 마일';
			case 'temperature.celsius': return '섭씨';
			case 'temperature.fahrenheit': return '화씨';
			case 'digital.bit': return '비트';
			case 'digital.byte': return '바이트';
			case 'digital.kilobyte': return '킬로바이트';
			case 'digital.megabyte': return '메가바이트';
			case 'digital.gigabyte': return '기가바이트';
			case 'digital.terabyte': return '테라바이트';
			case 'digital.petabyte': return '페타바이트';
			case 'digital.exabyte': return '엑사바이트';
			case 'networkSpeed.bps': return '초당 비트';
			case 'networkSpeed.kbps': return '초당 킬로비트';
			case 'networkSpeed.mbps': return '초당 메가비트';
			case 'networkSpeed.gbps': return '초당 기가비트';
			default: return null;
		}
	}
}

