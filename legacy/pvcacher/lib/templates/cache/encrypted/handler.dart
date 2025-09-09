// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pvcacher/src/ctx.dart';
import 'package:pvcacher/src/handle.dart';
import 'package:pvcacher/templates/cache/std/obj.dart';

class EncryptedHandler extends PVCacheHandle {
  late FlutterSecureStorage _storage;
  late String _keyPrefix;

  @override
  Future<void> init(PVCacheCtx ctx) async {
    _storage = const FlutterSecureStorage();
    _keyPrefix = "${ctx.cacher.namespace}_";
  }

  @override
  Future<void> onConstruct(PVCacheCtx ctx) async {
    // No special construction logic needed for encrypted storage
  }

  @override
  Future<void> beforeAnything(PVCacheCtx ctx) async {
    // Encrypted storage does not support options
    if (ctx.options.isNotEmpty) {
      throw Exception(
        "EncryptedHandler does not support options. "
        "Options provided: ${ctx.options.keys.join(', ')}",
      );
    }

    if (ctx.callingFunc == "clear") {
      return;
    }

    // Generate SHA256 hash for the key and store in context
    final sha256key = sha256.convert(ctx.key?.codeUnits ?? []).toString();
    ctx.contexts["sha256"] = sha256key;

    // Use hashed key as the actual storage key for additional security
    ctx.contexts["storageKey"] = "$_keyPrefix$sha256key";
  }

  @override
  Future<void> clear(PVCacheCtx ctx) async {
    // Get all keys and remove those with our prefix
    final allKeys = await _storage.readAll();
    for (final key in allKeys.keys) {
      if (key.startsWith(_keyPrefix)) {
        await _storage.delete(key: key);
      }
    }
  }

  @override
  Future<dynamic> get(PVCacheCtx ctx) async {
    final storageKey = ctx.contexts["storageKey"] as String;
    final jsonString = await _storage.read(key: storageKey);

    if (jsonString == null) {
      return null;
    }

    try {
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      final stdObj = StdObject.fromJson(jsonMap);
      return stdObj.value;
    } catch (e) {
      throw Exception("Failed to deserialize encrypted data: $e");
    }
  }

  @override
  @override
  Future<void> has(PVCacheCtx ctx) async {
    final storageKey = ctx.contexts["storageKey"] as String;
    final value = await _storage.read(key: storageKey);
    ctx.result = value != null;
  }

  @override
  Future<void> remove(PVCacheCtx ctx) async {
    final storageKey = ctx.contexts["storageKey"] as String;
    await _storage.delete(key: storageKey);
  }

  @override
  Future<void> set(PVCacheCtx ctx) async {
    final storageKey = ctx.contexts["storageKey"] as String;
    final obj = StdObject(ctx.value);
    final jsonString = jsonEncode(obj.toJson());

    await _storage.write(key: storageKey, value: jsonString);
  }
}
