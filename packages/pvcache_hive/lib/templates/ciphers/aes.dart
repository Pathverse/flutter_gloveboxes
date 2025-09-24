import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:pvcache_hive/src/encryptor.dart';

class PVAesEncryptor extends PVCiEncryptor {
  final String seed;
  late final Uint8List _key;
  late final SecureRandom _secureRandom;

  PVAesEncryptor(this.seed) {
    // Generate a consistent 32-byte key from the seed using SHA-256
    final digest = SHA256Digest();
    final seedBytes = utf8.encode(seed);
    _key = digest.process(Uint8List.fromList(seedBytes));

    // Initialize secure random
    _secureRandom = SecureRandom('Fortuna')..seed(KeyParameter(_key));
  }

  @override
  String encryptString(String data) {
    // Handle empty string case
    if (data.isEmpty) {
      data = ' '; // Replace with single space to avoid empty block issues
    }

    final plainBytes = utf8.encode(data);

    // Generate random IV
    final iv = _generateRandomBytes(16);

    // Setup AES cipher in CBC mode with PKCS7 padding
    final cipher = PaddedBlockCipher('AES/CBC/PKCS7');
    final params = PaddedBlockCipherParameters(
      ParametersWithIV(KeyParameter(_key), iv),
      null,
    );

    cipher.init(true, params); // true = encrypt

    final encryptedBytes = cipher.process(Uint8List.fromList(plainBytes));

    // Combine IV + encrypted data
    final result = Uint8List(iv.length + encryptedBytes.length);
    result.setRange(0, iv.length, iv);
    result.setRange(iv.length, result.length, encryptedBytes);

    return base64.encode(result);
  }

  @override
  String decryptString(String encryptedText) {
    final encryptedData = base64.decode(encryptedText);

    // Validate minimum length (IV + at least one encrypted block)
    if (encryptedData.length < 16) {
      throw ArgumentError('Invalid encrypted data: too short');
    }

    // Extract IV and encrypted bytes
    final iv = encryptedData.sublist(0, 16);
    final encryptedBytes = encryptedData.sublist(16);

    // Setup AES cipher in CBC mode with PKCS7 padding
    final cipher = PaddedBlockCipher('AES/CBC/PKCS7');
    final params = PaddedBlockCipherParameters(
      ParametersWithIV(KeyParameter(_key), iv),
      null,
    );

    cipher.init(false, params); // false = decrypt

    final decryptedBytes = cipher.process(Uint8List.fromList(encryptedBytes));

    final result = utf8.decode(decryptedBytes);

    // Handle empty string case (if we encrypted a space for empty string)
    return result == ' ' ? '' : result;
  }

  Uint8List _generateRandomBytes(int length) {
    final bytes = Uint8List(length);
    for (int i = 0; i < length; i++) {
      bytes[i] = _secureRandom.nextUint8();
    }
    return bytes;
  }
}
