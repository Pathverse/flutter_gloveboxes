// initialize flutter_secure_storage, hive_ce and flutter_cache_manager
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce/hive.dart';
import 'package:pv_cache/src/utils/custom_cipher.dart';

const secureStorage = FlutterSecureStorage();

// Map to store opened boxes by name
final Map<String, LazyBox<String>> _openLazyBoxes = {};
final Map<String, Box<String>> _openRegularBoxes = {};

// Global references for the main boxes
LazyBox<String>? lazyBox;
Box<String>? subscriberBox;

/// Get or create a lazy box for the specified name
/// Structure: indexeddb/__pv_cache__box_{name}
Future<LazyBox<String>> getCollectionBox(String name) async {
  final boxName = '__pvcache_$name';

  // Return existing box if already open
  if (_openLazyBoxes.containsKey(boxName)) {
    return _openLazyBoxes[boxName]!;
  }

  // Open new lazy box with simple naming
  final box = await Hive.openLazyBox<String>(
    boxName,
    encryptionCipher: CustomCipher(),
  );

  // Store in map for future use
  _openLazyBoxes[boxName] = box;
  return box;
}

/// Get or create a regular box for fast metadata access
/// Structure: indexeddb/__pv_cache__meta
Future<Box<String>> getMetadataBox() async {
  const boxName = '__pvcache_meta';

  // Return existing box if already open
  if (_openRegularBoxes.containsKey(boxName)) {
    return _openRegularBoxes[boxName]!;
  }

  // Open new regular box for fast metadata access
  final box = await Hive.openBox<String>(
    boxName,
    encryptionCipher: CustomCipher(),
  );

  // Store in map for future use
  _openRegularBoxes[boxName] = box;
  return box;
}

/// Get the default cache box (maintains backward compatibility)
Future<LazyBox<String>> get defaultBox async {
  lazyBox ??= await getCollectionBox('default');
  return lazyBox!;
}

/// Initialize base system
Future<void> baseInit() async {
  // Initialize the main boxes
  lazyBox = await getCollectionBox('default');
  subscriberBox = await getMetadataBox();
}
