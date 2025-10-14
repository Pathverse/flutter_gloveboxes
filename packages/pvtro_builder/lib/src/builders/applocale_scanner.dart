import 'dart:async';

import '../utils.dart';

/// Scans packages for slang-generated AppLocale enums and LocaleSettings
class AppLocaleScanner {
  /// Scan all packages for slang translations
  Future<List<SlangPackage>> scanForSlangPackages() async {
    final packages = <SlangPackage>[];

    // Get package configuration
    final packageConfig = await PackageConfigUtils.getPackageConfig();

    // Scan current package
    final currentPackage = await SlangAnalysisUtils.scanPackageForSlang('.');
    if (currentPackage != null) {
      packages.add(currentPackage);
    }

    // Scan all dependencies (excluding pvtro packages)
    final filteredPackages = PackageConfigUtils.filterPvtroPackages(
      packageConfig,
    );
    for (final packageInfo in filteredPackages) {
      final slangPackage = await SlangAnalysisUtils.scanPackageForSlang(
        packageInfo.rootPath,
      );
      if (slangPackage != null) {
        packages.add(slangPackage);
      }
    }

    return packages;
  }
}
