import 'package:pvcache/pvcache.dart';

class MemoryCache extends PVAdapter with PreOp {
  final Map<String, dynamic> _cache = {};
  final Map<String, DateTime> _lru = {};
  final int maxSize;

  MemoryCache(super.uid, {this.maxSize = 100});

  @override
  int get preClearPriority => 999;

  @override
  int get preDeletePriority => 999;

  @override
  int get preExistsPriority => 999;

  @override
  int get preGetPriority => 999;

  @override
  int get preSetPriority => 999;

  void _prune() {
    while (_cache.length > maxSize) {
      // Find the least recently used key
      final lruKey = _lru.entries
          .reduce((a, b) => a.value.isBefore(b.value) ? a : b)
          .key;
      _cache.remove(lruKey);
      _lru.remove(lruKey);
    }
  }

  @override
  Future<void> preOp(PVCtx ctx) async {
    if (ctx.functionIntent == "set") {
      _cache[ctx.key!] = ctx.value;
      _lru[ctx.key!] = DateTime.now();
    } else if (ctx.functionIntent == "get" &&
        ctx.key != null &&
        _cache.containsKey(ctx.key!)) {
      ctx.value = _cache[ctx.key!];
      _lru[ctx.key!] = DateTime.now();
      ctx.continueFlow = false;
    } else if (ctx.functionIntent == "delete" && ctx.key != null) {
      _cache.remove(ctx.key!);
      _lru.remove(ctx.key!);
    } else if (ctx.functionIntent == "clear") {
      _cache.clear();
      _lru.clear();
    }

    _prune();
  }
}
