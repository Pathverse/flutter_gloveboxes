part of '../config.dart';

class StdAdapter implements PVAdapter {
  @override
  bool get hasPreMethods => true;

  @override
  bool get hasPostMethods => false;

  @override
  Future<dynamic> get(String key, PVCacheConfig config) async {
    await PVCacheCore.ensure(config.name);
    final box = await PVCacheCore.get_(config.name);
    return await box.get(key);
  }

  @override
  Future<void> set(String key, dynamic value, PVCacheConfig config) async {
    await PVCacheCore.ensure(config.name);
    final box = await PVCacheCore.get_(config.name);
    await box.put(key, value);
  }

  @override
  Future<Map> getMeta(String key, PVCacheConfig config) async {
    await PVCacheCore.ensure(config.name);
    final metaBox = await PVCacheCore.get_('${config.name}-meta');
    final result = await metaBox.get(key);
    return result is Map
        ? Map<String, dynamic>.from(result)
        : <String, dynamic>{};
  }

  @override
  Future<void> setMeta(String key, Map metadata, PVCacheConfig config) async {
    await PVCacheCore.ensure(config.name);
    final metaBox = await PVCacheCore.get_('${config.name}-meta');
    await metaBox.put(key, metadata);
  }

  @override
  Future<void> delete(String key, PVCacheConfig config) async {
    await PVCacheCore.ensure(config.name);
    final box = await PVCacheCore.get_(config.name);
    await box.delete(key);
  }

  @override
  Future<void> deleteMeta(String key, PVCacheConfig config) async {
    await PVCacheCore.ensure(config.name);
    final metaBox = await PVCacheCore.get_('${config.name}-meta');
    await metaBox.delete(key);
  }

  @override
  Future<void> clear(PVCacheConfig config) async {
    await PVCacheCore.ensure(config.name);
    final box = await PVCacheCore.get_(config.name);
    await box.clear();
  }

  @override
  Future<void> clearMeta(PVCacheConfig config) async {
    await PVCacheCore.ensure(config.name);
    final metaBox = await PVCacheCore.get_('${config.name}-meta');
    await metaBox.clear();
  }

  @override
  Future<void> init(PVCacheConfig config) async {
    // Ensure the environment is properly set up
    await PVCacheCore.ensure(config.name);
  }

  @override
  Future<(dynamic, bool)> preGet(
    String key,
    Map metadata,
    PVCacheConfig config,
  ) async {
    // Check for expiry in metadata or defaultMeta
    final now = DateTime.now().millisecondsSinceEpoch;

    // Check metadata expiry first
    if (metadata.containsKey('expiry')) {
      final expiry = metadata['expiry'] as int?;
      if (expiry != null && now > expiry) {
        throw CacheExpiredException(
          'Cache entry expired at ${DateTime.fromMillisecondsSinceEpoch(expiry)}',
        );
      }
    }

    // Check defaultMeta expiry if no metadata expiry
    if (!metadata.containsKey('expiry') &&
        config.defaultMeta.containsKey('expiry')) {
      final expiry = config.defaultMeta['expiry'] as int?;
      if (expiry != null && now > expiry) {
        throw CacheExpiredException(
          'Cache entry expired (from defaultMeta) at ${DateTime.fromMillisecondsSinceEpoch(expiry)}',
        );
      }
    }

    // Return null value and continue flag - let the actual get operation proceed
    return (null, true);
  }

  @override
  Future<(dynamic, bool)> preSet(
    String key,
    dynamic value,
    Map<String, dynamic>? metadata,
    PVCacheConfig config,
  ) async {
    // No pre-set processing needed for the standard adapter
    // Return the original value and continue flag
    return (value, true);
  }

  @override
  Future<bool> preDelete(String key, PVCacheConfig config) async {
    // No pre-delete processing needed for the standard adapter
    return true;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
