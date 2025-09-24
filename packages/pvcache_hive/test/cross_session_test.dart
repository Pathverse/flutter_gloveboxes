import 'package:test/test.dart';
import 'package:pvcache_hive/templates/ciphers/aes.dart';

void main() {
  group('PVAesEncryptor Cross-Session Tests', () {
    test('can decrypt data encrypted in previous session', () {
      const seed = 'test-seed-123';
      const testData = 'Hello, cross-session world!';

      // Simulate first session - encrypt data
      final encryptor1 = PVAesEncryptor(seed);
      final encrypted = encryptor1.encryptString(testData);

      // Simulate app restart - create new encryptor instance
      final encryptor2 = PVAesEncryptor(seed);
      final decrypted = encryptor2.decryptString(encrypted);

      expect(decrypted, equals(testData));
    });

    test('same data produces same encrypted result (deterministic)', () {
      const seed = 'test-seed-456';
      const testData = 'Same data, same encrypted result';

      final encryptor = PVAesEncryptor(seed);

      // Encrypt the same data twice
      final encrypted1 = encryptor.encryptString(testData);
      final encrypted2 = encryptor.encryptString(testData);

      // Should produce identical encrypted results (deterministic encryption)
      expect(encrypted1, equals(encrypted2));

      // Both should decrypt to the same original data
      expect(encryptor.decryptString(encrypted1), equals(testData));
      expect(encryptor.decryptString(encrypted2), equals(testData));
    });

    test('handles empty strings across sessions', () {
      const seed = 'empty-test-seed';
      const testData = '';

      final encryptor1 = PVAesEncryptor(seed);
      final encrypted = encryptor1.encryptString(testData);

      final encryptor2 = PVAesEncryptor(seed);
      final decrypted = encryptor2.decryptString(encrypted);

      expect(decrypted, equals(testData));
    });

    test('handles large strings across sessions', () {
      const seed = 'large-test-seed';
      final testData = 'Large data test ' * 1000; // ~16KB string

      final encryptor1 = PVAesEncryptor(seed);
      final encrypted = encryptor1.encryptString(testData);

      final encryptor2 = PVAesEncryptor(seed);
      final decrypted = encryptor2.decryptString(encrypted);

      expect(decrypted, equals(testData));
    });

    test('same data encrypted across sessions produces identical results', () {
      const seed = 'deterministic-seed-789';
      const testData = 'Cache key data';

      // First session
      final encryptor1 = PVAesEncryptor(seed);
      final encrypted1 = encryptor1.encryptString(testData);

      // Second session (new encryptor instance)
      final encryptor2 = PVAesEncryptor(seed);
      final encrypted2 = encryptor2.encryptString(testData);

      // Should produce identical encrypted results for cache lookup
      expect(encrypted1, equals(encrypted2));

      // Both should decrypt correctly
      expect(encryptor1.decryptString(encrypted1), equals(testData));
      expect(encryptor2.decryptString(encrypted2), equals(testData));
    });
  });
}
