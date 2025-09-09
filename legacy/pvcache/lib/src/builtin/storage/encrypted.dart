import 'package:pvcache/src/core/interface.dart';
import 'package:pvcache/src/core/toplv.dart';

class Encrypted extends IPVCacheStorage {
  @override
  Future<void> clear(IPVCacheConfig config) async {
    // FlutterSecureStorage does not support clearing all keys directly, so we need to get all keys and delete them
    final allKeys = await PVCacheTopLv.secureStorage.readAll();
    for (final key in allKeys.keys) {
      await PVCacheTopLv.secureStorage.delete(key: key);
    }
  }

  @override
  Future<void> clearMeta(IPVCacheConfig config) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String key, IPVCacheConfig config) async {
    await PVCacheTopLv.secureStorage.delete(key: key);
  }

  @override
  Future<void> deleteMeta(String key, IPVCacheConfig config) {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> get(String key, IPVCacheConfig config) async {
    return await PVCacheTopLv.secureStorage.read(key: key);
  }

  @override
  Future<Map<String, dynamic>> getMeta(String key, IPVCacheConfig config) {
    throw UnimplementedError();
  }

  @override
  Future<bool> has(String key, IPVCacheConfig config) async {
    final value = await PVCacheTopLv.secureStorage.read(key: key);
    return value != null;
  }

  @override
  Future<bool> hasMeta(String key, IPVCacheConfig config) {
    throw UnimplementedError();
  }

  @override
  Future<void> set(
    String key,
    value,
    IPVCacheConfig config, {
    Map<String, dynamic>? metadata,
  }) async {
    await PVCacheTopLv.secureStorage.write(key: key, value: value?.toString());
  }

  @override
  Future<void> setMeta(
    String key,
    Map<String, dynamic> metadata,
    IPVCacheConfig config,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<Iterator<String>> iterKeys(IPVCacheConfig config) async {
    final allKeys = await PVCacheTopLv.secureStorage.readAll();
    return allKeys.keys.iterator;
  }

  @override
  Future<Iterator<String>> iterMetaKeys(IPVCacheConfig config) {
    throw UnimplementedError();
  }
}
