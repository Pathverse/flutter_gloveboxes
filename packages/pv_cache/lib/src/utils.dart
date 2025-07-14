
// Utility functions for JSON handling
import 'package:pv_cache/src/toplv.dart';
import 'dart:convert';

Future<void> putJson(String key, dynamic value) async {
  if (lazyBox == null) await baseInit();
  await lazyBox!.put(key, jsonEncode(value));
}

Future<T?> getJson<T>(String key, {T? defaultValue}) async {
  if (lazyBox == null) await baseInit();
  final value = await lazyBox!.get(key);
  if (value == null) return defaultValue;

  try {
    final decoded = jsonDecode(value);
    return decoded as T?;
  } catch (e) {
    return defaultValue;
  }
}

Future<Map<String, dynamic>?> getJsonMap(String key) async {
  return await getJson<Map<String, dynamic>>(key);
}

Future<List<dynamic>?> getJsonList(String key) async {
  return await getJson<List<dynamic>>(key);
}
