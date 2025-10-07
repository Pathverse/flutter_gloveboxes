import 'dart:async';
import 'package:build/build.dart';

import '../utils.dart';
import 'applocale_scanner.dart';
import 'unified_language_generator.dart';

/// Main builder that generates unified language enum and locale setup
class UnifiedLanguageBuilder implements Builder {
  final BuilderOptions options;

  UnifiedLanguageBuilder(this.options);

  @override
  Map<String, List<String>> get buildExtensions => {
    '.dart': ['.unified_lang.dart'],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    // Only process a specific trigger file to avoid multiple generations
    if (!buildStep.inputId.path.endsWith('lib/pvtro.dart')) {
      return;
    }

    log.info('🔍 Scanning for slang packages...');

    try {
      final scanner = AppLocaleScanner();
      final packages = await scanner.scanForSlangPackages();

      if (packages.isEmpty) {
        log.info('ℹ️ No slang packages found');
        return;
      }

      log.info('✅ Found ${packages.length} slang packages:');
      for (final package in packages) {
        log.info('  - ${package.name}: ${package.availableLocales.join(', ')}');
      }

      final generator = UnifiedLanguageGenerator();

      // Generate all code in a single output file
      final allCode = _generateAllCode(generator, packages);
      final outputId = buildStep.inputId.changeExtension('.unified_lang.dart');
      await buildStep.writeAsString(outputId, allCode);
      log.info('✅ Generated unified language system');
      log.info('  - ${outputId.path}');
    } catch (e, stackTrace) {
      log.severe('❌ Error generating unified language system: $e');
      log.severe('Stack trace: $stackTrace');
    }
  }

  String _generateAllCode(
    UnifiedLanguageGenerator generator,
    List<SlangPackage> packages,
  ) {
    final buffer = StringBuffer();

    // Generate file header with imports
    final uniqueLocaleCount = SlangAnalysisUtils.getAllUniqueLocales(
      packages,
    ).length;
    buffer.write(
      CodeGenUtils.generateFileHeader(
        description:
            'Found ${packages.length} slang packages with $uniqueLocaleCount unique locales',
      ),
    );

    // Generate all imports first
    buffer.writeln("import 'package:flutter/material.dart';");
    buffer.writeln("import 'package:pvtro/cubit.dart';");
    buffer.writeln("import 'package:pvtro/helper.dart';");
    buffer.writeln();

    // Add package imports
    for (final package in packages) {
      buffer.writeln("import '${package.importPath}' as ${package.name}_i18n;");
    }
    buffer.writeln();

    // Generate unified language enum (without its own header)
    final enumCode = generator.generateUnifiedLanguageEnum(packages);
    // Remove the header from enum code and add just the enum part
    final enumLines = enumCode.split('\n');
    final enumStartIndex = enumLines.indexWhere(
      (line) => line.startsWith('/// Unified language'),
    );
    if (enumStartIndex >= 0) {
      buffer.writeln(enumLines.sublist(enumStartIndex).join('\n'));
    } else {
      buffer.writeln(enumCode);
    }
    buffer.writeln();

    // Generate locale setup code (without its own header and imports)
    final setupCode = generator.generateLocaleSetup(packages);
    final setupLines = setupCode.split('\n');
    // Skip the header and import lines, start from the function definition
    final functionStartIndex = setupLines.indexWhere(
      (line) => line.startsWith('/// Creates a LocaleCubit'),
    );
    if (functionStartIndex >= 0) {
      buffer.writeln(setupLines.sublist(functionStartIndex).join('\n'));
    } else {
      // Fallback: add the whole setup code
      buffer.writeln(setupCode);
    }

    // Generate complete app setup function
    final completeAppSetup = generator.generateCompleteAppSetup(packages);
    buffer.writeln(completeAppSetup);

    return buffer.toString();
  }
}
