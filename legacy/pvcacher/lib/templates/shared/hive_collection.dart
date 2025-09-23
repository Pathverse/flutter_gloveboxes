// ignore_for_file: depend_on_referenced_packages

import 'package:hive_ce/hive.dart';
import 'package:pvcacher/src/ctx.dart';
import '../cache/std/obj.dart';

class HiveCollectionTop0 {
  static BoxCollection? boxCollection;
  static HiveCipher? hiveCipher;

  static final Map<String, PVCacheCtx> _configs = {};
  static final Map<String, List<String>> _additionalBoxNames = {};

  static bool _isInitialized = false;

  static bool get isInitialized => _isInitialized;

  static Future<void> register(
    PVCacheCtx ctx,
    List<String> additionalBoxNames,
  ) async {
    if (_configs.containsKey(ctx.cacher.namespace)) {
      throw Exception('Namespace already registered');
    }
    _configs[ctx.cacher.namespace] = ctx;
    _additionalBoxNames[ctx.cacher.namespace] = additionalBoxNames;
  }

  static Future<void> init() async {
    if (_isInitialized) return;

    _isInitialized = true;

    // Register type adapters for non-primitive types
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(StdObjectAdapter());
    }

    final totalBoxnames = <String>{};

    for (var ctx in _configs.values) {
      totalBoxnames.addAll(_additionalBoxNames[ctx.cacher.namespace] ?? []);
      totalBoxnames.add(ctx.cacher.namespace);
    }

    boxCollection = await BoxCollection.open(
      "PVCACHE",
      totalBoxnames,
      key: hiveCipher,
    );
  }

  static Future<CollectionBox<T>> getCollectionBox<T>(
    String name,
    PVCacheCtx ctx, {
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    if (!isInitialized) {
      throw Exception('HiveCollectionTop0 is not initialized');
    }

    // check if in valid ctx
    final additionalBoxes = _additionalBoxNames[ctx.cacher.namespace] ?? [];
    final isValidBox =
        (name == ctx.cacher.namespace) || additionalBoxes.contains(name);

    if (!isValidBox) {
      throw Exception(
        'Box $name is not valid in context: ${ctx.cacher.namespace}',
      );
    }

    final box = await boxCollection!.openBox<T>(name, fromJson: fromJson);

    return box;
  }
}
