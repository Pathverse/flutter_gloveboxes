import 'package:pvcacher/src/cacher.dart';
import 'package:pvcacher/src/handle.dart';

class PVCacheFlags {
  bool abort = false;
}

class PVCacheCtx {
  final Map<String, dynamic> options;
  final String? key;
  final dynamic value;
  final PVCacheHandle handle;
  final PVCacher cacher;
  late final Map<String, dynamic> contexts;
  dynamic result;
  final String callingFunc;
  late final PVCacheFlags flags;

  PVCacheCtx({
    required this.callingFunc,
    required this.options,
    required this.key,
    required this.value,
    required this.handle,
    required this.cacher,
  }) {
    contexts = {};
    flags = PVCacheFlags();
  }
}
