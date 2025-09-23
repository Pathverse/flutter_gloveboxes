import 'package:pvcache/src/top.dart';

export 'src/adapter.dart';

export 'src/cache.dart' show PVCache;

export 'src/callframe.dart' show PVCFrame;
export 'src/interface.dart'
    show PVBaseStorage, PVCtx, PVBaseCache, MetadataStorage;

/// helper to extend on
// ignore: non_constant_identifier_names
final PVCACHE = TopLv();
