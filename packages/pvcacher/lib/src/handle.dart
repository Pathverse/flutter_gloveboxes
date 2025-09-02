import 'package:pvcacher/src/ctx.dart';

abstract class PVCacheHandle {
  bool get beforeAnythingOuter => true;
  bool get afterAnythingOuter => true;

  Future<void> beforeAnything(PVCacheCtx ctx) async {
    return;
  }

  Future<void> afterAnything(PVCacheCtx ctx) async {
    return;
  }

  /// internal handler for cache items
  ///
  Future<void> onConstruct(PVCacheCtx ctx);
  Future<void> init(PVCacheCtx ctx);

  Future<void> beforeSet(PVCacheCtx ctx) async {
    return;
  }

  Future<void> set(PVCacheCtx ctx);

  Future<void> afterSet(PVCacheCtx ctx) async {
    return;
  }

  Future<void> beforeGet(PVCacheCtx ctx) async {
    return;
  }

  Future<dynamic> get(PVCacheCtx ctx);

  Future<void> afterGet(PVCacheCtx ctx) async {
    return;
  }

  Future<void> beforeRemove(PVCacheCtx ctx) async {
    return;
  }

  Future<void> remove(PVCacheCtx ctx);

  Future<void> afterRemove(PVCacheCtx ctx) async {
    return;
  }

  Future<void> beforeClear(PVCacheCtx ctx) async {
    return;
  }

  Future<void> clear(PVCacheCtx ctx);
  Future<void> afterClear(PVCacheCtx ctx) async {
    return;
  }

  Future<void> beforeHas(PVCacheCtx ctx) async {
    return;
  }

  Future<void> has(PVCacheCtx ctx);

  Future<void> afterHas(PVCacheCtx ctx) async {
    return;
  }
}
