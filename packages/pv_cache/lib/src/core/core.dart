import 'package:pv_cache/src/core/config.dart';
import 'package:pv_cache/src/core/toplv.dart';

class PVCache {
  static String defaultEnv = 'default';

  static final PVCache _instance = PVCache._();

  PVCache._();

  static PVCache get instance => _instance;

  /// Parses a key in the format {env}:{key} and returns the environment and actual key
  /// If no environment is specified (no colon), returns defaultEnv and the original key
  static (String env, String key) _parseKey(String inputKey) {
    final colonIndex = inputKey.indexOf(':');
    if (colonIndex == -1) {
      return (defaultEnv, inputKey);
    }

    final env = inputKey.substring(0, colonIndex);
    final key = inputKey.substring(colonIndex + 1);
    return (env, key);
  }

  static Future<void> init() async {
    await PVCacheCentral.init();
  }

  static Future<void> set(
    String key,
    dynamic value, {
    Map<String, dynamic>? metadata,
  }) async {
    final (env, actualKey) = _parseKey(key);
    final config = PVCacheCentral.environments[env];
    if (config == null) return;

    // Validate key is not a special internal key
    config.validateKey(actualKey);

    // Ensure the box is ready
    await PVCacheCentral.ensureBoxReady(env);

    if (config.defaultSet) {
      // Use default logic with pre/post hooks
      final processedValue = await config.preSet(actualKey, value, metadata);

      // Store the value
      if (config.boxType == PVBoxType.lazy) {
        await PVCacheCentral.lazyBoxes[env]?.put(actualKey, processedValue);
      } else {
        await PVCacheCentral.boxes[env]?.put(actualKey, processedValue);
      }

      // Post-processing
      await config.postSet(actualKey, processedValue);
    } else {
      // Use custom logic only - preSet handles everything
      await config.preSet(actualKey, value, metadata);
    }
  }

  static Future<dynamic> get(
    String key, {
    bool expiredReturnsNull = true,
  }) async {
    final (env, actualKey) = _parseKey(key);
    final config = PVCacheCentral.environments[env];
    if (config == null) return null;

    // Validate key is not a special internal key
    config.validateKey(actualKey);

    // Ensure the box is ready
    await PVCacheCentral.ensureBoxReady(env);

    if (config.defaultGet) {
      // Use default logic with pre/post hooks
      // Get the original value
      dynamic originalValue;
      if (config.boxType == PVBoxType.lazy) {
        originalValue = await PVCacheCentral.lazyBoxes[env]?.get(actualKey);
      } else {
        originalValue = PVCacheCentral.boxes[env]?.get(actualKey);
      }

      // Check if we should handle cache misses or return early
      if (originalValue == null && !config.handlesCacheMiss) {
        return null; // Fast path: no cache data and storage doesn't handle misses
      }

      // Pre-processing (includes expiry check and callback handling)
      final processedValue = await config.preGet(actualKey, originalValue);

      // If preGet returns null, return null (no data to cache or process)
      if (processedValue == null) return null;

      // If originalValue was null but preGet returned data, store it first
      if (originalValue == null && processedValue != null) {
        // Store the data returned by preGet
        if (config.boxType == PVBoxType.lazy) {
          await PVCacheCentral.lazyBoxes[env]?.put(actualKey, processedValue);
        } else {
          await PVCacheCentral.boxes[env]?.put(actualKey, processedValue);
        }

        // Call postSet to handle any additional processing
        await config.postSet(actualKey, processedValue);
      }

      // Post-processing
      await config.postGet(actualKey, processedValue);

      return processedValue;
    } else {
      // Use custom logic only - preGet handles everything
      return await config.preGet(actualKey, null);
    }
  }

  static Future<void> delete(String key) async {
    final (env, actualKey) = _parseKey(key);
    final config = PVCacheCentral.environments[env];
    if (config == null) return;

    // Validate key is not a special internal key
    config.validateKey(actualKey);

    // Ensure the box is ready
    await PVCacheCentral.ensureBoxReady(env);

    if (config.defaultDelete) {
      // Use default logic with pre/post hooks
      // Pre-processing (cleanup metadata)
      await config.preDelete(actualKey);

      // Delete the value
      if (config.boxType == PVBoxType.lazy) {
        await PVCacheCentral.lazyBoxes[env]?.delete(actualKey);
      } else {
        await PVCacheCentral.boxes[env]?.delete(actualKey);
      }

      // Post-processing
      await config.postDelete(actualKey);
    } else {
      // Use custom logic only - preDelete handles everything
      await config.preDelete(actualKey);
    }
  }

  static Future<void> clear({String? env}) async {
    final targetEnv = env ?? defaultEnv;
    final config = PVCacheCentral.environments[targetEnv];
    if (config == null) return;

    // Ensure the box is ready
    await PVCacheCentral.ensureBoxReady(targetEnv);

    // Clear the environment box
    if (config.boxType == PVBoxType.lazy) {
      await PVCacheCentral.lazyBoxes[targetEnv]?.clear();
    } else {
      await PVCacheCentral.boxes[targetEnv]?.clear();
    }

    if (config.useSecureMeta) {
      await PVCacheCentral.secureMetaClear(env: config.metaHash);
    } else {
      // Clear metadata for this environment from the single meta box
      await PVCacheCentral.clearMetaForEnvironment(config.metaHash);
    }
  }

  static Future<dynamic> pop(String key) async {
    final value = await get(key);
    await delete(key);
    return value;
  }

  /// Gets a value from cache, or if not cached, executes the callback to get the value and caches it
  /// Returns the cached value or the newly cached value from the callback
  static Future<dynamic> ifNotCached(
    String key,
    Future<dynamic> Function() callback, {
    Map<String, dynamic>? metadata,
  }) async {
    final (env, actualKey) = _parseKey(key);
    final config = PVCacheCentral.environments[env];
    if (config == null) return null;

    // Validate key is not a special internal key
    config.validateKey(actualKey);

    // Ensure the box is ready
    await PVCacheCentral.ensureBoxReady(env);

    // Try to get the existing value
    dynamic existingValue;
    if (config.boxType == PVBoxType.lazy) {
      existingValue = await PVCacheCentral.lazyBoxes[env]?.get(actualKey);
    } else {
      existingValue = PVCacheCentral.boxes[env]?.get(actualKey);
    }

    // If value exists and is valid, return it
    if (existingValue != null) {
      if (config.defaultGet) {
        // Apply pre/post processing to existing value
        final processedValue = await config.preGet(actualKey, existingValue);
        if (processedValue != null) {
          await config.postGet(actualKey, processedValue);
          return processedValue;
        }
      } else {
        // Use custom logic only
        return await config.preGet(actualKey, existingValue);
      }
    }

    // Value doesn't exist or is invalid, execute callback to get new value
    final newValue = await callback();

    // Cache the new value
    await set(key, newValue, metadata: metadata);

    return newValue;
  }

  static Future<void> setEnv(String env, PVCacheEnvConfig config) async {
    if (env == 'meta') {
      throw Exception('Environment $env is reserved');
    }
    if (PVCacheCentral.environments.containsKey(env)) {
      throw Exception('Environment $env already exists');
    }

    PVCacheCentral.environments[env] = config;
    PVCacheCentral.envToHash[env] = config.metaHash; // Store the hash mapping
  }

    // iter env keys
    static Future<Iterable<String>> iterEnvKeys(String env) async {
      final config = PVCacheCentral.environments[env];
      if (config == null) return [];

      if (config.boxType == PVBoxType.lazy) {
        return PVCacheCentral.lazyBoxes[env]?.keys.cast<String>() ?? [];
      } else {
        return PVCacheCentral.boxes[env]?.keys.cast<String>() ?? [];
      }
    }
}
