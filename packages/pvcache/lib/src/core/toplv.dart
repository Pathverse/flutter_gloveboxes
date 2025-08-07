import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce/hive.dart';

class PVCacheTopLv {
  static FlutterSecureStorage secureStorage = const FlutterSecureStorage(); 
  static BoxCollection? boxCollection;

  // init
  static bool _initialized = false;
  static bool get initialized => _initialized;
  static void setInitialized() {
    _initialized = true;
  }

  // debug mode
  static bool _debugMode = false;
  static bool get debugMode => _debugMode;

  static void enableDebugMode() {
    if (_initialized) {
      throw Exception('Cannot change debug mode after initialization.');
    }

    _debugMode = true;
  }
  

}