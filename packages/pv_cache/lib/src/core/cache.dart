import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive.dart';
import 'package:pv_cache/src/core/toplv.dart' as toplv;
import 'package:pv_cache/src/utils/json_op.dart' as utils;
import 'package:pv_cache/src/core/options.dart';
import 'package:pv_cache/src/core/wrapper.dart';

class PVCache {
  /// Returns all keys in the main cache box
  Future<List<String>> getAllKeys({CacheOptions? options}) async {
    final box = await _getBoxForOptions(options);
    return box.keys.cast<String>().toList();
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

  Future<void> clear({CacheOptions? options}) async {
    if (options != null && options.useCollection && options.group != null) {
      // Clear specific collection
      final box = await _getBoxForOptions(options);
      await box.clear();
    } else {
      // Clear all boxes (backward compatibility)
      final defaultCacheBox = await toplv.defaultBox;
      await defaultCacheBox.clear();

      // Clear subscriber metadata box
      if (toplv.subscriberBox != null) {
        await toplv.subscriberBox!.clear();
      }

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
  }

  /// Helper function to get the appropriate box based on cache options
  Future<LazyBox<String>> _getBoxForOptions(CacheOptions? options) async {
    if (options != null && options.useCollection && options.group != null) {
      return await toplv.getCollectionBox(options.group!);
    }
    return await toplv.defaultBox;
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
  Future<void> putJson(
    String key,
    dynamic value, {
    CacheOptions? options,
  }) async {
    await utils.putJson(key, value, options: options);
  }

  Future<T?> getJson<T>(
    String key, {
    T? defaultValue,
    CacheOptions? options,
  }) async {
    return await utils.getJson<T>(
      key,
      defaultValue: defaultValue,
      options: options,
    );
  }

  Future<Map<String, dynamic>?> getJsonMap(
    String key, {
    CacheOptions? options,
  }) async {
    return await utils.getJsonMap(key, options: options);
  }

  Future<List<dynamic>?> getJsonList(
    String key, {
    CacheOptions? options,
  }) async {
    return await utils.getJsonList(key, options: options);
  }

  // Direct access to the box for non-JSON operations
  Future<void> put(String key, String value, {CacheOptions? options}) async {
    final box = await _getBoxForOptions(options);
    await box.put(key, value);
  }

  Future<String?> get(String key, {CacheOptions? options}) async {
    final box = await _getBoxForOptions(options);
    return await box.get(key);
  }

  Future<void> delete(String key, {CacheOptions? options}) async {
    final box = await _getBoxForOptions(options);
    await box.delete(key);
  }

  Future<bool> containsKey(String key, {CacheOptions? options}) async {
    final box = await _getBoxForOptions(options);
    return box.containsKey(key);
  }
}
