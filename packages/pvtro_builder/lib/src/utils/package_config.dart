import 'dart:convert';
import 'dart:io';
import 'package:build/build.dart';
import 'package:path/path.dart' as p;

/// Information about a package from package_config.json
class PackageInfo {
  final String name;
  final String rootPath;

  PackageInfo({required this.name, required this.rootPath});

  @override
  String toString() => 'PackageInfo(name: $name, rootPath: $rootPath)';
}

/// Utilities for working with package configuration
class PackageConfigUtils {
  /// Read and parse package_config.json to get all packages
  static Future<List<PackageInfo>> getPackageConfig() async {
    final packages = <PackageInfo>[];

    try {
      final packageConfigFile = File('.dart_tool/package_config.json');
      if (await packageConfigFile.exists()) {
        final content = await packageConfigFile.readAsString();
        final config = jsonDecode(content) as Map<String, dynamic>;

        final packageList = config['packages'] as List<dynamic>;
        final packageConfigDir = packageConfigFile
            .parent
            .parent
            .path; // Go up from .dart_tool to root

        for (final package in packageList) {
          final packageMap = package as Map<String, dynamic>;
          final name = packageMap['name'] as String;
          final rootUri = packageMap['rootUri'] as String;

          // Convert relative URIs to absolute paths
          final rootPath = _resolvePackagePath(rootUri, packageConfigDir, name);

          log.info('Found package: $name at $rootPath');
          packages.add(PackageInfo(name: name, rootPath: rootPath));
        }
      }
    } catch (e) {
      log.warning('Could not read package config: $e');
    }

    return packages;
  }

  /// Resolve package URI to absolute path
  static String _resolvePackagePath(
    String rootUri,
    String packageConfigDir,
    String packageName,
  ) {
    String rootPath;

    if (rootUri.startsWith('file:///')) {
      // Absolute file URI
      rootPath = Uri.parse(rootUri).toFilePath();
    } else {
      // Relative path - resolve relative to package config directory
      rootPath = p.normalize(p.join(packageConfigDir, rootUri));

      // Check if this resolved path exists, if not try adjusting the relative path
      if (!Directory(rootPath).existsSync()) {
        // Try removing one ../ level (common issue with package config generation)
        final adjustedUri = rootUri.replaceFirst('../', '');
        final adjustedPath = p.normalize(p.join(packageConfigDir, adjustedUri));
        if (Directory(adjustedPath).existsSync()) {
          log.info('Adjusted path for $packageName: $rootUri -> $adjustedUri');
          rootPath = adjustedPath;
        }
      }
    }

    return rootPath;
  }

  /// Filter out pvtro-related packages from the list
  static List<PackageInfo> filterPvtroPackages(List<PackageInfo> packages) {
    return packages
        .where((p) => p.name != 'pvtro' && p.name != 'pvtro_builder')
        .toList();
  }
}
