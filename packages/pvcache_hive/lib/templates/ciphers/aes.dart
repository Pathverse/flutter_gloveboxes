import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:pvcache_hive/src/encryptor.dart';

class PVAesEncryptor extends PVCiEncryptor {
  final String seed;
  final bool liteMode;
  late final Uint8List _key;
  late final Uint8List _staticIV; // For lite mode

  PVAesEncryptor(this.seed, {this.liteMode = false}) {
    // Generate a consistent 32-byte key from the seed using SHA-256
    final digest = SHA256Digest();
    final seedBytes = utf8.encode(seed);
    _key = digest.process(Uint8List.fromList(seedBytes));
    
    if (liteMode) {
      // For lite mode, generate a static IV from the seed
      // This reduces security but improves performance significantly
      final ivDigest = SHA256Digest();
      final ivHash = ivDigest.process(Uint8List.fromList(utf8.encode('${seed}_iv')));
      _staticIV = Uint8List.fromList(ivHash.sublist(0, 16));
    }
  }

  @override
  String encryptString(String data) {
    final plainBytes = utf8.encode(data);

    // Choose IV generation based on mode
    final iv = liteMode ? _staticIV : _generateDeterministicIV(data);

    // Handle empty string case - CTR mode with empty input should produce empty output
    if (plainBytes.isEmpty) {
      // For empty strings, just return the IV (deterministic lookup capability)
      return base64.encode(iv);
    }

    // Setup AES cipher in CTR mode (handles any length, no padding needed)
    final cipher = CTRStreamCipher(AESEngine());
    final params = ParametersWithIV(KeyParameter(_key), iv);

    cipher.init(true, params); // true = encrypt

    final encryptedBytes = cipher.process(Uint8List.fromList(plainBytes));

    if (liteMode) {
      // In lite mode, don't prepend IV since it's static
      return base64.encode(encryptedBytes);
    } else {
      // Combine IV + encrypted data for full security mode
      final result = Uint8List(iv.length + encryptedBytes.length);
      result.setRange(0, iv.length, iv);
      result.setRange(iv.length, result.length, encryptedBytes);
      return base64.encode(result);
    }
  }

  @override
  String decryptString(String encryptedText) {
    final encryptedData = base64.decode(encryptedText);

    final Uint8List iv;
    final Uint8List encryptedBytes;

    if (liteMode) {
      // In lite mode, use static IV and all data is encrypted content
      iv = _staticIV;
      encryptedBytes = encryptedData;
      
      // Handle empty string case (empty data returns empty string)
      if (encryptedBytes.isEmpty) {
        return '';
      }
    } else {
      // Validate minimum length (just IV = 16 bytes minimum)
      if (encryptedData.length < 16) {
        throw ArgumentError('Invalid encrypted data: too short');
      }

      // Extract IV and encrypted bytes
      iv = encryptedData.sublist(0, 16);
      encryptedBytes = encryptedData.sublist(16);

      // Handle empty string case (no encrypted data, just IV)
      if (encryptedBytes.isEmpty) {
        return '';
      }
    }

    // Setup AES cipher in CTR mode
    final cipher = CTRStreamCipher(AESEngine());
    final params = ParametersWithIV(KeyParameter(_key), iv);

    cipher.init(false, params); // false = decrypt

    final decryptedBytes = cipher.process(Uint8List.fromList(encryptedBytes));

    try {
      return utf8.decode(decryptedBytes);
    } catch (e) {
      throw ArgumentError('Failed to decrypt: invalid key or corrupted data');
    }
  }

  /// Generates a deterministic IV based on the data content and seed
  /// Uses length-prefixed encoding to avoid collisions and ensure
  /// robust deterministic encryption for caching use cases
  Uint8List _generateDeterministicIV(String data) {
    final seedBytes = utf8.encode(seed);
    final dataBytes = utf8.encode(data);

    // Create length-prefixed buffer to avoid collisions
    // Format: [seed_len_high][seed_len_low][seed_bytes][data_len_high][data_len_low][data_bytes]
    final buffer = <int>[];

    // Add seed length (2 bytes, big-endian)
    buffer.add(seedBytes.length >> 8);
    buffer.add(seedBytes.length & 0xFF);
    buffer.addAll(seedBytes);

    // Add data length (2 bytes, big-endian)
    buffer.add(dataBytes.length >> 8);
    buffer.add(dataBytes.length & 0xFF);
    buffer.addAll(dataBytes);

    // Generate deterministic hash
    final digest = SHA256Digest();
    final hash = digest.process(Uint8List.fromList(buffer));

    // Take first 16 bytes as IV (AES block size)
    return Uint8List.fromList(hash.sublist(0, 16));
  }
}
