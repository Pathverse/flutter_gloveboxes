#!/usr/bin/env dart

// ignore_for_file: avoid_print

import 'dart:io';
import 'package:args/args.dart';
import 'package:pvtro_builder/src/main.dart';
import 'package:build/build.dart';

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      help: 'Show usage information',
      negatable: false,
    )
    ..addFlag(
      'scan-packages',
      help: 'Scan all dependencies for translation providers',
      defaultsTo: true,
    )
    ..addOption(
      'output',
      abbr: 'o',
      help: 'Output file path',
      defaultsTo: 'lib/generated_translations.dart',
    )
    ..addFlag('verbose', abbr: 'v', help: 'Verbose output', negatable: false);

  try {
    final results = parser.parse(arguments);

    if (results['help'] as bool) {
      print('pvtro - Translation Provider Scanner and Merger');
      print('');
      print('Usage: dart run pvtro_builder:pvtro [options]');
      print('');
      print('Options:');
      print(parser.usage);
      return;
    }

    final scanPackages = results['scan-packages'] as bool;
    final outputPath = results['output'] as String;
    final verbose = results['verbose'] as bool;

    if (verbose) {
      print('🔍 Scanning for slang translation providers...');
      print('📦 Scan packages: $scanPackages');
      print('📄 Output path: $outputPath');
    }

    // Create a mock BuilderOptions and BuildStep for CLI usage
    final options = BuilderOptions({
      'scan_packages': scanPackages,
      'output_file': outputPath,
    });

    final scanner = TranslationScannerBuilder(options);

    // For CLI usage, we need to implement our own scanning logic
    await _runStandaloneScan(scanner, outputPath, verbose);
  } catch (e) {
    print('❌ Error: $e');
    print('');
    print('Use --help for usage information.');
    exit(1);
  }
}

Future<void> _runStandaloneScan(
  TranslationScannerBuilder scanner,
  String outputPath,
  bool verbose,
) async {
  try {
    // Implement standalone scanning logic here
    // This would need to be adapted since we don't have a BuildStep in CLI mode

    if (verbose) {
      print('🔧 Standalone scanning is not yet implemented.');
      print('💡 Use this tool with build_runner instead:');
      print('   dart run build_runner build');
      print('   or');
      print('   dart run build_runner watch');
    }

    print('ℹ️  For now, use with build_runner:');
    print('   Add this to your pubspec.yaml dev_dependencies:');
    print('   build_runner: ^2.4.7');
    print('   pvtro_builder:');
    print('     path: ../pvtro_builder');
    print('');
    print('   Then run: dart run build_runner build');
  } catch (e) {
    print('❌ Error during scanning: $e');
    exit(1);
  }
}
