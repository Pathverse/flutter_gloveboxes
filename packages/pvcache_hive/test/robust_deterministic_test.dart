import 'package:test/test.dart';
import 'package:pvcache_hive/templates/ciphers/aes.dart';

void main() {
  group('PVAesEncryptor Robust Deterministic Tests', () {
    test('avoids collision between similar seed/data combinations', () {
      // These could collide with simple string concatenation
      final encryptor1 = PVAesEncryptor('ab');
      final encryptor2 = PVAesEncryptor('a');

      final encrypted1 = encryptor1.encryptString('c'); // seed="ab", data="c"
      final encrypted2 = encryptor2.encryptString('bc'); // seed="a", data="bc"

      // Should be different (no collision)
      expect(encrypted1, isNot(equals(encrypted2)));
    });

    test('handles separator conflicts', () {
      // These could collide with `:` separator approach
      final encryptor1 = PVAesEncryptor('key:with');
      final encryptor2 = PVAesEncryptor('key');

      final encrypted1 = encryptor1.encryptString('colon'); // "key:with:colon"
      final encrypted2 = encryptor2.encryptString(
        'with:colon',
      ); // "key:with:colon"

      // Should be different (no collision)
      expect(encrypted1, isNot(equals(encrypted2)));
    });

    test('handles Unicode and special characters deterministically', () {
      const seed = 'test-seed';
      const testData = 'Hello 世界! 🌍 \n\t"quotes"';

      final encryptor1 = PVAesEncryptor(seed);
      final encryptor2 = PVAesEncryptor(seed);

      final encrypted1 = encryptor1.encryptString(testData);
      final encrypted2 = encryptor2.encryptString(testData);

      // Should be identical (deterministic)
      expect(encrypted1, equals(encrypted2));

      // Should decrypt correctly
      expect(encryptor1.decryptString(encrypted1), equals(testData));
      expect(encryptor2.decryptString(encrypted2), equals(testData));
    });

    test('handles edge cases with empty and whitespace strings', () {
      const seed = 'edge-case-seed';

      final encryptor = PVAesEncryptor(seed);

      // Test various edge cases
      final testCases = [
        '', // empty
        ' ', // single space
        '\n', // newline
        '\t', // tab
        '   ', // multiple spaces
        '\n\t\r', // mixed whitespace
      ];

      // Each should be deterministic
      for (final testData in testCases) {
        final encrypted1 = encryptor.encryptString(testData);
        final encrypted2 = encryptor.encryptString(testData);

        expect(
          encrypted1,
          equals(encrypted2),
          reason:
              'Failed for: "${testData.replaceAll('\n', '\\n').replaceAll('\t', '\\t').replaceAll('\r', '\\r')}"',
        );

        final decrypted = encryptor.decryptString(encrypted1);
        expect(decrypted, equals(testData));
      }
    });

    test('handles very long seeds and data', () {
      final longSeed = 'x' * 1000;
      final longData = 'y' * 2000;

      final encryptor1 = PVAesEncryptor(longSeed);
      final encryptor2 = PVAesEncryptor(longSeed);

      final encrypted1 = encryptor1.encryptString(longData);
      final encrypted2 = encryptor2.encryptString(longData);

      // Should be deterministic even with long inputs
      expect(encrypted1, equals(encrypted2));
      expect(encryptor1.decryptString(encrypted1), equals(longData));
    });

    test('different data produces different results', () {
      const seed = 'same-seed';
      final encryptor = PVAesEncryptor(seed);

      final encrypted1 = encryptor.encryptString('data1');
      final encrypted2 = encryptor.encryptString('data2');

      // Different data should produce different ciphertext
      expect(encrypted1, isNot(equals(encrypted2)));
    });

    test('validates length-prefixed format handles boundary cases', () {
      // Test with data that could cause issues with length encoding
      const seed = 'boundary-test';
      final encryptor = PVAesEncryptor(seed);

      // Test with lengths that use both bytes of the length prefix
      final data255 = 'x' * 255; // Single byte length
      final data256 = 'x' * 256; // Requires second byte
      final data65535 = 'x' * 65535; // Max 2-byte length

      // Each should be deterministic
      for (final testData in [data255, data256, data65535]) {
        final encrypted1 = encryptor.encryptString(testData);
        final encrypted2 = encryptor.encryptString(testData);

        expect(encrypted1, equals(encrypted2));
        expect(encryptor.decryptString(encrypted1), equals(testData));
      }
    });
  });
}
