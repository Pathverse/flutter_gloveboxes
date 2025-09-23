/// Method resolver for custom loading methods in signature configurations
library;

import 'dart:io';
import '../config/signature_config.dart';

/// Handles resolution and validation of custom method references
class MethodResolver {
  final String projectRoot;
  final Map<String, String> _resolvedImports = {};

  MethodResolver(this.projectRoot);

  /// Resolve a method reference to generate appropriate import and call code
  Future<ResolvedMethod> resolveMethod(MethodReference methodRef) async {
    final filePath = await _findCustomFile(methodRef.file);
    final importPath = _generateImportPath(filePath);
    final alias = _generateAlias(methodRef.file);

    _resolvedImports[methodRef.file] = importPath;

    return ResolvedMethod(
      methodRef: methodRef,
      importPath: importPath,
      alias: alias,
      callExpression: '${alias}.${methodRef.method}',
    );
  }

  /// Generate all necessary imports for resolved methods
  List<String> generateImports() {
    return _resolvedImports.entries
        .map(
          (entry) => "import '${entry.value}' as ${_generateAlias(entry.key)};",
        )
        .toList();
  }

  /// Find the custom file in the project
  Future<String> _findCustomFile(String fileName) async {
    // Common locations to search for custom files
    final searchPaths = [
      'lib',
      'lib/custom',
      'lib/loaders',
      'lib/src',
      'lib/src/custom',
      'lib/src/loaders',
    ];

    for (final searchPath in searchPaths) {
      final fullPath = '$projectRoot/$searchPath';
      if (await Directory(fullPath).exists()) {
        await for (final entity in Directory(fullPath).list(recursive: true)) {
          if (entity is File) {
            final name = entity.path.split('/').last;
            // Check for exact match or match with .dart extension
            if (name == fileName || name == '$fileName.dart') {
              return _makeRelativePath(entity.path);
            }
          }
        }
      }
    }

    // If not found, assume it's a relative path from lib/
    final defaultPath = 'lib/$fileName';
    if (!fileName.endsWith('.dart')) {
      return '$defaultPath.dart';
    }
    return defaultPath;
  }

  /// Convert absolute path to relative import path
  String _makeRelativePath(String absolutePath) {
    // Simple relative path calculation
    if (absolutePath.startsWith(projectRoot)) {
      return absolutePath.substring(projectRoot.length + 1);
    }
    return absolutePath;
  }

  /// Generate import path for a file
  String _generateImportPath(String filePath) {
    // Ensure the path starts with package: if it's in lib/
    if (filePath.startsWith('lib/')) {
      final packageName = _getPackageName();
      return 'package:$packageName/${filePath.substring(4)}';
    }
    return filePath;
  }

  /// Generate a unique alias for the import
  String _generateAlias(String fileName) {
    // Clean the filename to create a valid Dart identifier
    return '_${fileName.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_')}_methods';
  }

  /// Get the package name from pubspec.yaml
  String _getPackageName() {
    // TODO: Parse pubspec.yaml to get actual package name
    // For now, assume it's the directory name
    return projectRoot.split('/').last;
  }

  /// Validate that all custom methods exist and are accessible
  Future<List<ValidationError>> validateMethods(
    SignatureConfigCollection signatures,
  ) async {
    final errors = <ValidationError>[];

    for (final signature in signatures.signatures.values) {
      if (signature.loader != null) {
        try {
          await resolveMethod(signature.loader!);
        } catch (e) {
          errors.add(
            ValidationError(
              signature: signature.name,
              methodRef: signature.loader!,
              error: e.toString(),
            ),
          );
        }
      }

      if (signature.matchConfig?.customMatcher != null) {
        try {
          await resolveMethod(signature.matchConfig!.customMatcher!);
        } catch (e) {
          errors.add(
            ValidationError(
              signature: signature.name,
              methodRef: signature.matchConfig!.customMatcher!,
              error: e.toString(),
            ),
          );
        }
      }
    }

    return errors;
  }

  /// Generate code for LazyObjectConfig extension with custom methods
  String generateCustomLoaderCode(SignatureConfigCollection signatures) {
    final buffer = StringBuffer();

    // Generate imports
    final imports = generateImports();
    for (final import in imports) {
      buffer.writeln(import);
    }

    buffer.writeln();
    buffer.writeln('/// Extended LazyObjectConfig with custom methods');
    buffer.writeln('class CustomLazyObjectConfig {');

    // Generate custom type maps
    buffer.writeln(
      '  static Map<String, List<String>> get customTypeMaps => {',
    );
    for (final signature in signatures.signatures.values) {
      if (signature.matchConfig?.extensions != null) {
        final extensions = signature.matchConfig!.extensions!
            .map((ext) => "'$ext'")
            .join(', ');
        buffer.writeln("    '${signature.name}': [$extensions],");
      }
    }
    buffer.writeln('  };');

    buffer.writeln();

    // Generate custom type loaders
    buffer.writeln(
      '  static Map<String, Function(String)> get customTypeLoaders => {',
    );
    for (final signature in signatures.signatures.values) {
      if (signature.loader != null) {
        final resolved = _resolvedImports[signature.loader!.file];
        if (resolved != null) {
          final alias = _generateAlias(signature.loader!.file);
          buffer.writeln(
            "    '${signature.name}': ${alias}.${signature.loader!.method},",
          );
        }
      }
    }
    buffer.writeln('  };');

    buffer.writeln();

    // Generate path pattern matchers
    buffer.writeln('  static Map<String, String> get pathPatterns => {');
    for (final signature in signatures.signatures.values) {
      if (signature.matchConfig?.pathPattern != null) {
        buffer.writeln(
          "    '${signature.name}': '${signature.matchConfig!.pathPattern}',",
        );
      }
    }
    buffer.writeln('  };');

    buffer.writeln();

    // Generate custom matchers
    buffer.writeln(
      '  static Map<String, Function(String)> get customMatchers => {',
    );
    for (final signature in signatures.signatures.values) {
      if (signature.matchConfig?.customMatcher != null) {
        final matcher = signature.matchConfig!.customMatcher!;
        final alias = _generateAlias(matcher.file);
        buffer.writeln("    '${signature.name}': ${alias}.${matcher.method},");
      }
    }
    buffer.writeln('  };');

    buffer.writeln('}');

    return buffer.toString();
  }
}

/// Represents a resolved method reference
class ResolvedMethod {
  final MethodReference methodRef;
  final String importPath;
  final String alias;
  final String callExpression;

  const ResolvedMethod({
    required this.methodRef,
    required this.importPath,
    required this.alias,
    required this.callExpression,
  });
}

/// Validation error for method resolution
class ValidationError {
  final String signature;
  final MethodReference methodRef;
  final String error;

  const ValidationError({
    required this.signature,
    required this.methodRef,
    required this.error,
  });

  @override
  String toString() =>
      'Validation error for signature "$signature": ${methodRef.toString()} - $error';
}
