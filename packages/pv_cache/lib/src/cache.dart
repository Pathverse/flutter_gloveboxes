import 'package:flutter/foundation.dart';
import 'package:pv_cache/src/toplv.dart' as toplv;
import 'package:pv_cache/src/utils.dart' as utils;
import 'package:pv_cache/src/options.dart';
import 'package:pv_cache/src/worker/custom_wrapper.dart';

class PVCache {
  /// Returns all keys in the main cache box
  Future<List<String>> getAllKeys() async {
    if (toplv.lazyBox == null) await toplv.baseInit();
    return toplv.lazyBox!.keys.cast<String>().toList();
  }

  static PVCache? _instance;
  static Future<PVCache> getInstance({bool debug = false}) async {
    if (_instance != null) {
      return _instance!;
    }
    _instance ??= PVCache._internal();
    await _instance!.init();
    // Ensure the lazy box is initialized
    return _instance!;
  }

  PVCache._internal();

  Future<void> init() async {
    await toplv.baseInit();
  }

  //!SECTION

  Future<void> clear() async {
    // Clear the lazy box using the already opened instance
    if (toplv.lazyBox == null) await toplv.baseInit();
    await toplv.lazyBox!.clear();

    // Clear subscriber box
    if (toplv.subscriberBox == null) await toplv.baseInit();
    await toplv.subscriberBox!.clear();

    // Clear secure storage - handle test environment gracefully
    try {
      await toplv.secureStorage.deleteAll();
    } catch (e) {
      // In test environment, flutter_secure_storage may not be available
      // This is expected and we can continue
      debugPrint(
        'Warning: Could not clear secure storage (likely in test environment): $e',
      );
    }
  }

  // NEW: Methods with CacheOptions support using the wrapper
  Future<void> putWithOptions(
    String key,
    dynamic value, {
    CacheOptions? options,
  }) async {
    final opts = options ?? const CacheOptions();
    await CacheWrapper.store(key, value, opts);
  }

  Future<T?> getWithOptions<T>(String key, {CacheOptions? options}) async {
    final opts = options ?? const CacheOptions();
    return await CacheWrapper.get(key, opts) as T?;
  }

  Future<void> deleteWithOptions(String key, {CacheOptions? options}) async {
    final opts = options ?? const CacheOptions();
    await CacheWrapper.delete(key, opts);
  }

  Future<bool> containsKeyWithOptions(
    String key, {
    CacheOptions? options,
  }) async {
    final opts = options ?? const CacheOptions();
    final value = await CacheWrapper.get(key, opts);
    return value != null;
  }

  // JSON utility methods
  Future<void> putJson(String key, dynamic value) async {
    await utils.putJson(key, value);
  }

  Future<T?> getJson<T>(String key, {T? defaultValue}) async {
    return await utils.getJson<T>(key, defaultValue: defaultValue);
  }

  Future<Map<String, dynamic>?> getJsonMap(String key) async {
    return await utils.getJsonMap(key);
  }

  Future<List<dynamic>?> getJsonList(String key) async {
    return await utils.getJsonList(key);
  }

  // Direct access to the box for non-JSON operations
  Future<void> put(String key, String value) async {
    if (toplv.lazyBox == null) await toplv.baseInit();
    await toplv.lazyBox!.put(key, value);
  }

  Future<String?> get(String key) async {
    if (toplv.lazyBox == null) await toplv.baseInit();
    return await toplv.lazyBox!.get(key);
  }

  Future<void> delete(String key) async {
    if (toplv.lazyBox == null) await toplv.baseInit();
    await toplv.lazyBox!.delete(key);
  }

  Future<bool> containsKey(String key) async {
    if (toplv.lazyBox == null) await toplv.baseInit();
    return toplv.lazyBox!.containsKey(key);
  }
}
