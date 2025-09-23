import 'package:pvcache/src/core/config.dart';
import 'package:pvcache/src/core/pvcache.dart';

class PVCACHE {
  static final Function init = PVCache.init;

  static String defaultEnv = 'default';

  static (String, String) resolveEnv(String key) {
    if (!key.contains(':')) {
      return (defaultEnv, key);
    }
    int colonIndex = key.indexOf(':');
    String env = key.substring(0, colonIndex);
    String subKey = key.substring(colonIndex + 1);
    return (env, subKey);
  }

  static void register(PVCacheConfig config, {bool isDefault = false}) {
    PVCache.register(config, isDefault: isDefault);
  }

  static Future<void> set(
    String key,
    dynamic value, {
    Map<String, dynamic>? metadata,
  }) async {
    var (env, subKey) = resolveEnv(key);
    var cache = PVCache(env);
    await cache.set(subKey, value, metadata: metadata);
  }

  static Future<dynamic> get(String key, {Map<String, dynamic>? metadata}) async {
    var (env, subKey) = resolveEnv(key);
    var cache = PVCache(env);
    return await cache.get(subKey, metadata: metadata);
  }

  static Future<void> delete(String key) async {
    var (env, subKey) = resolveEnv(key);
    var cache = PVCache(env);
    await cache.delete(subKey);
  }


  static Future<void> clear(String key) async {
    var (env, subKey) = resolveEnv(key);
    var cache = PVCache(env);
    await cache.clear(subKey);
  }


  static Future<bool> has(String key) async {
    var (env, subKey) = resolveEnv(key);
    var cache = PVCache(env);
    return await cache.has(subKey);
  }

  static Future<dynamic> ifNotCached(
    String key,
    Function action, {
    Map<String, dynamic>? metadata,
  }) async {
    var (env, subKey) = resolveEnv(key);
    var cache = PVCache(env);
    return await cache.ifNotCached(
      subKey,
      action,
      metadata: metadata,
    );
  }
}
