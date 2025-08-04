part of '../config.dart';

class SecureAdapter implements PVAdapter {
  @override
  bool get hasPreMethods => true;

  @override
  bool get hasPostMethods => false;

  @override
  Future<dynamic> get(String key, PVCacheConfig config) async {
    final secureStorage = PVCacheCore.secureStorage!;
    final value = await secureStorage.read(key: '${config.name}:$key');

    if (value == null) return null;

    return await config.serializer.deserialize(value);
  }

  @override
  Future<void> set(String key, dynamic value, PVCacheConfig config) async {
    final secureStorage = PVCacheCore.secureStorage!;
    final serializedValue = await config.serializer.serialize(value);
    await secureStorage.write(
      key: '${config.name}:$key',
      value: serializedValue,
    );
  }

  @override
  Future<Map> getMeta(String key, PVCacheConfig config) async {
    final secureStorage = PVCacheCore.secureStorage!;
    final metaKey = '${config.name}-meta:$key';
    final value = await secureStorage.read(key: metaKey);

    if (value == null) {
      return Map<String, dynamic>.from(config.defaultMeta);
    }

    try {
      final decoded = jsonDecode(value);
      return Map<String, dynamic>.from(decoded);
    } catch (e) {
      return Map<String, dynamic>.from(config.defaultMeta);
    }
  }

  @override
  Future<void> setMeta(String key, Map metadata, PVCacheConfig config) async {
    final secureStorage = PVCacheCore.secureStorage!;
    final metaKey = '${config.name}-meta:$key';
    final encodedMeta = jsonEncode(metadata);
    await secureStorage.write(key: metaKey, value: encodedMeta);
  }

  @override
  Future<void> delete(String key, PVCacheConfig config) async {
    final secureStorage = PVCacheCore.secureStorage!;
    await secureStorage.delete(key: '${config.name}:$key');
  }

  @override
  Future<void> deleteMeta(String key, PVCacheConfig config) async {
    final secureStorage = PVCacheCore.secureStorage!;
    final metaKey = '${config.name}-meta:$key';
    await secureStorage.delete(key: metaKey);
  }

  @override
  Future<void> clear(PVCacheConfig config) async {
    final secureStorage = PVCacheCore.secureStorage!;
    final allKeys = await secureStorage.readAll();
    final prefix = '${config.name}:';

    for (final key in allKeys.keys) {
      if (key.startsWith(prefix) && !key.contains('-meta:')) {
        await secureStorage.delete(key: key);
      }
    }
  }

  @override
  Future<void> clearMeta(PVCacheConfig config) async {
    final secureStorage = PVCacheCore.secureStorage!;
    final allKeys = await secureStorage.readAll();
    final metaPrefix = '${config.name}-meta:';

    for (final key in allKeys.keys) {
      if (key.startsWith(metaPrefix)) {
        await secureStorage.delete(key: key);
      }
    }
  }

  @override
  Future<void> init(PVCacheConfig config) async {
    // No initialization needed for secure adapter
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
    // No pre-set processing needed for the secure adapter
    // Return the original value and continue flag
    return (value, true);
  }

  @override
  Future<bool> preDelete(String key, PVCacheConfig config) async {
    // No pre-delete processing needed for the secure adapter
    return true;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
