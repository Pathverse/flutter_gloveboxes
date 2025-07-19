/// Custom image loaders with caching and optimization
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Enhanced image loader with caching
Widget loadCachedImage(String assetPath) {
  debugPrint('🖼️ Loading cached image: $assetPath');

  return Image.asset(
    assetPath,
    // Add caching and optimization
    cacheWidth: 800,
    cacheHeight: 600,
    filterQuality: FilterQuality.medium,
    errorBuilder: (context, error, stackTrace) {
      debugPrint('❌ Failed to load image: $assetPath - $error');
      return Container(
        width: 100,
        height: 100,
        color: Colors.grey[300],
        child: const Icon(Icons.broken_image, color: Colors.grey),
      );
    },
  );
}

/// Load image as bytes for processing
Future<Uint8List> loadImageBytes(String assetPath) async {
  debugPrint('📦 Loading image bytes: $assetPath');
  try {
    final ByteData data = await rootBundle.load(assetPath);
    return data.buffer.asUint8List();
  } catch (e) {
    debugPrint('❌ Failed to load image bytes: $assetPath - $e');
    rethrow;
  }
}

/// Load image with custom resolution
Widget loadHighResImage(String assetPath) {
  debugPrint('🔍 Loading high-res image: $assetPath');

  return Image.asset(
    assetPath,
    fit: BoxFit.cover,
    filterQuality: FilterQuality.high,
    isAntiAlias: true,
  );
}
