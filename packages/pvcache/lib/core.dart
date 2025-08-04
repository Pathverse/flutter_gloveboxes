import 'package:hive_ce/hive.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pvcache/config.dart';

class PVCacheCore {
  static String _collectionName = 'pvcache';
  static String? _overloadPath;
  static HiveCipher? _overloadCipher;
  static FlutterSecureStorage? _secureStorage;
  static FlutterSecureStorage? get secureStorage => _secureStorage;
  static Box<String>? _kvBox;

  static Box<String> get kvBox {
    if (_kvBox == null) {
      throw Exception('KV Box not initialized. Call init() first.');
    }
    return _kvBox!;
  }

  static String get collectionName => _collectionName;
  static set collectionName(String value) {
    if (_boxCollection != null) {
      throw Exception('Cannot change collection name after initialization');
    }
    _collectionName = value;
  }

  static set overloadPath(String? value) {
    if (_boxCollection != null) {
      throw Exception('Cannot change overload path after initialization');
    }
    _overloadPath = value;
  }

  static set overloadCipher(HiveCipher? value) {
    if (_boxCollection != null) {
      throw Exception('Cannot change overload cipher after initialization');
    }
    _overloadCipher = value;
  }

  static List<String> get _boxesToInit {
    // create a list of all box names plus {name}_meta
    return [
      ..._registeredConfigs.keys,
      ..._registeredConfigs.keys.map((name) => '$name-meta'),
    ];
  }

  static final Map<String, PVCacheConfig> _registeredConfigs = {};
  static final Map<String, CollectionBox<dynamic>> _boxes = {};
  static BoxCollection? _boxCollection;

  static Future<void> init() async {
    if (_boxCollection != null) return;

    _secureStorage = FlutterSecureStorage();

    // Initialize KV box separately
    _kvBox = await Hive.openBox<String>('kv', path: _overloadPath);

    _boxCollection = await BoxCollection.open(
      _collectionName,
      _boxesToInit.toSet(),
      path: _overloadPath,
      key: _overloadCipher,
    );
  }

  static Future<void> register(String name, PVCacheConfig config) async {
    if (_boxCollection != null) {
      throw Exception('Cannot register after initialization');
    }
    if (_registeredConfigs.containsKey(name)) {
      throw Exception('Cannot register duplicate name: $name');
    }

    // Check for reserved environment names
    if (name == 'kv' || name == 'encrypted') {
      throw Exception('Cannot register reserved environment name: $name');
    }

    _registeredConfigs[name] = config;
  }

  static Future<CollectionBox> get_(String name) async {
    //internal method
    return _boxes[name]!;
  }

  static PVCacheConfig? getConfig(String name) {
    return _registeredConfigs[name];
  }

  static (String env, String key) parseKey(String input) {
    if (input.contains(':')) {
      final parts = input.split(':');
      if (parts.length == 2) {
        return (parts[0], parts[1]);
      }
    }
    throw Exception('Invalid key format. Expected "env:key" but got "$input"');
  }

  static Future<void> ensure(String name) async {
    if (name.contains("-meta")) {
      throw Exception('Cannot handle meta box: $name');
    }

    if (_boxes.containsKey(name)) {
      return;
    }

    final config = _registeredConfigs[name]!;

    if (!config.secureData) {
      if (config.isMap) {
        final box = await _boxCollection!.openBox<Map>(
          name,
        );
        _boxes[name] = box;
      } else {
        final box = await _boxCollection!.openBox<dynamic>(
          name,
          // use proper json serialization, from json convert library
          fromJson: (json) => Map<String, dynamic>.from(json as Map),
        );
        _boxes[name] = box;
      }
    }
    if (!config.secureMeta) {
      final metabox = await _boxCollection!.openBox<Map>('$name-meta');
      _boxes['$name-meta'] = metabox;
    }

    // init adapters
    for (var adapter in config.adapters.values) {
      adapter.init(config);
    }
  }
}
