import 'dart:convert';
import 'package:hive_ce/hive.dart';
import 'dart:typed_data';

class CustomCipher extends HiveCipher {
  @override
  int encrypt(
    Uint8List inp,
    int inpOff,
    int inpLen,
    Uint8List out,
    int outOff,
  ) {
    try {
      // First decode the input bytes to string
      final inputString = utf8.decode(inp.sublist(inpOff, inpOff + inpLen));

      // Try to parse as JSON - if it's already valid JSON, keep it as is
      // If it's not JSON, treat it as a raw string
      dynamic jsonData;
      try {
        jsonData = jsonDecode(inputString);
      } catch (e) {
        // If it's not valid JSON, treat it as a raw string
        jsonData = inputString;
      }

      // Convert to JSON string
      final jsonString = jsonEncode(jsonData);

      // Encode to base64
      final encoded = base64Encode(utf8.encode(jsonString));
      final encodedBytes = utf8.encode(encoded);

      out.setRange(outOff, outOff + encodedBytes.length, encodedBytes);
      return encodedBytes.length;
    } catch (e) {
      // Fallback: just base64 encode the original data
      final encoded = base64Encode(inp.sublist(inpOff, inpOff + inpLen));
      final encodedBytes = utf8.encode(encoded);
      out.setRange(outOff, outOff + encodedBytes.length, encodedBytes);
      return encodedBytes.length;
    }
  }

  @override
  int decrypt(
    Uint8List inp,
    int inpOff,
    int inpLen,
    Uint8List out,
    int outOff,
  ) {
    try {
      // Decode from base64
      final base64String = utf8.decode(inp.sublist(inpOff, inpOff + inpLen));
      final decoded = base64Decode(base64String);
      final jsonString = utf8.decode(decoded);

      // Parse JSON and convert back to string
      final jsonData = jsonDecode(jsonString);

      // If the original data was a string, return it as is
      // Otherwise, convert back to JSON string for storage
      final resultString = jsonData is String ? jsonData : jsonEncode(jsonData);
      final resultBytes = utf8.encode(resultString);

      out.setRange(outOff, outOff + resultBytes.length, resultBytes);
      return resultBytes.length;
    } catch (e) {
      // Fallback: just base64 decode
      final decoded = base64Decode(
        utf8.decode(inp.sublist(inpOff, inpOff + inpLen)),
      );
      out.setRange(outOff, outOff + decoded.length, decoded);
      return decoded.length;
    }
  }

  @override
  int maxEncryptedSize(Uint8List inp) {
    // Account for JSON encoding overhead + Base64 encoding
    // JSON can potentially double the size, base64 increases by ~4/3
    return ((inp.length * 2 + 2) ~/ 3) * 4 +
        100; // Added buffer for JSON overhead
  }

  @override
  int calculateKeyCrc() {
    // No key is used in this cipher, so return a constant CRC value
    return 1; // Different from Base64Cipher to distinguish
  }
}
