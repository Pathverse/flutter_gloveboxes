import 'package:test/test.dart';
import 'package:pvcache_hive/templates/ciphers/aes.dart';
import 'package:pvcache_hive/src/pvci.dart';
import 'dart:typed_data';
import 'dart:convert';

void main() {
  group('PVAesEncryptor Integration Tests', () {
    late PVAesEncryptor encryptor;

    setUpAll(() {
      // Set up the encryptor once for all tests in this group
      encryptor = PVAesEncryptor('integration-test-seed-2024');
      // Set the encryptor in PVCoore for integration tests
      PVCoore.encryptor = encryptor;
    });

    test('encrypts and decrypts basic data types through PVCo', () {
      final testCases = [
        'Hello, World!',
        42,
        3.14159,
        true,
        false,
        null,
        ['list', 'of', 'items'],
        {'key': 'value', 'number': 123},
        '', // empty string
        'Unicode test: 🚀 世界 🌍',
      ];

      for (final testData in testCases) {
        // Create PVCo object
        final pvco = PVCo(testData);

        // Serialize to JSON (this should encrypt the data)
        final json = pvco.toJson();

        // Verify the data is encrypted (should not equal the original)
        if (testData != null && testData != '') {
          expect(json['data'], isNot(equals(testData.toString())));
        }

        // Deserialize from JSON (this should decrypt the data)
        final restored = PVCo.fromJson(json);

        // Verify the data matches
        expect(restored.data, equals(testData));
        expect(restored.typeCode, equals(0));
      }
    });

    test('handles complex nested data structures', () {
      final complexData = {
        'user': {
          'id': 12345,
          'name': 'John Doe',
          'email': 'john@example.com',
          'preferences': {
            'theme': 'dark',
            'notifications': true,
            'languages': ['en', 'es', 'fr'],
          },
        },
        'metadata': {
          'created': '2024-01-01T00:00:00Z',
          'version': 1.2,
          'tags': ['important', 'user-data'],
        },
      };

      final pvco = PVCo(complexData);
      final json = pvco.toJson();
      final restored = PVCo.fromJson(json);

      expect(restored.data, equals(complexData));
    });

    test('handles ByteData without encryption', () {
      final bytes = Uint8List.fromList([1, 2, 3, 4, 5, 255, 0, 128]);
      final byteData = ByteData.view(bytes.buffer);

      final pvco = PVCo(byteData);
      expect(pvco.typeCode, equals(1)); // ByteData uses typeCode 1

      final json = pvco.toJson();
      final restored = PVCo.fromJson(json);

      final restoredBytes = (restored.data as ByteData).buffer.asUint8List();
      expect(restoredBytes, equals(bytes));
    });

    test('cross-session deterministic encryption simulation', () {
      final testData = {'session': 'test', 'timestamp': 1234567890};

      // Since PVCoore doesn't allow resetting encryptor, we test with the same instance
      // but verify that the same seed produces consistent results across different
      // PVAesEncryptor instances (simulating cross-session behavior)

      final encryptor1 = PVAesEncryptor('session-test-seed');
      final encryptor2 = PVAesEncryptor('session-test-seed');

      // Test that both encryptors produce the same result for the same input
      final jsonStr = jsonEncode(testData);
      final encrypted1 = encryptor1.encryptString(jsonStr);
      final encrypted2 = encryptor2.encryptString(jsonStr);

      // Should be identical (deterministic)
      expect(encrypted1, equals(encrypted2));

      // Both should decrypt correctly
      expect(encryptor1.decryptString(encrypted1), equals(jsonStr));
      expect(encryptor2.decryptString(encrypted2), equals(jsonStr));

      // Cross-decrypt should also work
      expect(encryptor1.decryptString(encrypted2), equals(jsonStr));
      expect(encryptor2.decryptString(encrypted1), equals(jsonStr));
    });

    test('deterministic encryption produces same results', () {
      final testData = {'deterministic': 'test', 'value': 42};

      // Encrypt the same data twice
      final pvco1 = PVCo(testData);
      final pvco2 = PVCo(testData);

      final json1 = pvco1.toJson();
      final json2 = pvco2.toJson();

      // Should produce identical encrypted results
      expect(json1['data'], equals(json2['data']));

      // Both should decrypt correctly
      final restored1 = PVCo.fromJson(json1);
      final restored2 = PVCo.fromJson(json2);

      expect(restored1.data, equals(testData));
      expect(restored2.data, equals(testData));
    });

    test('handles encryption errors gracefully', () {
      // Create valid encrypted data
      final pvco = PVCo({'test': 'data'});
      final json = pvco.toJson();

      // Corrupt the encrypted data
      json['data'] = 'invalid-base64-data!@#';

      // Should throw PVCoDecryptionException
      expect(
        () => PVCo.fromJson(json),
        throwsA(isA<PVCoDecryptionException>()),
      );
    });

    test('empty data encryption and decryption', () {
      final testCases = ['', {}, []];

      for (final testData in testCases) {
        final pvco = PVCo(testData);
        final json = pvco.toJson();
        final restored = PVCo.fromJson(json);

        expect(restored.data, equals(testData));
      }
    });

    test('large data encryption performance', () {
      // Create a reasonably large data structure
      final largeData = {
        'users': List.generate(
          100,
          (i) => {
            'id': i,
            'name': 'User $i',
            'email': 'user$i@example.com',
            'data': List.generate(50, (j) => 'item_${i}_$j'),
          },
        ),
        'metadata': {
          'count': 100,
          'generated': DateTime.now().toIso8601String(),
        },
      };

      final stopwatch = Stopwatch()..start();

      final pvco = PVCo(largeData);
      final json = pvco.toJson();

      final encryptTime = stopwatch.elapsedMilliseconds;
      stopwatch.reset();

      final restored = PVCo.fromJson(json);

      final decryptTime = stopwatch.elapsedMilliseconds;
      stopwatch.stop();

      expect(restored.data, equals(largeData));

      // Performance assertions (adjust thresholds as needed)
      expect(
        encryptTime,
        lessThan(1000),
        reason: 'Encryption took too long: ${encryptTime}ms',
      );
      expect(
        decryptTime,
        lessThan(1000),
        reason: 'Decryption took too long: ${decryptTime}ms',
      );

      print('Encryption time: ${encryptTime}ms');
      print('Decryption time: ${decryptTime}ms');
    });

    test('handles special characters and unicode', () {
      final unicodeData = {
        'text': 'Hello 世界! 🌍 Здравствуй мир! مرحبا بالعالم!',
        'symbols': '!@#\$%^&*()_+-=[]{}|;:,.<>?',
        'control': '\n\r\t\b\f',
        'emoji': '🚀🎉🎯🔥💯🌟⭐️🎪🎨🎵',
      };

      final pvco = PVCo(unicodeData);
      final json = pvco.toJson();
      final restored = PVCo.fromJson(json);

      expect(restored.data, equals(unicodeData));
    });

    test('data integrity across different data types', () {
      // Test various edge cases to ensure data integrity
      final testCases = [
        {
          'nested': {
            'deep': {'value': 'test'},
          },
        },
        {'special_chars': r'$pecial Ch@rs! "\n\t'},
        {
          'numbers': {'int': 42, 'double': 3.14159, 'negative': -100},
        },
        {
          'booleans': {'true': true, 'false': false},
        },
        {
          'mixed_array': [
            1,
            'two',
            3.0,
            true,
            null,
            {'nested': 'object'},
          ],
        },
      ];

      for (final testData in testCases) {
        final pvco = PVCo(testData);
        final json = pvco.toJson();
        final restored = PVCo.fromJson(json);

        expect(
          restored.data,
          equals(testData),
          reason: 'Failed for test case: $testData',
        );
      }
    });
  });
}
