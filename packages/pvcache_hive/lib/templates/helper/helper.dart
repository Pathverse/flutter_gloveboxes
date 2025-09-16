import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pvcache/pvcache.dart';

// ignore: implementation_imports
import 'package:pvcache/src/top.dart';
import 'package:pvcache_hive/src/pvci.dart';
import 'package:pvcache_hive/src/pvci_decrypt_adapter.dart';
import 'package:pvcache_hive/templates/storage/std.dart';

extension PVCacheForImage on PVCache {
  // this assumes the storage used is caching [PVCo] with ByteData support
  Future<Image?> getImage(
    String key, {
    ImageByteFormat format = ImageByteFormat.png,
  }) async {
    if (await exists(key)) {
      final cachedBytes = await get(key);
      final cachedUint8List = cachedBytes is ByteData
          ? cachedBytes.buffer.asUint8List()
          : null;

      if (cachedUint8List != null) {
        return Image.memory(cachedUint8List);
      }
    }
    return null;
  }

  Future<Image?> getNetworkImage(
    String url, {
    ImageByteFormat format = ImageByteFormat.png,
    String? key,
  }) async {
    // create a key from url by only keeping alphanumeric characters
    final realkey = key ?? url.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');
    final cachedImage = await getImage(realkey, format: format);
    if (cachedImage != null) {
      return cachedImage;
    }

    final image = Image.network(url);
    image.image
        .resolve(const ImageConfiguration())
        .addListener(
          ImageStreamListener((ImageInfo info, bool _) async {
            final byteData = await info.image.toByteData(format: format);
            if (byteData != null) {
              await set(realkey, PVCo(byteData, tCode: 1));
            }
          }),
        );
    return image;
  }

  Future<Image?> getAssetImage(
    String path, {
    ImageByteFormat format = ImageByteFormat.png,
    String? key,
  }) async {
    // create a key from path by only keeping alphanumeric characters
    final realkey = key ?? path.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');
    final cachedImage = await getImage(realkey, format: format);
    if (cachedImage != null) {
      return cachedImage;
    }

    final image = Image.asset(path);
    image.image
        .resolve(const ImageConfiguration())
        .addListener(
          ImageStreamListener((ImageInfo info, bool _) async {
            final byteData = await info.image.toByteData(format: format);
            if (byteData != null) {
              await set(realkey, PVCo(byteData, tCode: 1));
            }
          }),
        );
    return image;
  }
}

extension PVCACHEForHive on TopLv {
  PVCache createStdHive({
    String env = "default",
    String? metaboxName,
    List<PVAdapter>? adapters,
    bool handleDecryptionError = true,
  }) {

    adapters ??= [];
    final (ms, ss) = createPair(env);
    if (handleDecryptionError) {
      adapters.add(DECRYPT_ERROR_ADAPTER);
    }
    return PVCache(env: env, adapters: adapters, metaStorage: ms, storage: ss);
  }
}
