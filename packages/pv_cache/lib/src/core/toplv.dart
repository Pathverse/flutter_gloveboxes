// initialize flutter_secure_storage, hive_ce and flutter_cache_manager
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce/hive.dart';

FlutterSecureStorage secureStorage = const FlutterSecureStorage();

// Map to store opened boxes by name
final Map<String, LazyBox<dynamic>> _openLazyBoxes = {};
final Map<String, Box<dynamic>> _openRegularBoxes = {};

// Global references for the main boxes
LazyBox<dynamic>? lazyBox;
Box<dynamic>? subscriberBox;

/// Get or create a lazy box for the specified name
/// Structure: indexeddb/__pv_cache__box_{name}
Future<LazyBox<dynamic>> getCollectionBox(String name) async {
  final boxName = '__pvcache_$name';

  // Return existing box if already open
  if (_openLazyBoxes.containsKey(boxName)) {
    return _openLazyBoxes[boxName]!;
  }

  // Open new lazy box with dynamic type for native Hive serialization
  final box = await Hive.openLazyBox<dynamic>(boxName);

  // Store in map for future use
  _openLazyBoxes[boxName] = box;
  return box;
}

/// Get or create a regular box for fast metadata access
/// Structure: indexeddb/__pv_cache__meta
Future<Box<dynamic>> getMetadataBox() async {
  const boxName = '__pvcache_meta';

  // Return existing box if already open
  if (_openRegularBoxes.containsKey(boxName)) {
    return _openRegularBoxes[boxName]!;
  }

  // Open new regular box for fast metadata access with dynamic type
  final box = await Hive.openBox<dynamic>(boxName);

  // Store in map for future use
  _openRegularBoxes[boxName] = box;
  return box;
}

/// Get the default cache box (maintains backward compatibility)
Future<LazyBox<dynamic>> get defaultBox async {
  lazyBox ??= await getCollectionBox('default');
  return lazyBox!;
}

/// Initialize base system
Future<void> baseInit() async {
  // Initialize the main boxes
  lazyBox = await getCollectionBox('default');
  subscriberBox = await getMetadataBox();
}

/// Get all opened lazy boxes (for debugging and management)
Map<String, LazyBox<dynamic>> getOpenedLazyBoxes() {
  return Map.unmodifiable(_openLazyBoxes);
}

/// Get all opened regular boxes (for debugging and management)
Map<String, Box<dynamic>> getOpenedRegularBoxes() {
  return Map.unmodifiable(_openRegularBoxes);
}
