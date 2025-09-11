// ignore: implementation_imports
import 'package:pvcache/src/top.dart';
import 'package:pvcache/pvcache.dart';
import 'package:pvcache/templates/adapters/expiry.dart';
import 'package:pvcache_hive/src/hboxcore.dart';
import 'package:pvcache_hive/src/pvco.dart';
import 'package:pvcache_hive/templates/storage/std.dart';

final _adapters = [ExpiryAdapter()];

extension PVCacheAddHive on TopLv {
  PVCache createStdHive({
    String env = "default",
    String? metaboxName,
    List<PVAdapter>? adapters,
    HPerBoxConfig? boxConfig,
  }) {
    adapters ??= _adapters;
    final (ms, ss) = createPair<PVCo>(
      env,
      metaBoxName: metaboxName,
      boxConfig: boxConfig,
    );
    return PVCache(env: env, adapters: adapters, metaStorage: ms, storage: ss);
  }
}
