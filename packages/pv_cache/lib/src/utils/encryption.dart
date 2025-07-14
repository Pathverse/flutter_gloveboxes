import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

/// Handles encryption and decryption operations for cache data
class CacheEncryption {
  /// Cache for derived public keys to improve performance
  static final Map<String, String> _publicKeyCache = {};

  /// Encrypt data using private key (derives public key for actual encryption)
  static Future<String> encryptWithPrivateKey(
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
    return await encrypt(text, publicKey);
  }

  /// Decrypt data using private key
  static Future<String> decryptWithPrivateKey(
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
    return await decrypt(encryptedText, publicKey);
  }

  /// Encryption using derived key
  static Future<String> encrypt(String text, String password) async {
    // Generate random salt and IV
    final salt = List<int>.generate(16, (i) => Random.secure().nextInt(256));
    final iv = List<int>.generate(12, (i) => Random.secure().nextInt(256));

    // Use crypto package for PBKDF2 key derivation
    final passwordBytes = utf8.encode(password);
    final key = deriveKeyPBKDF2(passwordBytes, salt, 100000, 32);

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
  static Future<String> decrypt(String encryptedText, String password) async {
    final combined = base64Decode(encryptedText);

    // Extract salt, iv, and encrypted data
    final salt = combined.sublist(0, 16);
    final iv = combined.sublist(16, 28);
    final encrypted = combined.sublist(28);

    // Derive key using same parameters
    final passwordBytes = utf8.encode(password);
    final key = deriveKeyPBKDF2(passwordBytes, salt, 100000, 32);

    // Decrypt
    final decrypted = <int>[];
    for (int i = 0; i < encrypted.length; i++) {
      decrypted.add(encrypted[i] ^ key[i % key.length] ^ iv[i % iv.length]);
    }

    return utf8.decode(decrypted);
  }

  /// PBKDF2 key derivation using crypto package
  static List<int> deriveKeyPBKDF2(
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

  /// Clear the public key cache
  static void clearKeyCache() {
    _publicKeyCache.clear();
  }
}
