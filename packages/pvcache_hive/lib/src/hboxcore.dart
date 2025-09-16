import 'dart:convert';
import 'dart:typed_data';
import 'package:hive_ce/hive.dart';
import 'package:pvcache_hive/src/pvci.dart';

late final BoxCollection _boxCollection;
bool _initialized = false;
final Set<String> _registeredBoxNames = {};
final Map<String, HBoxIntent> _hboxIntents = {};
final Map<String, CollectionBox> _openBoxes = {};
final Map<String, HPerBoxConfig> _perBoxConfigs = {};
HiveCipher? _hiveCipher;

class HPerBoxConfig<V> {
  final String boxName;
  final bool preload;
  final CollectionBox<V> Function(String, BoxCollection)? boxCreator;
  V Function(Map)? fromJson;

  HPerBoxConfig({
    required this.boxName,
    this.preload = false,
    this.boxCreator,
    this.fromJson,
  });
}

class HBoxIntent {
  final String env;
  final Set<String> boxNames;

  HBoxIntent._internal(this.env, this.boxNames);

  factory HBoxIntent(
    String env,
    Set<String> boxNames, {
    List<HPerBoxConfig> perBoxConfigs = const [],
  }) {
    if (_hboxIntents.containsKey(env)) {
      throw Exception("HBoxIntent for env '$env' already exists.");
    }

    // check box validity
    for (var name in boxNames) {
      if (name.trim().isEmpty) {
        throw Exception("Box names cannot be empty or whitespace.");
      }
    }

    // only allow perBoxConfigs to contain the defined ones, and throw
    for (var config in perBoxConfigs) {
      if (!boxNames.contains(config.boxName)) {
        throw Exception(
          "PerBoxConfig boxName '${config.boxName}' not in defined boxNames.",
        );
      }
      // and if already defined
      if (_perBoxConfigs.containsKey(config.boxName)) {
        throw Exception(
          "PerBoxConfig for boxName '${config.boxName}' already defined.",
        );
      }
    }

    // Register perBoxConfigs
    for (var config in perBoxConfigs) {
      _perBoxConfigs[config.boxName] = config;
    }

    final intent = HBoxIntent._internal(env, boxNames);

    // Register box names
    _registeredBoxNames.addAll(boxNames);

    _hboxIntents[env] = intent;
    return intent;
  }
}

void setHiveCipher(HiveCipher cipher) {
  if (_initialized) {
    throw Exception("Cannot set HiveCipher after initialization.");
  }
  _hiveCipher = cipher;
}

HiveCipher? getHiveCipher() => _hiveCipher;

/// Encrypt a string using the currently set HiveCipher
String? encryptString(String plainText) {
  final cipher = _hiveCipher;
  if (cipher == null) return null;
  return cipher.encryptString(plainText);
}

/// Decrypt a string using the currently set HiveCipher
String? decryptString(String encryptedText) {
  final cipher = _hiveCipher;
  if (cipher == null) return null;
  return cipher.decryptString(encryptedText);
}

Future<void> initHBox({String? path}) async {
  if (_initialized) return;
  _boxCollection = await BoxCollection.open(
    "pvcache",
    _registeredBoxNames,
    path: path,
    key: _hiveCipher,
  );
  _initialized = true;
}

Future<CollectionBox<dynamic>> getBox(String boxName, HBoxIntent intent) async {
  if (!_initialized) {
    throw Exception("HBox not initialized. Call initHBox() first.");
  }

  if (!intent.boxNames.contains(boxName)) {
    throw Exception(
      "Box name '$boxName' not registered in the provided HBoxIntent.",
    );
  }
  if (_openBoxes.containsKey(boxName)) {
    return _openBoxes[boxName]!;
  }

  if (!_perBoxConfigs.containsKey(boxName)) {
    // create default box
    final box = await _boxCollection.openBox<PVCo>(
      boxName,
      fromJson: PVCo.fromJson,
    
    );
    _openBoxes[boxName] = box;
    return box;
  }

  final config = _perBoxConfigs[boxName]!;
  final box = await _boxCollection.openBox<PVCo>(
    boxName,
    preload: config.preload,
    boxCreator:
        config.boxCreator
            as CollectionBox<PVCo> Function(String, BoxCollection)?,
    fromJson: config.fromJson as PVCo Function(Map)?,
  );
  _openBoxes[boxName] = box;
  return box;
}

//
extension HiveCipherExt on HiveCipher {
  /// Encrypt a string using the HiveCipher
  String encryptString(String plainText) {
    final bytes = Uint8List.fromList(utf8.encode(plainText));

    // For AES-CBC with PKCS7 padding, we need enough space for:
    // - Original data
    // - Padding (up to 16 bytes for AES block size)
    // - Some extra buffer space for the cipher implementation
    final outputBytes = Uint8List(bytes.length + 32); // More generous buffer

    final encryptedLength = encrypt(bytes, 0, bytes.length, outputBytes, 0);
    final encryptedBytes = outputBytes.sublist(0, encryptedLength);
    // Convert to base64 for safe string storage
    return base64Encode(encryptedBytes);
  }

  /// Decrypt a string using the HiveCipher
  String decryptString(String encryptedText) {
    // Decode from base64
    final encryptedBytes = base64Decode(encryptedText);
    final outputBytes = Uint8List(encryptedBytes.length + 16); // Add padding
    final decryptedLength = decrypt(
      Uint8List.fromList(encryptedBytes),
      0,
      encryptedBytes.length,
      outputBytes,
      0,
    );
    final decryptedBytes = outputBytes.sublist(0, decryptedLength);
    return utf8.decode(decryptedBytes);
  }
}
