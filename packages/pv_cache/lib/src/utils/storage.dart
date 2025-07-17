import 'dart:convert';
import 'package:hive_ce/hive.dart';
import 'package:pv_cache/src/core/options.dart';
import 'package:pv_cache/src/core/toplv.dart';
import 'package:pv_cache/src/utils/encryption.dart';
import 'package:pv_cache/src/utils/tracking.dart';
import 'package:pv_cache/src/utils/cache_helper.dart';

/// Handles core cache storage operations
class CacheStorage {
  /// Get the appropriate box based on cache options
  static Future<LazyBox<dynamic>> getBoxForOptions(CacheOptions options) async {
    if (options.useCollection && options.group != null) {
      return await getCollectionBox(options.group!);
    }
    return await defaultBox;
  }

  /// Store value with options
  static Future<void> store(
    String key,
    dynamic value,
    CacheOptions options,
  ) async {
    // Validate options
    CacheUtils.validateOptions(options);

    // Get the appropriate box for this operation
    final box = await getBoxForOptions(options);

    // Get sensitive patterns and check if we have sensitive data with dependencies
    final sensitivePatterns = options.sensitive ?? <String>[];
    final hasSensitiveData =
        sensitivePatterns.isNotEmpty && options.depends != null;

    // Calculate expiry if lifetime is set
    final expiryTimestamp = CacheUtils.calculateExpiry(options.lifetime);

    // Store the data based on encryption requirements
    if (options.encrypted) {
      await _storeEncrypted(key, value, options, expiryTimestamp);
    } else if (hasSensitiveData) {
      await _storeSensitive(key, value, options, expiryTimestamp);
    } else {
      await _storeRegular(key, value, options, expiryTimestamp, box);
    }

    // Handle LRU/LFU tracking
    await CacheTracking.updateOnStore(key, options);
  }

  /// Get value with options
  static Future<dynamic> get(String key, CacheOptions options) async {
    // Get sensitive patterns and check if we have sensitive data with dependencies
    final sensitivePatterns = options.sensitive ?? <String>[];
    final hasSensitiveData =
        sensitivePatterns.isNotEmpty && options.depends != null;

    dynamic result;

    if (options.encrypted || hasSensitiveData) {
      result = await _getEncrypted(key, options, hasSensitiveData);
    } else {
      result = await _getRegular(key, options);
    }

    // Handle LRU/LFU tracking on access if we got a result
    if (result != null) {
      await CacheTracking.updateOnAccess(key, options);
    }

    return result;
  }

  /// Delete value with options
  static Future<void> delete(String key, CacheOptions options) async {
    // Get sensitive patterns and check if we have sensitive data with dependencies
    final sensitivePatterns = options.sensitive ?? <String>[];
    final hasSensitiveData =
        sensitivePatterns.isNotEmpty && options.depends != null;

    if (options.encrypted || hasSensitiveData) {
      // Delete from secure storage
      await secureStorage.delete(key: key);
    } else {
      // Delete from regular storage
      final box = await getBoxForOptions(options);
      await box.delete(key);
    }

    // Clean up LRU/LFU tracking data
    await CacheTracking.cleanupTracking(key);
  }

  /// Store encrypted data directly to secure storage
  static Future<void> _storeEncrypted(
    String key,
    dynamic value,
    CacheOptions options,
    int? expiryTimestamp,
  ) async {
    final metadata = CacheUtils.createMetadata(
      value: value,
      group: options.group,
      expiryTimestamp: expiryTimestamp,
      encrypted: true,
    );

    await secureStorage.write(key: key, value: jsonEncode(metadata));
  }

  /// Store sensitive data with selective encryption
  static Future<void> _storeSensitive(
    String key,
    dynamic value,
    CacheOptions options,
    int? expiryTimestamp,
  ) async {
    if (options.depends == null) {
      throw ArgumentError(
        'Sensitive data requires depends parameter for encryption key location',
      );
    }

    // Get private key from secure storage
    final masterKeyDataStr = await secureStorage.read(key: options.depends!);
    if (masterKeyDataStr == null) {
      throw ArgumentError(
        'Private key not found at depends location: ${options.depends}',
      );
    }

    // Extract the private key value from the stored metadata
    final masterKeyData = jsonDecode(masterKeyDataStr);
    final privateKeyStr = masterKeyData['value'];
    if (privateKeyStr == null) {
      throw ArgumentError(
        'Private key not found at depends location: ${options.depends}',
      );
    }

    // Encrypt the value
    final jsonStr = jsonEncode(value);
    final encryptedValue = await CacheEncryption.encryptWithPrivateKey(
      jsonStr,
      privateKeyStr,
      options.group,
      options.depends!,
    );

    // Store encrypted data with metadata
    final metadata = CacheUtils.createMetadata(
      value: null,
      group: options.group,
      expiryTimestamp: expiryTimestamp,
      encrypted: true,
      encryptedValue: encryptedValue,
    );

    await secureStorage.write(key: key, value: jsonEncode(metadata));
  }

  /// Store regular unencrypted data
  static Future<void> _storeRegular(
    String key,
    dynamic value,
    CacheOptions options,
    int? expiryTimestamp,
    LazyBox<dynamic> box,
  ) async {
    final metadata = CacheUtils.createMetadata(
      value: value,
      group: options.group,
      expiryTimestamp: expiryTimestamp,
      encrypted: false,
    );

    // Store metadata Map directly, leveraging Hive's native serialization
    await box.put(key, metadata);
  }

  /// Get encrypted data from secure storage
  static Future<dynamic> _getEncrypted(
    String key,
    CacheOptions options,
    bool isSensitive,
  ) async {
    final encryptedDataStr = await secureStorage.read(key: key);
    if (encryptedDataStr == null) return null;

    final encryptedData = jsonDecode(encryptedDataStr);

    // Check expiry
    if (CacheUtils.isExpired(encryptedData['expiry'])) {
      await secureStorage.delete(key: key);
      return null;
    }

    // Handle sensitive data with dependency decryption
    if (encryptedData['encrypted_value'] != null) {
      return await _decryptSensitiveData(key, encryptedData, options);
    } else {
      // Simple encrypted storage, just return the value
      return encryptedData['value'];
    }
  }

  /// Get regular data from storage
  static Future<dynamic> _getRegular(String key, CacheOptions options) async {
    final box = await getBoxForOptions(options);
    final data = await box.get(key);
    if (data == null) return null;

    // Data is now stored as Map directly, no JSON decoding needed
    // Handle the type safely - Hive returns Map<dynamic, dynamic>
    final metadata = Map<String, dynamic>.from(data as Map);

    // Check expiry
    if (CacheUtils.isExpired(metadata['expiry'])) {
      await box.delete(key);
      return null;
    }

    return metadata['value'];
  }

  /// Decrypt sensitive data using dependency key
  static Future<dynamic> _decryptSensitiveData(
    String key,
    Map<String, dynamic> encryptedData,
    CacheOptions options,
  ) async {
    if (options.depends == null) {
      throw ArgumentError(
        'Sensitive encrypted data requires depends parameter for key location',
      );
    }

    // First check if the master key exists and is not expired
    final masterKeyDataStr = await secureStorage.read(key: options.depends!);
    if (masterKeyDataStr == null) {
      // Master key doesn't exist, cleanup dependent data
      await secureStorage.delete(key: key);
      return null;
    }

    // Check if master key is expired
    try {
      final masterKeyData = jsonDecode(masterKeyDataStr);

      if (CacheUtils.isExpired(masterKeyData['expiry'])) {
        // Master key is expired, cleanup both master key and dependent data
        await secureStorage.delete(key: key);
        await secureStorage.delete(key: options.depends!);
        return null;
      }

      // Extract the private key value
      final privateKeyStr = masterKeyData['value'];
      if (privateKeyStr == null) {
        throw ArgumentError(
          'Private key not found at depends location: ${options.depends}',
        );
      }

      // Decrypt and return
      final decryptedJson = await CacheEncryption.decryptWithPrivateKey(
        encryptedData['encrypted_value'],
        privateKeyStr,
        options.group,
        options.depends!,
      );
      return jsonDecode(decryptedJson);
    } catch (e) {
      // If decryption fails, assume key is corrupted - delete entry and private key
      await secureStorage.delete(key: key);
      await secureStorage.delete(key: options.depends!);
      return null;
    }
  }
}
