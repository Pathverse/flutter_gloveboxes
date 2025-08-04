// ignore_for_file: avoid_print

import 'package:pvcache/pvcache.dart';

/// Handles PVCache environment registration and initialization
class PVCacheInitializer {
  /// Initialize PVCache with all test environments
  static Future<void> initializeAll() async {
    print('🚀 Starting PVCache initialization...');

    await registerEnvironments();
    await initializePVCache();

    print('✅ PVCache initialized successfully!');
  }

  /// Register all test environments (public method)
  static Future<void> registerEnvironments() async {
    print('\n📦 Registering custom environments...');
    await _registerEnvironments();
  }

  /// Initialize PVCache core (public method)
  static Future<void> initializePVCache() async {
    print('\n🔧 Initializing PVCache...');
    await _initializePVCache();
  }

  /// Register all test environments
  static Future<void> _registerEnvironments() async {
    await PVCache.register(
      'user',
      secureData: false,
      secureMeta: false,
      defaultMeta: {
        'created_at': DateTime.now().millisecondsSinceEpoch,
        'expiry': DateTime.now()
            .add(Duration(hours: 24))
            .millisecondsSinceEpoch,
      },
    );
    print('✅ user environment registered');

    await PVCache.register(
      'cache',
      secureData: false,
      secureMeta: false,
      defaultMeta: {
        'expiry': DateTime.now()
            .add(Duration(minutes: 30))
            .millisecondsSinceEpoch,
      },
    );
    print('✅ cache environment registered');

    await PVCache.register('secure', secureData: true, secureMeta: true);
    print('✅ secure environment registered');
  }

  /// Initialize PVCache core
  static Future<void> _initializePVCache() async {
    await PVCache.init();
  }
}
