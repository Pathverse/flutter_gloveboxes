import 'package:pv_cache/src/core/options.dart';
import 'package:pv_cache/src/utils/storage.dart';

/// Main wrapper that orchestrates cache operations based on CacheOptions
class CacheWrapper {
  /// Store value with options
  static Future<void> store(
    String key,
    dynamic value,
    CacheOptions options,
  ) async {
    await CacheStorage.store(key, value, options);
  }

  /// Get value with options
  static Future<dynamic> get(String key, CacheOptions options) async {
    return await CacheStorage.get(key, options);
  }

  /// Delete value with options
  static Future<void> delete(String key, CacheOptions options) async {
    await CacheStorage.delete(key, options);
  }
}
