import 'package:pvcacher/src/ctx.dart';

class PVCacheAdapter {
  bool get hasPreset => false;
  bool get hasPostset => false;
  bool get hasPreGet => false;
  bool get hasPostGet => false;
  bool get hasOnOptions => false;
  bool get hasPreHas => false;
  bool get hasPostHas => false;
  bool get hasPreRemove => false;
  bool get hasPostRemove => false;
  bool get hasPreClear => false;
  bool get hasPostClear => false;

  bool get hasPreHandlerOperation => false;
  bool get hasPostHandlerOperation => false;
}

mixin PVPreset {
  bool get hasPreset => true;

  Future<void> preSet(PVCacheCtx ctx);
}

mixin PVPreGet {
  bool get hasPreGet => true;

  Future<void> preGet(PVCacheCtx ctx);
}

mixin PVPostSet {
  bool get hasPostset => true;

  Future<void> postSet(PVCacheCtx ctx);
}

mixin PVPostGet {
  bool get hasPostGet => true;

  Future<void> postGet(PVCacheCtx ctx);
}

mixin PVOnOptions {
  bool get hasOnOptions => true;

  Future<void> onOptions(PVCacheCtx ctx);
}

mixin PVPreHas {
  bool get hasPreHas => true;

  Future<void> preHas(PVCacheCtx ctx);
}

mixin PVPostHas {
  bool get hasPostHas => true;

  Future<void> postHas(PVCacheCtx ctx);
}

mixin PVPreRemove {
  bool get hasPreRemove => true;

  Future<void> preRemove(PVCacheCtx ctx);
}

mixin PVPostRemove {
  bool get hasPostRemove => true;

  Future<void> postRemove(PVCacheCtx ctx);
}

mixin PVPreClear {
  bool get hasPreClear => true;

  Future<void> preClear(PVCacheCtx ctx);
}

mixin PVPostClear {
  bool get hasPostClear => true;

  Future<void> postClear(PVCacheCtx ctx);
}

mixin PVPreHandlerOperation {
  bool get hasPreHandlerOperation => true;

  Future<void> preHandlerOperation(PVCacheCtx ctx);
}

mixin PVPostHandlerOperation {
  bool get hasPostHandlerOperation => true;

  Future<void> postHandlerOperation(PVCacheCtx ctx);
}
