// ignore: implementation_imports
import 'package:pvcache/src/top.dart';
import 'package:pvcache/pvcache.dart';
import 'package:pvcache_secrets/templates/storage/encrypted.dart';

extension PVCacheAddSecrets on TopLv {
  PVCache createEncrypted({
    String env = "encrypted",
    List<PVAdapter> adapters = const [],
    PVBaseStorage? metaStorage,
  }) {
    return PVCache(env: env, adapters: adapters, storage: Encrypted(), metaStorage: metaStorage);
  }
}
