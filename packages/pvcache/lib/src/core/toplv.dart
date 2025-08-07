import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce/hive.dart';
import 'package:pvcache/src/core/config.dart';

class PVCacheTopLv {
  static FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  // box
  static BoxCollection? boxCollection;

  static Future<void> init(
    Map<String, PVCacheConfig> configs, {
    String? path,
    HiveCipher? cipher,
  }) async {
    if (boxCollection != null) {
      throw Exception('Box collection is already initialized.');
    }

    Set<String> boxNames = {};
    for (var config in configs.values) {
      if (config.storage.useHiveCollection) {
        if (config.storage.hiveCollectionBoxes.any(
          (boxName) => boxNames.contains(boxName),
        )) {
          throw Exception('Duplicate box names found in PVCacheConfig.');
        }
        boxNames.addAll(config.storage.hiveCollectionBoxes);
      }
      config.storage.onInit(config);
    }

    boxCollection = await BoxCollection.open(
      'pvcache',
      boxNames,
      path: path,
      key: cipher,
    );

    for (var config in configs.values) {
      await config.storage.postBoxInit(config);
    }
  }

  // boxes
  static final Map<String, CollectionBox> _boxes = {};
  static Map<String, CollectionBox> get boxes => Map.unmodifiable(_boxes);

  static Future<CollectionBox> ensureBox<T>(
    String boxName,
    {
      CollectionBox<T> Function(String, BoxCollection)? boxCreator,
      T Function(Map<String, dynamic>)? fromJson,
    }
  ) async {
    if (_boxes.containsKey(boxName)) {
      return _boxes[boxName]!;
    }

    if (boxCollection == null) {
      throw Exception('Box collection is not initialized.');
    }

    var box = boxCollection!.openBox<T>(boxName, boxCreator: boxCreator, fromJson: fromJson);
    _boxes[boxName] = await box;
    return box;
  }

  // init
  static bool get initialized => boxCollection != null;

  // debug mode
  static bool _debugMode = false;
  static bool get debugMode => _debugMode;

  static void enableDebugMode() {
    if (initialized) {
      throw Exception('Cannot change debug mode after initialization.');
    }

    _debugMode = true;
  }
}
