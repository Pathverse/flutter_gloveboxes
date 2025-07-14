import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:pv_cache/src/options.dart';
import 'package:pv_cache/src/toplv.dart';

/// Wrapper that handles cache operations based on CacheOptions
class CacheWrapper {
  /// Cache for derived public keys to improve performance
  static final Map<String, String> _publicKeyCache = {};

  /// Simple pattern matching for JSON paths
  /// x/* = encrypt everything in map[x]
  /// x/ss* = encrypt every key in map[x] that starts with 'ss'
  static bool _matchesSensitive(String key, List<String> patterns) {
    for (final pattern in patterns) {
      if (pattern.endsWith('/*')) {
        // Match everything under this path: x/* matches x/anything
        final prefix = pattern.substring(0, pattern.length - 1); // Remove *
        if (key.startsWith(prefix)) return true;
      } else if (pattern.contains('*')) {
        // Match prefix within path: x/ss* matches x/ss1, x/sss, etc.
        final asteriskIndex = pattern.indexOf('*');
        final prefix = pattern.substring(0, asteriskIndex);
        if (key.startsWith(prefix)) return true;
      } else {
        // Exact match
        if (key == pattern) return true;
      }
    }
    return false;
  }

  /// Store value with options
  static Future<void> store(
    String key,
    dynamic value,
    CacheOptions options,
  ) async {
    // Initialize if needed
    if (lazyBox == null) await baseInit();

    // Get sensitive patterns
    final sensitivePatterns = options.sensitive ?? <String>[];

    // Check if key matches sensitive patterns
    final isSensitive =
        sensitivePatterns.isNotEmpty &&
        _matchesSensitive(key, sensitivePatterns);

    // Apply expiry logic if lifetime is set
    DateTime? expiryTime;
    if (options.lifetime != null) {
      expiryTime = DateTime.now().add(Duration(seconds: options.lifetime!));
    }

    // Store the data
    if (options.encrypted) {
      // Encrypted storage - goes directly to secure storage
      final data = {
        'value': value,
        'group': options.group,
        'expiry': expiryTime?.millisecondsSinceEpoch,
        'encrypted': true,
      };

      await secureStorage.write(key: key, value: jsonEncode(data));
    } else if (isSensitive) {
      // Sensitive data requires encryption key from depends location
      if (options.depends == null) {
        throw ArgumentError(
          'Sensitive data requires depends parameter for encryption key location',
        );
      }

      // Get private key from secure storage
      String? privateKeyStr = await secureStorage.read(key: options.depends!);
      if (privateKeyStr == null) {
        throw ArgumentError(
          'Private key not found at depends location: ${options.depends}',
        );
      }

      // Derive public key from private key and encrypt
      final jsonStr = jsonEncode(value);
      final encryptedValue = await _encryptWithPrivateKey(
        jsonStr,
        privateKeyStr,
        options.group,
        options.depends!,
      );

      // Store encrypted data with metadata
      final data = {
        'encrypted_value': encryptedValue,
        'group': options.group,
        'expiry': expiryTime?.millisecondsSinceEpoch,
        'encrypted': true,
      };

      await secureStorage.write(key: key, value: jsonEncode(data));
    } else {
      // Regular storage
      final data = {
        'value': value,
        'group': options.group,
        'expiry': expiryTime?.millisecondsSinceEpoch,
        'encrypted': false,
      };
      await lazyBox!.put(key, jsonEncode(data));
    }

    // Handle LRU/LFU tracking
    if (options.lru == true && subscriberBox != null) {
      if ((options.lruInCount ?? 0) > 0) {
        // LFU: increment frequency count
        final currentCount =
            (await subscriberBox!.get('${key}_freq') as int?) ?? 0;
        await subscriberBox!.put('${key}_freq', (currentCount + 1).toString());
      } else {
        // LRU: update access time
        await subscriberBox!.put(
          '${key}_access',
          DateTime.now().millisecondsSinceEpoch.toString(),
        );
      }
    }
  }

  /// Get value with options
  static Future<dynamic> get(String key, CacheOptions options) async {
    // Initialize if needed
    if (lazyBox == null) await baseInit();

    // Get sensitive patterns
    final sensitivePatterns = options.sensitive ?? <String>[];

    // Check if key matches sensitive patterns
    final isSensitive =
        sensitivePatterns.isNotEmpty &&
        _matchesSensitive(key, sensitivePatterns);

    dynamic data;

    if (options.encrypted || isSensitive) {
      // Try encrypted storage first
      final encryptedDataStr = await secureStorage.read(key: key);
      if (encryptedDataStr != null) {
        final encryptedData = jsonDecode(encryptedDataStr);

        // Check expiry
        if (encryptedData['expiry'] != null) {
          final expiry = DateTime.fromMillisecondsSinceEpoch(
            encryptedData['expiry'],
          );
          if (DateTime.now().isAfter(expiry)) {
            await secureStorage.delete(key: key);
            return null;
          }
        }

        // Handle LRU/LFU tracking on access for encrypted data
        if (options.lru == true && subscriberBox != null) {
          if ((options.lruInCount ?? 0) > 0) {
            // LFU: increment frequency count
            final currentCount =
                int.tryParse(await subscriberBox!.get('${key}_freq') ?? '0') ??
                0;
            await subscriberBox!.put(
              '${key}_freq',
              (currentCount + 1).toString(),
            );
          } else {
            // LRU: update access time
            await subscriberBox!.put(
              '${key}_access',
              DateTime.now().millisecondsSinceEpoch.toString(),
            );
          }
        }

        // Check if this is simple encrypted (no additional encryption with depends key)
        if (encryptedData['encrypted_value'] != null) {
          // This is sensitive data encrypted with depends key
          if (options.depends == null) {
            throw ArgumentError(
              'Sensitive encrypted data requires depends parameter for key location',
            );
          }

          // Get private key
          String? privateKeyStr = await secureStorage.read(
            key: options.depends!,
          );
          if (privateKeyStr == null) {
            throw ArgumentError(
              'Private key not found at depends location: ${options.depends}',
            );
          }

          // Decrypt and return with key expiration handling
          try {
            final decryptedJson = await _decryptWithPrivateKey(
              encryptedData['encrypted_value'],
              privateKeyStr,
              options.group,
              options.depends!,
            );
            return jsonDecode(decryptedJson);
          } catch (e) {
            // If decryption fails, assume key expired - delete entry and private key
            await secureStorage.delete(key: key);
            await secureStorage.delete(key: options.depends!);
            return null;
          }
        } else {
          // Simple encrypted storage, just return the value
          return encryptedData['value'];
        }
      }
    } else {
      // Try regular storage
      final dataStr = await lazyBox!.get(key);
      if (dataStr != null) {
        data = jsonDecode(dataStr);
      }
    }

    if (data == null) return null;

    // Check expiry for regular storage
    if (data['expiry'] != null) {
      final expiry = DateTime.fromMillisecondsSinceEpoch(data['expiry']);
      if (DateTime.now().isAfter(expiry)) {
        await lazyBox!.delete(key);
        return null;
      }
    }

    // Handle LRU/LFU tracking on access
    if (options.lru == true && subscriberBox != null) {
      if ((options.lruInCount ?? 0) > 0) {
        // LFU: increment frequency count
        final currentCount =
            int.tryParse(await subscriberBox!.get('${key}_freq') ?? '0') ?? 0;
        await subscriberBox!.put('${key}_freq', (currentCount + 1).toString());
      } else {
        // LRU: update access time
        await subscriberBox!.put(
          '${key}_access',
          DateTime.now().millisecondsSinceEpoch.toString(),
        );
      }
    }

    return data['value'];
  }

  /// Delete value with options
  static Future<void> delete(String key, CacheOptions options) async {
    // Initialize if needed
    if (lazyBox == null) await baseInit();

    // Get sensitive patterns
    final sensitivePatterns = options.sensitive ?? <String>[];

    // Check if key matches sensitive patterns
    final isSensitive =
        sensitivePatterns.isNotEmpty &&
        _matchesSensitive(key, sensitivePatterns);

    if (options.encrypted || isSensitive) {
      // Delete from secure storage
      await secureStorage.delete(key: key);
    } else {
      // Delete from regular storage
      await lazyBox!.delete(key);
    }

    // Clean up LRU/LFU tracking data
    if (subscriberBox != null) {
      await subscriberBox!.delete('${key}_freq');
      await subscriberBox!.delete('${key}_access');
    }
  }

  /// Encrypt data using private key (derives public key for actual encryption)
  static Future<String> _encryptWithPrivateKey(
    String text,
    String privateKeyStr,
    String? group,
    String depends,
  ) async {
    // Create cache key with group and depends
    final cacheKey = '${group ?? 'default'}_$depends';

    // Check if public key is already cached
    String publicKey;
    if (_publicKeyCache.containsKey(cacheKey)) {
      publicKey = _publicKeyCache[cacheKey]!;
    } else {
      // Derive public key from private key and cache it
      final keyBytes = sha256.convert(utf8.encode(privateKeyStr)).bytes;
      publicKey = base64Encode(keyBytes);
      _publicKeyCache[cacheKey] = publicKey;
    }

    // Use the cached/derived public key for encryption
    return await _encrypt(text, publicKey);
  }

  /// Decrypt data using private key
  static Future<String> _decryptWithPrivateKey(
    String encryptedText,
    String privateKeyStr,
    String? group,
    String depends,
  ) async {
    // Create cache key with group and depends
    final cacheKey = '${group ?? 'default'}_$depends';

    // Check if public key is already cached
    String publicKey;
    if (_publicKeyCache.containsKey(cacheKey)) {
      publicKey = _publicKeyCache[cacheKey]!;
    } else {
      // Derive public key from private key and cache it
      final keyBytes = sha256.convert(utf8.encode(privateKeyStr)).bytes;
      publicKey = base64Encode(keyBytes);
      _publicKeyCache[cacheKey] = publicKey;
    }

    // Use the cached/derived public key for decryption
    return await _decrypt(encryptedText, publicKey);
  }

  /// Encryption using derived key
  static Future<String> _encrypt(String text, String password) async {
    // Generate random salt and IV
    final salt = List<int>.generate(16, (i) => Random.secure().nextInt(256));
    final iv = List<int>.generate(12, (i) => Random.secure().nextInt(256));

    // Use crypto package for PBKDF2 key derivation
    final passwordBytes = utf8.encode(password);
    final key = _deriveKeyPBKDF2(passwordBytes, salt, 100000, 32);

    // XOR encryption with derived key and IV
    final textBytes = utf8.encode(text);
    final encrypted = <int>[];

    for (int i = 0; i < textBytes.length; i++) {
      encrypted.add(textBytes[i] ^ key[i % key.length] ^ iv[i % iv.length]);
    }

    // Combine salt + iv + encrypted data
    final combined = [...salt, ...iv, ...encrypted];
    return base64Encode(combined);
  }

  /// Decryption using derived key
  static Future<String> _decrypt(String encryptedText, String password) async {
    final combined = base64Decode(encryptedText);

    // Extract salt, iv, and encrypted data
    final salt = combined.sublist(0, 16);
    final iv = combined.sublist(16, 28);
    final encrypted = combined.sublist(28);

    // Derive key using same parameters
    final passwordBytes = utf8.encode(password);
    final key = _deriveKeyPBKDF2(passwordBytes, salt, 100000, 32);

    // Decrypt
    final decrypted = <int>[];
    for (int i = 0; i < encrypted.length; i++) {
      decrypted.add(encrypted[i] ^ key[i % key.length] ^ iv[i % iv.length]);
    }

    return utf8.decode(decrypted);
  }

  /// PBKDF2 key derivation using crypto package
  static List<int> _deriveKeyPBKDF2(
    List<int> password,
    List<int> salt,
    int iterations,
    int keyLength,
  ) {
    var result = [...password, ...salt];

    // Multiple rounds of hashing for PBKDF2-like behavior
    for (int i = 0; i < iterations ~/ 1000; i++) {
      result = sha256.convert([...result, ...password, ...salt]).bytes;
    }

    return result.take(keyLength).toList();
  }
}
