
import 'package:pvcache/src/core/interface.dart';

class StdStorage extends IPVCacheStorage {
  @override
  Future<void> clear(IPVCacheConfig config) {
    // TODO: implement clear
    throw UnimplementedError();
  }

  @override
  Future<void> clearMeta(IPVCacheConfig config) {
    // TODO: implement clearMeta
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String key, IPVCacheConfig config) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> deleteMeta(String key, IPVCacheConfig config) {
    // TODO: implement deleteMeta
    throw UnimplementedError();
  }

  @override
  Future get(String key, IPVCacheConfig config) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getMeta(String key, IPVCacheConfig config) {
    // TODO: implement getMeta
    throw UnimplementedError();
  }

  @override
  Future<bool> has(String key, IPVCacheConfig config) {
    // TODO: implement has
    throw UnimplementedError();
  }

  @override
  Future<bool> hasMeta(String key, IPVCacheConfig config) {
    // TODO: implement hasMeta
    throw UnimplementedError();
  }

  @override
  Future<Iterator<String>> iterKeys(IPVCacheConfig config) {
    // TODO: implement iterKeys
    throw UnimplementedError();
  }

  @override
  Future<Iterator<String>> iterMetaKeys(IPVCacheConfig config) {
    // TODO: implement iterMetaKeys
    throw UnimplementedError();
  }

  @override
  Future<void> set(String key, value, IPVCacheConfig config, {Map<String, dynamic>? metadata}) {
    // TODO: implement set
    throw UnimplementedError();
  }

  @override
  Future<void> setMeta(String key, Map<String, dynamic> metadata, IPVCacheConfig config) {
    // TODO: implement setMeta
    throw UnimplementedError();
  }
  
}