import 'package:flutter/material.dart';

class LazyObjectConfig {
  static Map<String, List<String>> defaultTypeMaps = {
    "image": ['.png', '.jpg', '.jpeg', '.gif', '.webp'],
  };

  static Map<String, Function(String assetPath)> defaultTypeLoaders = {
    "image": (String assetPath) => Image.network(assetPath),
  };

  static Function(String assetPath) getTypeLoader(String assetpath, String? signature) {
    if (signature != null) {
      return defaultTypeLoaders[signature]!(assetpath);
    }
    final extension = assetpath.split('.').last;
    final type = defaultTypeMaps.entries
        .firstWhere((entry) => entry.value.contains(extension))
        .key;
    return defaultTypeLoaders[type]!(assetpath);
  }
}

class LazyObject {
  final String? loadSignature;
  final String assetPath;
  dynamic _value;

  LazyObject(this.assetPath, {this.loadSignature});

  dynamic get value {
    _value ??= _loadValue();
    return _value;
  }

  dynamic _loadValue() {
    return LazyObjectConfig.getTypeLoader(assetPath, loadSignature);
  }
}
