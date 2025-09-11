import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:pvcache/pvcache.dart';

// ignore: implementation_imports
import 'package:pvcache/src/top.dart';
import 'package:pvcache_hive/src/hboxcore.dart';
import 'package:pvcache_hive/src/pvco.dart';
import 'package:pvcache_hive/templates/storage/std.dart';

extension PVCacheAddImageHive on TopLv {
  PVCache createImageHive({
    String env = "default",
    String? metaboxName,
    List<PVAdapter>? adapters,
    HPerBoxConfig? boxConfig,
  }) {
    final (ms, ss) = createPair<PVCo>(
      env,
      metaBoxName: metaboxName,
      boxConfig: boxConfig,
    );

    return PVCache(env: env, adapters: adapters, metaStorage: ms, storage: ss);
  }
}

class ImageHiveHelper {
  final PVCache cache;

  ImageHiveHelper(this.cache);

  Future<Image> network(
    String url, {
    ImageByteFormat format = ImageByteFormat.png,
  }) async {
    // cache key url convert
    final key = url.replaceAll('https://', '').replaceAll('/', '_');
    if (await cache.exists(key)) {
      final cachedImage = await cache.get(key);
      if (cachedImage != null) {
        final image = Image.memory(cachedImage);
        return image;
      }
    }
    final image = Image.network(url);
    // cache image bytes
    image.image
        .resolve(const ImageConfiguration())
        .addListener(
          ImageStreamListener((ImageInfo info, bool _) async {
            final byteData = await info.image.toByteData(format: format);
            if (byteData != null) {
              await cache.set(key, byteData);
            }
          }),
        );
    return image;
  }

  Future<Image> asset(String path) async {
    final key = path.replaceAll('/', '_').replaceAll("\\", '_');
    if (await cache.exists(key)) {
      final cachedImage = await cache.get(key);
      if (cachedImage != null) {
        final image = Image.memory(cachedImage);
        return image;
      }
    }
    final image = Image.asset(path);
    // cache image bytes
    image.image
        .resolve(const ImageConfiguration())
        .addListener(
          ImageStreamListener((ImageInfo info, bool _) async {
            final byteData = await info.image.toByteData(
              format: ImageByteFormat.png,
            );
            if (byteData != null) {
              await cache.set(key, byteData);
            }
          }),
        );
    return image;
  }
}
