import 'package:flutter/material.dart';
import 'collection.dart';

class LazyObjectConfig {
  static SelfUpdatingMap<String, List<String>> defaultTypeMaps =
      DotStrippedStringListMap({
        "image": ['png', 'jpg', 'jpeg', 'gif', 'webp'],
      });

  static Map<String, Function(String assetPath)> defaultTypeLoaders = {
    "image": (String assetPath) => Image.asset(assetPath),
  };

  static Function(String assetPath) getTypeLoader(
    String assetpath,
    String? signature,
  ) {
    debugPrint(
      '🔍 LazyObjectConfig.getTypeLoader called with: $assetpath, signature: $signature',
    );

    try {
      if (signature != null) {
        debugPrint('🔍 Looking for signature loader: $signature');
        final loader = defaultTypeLoaders[signature];
        if (loader == null) {
          debugPrint('❌ No loader found for signature: $signature');
          throw Exception('No loader found for signature: $signature');
        }
        debugPrint('✅ Found signature loader for: $signature');
        return loader;
      }

      final extension = assetpath.split('.').last;
      debugPrint('🔍 Looking for extension loader: $extension');

      final typeEntry = defaultTypeMaps.entries.where(
        (entry) => entry.value.contains(extension),
      );

      if (typeEntry.isEmpty) {
        debugPrint('❌ No type mapping found for extension: $extension');
        throw Exception('No type mapping found for extension: $extension');
      }

      final type = typeEntry.first.key;
      debugPrint('🔍 Found type: $type for extension: $extension');

      final loader = defaultTypeLoaders[type];
      if (loader == null) {
        debugPrint('❌ No loader found for type: $type');
        throw Exception('No loader found for type: $type');
      }

      debugPrint('✅ Found type loader for: $type');
      return loader;
    } catch (e, stackTrace) {
      debugPrint('❌ Error in getTypeLoader: $e');
      debugPrint('Stack trace: $stackTrace');
      rethrow;
    }
  }
}

class LazyObject {
  final String? loadSignature;
  final String assetPath;
  dynamic _value;
  static int _loadDepth = 0;

  LazyObject(this.assetPath, {this.loadSignature});

  dynamic get value {
    debugPrint(
      '🔄 LazyObject.value getter called for: $assetPath (depth: $_loadDepth)',
    );

    if (_loadDepth > 10) {
      debugPrint(
        '❌ STACK OVERFLOW DETECTED! Load depth exceeded 10 for: $assetPath',
      );
      throw Exception('Stack overflow detected for asset: $assetPath');
    }

    _value ??= _loadValue();
    return _value;
  }

  dynamic _loadValue() {
    _loadDepth++;
    debugPrint(
      '📥 LazyObject._loadValue called for: $assetPath (depth: $_loadDepth)',
    );

    try {
      final loader = LazyObjectConfig.getTypeLoader(assetPath, loadSignature);
      debugPrint('🚀 Calling loader for: $assetPath');
      final result = loader(assetPath);
      debugPrint('✅ Loader completed for: $assetPath');
      _loadDepth--;
      return result;
    } catch (e, stackTrace) {
      _loadDepth--;
      debugPrint('❌ Error in _loadValue for $assetPath: $e');
      debugPrint('Stack trace: $stackTrace');
      rethrow;
    }
  }
}
