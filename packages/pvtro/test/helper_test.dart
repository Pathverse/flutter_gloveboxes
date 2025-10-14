import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pvtro/helper.dart';
import 'package:pvtro/cubit.dart';

// Test enum for testing purposes - matching generated format
enum TestLanguage { en, es, fr, zhHans, enUs, deDe }

extension TestLanguageExtension on TestLanguage {
  String get languageCode {
    switch (this) {
      case TestLanguage.en:
        return 'en';
      case TestLanguage.es:
        return 'es';
      case TestLanguage.fr:
        return 'fr';
      case TestLanguage.zhHans:
        return 'zhHans';
      case TestLanguage.enUs:
        return 'en_us';
      case TestLanguage.deDe:
        return 'de_de';
    }
  }

  static TestLanguage? fromLanguageCode(String code) {
    switch (code.toLowerCase()) {
      case 'en':
        return TestLanguage.en;
      case 'es':
        return TestLanguage.es;
      case 'fr':
        return TestLanguage.fr;
      case 'zhhans':
        return TestLanguage.zhHans;
      case 'en_us':
        return TestLanguage.enUs;
      case 'de_de':
        return TestLanguage.deDe;
      default:
        return null;
    }
  }
}

void main() {
  group('Helper Functions', () {
    group('localeToLanguageCode', () {
      test('converts simple locales', () {
        expect(localeToLanguageCode(const Locale('en')), equals('en'));
        expect(localeToLanguageCode(const Locale('fr')), equals('fr'));
        expect(localeToLanguageCode(const Locale('de')), equals('de'));
      });

      test('converts locales with country codes', () {
        expect(localeToLanguageCode(const Locale('en', 'US')), equals('en_us'));
        expect(localeToLanguageCode(const Locale('es', 'ES')), equals('es_es'));
        expect(localeToLanguageCode(const Locale('de', 'DE')), equals('de_de'));
      });

      test('converts locales with script codes', () {
        expect(
          localeToLanguageCode(
            const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
          ),
          equals('zhHans'),
        );
        expect(
          localeToLanguageCode(
            const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
          ),
          equals('zhHant'),
        );
      });

      test('converts complex locales with script and country codes', () {
        expect(
          localeToLanguageCode(
            const Locale.fromSubtags(
              languageCode: 'zh',
              scriptCode: 'Hans',
              countryCode: 'CN',
            ),
          ),
          equals('zh_Hans_CN'),
        );
      });
    });

    group('languageCodeToLocale', () {
      test('converts simple language codes', () {
        expect(languageCodeToLocale('en'), equals(const Locale('en')));
        expect(languageCodeToLocale('fr'), equals(const Locale('fr')));
        expect(languageCodeToLocale('de'), equals(const Locale('de')));
      });

      test('converts language codes with country codes', () {
        expect(languageCodeToLocale('en_us'), equals(const Locale('en', 'US')));
        expect(languageCodeToLocale('es_es'), equals(const Locale('es', 'ES')));
        expect(languageCodeToLocale('de_de'), equals(const Locale('de', 'DE')));
      });

      test('converts language codes with script codes', () {
        expect(
          languageCodeToLocale('zhHans'),
          equals(
            const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
          ),
        );
        expect(
          languageCodeToLocale('zhHant'),
          equals(
            const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
          ),
        );
      });

      test('converts complex language codes', () {
        expect(
          languageCodeToLocale('zh_Hans_CN'),
          equals(
            const Locale.fromSubtags(
              languageCode: 'zh',
              scriptCode: 'Hans',
              countryCode: 'CN',
            ),
          ),
        );
      });

      test('handles malformed codes gracefully', () {
        expect(
          languageCodeToLocale('invalid_code_too_many_parts_here'),
          equals(const Locale('invalid')),
        );
      });
    });

    group('localeToEnum', () {
      test('converts Flutter Locale to enum', () {
        expect(
          localeToEnum(
            const Locale('en'),
            TestLanguageExtension.fromLanguageCode,
          ),
          equals(TestLanguage.en),
        );
        expect(
          localeToEnum(
            const Locale('es'),
            TestLanguageExtension.fromLanguageCode,
          ),
          equals(TestLanguage.es),
        );
        expect(
          localeToEnum(
            const Locale('fr'),
            TestLanguageExtension.fromLanguageCode,
          ),
          equals(TestLanguage.fr),
        );
      });

      test('converts complex Locale to enum', () {
        expect(
          localeToEnum(
            const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
            TestLanguageExtension.fromLanguageCode,
          ),
          equals(TestLanguage.zhHans),
        );
        expect(
          localeToEnum(
            const Locale('en', 'US'),
            TestLanguageExtension.fromLanguageCode,
          ),
          equals(TestLanguage.enUs),
        );
      });

      test('returns null for unsupported locales', () {
        expect(
          localeToEnum(
            const Locale('unsupported'),
            TestLanguageExtension.fromLanguageCode,
          ),
          isNull,
        );
      });
    });

    group('enumToLocale', () {
      test('converts enum to Flutter Locale', () {
        expect(
          enumToLocale(TestLanguage.en, (e) => e.languageCode),
          equals(const Locale('en')),
        );
        expect(
          enumToLocale(TestLanguage.es, (e) => e.languageCode),
          equals(const Locale('es')),
        );
        expect(
          enumToLocale(TestLanguage.fr, (e) => e.languageCode),
          equals(const Locale('fr')),
        );
      });

      test('converts complex enum to Flutter Locale', () {
        expect(
          enumToLocale(TestLanguage.zhHans, (e) => e.languageCode),
          equals(
            const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
          ),
        );
        expect(
          enumToLocale(TestLanguage.enUs, (e) => e.languageCode),
          equals(const Locale('en', 'US')),
        );
      });
    });

    group('createPvtroApp', () {
      testWidgets('creates app with LocaleCubit provider', (tester) async {
        final cubit = LocaleCubit<TestLanguage>(
          defaultLocale: TestLanguage.en,
          enumToLanguageCode: (e) => e.languageCode,
          languageCodeToEnum: TestLanguageExtension.fromLanguageCode,
        );

        await tester.pumpWidget(
          createPvtroApp<TestLanguage>(
            localeCubit: cubit,
            child: MaterialApp(
              home: Builder(
                builder: (context) {
                  final cubitFromContext = context
                      .read<LocaleCubit<TestLanguage>>();
                  return Text('Locale: ${cubitFromContext.state.name}');
                },
              ),
            ),
          ),
        );

        expect(find.text('Locale: en'), findsOneWidget);
      });

      testWidgets('creates app with additional providers', (tester) async {
        final cubit = LocaleCubit<TestLanguage>(
          defaultLocale: TestLanguage.en,
          enumToLanguageCode: (e) => e.languageCode,
          languageCodeToEnum: TestLanguageExtension.fromLanguageCode,
        );

        var providerCalled = false;

        await tester.pumpWidget(
          createPvtroApp<TestLanguage>(
            localeCubit: cubit,
            additionalProviders: [
              (child) {
                providerCalled = true;
                return child;
              },
            ],
            child: const MaterialApp(home: Text('Test')),
          ),
        );

        expect(providerCalled, isTrue);
        expect(find.text('Test'), findsOneWidget);
      });
    });

    group('createSlangProvider', () {
      test('creates provider wrapper function', () {
        Widget testProvider({required Widget child}) {
          return Container(child: child);
        }

        final wrapper = createSlangProvider(testProvider);
        final result = wrapper(const Text('Test Child'));

        expect(result, isA<Container>());
        expect((result as Container).child, isA<Text>());
      });
    });

    group('Round-trip conversions', () {
      test('Locale -> LanguageCode -> Locale maintains consistency', () {
        const testLocales = [
          Locale('en'),
          Locale('fr'),
          Locale('es', 'ES'),
          Locale('en', 'US'),
          Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
          Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: 'Hans',
            countryCode: 'CN',
          ),
        ];

        for (final locale in testLocales) {
          final languageCode = localeToLanguageCode(locale);
          final backToLocale = languageCodeToLocale(languageCode);
          expect(
            backToLocale,
            equals(locale),
            reason: 'Round-trip failed for $locale',
          );
        }
      });

      test(
        'Enum -> Locale -> Enum maintains consistency with supported locales',
        () {
          final testEnums = [
            TestLanguage.en,
            TestLanguage.es,
            TestLanguage.fr,
            TestLanguage.zhHans,
            TestLanguage.enUs,
          ];

          for (final enumValue in testEnums) {
            final locale = enumToLocale(enumValue, (e) => e.languageCode);
            final backToEnum = localeToEnum(
              locale,
              TestLanguageExtension.fromLanguageCode,
            );
            expect(
              backToEnum,
              equals(enumValue),
              reason: 'Round-trip failed for $enumValue',
            );
          }
        },
      );
    });
  });
}
