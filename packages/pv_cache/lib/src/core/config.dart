import 'package:pv_cache/src/core/toplv.dart';
import 'package:pv_cache/utils/json.dart';

enum PVBoxType { lazy, normal }

abstract class PVCacheEnvConfig {
  final PVBoxType boxType;
  final String metaId;
  final bool useMeta;
  final bool useSecureMeta;

  // Default logic control flags
  final bool defaultGet;
  final bool defaultSet;
  final bool defaultDelete;

  // Cache miss handling flag
  final bool handlesCacheMiss;

  

  PVCacheEnvConfig({
    this.boxType = PVBoxType.lazy,
    this.useMeta = true,
    this.useSecureMeta = false,
    String? metaId,
    this.defaultGet = true,
    this.defaultSet = true,
    this.defaultDelete = true,
    this.handlesCacheMiss = false,
  }) : metaId = metaId ??
            'pvcache_${DateTime.now().millisecondsSinceEpoch}';

  /// Get the meta hash for this configuration
  String get metaHash => PVCacheCentral.generateMetaHash(metaId);

  /// Find the environment name for this configuration using the metaHash
  String get environmentName {
    return PVCacheCentral.envToHash.entries
        .firstWhere(
          (entry) => entry.value == metaHash,
          orElse: () => const MapEntry('default', ''),
        )
        .key;
  }

  /// Raw storage access - set value directly to box without hooks
  Future<void> rawSet(String key, dynamic value) async {
    final env = environmentName;
    await PVCacheCentral.ensureBoxReady(env);

    if (boxType == PVBoxType.lazy) {
      await PVCacheCentral.lazyBoxes[env]?.put(key, value);
    } else {
      await PVCacheCentral.boxes[env]?.put(key, value);
    }
  }

  /// Raw storage access - get value directly from box without hooks
  Future<dynamic> rawGet(String key) async {
    final env = environmentName;
    await PVCacheCentral.ensureBoxReady(env);

    if (boxType == PVBoxType.lazy) {
      return await PVCacheCentral.lazyBoxes[env]?.get(key);
    } else {
      return PVCacheCentral.boxes[env]?.get(key);
    }
  }

  /// Delete both metadata and the actual value from cache when invalid
  Future<void> rawDelete(String key) async {
    // Delete metadata
    await deleteMeta(key);

    // Delete the actual value from cache directly
    final env = environmentName;

    // Ensure the box is ready before trying to delete
    await PVCacheCentral.ensureBoxReady(env);

    if (boxType == PVBoxType.lazy) {
      await PVCacheCentral.lazyBoxes[env]?.delete(key);
    } else {
      await PVCacheCentral.boxes[env]?.delete(key);
    }
  }

  /// Validate that a key is not a special internal key
  void validateKey(String key) {
    if (PVCacheCentral.isSpecialKey(key)) {
      throw ArgumentError(
        'Keys starting and ending with __ are reserved for internal use: $key',
      );
    }
  }

  Future<Map<String, dynamic>?> getMeta(String key) async {
    if (!useMeta) {
      return null;
    }
    if (useSecureMeta) {
      return await PVCacheCentral.secureMetaGet(env: metaHash, key: key);
    }
    // Use single meta box with environment-prefixed keys
    final envKey = '$metaHash:$key';
    final value = PVCacheCentral.metaBoxes['meta']?.get(envKey);
    if (value == null) return null;
    if (value is String) {
      return jsonLoad(value);
    }
    return value as Map<String, dynamic>?;
  }

  Future<void> setMeta(String key, Map<String, dynamic> value) async {
    if (!useMeta) {
      return;
    }
    if (useSecureMeta) {
      await PVCacheCentral.secureMetaSet(env: metaHash, key: key, value: value);
    }
    // Use single meta box with environment-prefixed keys
    final envKey = '$metaHash:$key';
    await PVCacheCentral.metaBoxes['meta']?.put(envKey, jsonDump(value));
  }

  Future<void> deleteMeta(String key) async {
    if (!useMeta) {
      return;
    }
    if (useSecureMeta) {
      await PVCacheCentral.secureMetaDelete(env: metaHash, key: key);
    }
    // Use single meta box with environment-prefixed keys
    final envKey = '$metaHash:$key';
    await PVCacheCentral.metaBoxes['meta']?.delete(envKey);
  }

  Future<bool> isValid(String key);
  Future<void> invalidCleanup(String key);

  // Pre-operation methods that can modify values and return overloadable results
  Future<dynamic> preGet(String key, dynamic originalValue);
  Future<dynamic> preSet(
    String key,
    dynamic value,
    Map<String, dynamic>? metadata,
  );
  Future<void> preDelete(String key);

  // Post-operation methods for cleanup and final processing
  Future<void> postGet(String key, dynamic value);
  Future<void> postSet(String key, dynamic value);
  Future<void> postDelete(String key);
}
