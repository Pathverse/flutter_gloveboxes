// ignore: implementation_imports
import 'package:pvcache/src/top.dart';
import 'package:pvcache/pvcache.dart';
import 'package:pvcache_secrets/templates/storage/encrypted.dart';
import 'package:pvcache_secrets/templates/storage/metable.dart';

extension PVCacheAddSecrets on TopLv {
  PVCache createEncrypted({
    String env = "encrypted",
    List<PVAdapter> adapters = const [],
    MetadataStorage? metaStorage,
  }) {
    return PVCache(
      env: env,
      adapters: adapters,
      storage: Encrypted(),
      metaStorage: metaStorage,
    );
  }

  PVCache createLimitedEncryptedWithMeta({
    String env = "limited-encrypted",
    List<PVAdapter> adapters = const [],
  }) {
    final encrypted = MetableEncrypted();
    return PVCache(
      env: env,
      adapters: adapters,
      storage: encrypted,
      metaStorage: encrypted,
    );
  }
}
