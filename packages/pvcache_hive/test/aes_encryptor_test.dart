import 'package:test/test.dart';
import '../lib/templates/ciphers/aes.dart';

void main() {
  group('PVAesEncryptor', () {
    late PVAesEncryptor encryptor;
    const testSeed = 'test-seed-123';

    setUp(() {
      encryptor = PVAesEncryptor(testSeed);
    });

    group('Basic Encryption/Decryption', () {
      test('should encrypt and decrypt simple string', () {
        const plainText = 'Hello, World!';

        final encrypted = encryptor.encryptString(plainText);
        final decrypted = encryptor.decryptString(encrypted);

        expect(decrypted, equals(plainText));
        expect(encrypted, isNot(equals(plainText)));
      });

      test('should handle empty string', () {
        const plainText = '';

        final encrypted = encryptor.encryptString(plainText);
        final decrypted = encryptor.decryptString(encrypted);

        expect(decrypted, equals(plainText));
        expect(encrypted.isNotEmpty, isTrue);
      });

      test('should handle single character', () {
        const plainText = 'A';

        final encrypted = encryptor.encryptString(plainText);
        final decrypted = encryptor.decryptString(encrypted);

        expect(decrypted, equals(plainText));
      });

      test('should handle long strings', () {
        const plainText =
            'This is a very long string that spans multiple AES blocks '
            'and should test the padding mechanism thoroughly. It contains more '
            'than 64 characters to ensure multiple block encryption is working correctly.';

        final encrypted = encryptor.encryptString(plainText);
        final decrypted = encryptor.decryptString(encrypted);

        expect(decrypted, equals(plainText));
      });
    });

    group('Unicode and Special Characters', () {
      test('should handle Unicode characters', () {
        const plainText = 'Héllo, Wörld! 🌍 áéíóú ñ';

        final encrypted = encryptor.encryptString(plainText);
        final decrypted = encryptor.decryptString(encrypted);

        expect(decrypted, equals(plainText));
      });

      test('should handle special characters and symbols', () {
        const plainText = '!@#\$%^&*()_+-=[]{}|;:,.<>?`~"\'';

        final encrypted = encryptor.encryptString(plainText);
        final decrypted = encryptor.decryptString(encrypted);

        expect(decrypted, equals(plainText));
      });

      test('should handle newlines and tabs', () {
        const plainText = 'Line 1\nLine 2\tTabbed\r\nWindows line ending';

        final encrypted = encryptor.encryptString(plainText);
        final decrypted = encryptor.decryptString(encrypted);

        expect(decrypted, equals(plainText));
      });
    });

    group('JSON and Structured Data', () {
      test('should handle JSON strings', () {
        const plainText = '{"name": "John", "age": 30, "city": "New York"}';

        final encrypted = encryptor.encryptString(plainText);
        final decrypted = encryptor.decryptString(encrypted);

        expect(decrypted, equals(plainText));
      });

      test('should handle complex JSON with arrays', () {
        const plainText = '''
        {
          "users": [
            {"id": 1, "name": "Alice", "active": true},
            {"id": 2, "name": "Bob", "active": false}
          ],
          "metadata": {
            "version": "1.0",
            "created": "2025-09-24T10:00:00Z"
          }
        }''';

        final encrypted = encryptor.encryptString(plainText);
        final decrypted = encryptor.decryptString(encrypted);

        expect(decrypted, equals(plainText));
      });
    });

    group('Security Properties', () {
      test(
        'should produce different ciphertext for same plaintext (random IV)',
        () {
          const plainText = 'Test message';

          final encrypted1 = encryptor.encryptString(plainText);
          final encrypted2 = encryptor.encryptString(plainText);

          // Should be different due to random IV
          expect(encrypted1, isNot(equals(encrypted2)));

          // But both should decrypt to same plaintext
          expect(encryptor.decryptString(encrypted1), equals(plainText));
          expect(encryptor.decryptString(encrypted2), equals(plainText));
        },
      );

      test('should produce different results with different seeds', () {
        final encryptor1 = PVAesEncryptor('seed1');
        final encryptor2 = PVAesEncryptor('seed2');
        const plainText = 'Test message';

        final encrypted1 = encryptor1.encryptString(plainText);
        final encrypted2 = encryptor2.encryptString(plainText);

        // Different seeds should produce different ciphertext
        expect(encrypted1, isNot(equals(encrypted2)));

        // Each encryptor should decrypt its own ciphertext correctly
        expect(encryptor1.decryptString(encrypted1), equals(plainText));
        expect(encryptor2.decryptString(encrypted2), equals(plainText));
      });

      test('should fail to decrypt with wrong encryptor', () {
        final encryptor1 = PVAesEncryptor('seed1');
        final encryptor2 = PVAesEncryptor('seed2');
        const plainText = 'Test message';

        final encrypted = encryptor1.encryptString(plainText);

        // Should throw exception when trying to decrypt with wrong key
        expect(
          () => encryptor2.decryptString(encrypted),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('should be deterministic with same seed', () {
        final encryptor1 = PVAesEncryptor(testSeed);
        final encryptor2 = PVAesEncryptor(testSeed);
        const plainText = 'Test message';

        final encrypted1 = encryptor1.encryptString(plainText);
        final encrypted2 = encryptor2.encryptString(plainText);

        // Both should be able to decrypt each other's ciphertext
        expect(encryptor1.decryptString(encrypted2), equals(plainText));
        expect(encryptor2.decryptString(encrypted1), equals(plainText));
      });
    });

    group('Error Handling', () {
      test('should throw error for invalid base64', () {
        expect(
          () => encryptor.decryptString('invalid-base64!@#'),
          throwsA(isA<Exception>()),
        );
      });

      test('should throw error for too short encrypted data', () {
        // Base64 encoded data that's too short (less than 16 bytes for IV)
        const shortData = 'dGVzdA=='; // "test" in base64 (4 bytes)

        expect(
          () => encryptor.decryptString(shortData),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('should throw error for corrupted encrypted data', () {
        const plainText = 'Test message';
        final encrypted = encryptor.encryptString(plainText);

        // Severely corrupt the encrypted data by replacing last 8 characters
        // This corrupts the actual encrypted content, not just the IV
        final corruptedEncrypted =
            '${encrypted.substring(0, encrypted.length - 8)}XXXXXXXX';

        expect(
          () => encryptor.decryptString(corruptedEncrypted),
          throwsA(anything), // Accept any exception type for corrupted data
        );
      });
    });

    group('Performance and Edge Cases', () {
      test('should handle very long strings efficiently', () {
        // Create a 10KB string
        final longString = 'A' * 10240;

        final stopwatch = Stopwatch()..start();
        final encrypted = encryptor.encryptString(longString);
        final decrypted = encryptor.decryptString(encrypted);
        stopwatch.stop();

        expect(decrypted, equals(longString));
        expect(stopwatch.elapsedMilliseconds, lessThan(1000)); // Should be fast
      });

      test('should handle strings with only whitespace', () {
        const plainText = '   \t\n\r   ';

        final encrypted = encryptor.encryptString(plainText);
        final decrypted = encryptor.decryptString(encrypted);

        expect(decrypted, equals(plainText));
      });

      test('should handle binary-looking data', () {
        const plainText = '\x00\x01\x02\x03\xFF\xFE\xFD';

        final encrypted = encryptor.encryptString(plainText);
        final decrypted = encryptor.decryptString(encrypted);

        expect(decrypted, equals(plainText));
      });
    });

    group('Consistency Tests', () {
      test(
        'should maintain consistency across multiple encrypt/decrypt cycles',
        () {
          const plainText = 'Consistency test message';

          String current = plainText;

          // Encrypt and decrypt multiple times
          for (int i = 0; i < 10; i++) {
            final encrypted = encryptor.encryptString(current);
            current = encryptor.decryptString(encrypted);
          }

          expect(current, equals(plainText));
        },
      );

      test('should handle rapid successive operations', () {
        const plainText = 'Rapid operation test';
        final results = <String>[];

        // Perform rapid encrypt/decrypt operations
        for (int i = 0; i < 100; i++) {
          final encrypted = encryptor.encryptString(plainText);
          final decrypted = encryptor.decryptString(encrypted);
          results.add(decrypted);
        }

        // All results should be identical
        expect(results.every((result) => result == plainText), isTrue);
      });
    });
  });
}
