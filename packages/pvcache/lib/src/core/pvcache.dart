import 'package:pvcache/src/core/config.dart';
import 'package:pvcache/src/core/interface.dart';
import 'package:pvcache/src/core/toplv.dart';

class PVCache {
  // env name related
  final String env;

  static String _defaultEnv = 'default';

  static String get defaultEnv {
    if (_defaultEnv.isEmpty || !_instances.containsKey(_defaultEnv)) {
      throw Exception('Default environment is not set or does not exist.');
    }
    return _defaultEnv;
  }

  static set defaultEnv(String env) {
    if (!_instances.containsKey(env)) {
      throw Exception(
        'PVCache instance for $env does not exist. Please create it first.',
      );
    }

    _defaultEnv = env;
  }

  //! singleton management
  static final Map<String, PVCache> _instances = {};

  PVCache._internal(this.env);

  factory PVCache(String env) {
    if (_instances.containsKey(env)) {
      return _instances[env]!;
    } else {
      final instance = PVCache._internal(env);
      _instances[env] = instance;
      return instance;
    }
  }

  static get encryptedEnv {
    return PVCache('encrypted');
  }

  // ignore: non_constant_identifier_names
  static get DefaultEnv {
    return PVCache(_defaultEnv);
  }

  //! config management
  static final Map<String, PVCacheConfig> _configs = {};

  static void initialize() {}

  static void register(PVCacheConfig config, {bool isDefault = false}) {
    if (PVCacheTopLv.initialized) {
      throw Exception('PVCache is already initialized.');
    }
    if (_configs.containsKey(config.env)) {
      throw Exception('PVCacheConfig for ${config.env} already exists.');
    }
    _configs[config.env] = config;
    if (isDefault) {
      _defaultEnv = config.env;
    }
  }

  // cache management
  PVCacheConfig get config {
    if (!_configs.containsKey(env)) {
      throw Exception('PVCacheConfig for $env does not exist.');
    }
    return _configs[env]!;
  }

  Future<void> set(
    String key,
    dynamic value, {
    Map<String, dynamic>? metadata,
  }) async {
    var ctx = PVCacheAdapterCtx(handle: "pre_set", value: value, metadata: metadata);
    config.handle(ctx: ctx);
    if (!ctx.isPrimaryOverride) {
      return Future.value();
    }
    await config.storage.set(key, ctx.value, config, metadata: metadata);

    ctx = PVCacheAdapterCtx(handle: "post_set", value: ctx.value, metadata: metadata);
    config.handle(ctx: ctx);
  }

  Future<dynamic> get(
    String key, {
    Map<String, dynamic>? metadata,
  }) async {
    var ctx = PVCacheAdapterCtx(handle: "pre_get", metadata: metadata);
    config.handle(ctx: ctx);
    if (!ctx.isPrimaryOverride) {
      return ctx.value;
    }
    final value = await config.storage.get(key, config);
    ctx = PVCacheAdapterCtx(handle: "post_get", value: value, metadata: metadata);
    config.handle(ctx: ctx);
    return ctx.value;
  }

  Future<void> delete(String key) async {
    var ctx = PVCacheAdapterCtx(handle: "pre_delete");
    config.handle(ctx: ctx);
    if (!ctx.isPrimaryOverride) {
      return Future.value();
    }
    await config.storage.set(key, null, config);

    ctx = PVCacheAdapterCtx(handle: "post_delete");
    config.handle(ctx: ctx);
  }

  Future<void> clear(String key) async {
    var ctx = PVCacheAdapterCtx(handle: "pre_clear");
    config.handle(ctx: ctx);
    if (!ctx.isPrimaryOverride) {
      return Future.value();
    }
    await config.storage.set(key, null, config);

    ctx = PVCacheAdapterCtx(handle: "post_clear");
    config.handle(ctx: ctx);
  }

  Future<bool> has(String key) async {
    var ctx = PVCacheAdapterCtx(handle: "pre_has");
    config.handle(ctx: ctx);
    if (!ctx.isPrimaryOverride) {
      return Future.value(false);
    }
    final value = await config.storage.get(key, config);
    ctx = PVCacheAdapterCtx(handle: "post_has", value: value);
    config.handle(ctx: ctx);
    return ctx.value != null;
  }

  Future<void> ifNotCached(String key, Function action, {Map<String, dynamic>? metadata}) async {
    if (!await has(key)) {
      var value = await action();
      await set(key, value, metadata: metadata);
    }
    return await get(key, metadata: metadata);
  }

}
