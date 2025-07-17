import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive.dart';
import 'package:pv_cache/src/core/toplv.dart' as toplv;
import 'package:pv_cache/src/utils/json_op.dart' as utils;
import 'package:pv_cache/src/core/options.dart';
import 'package:pv_cache/src/core/wrapper.dart';

class PVCache {
  /// Returns all keys from cache boxes
  /// 
  /// Parameters:
  /// - [options]: If provided with a group, returns keys from that specific collection
  /// - [includeAllGroups]: If true, returns keys from all collections (default box + all groups)
  /// 
  /// Examples:
  /// - `getAllKeys()` - Returns keys from default box only
  /// - `getAllKeys(options: CacheOptions(group: 'user_sessions'))` - Returns keys from specific group
  /// - `getAllKeys(includeAllGroups: true)` - Returns keys from all boxes combined
  Future<List<String>> getAllKeys({
    CacheOptions? options,
    bool includeAllGroups = false,
  }) async {
    if (includeAllGroups) {
      return await _getAllKeysFromAllBoxes();
    }
    
    final box = await _getBoxForOptions(options);
    return box.keys.cast<String>().toList();
  }

  /// Get all keys from all opened boxes (default + all collections)
  Future<List<String>> _getAllKeysFromAllBoxes() async {
    final allKeys = <String>[];
    
    try {
      // Get keys from default box
      final defaultBox = await toplv.defaultBox;
      allKeys.addAll(defaultBox.keys.cast<String>());
      
      // Get keys from all opened collection boxes
      for (final entry in toplv.getOpenedLazyBoxes().entries) {
        final boxName = entry.key;
        final box = entry.value;
        
        // Add group prefix to distinguish keys from different collections
        final groupName = boxName.replaceFirst('__pvcache_', '');
        final groupKeys = box.keys.cast<String>()
            .map((key) => '[$groupName]$key')
            .toList();
        allKeys.addAll(groupKeys);
      }
      
      // Also check metadata box for any keys
      final metadataBox = await toplv.getMetadataBox();
      final metadataKeys = metadataBox.keys.cast<String>()
          .map((key) => '[metadata]$key')
          .toList();
      allKeys.addAll(metadataKeys);
      
    } catch (e) {
      debugPrint('Warning: Error getting keys from some boxes: $e');
    }
    
    return allKeys;
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
  Future<LazyBox<dynamic>> _getBoxForOptions(CacheOptions? options) async {
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
    final result = await CacheWrapper.get(key, opts);

    if (result == null) return null;

    // Handle Map type conversion
    if (result is Map<dynamic, dynamic>) {
      return Map<String, dynamic>.from(result) as T?;
    }

    return result as T?;
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

  // Direct access to the box for backward compatibility - now supports dynamic types
  Future<void> put(String key, dynamic value, {CacheOptions? options}) async {
    final box = await _getBoxForOptions(options);
    await box.put(key, value);
  }

  Future<dynamic> get(String key, {CacheOptions? options}) async {
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
