// initialize flutter_secure_storage, hive_ce and flutter_cache_manager
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce/hive.dart';
import 'package:pv_cache/src/worker/custom_cipher.dart';

const secureStorage = FlutterSecureStorage();
LazyBox<String>? lazyBox;
LazyBox<String>? subscriberBox;

Future<void> baseInit() async {
  // Initialize Hive if not already initialized
  if (!Hive.isBoxOpen('__pv_cache_kv__')) {
    // creates a lazy box where data is saved in base64 format with JSON serialization
    lazyBox = await Hive.openLazyBox(
      "__pv_cache_kv__",
      encryptionCipher: CustomCipher(),
    );
  } else {
    // Use existing box if already open
    lazyBox = Hive.lazyBox('__pv_cache_kv__');
  }

  // Initialize subscriber box for tracking cache behavior
  if (!Hive.isBoxOpen('__pv_cache_subscriber__')) {
    subscriberBox = await Hive.openLazyBox(
      "__pv_cache_subscriber__",
      encryptionCipher: CustomCipher(),
    );
  } else {
    subscriberBox = Hive.lazyBox('__pv_cache_subscriber__');
  }
}
