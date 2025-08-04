import 'dart:collection';
import 'package:pvcache/config.dart';
import 'package:pvcache/core.dart' show PVCacheCore;
import 'package:pvcache/exceptions.dart';
import 'package:pvcache/utils/debug.dart';

class PVCache {
  static String defaultEnv = "kv";

  static Future<void> init() async {
    await PVCacheCore.init();
  }

  static Future<void> register(
    String name, {
    bool secureData = false,
    bool secureMeta = false,
    Type? type,
    bool isMap = false,
    LinkedHashMap<String, PVAdapter>? adapters,
    Map<String, dynamic> defaultMeta = const {},
    PVSerializer? serializer,
  }) async {
    await PVCacheCore.register(
      name,
      PVCacheConfig(
        name: name,
        secureData: secureData,
        secureMeta: secureMeta,
        type: type,
        isMap: isMap,
        adapters: adapters,
        defaultMeta: defaultMeta,
        serializer: serializer,
      ),
    );
  }

  // Main API methods that support both env:key and key formats
  static Future<void> set(
    String key,
    dynamic value, {
    Map<String, dynamic>? metadata,
  }) async {
    cacheDebugPrint(
      '🎯 PVCache.set: key="$key", value="$value", metadata=$metadata',
    );
    final (env, actualKey) = _parseKey(key);
    cacheDebugPrint(
      '🔍 PVCache.set: Parsed env="$env", actualKey="$actualKey"',
    );

    if (env == 'kv') {
      cacheDebugPrint('📦 PVCache.set: Using KV storage');
      await _setKV(actualKey, value);
    } else if (env == 'encrypted') {
      cacheDebugPrint('🔒 PVCache.set: Using encrypted storage');
      await _setEncrypted(actualKey, value, metadata);
    } else {
      cacheDebugPrint('🔧 PVCache.set: Using custom adapter for env="$env"');
      await _setCustom(env, actualKey, value, metadata);
    }
  }

  static Future<dynamic> get(String key) async {
    cacheDebugPrint('🎯 PVCache.get: key="$key"');
    final (env, actualKey) = _parseKey(key);
    cacheDebugPrint(
      '🔍 PVCache.get: Parsed env="$env", actualKey="$actualKey"',
    );

    if (env == 'kv') {
      cacheDebugPrint('📦 PVCache.get: Using KV storage');
      return await _getKV(actualKey);
    } else if (env == 'encrypted') {
      cacheDebugPrint('🔒 PVCache.get: Using encrypted storage');
      return await _getEncrypted(actualKey);
    } else {
      cacheDebugPrint('🔧 PVCache.get: Using custom adapter for env="$env"');
      return await _getCustom(env, actualKey);
    }
  }

  static Future<void> delete(String key) async {
    final (env, actualKey) = _parseKey(key);

    if (env == 'kv') {
      await _deleteKV(actualKey);
    } else if (env == 'encrypted') {
      await _deleteEncrypted(actualKey);
    } else {
      await _deleteCustom(env, actualKey);
    }
  }

  static Future<void> setMeta(String key, Map<String, dynamic> metadata) async {
    final (env, actualKey) = _parseKey(key);

    if (env == 'kv') {
      throw Exception('KV environment does not support metadata');
    } else if (env == 'encrypted') {
      throw Exception(
        'Encrypted environment metadata is handled automatically',
      );
    } else {
      await _setMetaCustom(env, actualKey, metadata);
    }
  }

  static Future<Map<String, dynamic>> getMeta(String key) async {
    final (env, actualKey) = _parseKey(key);

    if (env == 'kv') {
      throw Exception('KV environment does not support metadata');
    } else if (env == 'encrypted') {
      throw Exception(
        'Encrypted environment metadata is handled automatically',
      );
    } else {
      return await _getMetaCustom(env, actualKey);
    }
  }

  static Future<void> clear(String envKey) async {
    // envKey should be just the environment name for clear operations
    if (envKey == 'kv') {
      await PVCacheCore.kvBox.clear();
    } else if (envKey == 'encrypted') {
      await PVCacheCore.secureStorage!.deleteAll();
    } else {
      await _clearCustom(envKey);
    }
  }

  // Helper method to parse env:key or default to defaultEnv
  static (String env, String key) _parseKey(String input) {
    (String env, String key) results;
    if (input.contains(':')) {
      results = PVCacheCore.parseKey(input);
    } else {
      results = (defaultEnv, input);
    }
    // check reserved var names __
    if (results.$2.startsWith("__")) {
      throw CacheReservedNameException(results.$2);
    }

    return results;
  }

  // KV environment methods (string only, no metadata)
  static Future<void> _setKV(String key, dynamic value) async {
    final stringValue = value.toString();
    await PVCacheCore.kvBox.put(key, stringValue);
  }

  static Future<String?> _getKV(String key) async {
    return PVCacheCore.kvBox.get(key);
  }

  static Future<void> _deleteKV(String key) async {
    await PVCacheCore.kvBox.delete(key);
  }

  // Encrypted environment methods (string only, meta in secure format)
  static Future<void> _setEncrypted(
    String key,
    dynamic value,
    Map<String, dynamic>? metadata,
  ) async {
    final stringValue = value.toString();
    final secureStorage = PVCacheCore.secureStorage!;

    if (metadata != null) {
      // Use secure meta format: store meta info that points to actual data
      final serializer = defaultSerializer;
      final actualDataKey = 'data_${serializer.generateMetaId()}';
      final secureMetaValue = serializer.formatSecureMeta(
        metadata,
        actualDataKey,
      );

      // Store the secure meta format under the original key
      await secureStorage.write(key: key, value: secureMetaValue);
      // Store the actual data under the generated key
      await secureStorage.write(key: actualDataKey, value: stringValue);
    } else {
      // Store directly if no metadata
      await secureStorage.write(key: key, value: stringValue);
    }
  }

  static Future<String?> _getEncrypted(String key) async {
    final secureStorage = PVCacheCore.secureStorage!;
    final value = await secureStorage.read(key: key);

    if (value == null) return null;

    // Check if this is secure meta format
    final serializer = defaultSerializer;
    final parsed = serializer.parseSecureMeta(value);

    if (parsed != null) {
      final (meta, actualDataKey) = parsed;

      // Check expiry from metadata
      if (meta.containsKey('expiry')) {
        final expiry = meta['expiry'] as int?;
        if (expiry != null && DateTime.now().millisecondsSinceEpoch > expiry) {
          throw CacheExpiredException('Encrypted cache entry expired');
        }
      }

      // Return the actual data
      return await secureStorage.read(key: actualDataKey);
    }

    // Return direct value if not secure meta format
    return value;
  }

  static Future<void> _deleteEncrypted(String key) async {
    final secureStorage = PVCacheCore.secureStorage!;
    final value = await secureStorage.read(key: key);

    if (value != null) {
      // Check if this is secure meta format and delete both keys
      final serializer = defaultSerializer;
      final parsed = serializer.parseSecureMeta(value);

      if (parsed != null) {
        final (_, actualDataKey) = parsed;
        await secureStorage.delete(key: actualDataKey);
      }
    }

    await secureStorage.delete(key: key);
  }

  // Custom environment methods (use adapter pattern)
  static Future<void> _setCustom(
    String env,
    String key,
    dynamic value,
    Map<String, dynamic>? metadata,
  ) async {
    cacheDebugPrint(
      '🏁 PVCache._setCustom: START - env="$env", key="$key", value="$value"',
    );
    final config = PVCacheCore.getConfig(env)!;
    final adapter = config.adapters[config.overwriteSet]!;
    final metaAdapter = config.adapters[config.overwriteMetaSet]!;

    cacheDebugPrint(
      '🔧 PVCache._setCustom: Available adapters: ${config.adapters.keys.toList()}',
    );
    cacheDebugPrint(
      '🔧 PVCache._setCustom: Storage adapter=${adapter.runtimeType}, metaAdapter=${metaAdapter.runtimeType}',
    );

    // Call pre-set hooks for ALL adapters that have them
    dynamic finalValue = value;
    bool shouldContinue = true;

    for (final adapterEntry in config.adapters.entries) {
      final adapterName = adapterEntry.key;
      final currentAdapter = adapterEntry.value;

      if (currentAdapter.hasPreMethods && shouldContinue) {
        cacheDebugPrint(
          '🪝 PVCache._setCustom: Calling preSet for $adapterName (${currentAdapter.runtimeType})',
        );
        final (hookValue, hookContinue) = await currentAdapter.preSet(
          key,
          finalValue,
          metadata,
          config,
        );
        finalValue = hookValue;
        shouldContinue = shouldContinue && hookContinue;
        cacheDebugPrint(
          '🪝 PVCache._setCustom: $adapterName.preSet returned value="$hookValue", continue=$hookContinue',
        );
      }
    }

    cacheDebugPrint(
      '🚦 PVCache._setCustom: Final shouldContinue=$shouldContinue, finalValue="$finalValue"',
    );

    // Only proceed with storage if hooks allow it
    if (shouldContinue) {
      cacheDebugPrint(
        '💾 PVCache._setCustom: Proceeding with storage operations',
      );
      // Perform the actual operations using the potentially modified value
      await adapter.set(key, finalValue, config);

      if (metadata != null) {
        await metaAdapter.setMeta(key, metadata, config);
      }

      // Call post-set hooks for ALL adapters that have them
      for (final adapterEntry in config.adapters.entries) {
        final adapterName = adapterEntry.key;
        final currentAdapter = adapterEntry.value;

        if (currentAdapter.hasPostMethods) {
          cacheDebugPrint(
            '🪝 PVCache._setCustom: Calling postSet for $adapterName (${currentAdapter.runtimeType})',
          );
          await currentAdapter.postSet(key, finalValue, config);
        }
      }
      cacheDebugPrint('✅ PVCache._setCustom: COMPLETED successfully');
    } else {
      cacheDebugPrint('🛑 PVCache._setCustom: HALTED by hooks');
    }
  }

  static Future<dynamic> _getCustom(String env, String key) async {
    cacheDebugPrint('🔍 PVCache._getCustom: START - env="$env", key="$key"');
    final config = PVCacheCore.getConfig(env)!;
    final adapter = config.adapters[config.overwriteGet]!;
    final metaAdapter = config.adapters[config.overwriteMetaGet]!;

    cacheDebugPrint(
      '🔧 PVCache._getCustom: Available adapters: ${config.adapters.keys.toList()}',
    );
    cacheDebugPrint(
      '🔧 PVCache._getCustom: Storage adapter=${adapter.runtimeType}, metaAdapter=${metaAdapter.runtimeType}',
    );

    Map<String, dynamic> metadata = {};
    try {
      final metaResult = await metaAdapter.getMeta(key, config);
      metadata = Map<String, dynamic>.from(metaResult);
      cacheDebugPrint('📋 PVCache._getCustom: Retrieved metadata: $metadata');
    } catch (e) {
      metadata = Map<String, dynamic>.from(config.defaultMeta);
      cacheDebugPrint(
        '📋 PVCache._getCustom: Using default metadata (error: $e): $metadata',
      );
    }

    // Call pre-get hooks for ALL adapters that have them
    dynamic hookValue;
    bool shouldContinue = true;

    for (final adapterEntry in config.adapters.entries) {
      final adapterName = adapterEntry.key;
      final currentAdapter = adapterEntry.value;

      if (currentAdapter.hasPreMethods && shouldContinue) {
        cacheDebugPrint(
          '🪝 PVCache._getCustom: Calling preGet for $adapterName (${currentAdapter.runtimeType})',
        );
        final (currentHookValue, currentContinue) = await currentAdapter.preGet(
          key,
          metadata,
          config,
        );
        if (!currentContinue) {
          hookValue = currentHookValue;
          shouldContinue = false;
        }
        cacheDebugPrint(
          '🪝 PVCache._getCustom: $adapterName.preGet returned value="$currentHookValue", continue=$currentContinue',
        );
      }
    }

    // If hooks provided a value and halted, return that value
    if (!shouldContinue) {
      cacheDebugPrint(
        '🛑 PVCache._getCustom: HALTED by hooks, returning: $hookValue',
      );
      return hookValue;
    }

    cacheDebugPrint(
      '💾 PVCache._getCustom: Proceeding with storage get operation',
    );
    final value = await adapter.get(key, config);
    cacheDebugPrint(
      '💾 PVCache._getCustom: Retrieved value from storage: $value',
    );

    // Call post-get hooks for ALL adapters that have them
    for (final adapterEntry in config.adapters.entries) {
      final adapterName = adapterEntry.key;
      final currentAdapter = adapterEntry.value;

      if (currentAdapter.hasPostMethods) {
        cacheDebugPrint(
          '🪝 PVCache._getCustom: Calling postGet for $adapterName (${currentAdapter.runtimeType})',
        );
        await currentAdapter.postGet(key, value, config);
      }
    }

    cacheDebugPrint('✅ PVCache._getCustom: COMPLETED, returning: $value');
    return value;
  }

  static Future<void> _deleteCustom(String env, String key) async {
    final config = PVCacheCore.getConfig(env)!;
    final adapter = config.adapters[config.overwriteDelete]!;
    final metaAdapter = config.adapters[config.overwriteMetaDelete]!;

    // Call pre-delete hooks for ALL adapters that have them
    bool shouldContinue = true;
    for (final adapterEntry in config.adapters.entries) {
      final adapterName = adapterEntry.key;
      final currentAdapter = adapterEntry.value;

      if (currentAdapter.hasPreMethods && shouldContinue) {
        cacheDebugPrint(
          '🪝 PVCache._deleteCustom: Calling preDelete for $adapterName (${currentAdapter.runtimeType})',
        );
        shouldContinue = await currentAdapter.preDelete(key, config);
        cacheDebugPrint(
          '🪝 PVCache._deleteCustom: $adapterName.preDelete returned continue=$shouldContinue',
        );
      }
    }

    // Only proceed with deletion if hooks allow it
    if (shouldContinue) {
      // Perform the actual operations
      await adapter.delete(key, config);
      await metaAdapter.deleteMeta(key, config);

      // Call post-delete hooks for ALL adapters that have them
      for (final adapterEntry in config.adapters.entries) {
        final adapterName = adapterEntry.key;
        final currentAdapter = adapterEntry.value;

        if (currentAdapter.hasPostMethods) {
          cacheDebugPrint(
            '🪝 PVCache._deleteCustom: Calling postDelete for $adapterName (${currentAdapter.runtimeType})',
          );
          await currentAdapter.postDelete(key, config);
        }
      }
    }
  }

  static Future<void> _setMetaCustom(
    String env,
    String key,
    Map<String, dynamic> metadata,
  ) async {
    final config = PVCacheCore.getConfig(env)!;
    final adapter = config.adapters[config.overwriteMetaSet]!;
    await adapter.setMeta(key, metadata, config);
  }

  static Future<Map<String, dynamic>> _getMetaCustom(
    String env,
    String key,
  ) async {
    final config = PVCacheCore.getConfig(env)!;
    final adapter = config.adapters[config.overwriteMetaGet]!;
    final result = await adapter.getMeta(key, config);
    return Map<String, dynamic>.from(result);
  }

  static Future<void> _clearCustom(String env) async {
    final config = PVCacheCore.getConfig(env)!;
    final adapter = config.adapters[config.overwriteClear]!;
    await adapter.clear(config);
  }

  /// Gets a value from cache, or if not cached, executes the callback to get the value and caches it
  /// Returns the cached value or the newly cached value from the callback
  static Future<dynamic> ifNotCached(
    String key,
    Future<dynamic> Function() callback, {
    Map<String, dynamic>? metadata,
  }) async {
    cacheDebugPrint('🔄 PVCache.ifNotCached: key="$key", metadata=$metadata');
    final (env, actualKey) = _parseKey(key);
    cacheDebugPrint(
      '🔍 PVCache.ifNotCached: Parsed env="$env", actualKey="$actualKey"',
    );

    // Handle KV environment (string only, no metadata support)
    if (env == 'kv') {
      cacheDebugPrint('📦 PVCache.ifNotCached: Using KV storage');
      final existingValue = await _getKV(actualKey);
      if (existingValue != null) {
        cacheDebugPrint('✅ PVCache.ifNotCached: Found cached value in KV');
        return existingValue;
      }

      cacheDebugPrint(
        '🔄 PVCache.ifNotCached: KV cache miss, executing callback',
      );
      final newValue = await callback();
      await _setKV(actualKey, newValue);
      return newValue;
    }

    // Handle encrypted environment specially
    if (env == 'encrypted') {
      cacheDebugPrint('🔒 PVCache.ifNotCached: Using encrypted storage');
      try {
        final existingValue = await _getEncrypted(actualKey);
        if (existingValue != null) {
          cacheDebugPrint(
            '✅ PVCache.ifNotCached: Found valid cached value in encrypted storage',
          );
          return existingValue;
        }
      } catch (e) {
        cacheDebugPrint(
          '⚠️ PVCache.ifNotCached: Encrypted value expired or invalid: $e',
        );
        // Continue to fetch new value
      }

      cacheDebugPrint(
        '🔄 PVCache.ifNotCached: Encrypted cache miss, executing callback',
      );
      final newValue = await callback();
      await _setEncrypted(actualKey, newValue, metadata);
      return newValue;
    }

    // Handle custom environment with adapter pattern
    cacheDebugPrint(
      '🔧 PVCache.ifNotCached: Using custom adapter for env="$env"',
    );
    final existingValue = await _getCustom(env, actualKey);

    if (existingValue != null) {
      cacheDebugPrint(
        '✅ PVCache.ifNotCached: Found cached value in custom environment',
      );
      return existingValue;
    }

    cacheDebugPrint(
      '🔄 PVCache.ifNotCached: Custom cache miss, executing callback',
    );
    final newValue = await callback();
    await _setCustom(env, actualKey, newValue, metadata);

    cacheDebugPrint('✅ PVCache.ifNotCached: Cached new value and returning');
    return newValue;
  }

  static Future<dynamic> pop(String key) async {
    final value = await get(key);
    await delete(key);
    return value;
  }
}
