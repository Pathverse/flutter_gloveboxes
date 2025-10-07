import 'dart:io';
import 'package:path/path.dart' as p;

/// Utilities for file system operations
class FileSystemUtils {
  /// Find a file matching patterns in a directory
  static Future<File?> findFileByPatterns(
    String basePath,
    List<String> patterns, {
    bool recursive = true,
  }) async {
    final baseDir = Directory(basePath);
    if (!await baseDir.exists()) return null;

    // First try specific patterns
    for (final pattern in patterns) {
      final file = File(p.join(basePath, pattern));
      if (await file.exists()) {
        return file;
      }
    }

    // If recursive search is enabled, search for the first matching pattern
    if (recursive && patterns.isNotEmpty) {
      final filename = p.basename(patterns.first);
      await for (final entity in baseDir.list(recursive: true)) {
        if (entity is File && entity.path.endsWith(filename)) {
          return entity;
        }
      }
    }

    return null;
  }

  /// Find strings.g.dart file in common slang locations
  static Future<File?> findStringsFile(String packagePath) async {
    final libDir = Directory(p.join(packagePath, 'lib'));
    if (!await libDir.exists()) return null;

    // Common slang generated file patterns
    const patterns = [
      'i18n/strings.g.dart',
      'l10n/strings.g.dart',
      'translations/strings.g.dart',
      'strings.g.dart',
    ];

    return findFileByPatterns(libDir.path, patterns);
  }

  /// Generate package import path from file path
  static String generateImportPath(String filePath, String packageName) {
    final parts = filePath.split(Platform.pathSeparator);
    final libIndex = parts.lastIndexOf('lib');

    if (libIndex >= 0 && libIndex < parts.length - 1) {
      final relativePath = parts.sublist(libIndex + 1).join('/');
      return 'package:$packageName/$relativePath';
    }

    return filePath;
  }

  /// Check if a directory exists
  static Future<bool> directoryExists(String path) async {
    return Directory(path).exists();
  }

  /// Check if a file exists
  static Future<bool> fileExists(String path) async {
    return File(path).exists();
  }
}
