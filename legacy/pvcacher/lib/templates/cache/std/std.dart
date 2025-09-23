import 'package:pvcacher/src/adapter.dart';
import 'package:pvcacher/src/cacher.dart';
import 'package:pvcacher/templates/cache/std/handle.dart';

export 'handle.dart';
export 'obj.dart';

PVCacher createStd({String namespace = "std", List<PVCacheAdapter>? adapters}) {
  return PVCacher(
    namespace: namespace,
    handle: StdHandler(),
    adapters: adapters ?? const [],
  );
}

