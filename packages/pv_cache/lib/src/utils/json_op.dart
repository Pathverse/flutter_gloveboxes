// Utility functions for JSON handling
import 'package:hive_ce/hive.dart';
import 'package:pv_cache/src/core/toplv.dart';
import 'package:pv_cache/src/core/options.dart';
import 'dart:convert';

Future<void> putJson(String key, dynamic value, {CacheOptions? options}) async {
  final box = await _getBoxForOptions(options);
  await box.put(key, jsonEncode(value));
}

Future<T?> getJson<T>(
  String key, {
  T? defaultValue,
  CacheOptions? options,
}) async {
  final box = await _getBoxForOptions(options);
  final value = await box.get(key);
  if (value == null) return defaultValue;

  try {
    final decoded = jsonDecode(value);
    return decoded as T?;
  } catch (e) {
    return defaultValue;
  }
}

Future<Map<String, dynamic>?> getJsonMap(
  String key, {
  CacheOptions? options,
}) async {
  return await getJson<Map<String, dynamic>>(key, options: options);
}

Future<List<dynamic>?> getJsonList(String key, {CacheOptions? options}) async {
  return await getJson<List<dynamic>>(key, options: options);
}

/// Helper function to get the appropriate box based on cache options
Future<LazyBox<String>> _getBoxForOptions(CacheOptions? options) async {
  if (options != null && options.useCollection && options.group != null) {
    return await getCollectionBox(options.group!);
  }
  return await defaultBox;
}
