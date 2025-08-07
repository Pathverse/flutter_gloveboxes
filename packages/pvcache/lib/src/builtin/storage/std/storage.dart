import 'dart:math';
import 'package:pvcache/src/core/interface.dart';
import 'package:pvcache/src/core/toplv.dart';
import 'package:pvcache/src/builtin/storage/std/obj.dart';

class StdStorage extends IPVCacheStorage {
  final String hiveBoxName;

  StdStorage({String? hiveBoxName})
    : hiveBoxName = hiveBoxName ?? "std-${Random().nextInt(10000).toString()}";

  String? lastKey;
  dynamic lastValue;
  Map<String, dynamic>? lastMeta;

  @override
  Future<void> postBoxInit(IPVCacheConfig config) async {
    PVCacheTopLv.ensureBox<StdObject>(
      hiveBoxName,
      fromJson: StdObject.fromJson,
    );
  }

  // Private helper methods for cache management
  bool _isCacheValid(String key) {
    return lastKey == key && lastValue != null;
  }

  void _clearCache() {
    lastKey = null;
    lastValue = null;
    lastMeta = null;
  }

  void _updateCache(String key, StdObject obj) {
    lastKey = key;
    lastValue = obj.value;
    lastMeta = obj.metadata;
  }

  @override
  bool get useHiveCollection => true;

  @override
  List<String> get hiveCollectionBoxes {
    return [hiveBoxName];
  }

  @override
  Future<void> clear(IPVCacheConfig config) async {
    final box = await PVCacheTopLv.ensureBox<StdObject>(hiveBoxName);
    await box.clear();
    _clearCache();
  }

  @override
  Future<void> clearMeta(IPVCacheConfig config) async {
    // Since metadata is stored together with value, clearMeta is same as clear
    await clear(config);
  }

  @override
  Future<void> delete(String key, IPVCacheConfig config) async {
    final box = await PVCacheTopLv.ensureBox<StdObject>(hiveBoxName);
    await box.delete(key);

    // Clear cache if deleted key was cached
    if (lastKey == key) {
      _clearCache();
    }
  }

  @override
  Future<void> deleteMeta(String key, IPVCacheConfig config) async {
    // Since metadata is stored together with value, we need to preserve the value
    // and only remove metadata by setting it to empty
    dynamic existingValue = lastValue;
    if (lastKey != key) {
      existingValue = await get(key, config);
    }

    if (existingValue == null) {
      return; // Key doesn't exist, nothing to delete
    }

    // Create new StdObject with empty metadata
    final stdObject = StdObject(existingValue, metadata: {});
    final box = await PVCacheTopLv.ensureBox<StdObject>(hiveBoxName);

    await box.put(key, stdObject);

    // Update cache
    _updateCache(key, stdObject);
  }

  @override
  Future get(String key, IPVCacheConfig config) async {
    // Check if we already have this key cached
    if (_isCacheValid(key)) {
      return lastValue;
    }

    final box = await PVCacheTopLv.ensureBox<StdObject>(hiveBoxName);
    final data = await box.get(key);

    if (data == null) {
      return null;
    }

    final stdObject = data as StdObject;

    // Cache for next access
    _updateCache(key, stdObject);

    return stdObject.value;
  }

  @override
  Future<Map<String, dynamic>> getMeta(
    String key,
    IPVCacheConfig config,
  ) async {
    // Check if we already have this key cached
    if (_isCacheValid(key) && lastMeta != null) {
      return lastMeta!;
    }

    final box = await PVCacheTopLv.ensureBox<StdObject>(hiveBoxName);
    final data = await box.get(key);

    if (data == null) {
      return {};
    }

    final stdObject = data as StdObject;

    // Cache for next access
    _updateCache(key, stdObject);

    return stdObject.metadata;
  }

  @override
  Future<bool> has(String key, IPVCacheConfig config) async {
    final box = await PVCacheTopLv.ensureBox<StdObject>(hiveBoxName);
    final value = await box.get(key);
    return value != null;
  }

  @override
  Future<bool> hasMeta(String key, IPVCacheConfig config) async {
    // Since metadata is stored together with value, hasMeta is same as has
    return await has(key, config);
  }

  @override
  Future<Iterator<String>> iterKeys(IPVCacheConfig config) async {
    final box = await PVCacheTopLv.ensureBox<StdObject>(hiveBoxName);
    final keys = await box.getAllKeys();
    return keys.iterator;
  }

  @override
  Future<Iterator<String>> iterMetaKeys(IPVCacheConfig config) async {
    // Since metadata is stored together with value, iterMetaKeys is same as iterKeys
    return await iterKeys(config);
  }

  @override
  Future<void> set(
    String key,
    value,
    IPVCacheConfig config, {
    Map<String, dynamic>? metadata,
  }) async {
    final box = await PVCacheTopLv.ensureBox<StdObject>(hiveBoxName);
    final stdObject = StdObject(value, metadata: metadata);

    await box.put(key, stdObject);

    // Cache the last accessed item for optimization
    _updateCache(key, stdObject);
  }

  @override
  Future<void> setMeta(
    String key,
    Map<String, dynamic> metadata,
    IPVCacheConfig config,
  ) async {
    // Get existing value to preserve it
    dynamic existingValue = lastValue;
    if (lastKey != key) {
      existingValue = await get(key, config);
    }

    if (existingValue == null) {
      throw Exception('Cannot set metadata for non-existent key: $key');
    }

    // Create new StdObject with updated metadata
    final stdObject = StdObject(existingValue, metadata: metadata);
    final box = await PVCacheTopLv.ensureBox<StdObject>(hiveBoxName);

    await box.put(key, stdObject);

    // Update cache
    _updateCache(key, stdObject);
  }
}
