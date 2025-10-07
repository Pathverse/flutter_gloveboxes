import '../utils.dart';

/// Generates the unified language enum and locale management code
class UnifiedLanguageGenerator {
  /// Generate the unified language enum from discovered slang packages
  String generateUnifiedLanguageEnum(List<SlangPackage> packages) {
    // Collect all unique language codes from all packages
    final allLocales = SlangAnalysisUtils.getAllUniqueLocales(packages);
    final sortedLocales = allLocales.toList()..sort();

    final buffer = StringBuffer();

    // Generate file header
    buffer.write(
      CodeGenUtils.generateFileHeader(
        packageCount: packages.length,
        localeCount: sortedLocales.length,
      ),
    );

    // Generate the unified enum
    final enumValues = sortedLocales
        .map(
          (locale) => EnumValue(
            StringUtils.sanitizeEnumName(locale),
            documentation: 'Language code: $locale',
          ),
        )
        .toList();

    buffer.write(
      CodeGenUtils.generateEnum(
        enumName: 'UnifiedLanguage',
        values: enumValues,
        documentation:
            'Unified language code enum that represents all supported languages across all discovered slang packages',
      ),
    );
    buffer.writeln();

    // Generate extension methods
    buffer.write(
      CodeGenUtils.generateDocComment(
        'Extension to convert UnifiedLanguage to language code string',
      ),
    );
    buffer.writeln('extension UnifiedLanguageExtension on UnifiedLanguage {');

    // Generate languageCode getter
    final languageCodeCases = sortedLocales.map((locale) {
      final enumName = StringUtils.sanitizeEnumName(locale);
      return SwitchCase(['UnifiedLanguage.$enumName'], "return '$locale';");
    }).toList();

    buffer.writeln('  String get languageCode {');
    buffer.write(
      CodeGenUtils.generateSwitch(
        switchExpression: 'this',
        cases: languageCodeCases,
        indent: 4,
      ),
    );
    buffer.writeln('  }');
    buffer.writeln();
    buffer.writeln();

    // Generate fromLanguageCode method
    final fromLanguageCodeCases = <SwitchCase>[];
    for (final locale in sortedLocales) {
      final enumName = StringUtils.sanitizeEnumName(locale);
      final variations = StringUtils.getLocaleVariations(locale);
      final casePatterns = variations.map((v) => "'$v'").toList();
      fromLanguageCodeCases.add(
        SwitchCase(casePatterns, 'return UnifiedLanguage.$enumName;'),
      );
    }

    buffer.write(
      CodeGenUtils.generateMethod(
        methodName: 'fromLanguageCode',
        returnType: 'UnifiedLanguage?',
        parameters: [Parameter('String', 'code')],
        body: CodeGenUtils.generateSwitch(
          switchExpression: 'code.toLowerCase()',
          cases: fromLanguageCodeCases,
          defaultCase: 'return null;',
        ),
        documentation: 'Parse language code string to UnifiedLanguage',
        isStatic: true,
        indent: 2,
      ),
    );
    buffer.writeln('}');

    return buffer.toString();
  }

  /// Generate the locale setup code that connects all slang packages
  String generateLocaleSetup(List<SlangPackage> packages) {
    final buffer = StringBuffer();

    // Generate file header
    buffer.write(CodeGenUtils.generateFileHeader());

    // Generate imports
    final imports = [
      'package:pvtro/cubit.dart',
      'unified_language.dart',
      ...packages.map((p) => p.importPath),
    ];

    buffer.write(CodeGenUtils.generateImports(imports));

    // Add package import aliases
    for (final package in packages) {
      buffer.writeln("import '${package.importPath}' as ${package.name}_i18n;");
    }
    buffer.writeln();

    // Generate the setup function
    final packagesWithSettings =
        SlangAnalysisUtils.getPackagesWithLocaleSettings(packages);
    final setterCalls = packagesWithSettings
        .map((package) {
          return '''      // ${package.name} package locale setter
      (languageCode) {
        final locale = _parse${StringUtils.capitalize(package.name)}Locale(languageCode);
        if (locale != null) {
          ${package.name}_i18n.${package.localeSettingsClass}.setLocale(locale);
        }
      },''';
        })
        .join('\n');

    buffer.write(
      CodeGenUtils.generateMethod(
        methodName: 'createUnifiedLocaleCubit',
        returnType: 'LocaleCubit<UnifiedLanguage>',
        parameters: [
          Parameter(
            'UnifiedLanguage',
            'defaultLocale',
            defaultValue: 'UnifiedLanguage.en',
          ),
        ],
        body:
            '''return LocaleCubit<UnifiedLanguage>(
    defaultLocale: defaultLocale,
    enumToLanguageCode: (locale) => locale.languageCode,
    languageCodeToEnum: (code) => UnifiedLanguageExtension.fromLanguageCode(code),
    subpackageLocaleSetters: [
$setterCalls
    ],
  );''',
        documentation:
            'Creates a LocaleCubit with all discovered slang packages connected',
      ),
    );
    buffer.writeln();

    // Generate locale parsing functions for each package
    for (final package in packagesWithSettings) {
      final parseCases = package.availableLocales.map((locale) {
        final variations = StringUtils.getLocaleVariations(locale);
        final casePatterns = variations.map((v) => "'$v'").toList();
        return SwitchCase(
          casePatterns,
          'return ${package.name}_i18n.AppLocale.$locale;',
        );
      }).toList();

      buffer.write(
        CodeGenUtils.generateMethod(
          methodName: '_parse${StringUtils.capitalize(package.name)}Locale',
          returnType: '${package.name}_i18n.AppLocale?',
          parameters: [Parameter('String', 'languageCode')],
          body: CodeGenUtils.generateSwitch(
            switchExpression: 'languageCode.toLowerCase()',
            cases: parseCases,
            defaultCase: 'return null;',
          ),
          documentation: 'Parse language code to ${package.name} AppLocale',
        ),
      );
      buffer.writeln();
    }

    return buffer.toString();
  }
}
