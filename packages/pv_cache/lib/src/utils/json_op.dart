// Utility functions for JSON handling
import 'package:hive_ce/hive.dart';
import 'package:pv_cache/src/core/toplv.dart';
import 'package:pv_cache/src/core/options.dart';
import 'dart:convert';

/// Store JSON data - now uses native Hive serialization for better performance
Future<void> putJson(String key, dynamic value, {CacheOptions? options}) async {
  final box = await _getBoxForOptions(options);
  // Use native Hive serialization instead of JSON encoding
  await box.put(key, value);
}

/// Get JSON data with type safety - leverages native Hive serialization
Future<T?> getJson<T>(
  String key, {
  T? defaultValue,
  CacheOptions? options,
}) async {
  final box = await _getBoxForOptions(options);
  final value = await box.get(key);
  if (value == null) return defaultValue;

  try {
    // If value is a Map and expecting Map<String, dynamic>, force a true Map<String, dynamic>
    if (value is Map && (T == Map || T == Map<String, dynamic>)) {
      return Map<String, dynamic>.fromEntries(
            (value as Map).entries.map(
              (e) => MapEntry(e.key.toString(), e.value),
            ),
          )
          as T;
    }
    // Value is already deserialized by Hive, just cast it
    return value as T?;
  } catch (e) {
    return defaultValue;
  }
}

/// Legacy method: Store as explicit JSON string (for backward compatibility)
Future<void> putJsonString(
  String key,
  dynamic value, {
  CacheOptions? options,
}) async {
  final box = await _getBoxForOptions(options);
  await box.put(key, jsonEncode(value));
}

/// Legacy method: Get from explicit JSON string (for backward compatibility)
Future<T?> getJsonString<T>(
  String key, {
  T? defaultValue,
  CacheOptions? options,
}) async {
  final box = await _getBoxForOptions(options);
  final value = await box.get(key);
  if (value == null) return defaultValue;

  try {
    // Assume value is a JSON string that needs decoding
    final decoded = jsonDecode(value as String);
    return decoded as T?;
  } catch (e) {
    return defaultValue;
  }
}

Future<Map<String, dynamic>?> getJsonMap(
  String key, {
  CacheOptions? options,
}) async {
  final value = await getJson<Map<String, dynamic>>(key, options: options);
  if (value == null) return null;
  // Defensive: ensure all keys are strings and type is Map<String, dynamic>
  return Map<String, dynamic>.fromEntries(
    value.entries.map((e) => MapEntry(e.key.toString(), e.value)),
  );
}

Future<List<dynamic>?> getJsonList(String key, {CacheOptions? options}) async {
  return await getJson<List<dynamic>>(key, options: options);
}

/// Helper function to get the appropriate box based on cache options
Future<LazyBox<dynamic>> _getBoxForOptions(CacheOptions? options) async {
  if (options != null && options.useCollection && options.group != null) {
    return await getCollectionBox(options.group!);
  }
  return await defaultBox;
}
