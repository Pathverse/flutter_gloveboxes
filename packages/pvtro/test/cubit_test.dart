import 'package:flutter_test/flutter_test.dart';
import 'package:pvtro/cubit.dart';
import 'package:pvtro/enums.dart';

void main() {
  group('LocaleCubit', () {
    test('should create cubit with default locale', () {
      final cubit = LocaleCubit<UnifiedLanguage>(
        defaultLocale: UnifiedLanguage.en,
        enumToLanguageCode: (locale) => locale.languageCode,
        languageCodeToEnum: (code) =>
            UnifiedLanguageExtension.fromLanguageCode(code),
      );

      expect(cubit.state, equals(UnifiedLanguage.en));
      expect(cubit.currentLanguageCode, equals('en'));
    });

    test('should change locale and call subpackage setters', () async {
      final calledLanguageCodes = <String>[];

      final cubit = LocaleCubit<UnifiedLanguage>(
        defaultLocale: UnifiedLanguage.en,
        enumToLanguageCode: (locale) => locale.languageCode,
        languageCodeToEnum: (code) =>
            UnifiedLanguageExtension.fromLanguageCode(code),
        subpackageLocaleSetters: [
          (code) => calledLanguageCodes.add('package1:$code'),
          (code) => calledLanguageCodes.add('package2:$code'),
        ],
      );

      await cubit.changeLocale(UnifiedLanguage.da);

      expect(cubit.state, equals(UnifiedLanguage.da));
      expect(cubit.currentLanguageCode, equals('da'));
      expect(calledLanguageCodes, contains('package1:da'));
      expect(calledLanguageCodes, contains('package2:da'));
    });
  });
}
