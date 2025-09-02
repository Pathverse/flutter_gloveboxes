// ignore_for_file: depend_on_referenced_packages

import 'package:crypto/crypto.dart';
import 'package:hive_ce/hive.dart';
import 'package:pvcacher/src/ctx.dart';
import 'package:pvcacher/src/handle.dart';
import 'package:pvcacher/templates/cache/std/obj.dart';
import 'package:pvcacher/templates/shared/hive_collection.dart';

class StdHandler extends PVCacheHandle {
  late CollectionBox _box;
  late CollectionBox _metaBox;

  final Map<String, Map> _metaCache = {};

  @override
  bool get beforeAnythingOuter => false; // Load metadata BEFORE adapter hooks

  @override
  Future<void> init(PVCacheCtx ctx) async {
    await HiveCollectionTop0.init();
    _box = await HiveCollectionTop0.getCollectionBox<StdObject>(
      ctx.cacher.namespace,
      ctx,
      fromJson: StdObject.fromJson,
    );
    _metaBox = await HiveCollectionTop0.getCollectionBox<Map>(
      "${ctx.cacher.namespace}_meta",
      ctx,
    );
  }

  @override
  Future<void> onConstruct(PVCacheCtx ctx) async {
    if (ctx.cacher.namespace.endsWith("_meta")) {
      throw Exception("Meta namespaces are not allowed");
    }

    await HiveCollectionTop0.register(ctx, ["${ctx.cacher.namespace}_meta"]);
  }

  @override
  Future<void> beforeAnything(PVCacheCtx ctx) async {
    if (ctx.callingFunc == "clear") {
      return;
    }

    // flash sha256 into contexts
    final sha256key = sha256.convert(ctx.key?.codeUnits ?? []).toString();
    ctx.contexts["sha256"] = sha256key;

    // check if sha256 key exists in the meta cache
    if (!_metaCache.containsKey(sha256key)) {
      // Not in memory cache, try loading from disk
      final diskMeta = await _metaBox.get(sha256key);
      print('LOAD_META: sha256key=$sha256key, diskMeta=$diskMeta');
      if (diskMeta != null) {
        _metaCache[sha256key] = Map<String, dynamic>.from(diskMeta);
        print('LOAD_META: Loaded into cache: ${_metaCache[sha256key]}');
      }
    }

    print(sha256key);
    // populate options with metadata if available
    if (_metaCache.containsKey(sha256key)) {
      print('LOAD_META: Found in cache: ${_metaCache[sha256key]}');
      ctx.options.addAll(Map<String, dynamic>.from(_metaCache[sha256key]!));
      print('LOAD_META: ctx.options after loading: ${ctx.options}');
    } else {
      print('LOAD_META: No metadata found for $sha256key');
    }
    print(ctx.options);
  }

  @override
  Future<void> clear(PVCacheCtx ctx) async {
    await _box.clear();
    _metaCache.clear();
    await _metaBox.clear();
  }

  @override
  Future<dynamic> get(PVCacheCtx ctx) async {
    final StdObject? stdObj = await _box.get(ctx.key!);

    if (stdObj != null) {
      final result = stdObj.toObject();

      return result;
    }

    return null;
  }

  @override
  Future<void> has(PVCacheCtx ctx) async {
    final List<String> keys = await _box.getAllKeys();
    ctx.result = keys.contains(ctx.key!);
  }

  @override
  Future<void> remove(PVCacheCtx ctx) async {
    await _box.delete(ctx.key!);
  }

  @override
  Future<void> set(PVCacheCtx ctx) async {
    final sha256key = ctx.contexts["sha256"] as String;
    print('SAVE_META: sha256key=$sha256key, options=${ctx.options}');
    if (ctx.options.isNotEmpty) {
      final meta = Map<String, dynamic>.from(ctx.options);
      _metaCache[sha256key] = meta;
      await _metaBox.put(sha256key, meta);
      print('SAVE_META: Saved metadata: $meta');
    }

    final obj = StdObject(ctx.value);

    await _box.put(ctx.key!, obj);
  }
}
