
import 'package:hive_ce/hive.dart';
import 'package:pvcache/src/core/interface.dart';

class KVStorage extends IPVCacheStorage {
  LazyBox<String>? _varlazyBox;
  LazyBox<String> get _lazyBox {
    _varlazyBox ??= Hive.lazyBox<String>('pvcachekv');
    return _varlazyBox!;
  }


  @override
  Future<void> clear(IPVCacheConfig config) async {
    await _lazyBox.clear();
  }

  @override
  Future<void> clearMeta(IPVCacheConfig config) async {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String key, IPVCacheConfig config) async {
    await _lazyBox.delete(key);
  }


  @override
  Future<void> deleteMeta(String key, IPVCacheConfig config) async {
    throw UnimplementedError();
  }

  @override
  Future get(String key, IPVCacheConfig config) async {
    return await _lazyBox.get(key);
  }

  @override
  Future<Map<String, dynamic>> getMeta(String key, IPVCacheConfig config) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> has(String key, IPVCacheConfig config) async {
    return _lazyBox.containsKey(key);
  }

  @override
  Future<bool> hasMeta(String key, IPVCacheConfig config) async {
    throw UnimplementedError();
  }

  @override
  Future<Iterator<String>> iterKeys(IPVCacheConfig config) async {
    return _lazyBox.keys.cast<String>().iterator;
  }

  @override
  Future<Iterator<String>> iterMetaKeys(IPVCacheConfig config) async {
    throw UnimplementedError();
  }

  @override
  Future<void> set(String key, value, IPVCacheConfig config, {Map<String, dynamic>? metadata}) async {
    await _lazyBox.put(key, value.toString());
  }

  @override
  Future<void> setMeta(String key, Map<String, dynamic> metadata, IPVCacheConfig config) {
    throw UnimplementedError();
  }
}