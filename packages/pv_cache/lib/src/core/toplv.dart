import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pv_cache/src/core/config.dart';
import 'package:hive_ce/hive.dart';
import 'package:pv_cache/utils/json.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class PVCacheCentral {
  static FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  static Map<String, PVCacheEnvConfig> environments = {};
  static Map<String, String> envToHash = {}; // Simple map: env -> hash
  static Map<String, LazyBox<dynamic>> lazyBoxes = {};
  static Map<String, Box<dynamic>> boxes = {};
  static Map<String, Box<dynamic>> metaBoxes = {};
  static String _prefix = "pvcache";
  // ignore: prefer_final_fields
  static bool _initialized = false;

  static String get prefix => _prefix;

  static set prefix(String value) {
    if (_initialized) {
      throw Exception("Prefix cannot be changed after initialization");
    }
    _prefix = value;
  }

  /// Generate SHA1 hash for meta box name, limited to 8 characters
  static String generateMetaHash(String input) {
    final bytes = utf8.encode(input);
    final digest = sha1.convert(bytes);
    return digest.toString().substring(0, 8);
  }

  /// Check if a key is a special internal key (starts and ends with __)
  static bool isSpecialKey(String key) {
    return key.startsWith('__') && key.endsWith('__');
  }

  static Future<void> init() async {
    // Open the single shared meta box first
    metaBoxes['meta'] = await Hive.openBox<dynamic>(
      'meta',
      //collection: "meta",
    );

    // Don't open environment boxes here - let ensureBoxReady handle them on-demand
    _initialized = true;
  }

  /// Ensure a box is ready for use, opening it if necessary
  static Future<void> ensureBoxReady(String env) async {
    if (!environments.containsKey(env)) {
      throw Exception('Environment $env not found');
    }

    final config = environments[env]!;

    if (config.boxType == PVBoxType.lazy) {
      if (!lazyBoxes.containsKey(env)) {
        lazyBoxes[env] = await Hive.openLazyBox<dynamic>(
          env,
        );
      }
    } else {
      if (!boxes.containsKey(env)) {
        boxes[env] = await Hive.openBox<dynamic>(env); //collection: "normal");
      }
    }
  }

  static Future<void> secureSet({
    String env = "default",
    required String key,
    required dynamic value,
  }) async {
    await secureStorage.write(key: "$prefix::$env:$key", value: value);
  }

  static Future<dynamic> secureGet({
    String env = "default",
    required String key,
  }) async {
    return await secureStorage.read(key: "$prefix::$env:$key");
  }

  static Future<void> secureDelete({
    String env = "default",
    required String key,
  }) async {
    await secureStorage.delete(key: "$prefix::$env:$key");
  }

  static Future<void> secureClear({String env = "default"}) async {
    Map<String, String> allKeys = await secureStorage.readAll();
    for (String key in allKeys.keys) {
      if (key.startsWith("$prefix::$env:")) {
        await secureStorage.delete(key: key);
      }
    }
  }

  static Future<void> secureMetaSet({
    String env = "default",
    required String key,
    required dynamic value,
  }) async {
    await secureStorage.write(
      key: "$prefix::$env:$key",
      value: jsonDump(value),
    );
  }

  static Future<Map<String, dynamic>?> secureMetaGet({
    String env = "default",
    required String key,
  }) async {
    final value = await secureStorage.read(key: "$prefix::$env:$key");
    if (value == null) {
      return null;
    }
    return jsonLoad(value);
  }

  static Future<void> secureMetaDelete({
    String env = "default",
    required String key,
  }) async {
    await secureStorage.delete(key: "$prefix::$env:$key");
  }

  static Future<void> secureMetaClear({String env = "default"}) async {
    Map<String, String> allKeys = await secureStorage.readAll();
    for (String key in allKeys.keys) {
      if (key.startsWith("$prefix::$env:")) {
        await secureStorage.delete(key: key);
      }
    }
  }

  /// Clear metadata for a specific environment from the single meta box
  static Future<void> clearMetaForEnvironment(String env) async {
    final metaBox = metaBoxes['meta'];
    if (metaBox == null) return;

    final keysToDelete = <String>[];

    // Find all keys that start with the environment hash
    for (final key in metaBox.keys) {
      if (key is String && key.startsWith('$env:')) {
        keysToDelete.add(key);
      }
    }

    // Delete all keys for this environment
    for (final key in keysToDelete) {
      await metaBox.delete(key);
    }
  }
}
