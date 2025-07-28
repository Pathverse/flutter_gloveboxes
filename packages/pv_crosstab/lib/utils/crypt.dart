/// Cryptography utilities for secure cross-tab communication
///
/// This file provides encryption, key generation, and secure storage functionality
/// for the PV Crosstab package. It handles:
/// - Master key generation and storage
/// - RSA key pair generation for asymmetric encryption
/// - Secure random number generation
/// - Secure storage management using flutter_secure_storage
library;

import "package:web/web.dart" as html;
import 'package:cryptography/cryptography.dart';
import 'dart:js_interop';
import 'package:flutter/foundation.dart' hide Key;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

/// Web Crypto API instance for generating secure random numbers
/// Uses the browser's built-in cryptographically secure random number generator
final crypto = html.window.crypto;

/// Secure storage instance for storing sensitive cryptographic keys
/// This uses platform-specific secure storage (Keychain on iOS, Keystore on Android)
const FlutterSecureStorage _storage = FlutterSecureStorage();

/// Storage key for the master encryption key
/// The master key is the root key used for deriving other encryption keys
const String _masterKeyId = 'crosstab_master_key';

/// Storage key for the RSA private key
/// Private key is kept secret and used for decryption and digital signatures
const String _privateKeyId = 'crosstab_private_key';

/// Storage key for the RSA public key
/// Public key can be shared and is used for encryption and signature verification
const String _publicKeyId = 'crosstab_public_key';

/// Generates a random cryptographic key and returns it as a base64 string
///
/// This is useful for creating symmetric encryption keys, nonces, or other
/// cryptographic material that needs to be random and secure.
///
/// [keyLength] - The length of the key in bytes (default: 32 bytes = 256 bits)
///
/// Returns a base64-encoded string of the random key, or null if generation fails
///
/// Example:
/// ```dart
/// final key = await generateRandomKey(keyLength: 16); // 128-bit key
/// print('Generated key: $key');
/// ```
Future<String?> generateRandomKey({int keyLength = 32}) async {
  final randomBytes = await generateSecureRandomBytes(keyLength);
  if (randomBytes == null) {
    return null;
  }
  return base64Encode(randomBytes);
}

/// Initializes the security system for the application
///
/// This function sets up the cryptographic foundation by:
/// 1. Creating a master key if one doesn't exist
/// 2. Generating RSA key pair if keys don't exist
///
/// Should be called once when the app starts to ensure all cryptographic
/// keys are ready for use. This is safe to call multiple times - it won't
/// overwrite existing keys.
///
/// Throws an exception if key generation fails
///
/// Example:
/// ```dart
/// await initSecurity(); // Call this in your app's initialization
/// ```
Future<void> initSecurity() async {
  final masterKey = await _storage.read(key: _masterKeyId);
  if (masterKey == null) {
    // Generate a new master key
    final newMasterKey = await generateSecureRandomBytes(32);
    if (newMasterKey != null) {
      await _storage.write(
        key: _masterKeyId,
        value: base64Encode(newMasterKey),
      );
    }
  }

  // Check if key pair exists, generate if not
  final privateKey = await _storage.read(key: _privateKeyId);
  final publicKey = await _storage.read(key: _publicKeyId);

  if (privateKey == null || publicKey == null) {
    await generateAndStoreKeyPair();
  }
}

/// Generates a new RSA key pair and stores it securely
///
/// This creates a fresh RSA key pair (public and private keys) and saves them
/// to secure storage. The keys are used for:
/// - Encrypting/decrypting data between browser tabs
/// - Creating and verifying digital signatures
/// - Establishing secure communication channels
///
/// The keys are stored in base64 format for easy serialization and transport.
///
/// Throws an exception if key generation or storage fails
///
/// Example:
/// ```dart
/// await generateAndStoreKeyPair(); // Creates and stores new keys
/// ```
Future<void> generateAndStoreKeyPair() async {
  try {
    // Generate RSA key pair
    final keyPair = await generateRSAKeyPair();

    // Store private key securely
    await _storage.write(key: _privateKeyId, value: keyPair['privateKey']);

    // Store public key
    await _storage.write(key: _publicKeyId, value: keyPair['publicKey']);
  } catch (e) {
    throw Exception('Failed to generate key pair: $e');
  }
}

/// Generates an RSA key pair using the cryptography package
///
/// Creates a 2048-bit RSA key pair suitable for encryption and digital signatures.
/// RSA (Rivest-Shamir-Adleman) is an asymmetric encryption algorithm that uses
/// two mathematically related keys:
/// - Private key: kept secret, used for decryption and signing
/// - Public key: can be shared, used for encryption and signature verification
///
/// The function uses RSA-PSS (Probabilistic Signature Scheme) with SHA-256
/// for enhanced security compared to traditional RSA.
///
/// Returns a Map containing:
/// - 'privateKey': base64-encoded private key data
/// - 'publicKey': base64-encoded public key data
///
/// Throws an exception if key generation fails
///
/// Example:
/// ```dart
/// final keys = await generateRSAKeyPair();
/// print('Private key: ${keys['privateKey']}');
/// print('Public key: ${keys['publicKey']}');
/// ```
Future<Map<String, String>> generateRSAKeyPair() async {
  try {
    // Generate RSA key pair using the cryptography package
    final algorithm = RsaPss(Sha256());
    final keyPair = await algorithm.newKeyPair();

    // Get the key pair data
    final keyPairData = await keyPair.extract();

    // Convert to base64 for storage
    // Check what properties are available on keyPairData
    final privateKeyBase64 = base64Encode(
      keyPairData.d,
    ); // RSA private exponent
    final publicKeyBase64 = base64Encode(keyPairData.n); // RSA public modulus

    return {'privateKey': privateKeyBase64, 'publicKey': publicKeyBase64};
  } catch (e) {
    throw Exception('Failed to generate RSA key pair: $e');
  }
}

/// Retrieves the stored public key from secure storage
///
/// The public key is used for:
/// - Encrypting data that only this app instance can decrypt
/// - Verifying digital signatures created by this app instance
/// - Sharing with other browser tabs for secure communication
///
/// Returns the base64-encoded public key string, or null if not found
///
/// Example:
/// ```dart
/// final publicKey = await getPublicKey();
/// if (publicKey != null) {
///   print('Public key available for encryption');
/// }
/// ```
Future<String?> getPublicKey() async {
  return await _storage.read(key: _publicKeyId);
}

/// Retrieves the stored private key from secure storage
///
/// The private key is highly sensitive and should be kept secret. It's used for:
/// - Decrypting data that was encrypted with the corresponding public key
/// - Creating digital signatures to prove authenticity
/// - Secure communication with other browser tabs
///
/// ⚠️ WARNING: Never expose the private key or send it over the network!
///
/// Returns the base64-encoded private key string, or null if not found
///
/// Example:
/// ```dart
/// final privateKey = await getPrivateKey();
/// if (privateKey != null) {
///   // Use for decryption or signing - keep secret!
/// }
/// ```
Future<String?> getPrivateKey() async {
  return await _storage.read(key: _privateKeyId);
}

/// Generates cryptographically secure random bytes using the Web Crypto API
///
/// This function uses the browser's built-in secure random number generator,
/// which is suitable for cryptographic operations. The random bytes can be
/// used for:
/// - Generating encryption keys
/// - Creating initialization vectors (IVs)
/// - Generating nonces for authentication
/// - Creating salt values for password hashing
///
/// [length] - The number of random bytes to generate
///
/// Returns a Uint8List containing the random bytes, or null if generation fails
///
/// Example:
/// ```dart
/// final randomBytes = await generateSecureRandomBytes(16);
/// if (randomBytes != null) {
///   print('Generated ${randomBytes.length} random bytes');
/// }
/// ```
Future<Uint8List?> generateSecureRandomBytes(int length) async {
  final array = Uint8List(length);
  crypto.getRandomValues(array.toJS);
  return array;
}
