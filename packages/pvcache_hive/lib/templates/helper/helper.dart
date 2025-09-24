import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pvcache/pvcache.dart';

// ignore: implementation_imports
import 'package:pvcache/src/top.dart';
import 'package:pvcache_hive/src/pvci.dart';
import 'package:pvcache_hive/src/encryptor.dart';
import 'package:pvcache_hive/templates/adapters/decryption_error.dart';
import 'package:pvcache_hive/templates/ciphers/aes.dart';
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
  void setupPVCiEncrption({
    bool useDefaultCipher = true,
    // custom cipher
    PVCiEncryptor? hiveCipher,

    // decryption error
  }) {}

  PVCache createStdHive({
    String env = "default",
    String? metaboxName,
    List<PVAdapter>? adapters,
    int decryptionErrorStrategy = -1,
    Future<void> Function(PVCtx ctx)? resetCallbackOnStrategy2,
  }) {
    adapters ??= [];
    if (decryptionErrorStrategy != -1) {
      adapters.add(
        DecryptionErrorAdapter(
          'hive_decryption_error_adapter_$env',
          decryptionErrorStrategy,
          resetCallback: resetCallbackOnStrategy2,
        ),
      );
    }

    final (ms, ss) = createPair(env);

    return PVCache(env: env, adapters: adapters, metaStorage: ms, storage: ss);
  }

  void setupHiveEncryption({
    useDefault = true,
    String? seed,
    PVCiEncryptor? hiveCipher,
  }) {
    if (!useDefault) {
      // random seed if not provided
      seed ??= DateTime.now().millisecondsSinceEpoch.toString();
      PVCoore.encryptor = PVAesEncryptor(seed);
    } else if (hiveCipher != null) {
      PVCoore.encryptor = hiveCipher;
    }
  }

  Future<void> setupDependentAESEncryption(
    PVCache depCache,
    String depKey,
    Future<String> Function() callbackIfNotFound,
  ) async {
    final seed = await depCache.ifNotCached(depKey, callbackIfNotFound);
    PVCoore.encryptor = PVAesEncryptor(seed);
  }
}
