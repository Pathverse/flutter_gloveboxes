import 'package:flutter_test/flutter_test.dart';
import 'package:pvcache/src/cache.dart';
import 'package:pvcache/templates/adapters/expiry.dart';
import 'package:pvcache/templates/storage/inmemory.dart';
import 'package:pvcache/templates/helpers/test.dart';

void main() {
  group('PVCache Basic Operations', () {
    late PVCache cache;

    setUp(() {
      cache = simpleMemoryTest();
    });

    test('should set and get value', () async {
      await cache.set('test-key', 'test-value');
      final result = await cache.get('test-key');
      expect(result, equals('test-value'));
    });

    test('should check if key exists', () async {
      await cache.set('exists-key', 'some-value');
      final exists = await cache.exists('exists-key');
      expect(exists, isTrue);

      final notExists = await cache.exists('non-existent-key');
      expect(notExists, isFalse);
    });

    test('should delete key', () async {
      await cache.set('delete-key', 'delete-value');
      await cache.delete('delete-key');
      final result = await cache.get('delete-key');
      expect(result, isNull);
    });

    test('should clear all keys', () async {
      await cache.set('key1', 'value1');
      await cache.set('key2', 'value2');

      await cache.clear();

      final result1 = await cache.get('key1');
      final result2 = await cache.get('key2');
      expect(result1, isNull);
      expect(result2, isNull);
    });
  });

  group('PVCache TTL/Expiry Operations', () {
    late PVCache cache;

    setUp(() {
      cache = expiryMemoryTest();
    });

    test('should store value with TTL in seconds', () async {
      await cache.set('ttl-key', 'ttl-value', metadata: {'ttl': 1});

      // Should be available immediately
      final immediate = await cache.get('ttl-key');
      expect(immediate, equals('ttl-value'));

      // Wait for expiry
      await Future.delayed(Duration(milliseconds: 1100));

      // Should be expired
      final expired = await cache.get('ttl-key');
      expect(expired, isNull);
    });

    test('should store value with TTL as Duration', () async {
      await cache.set(
        'duration-key',
        'duration-value',
        metadata: {'ttl': Duration(milliseconds: 500)},
      );

      // Should be available immediately
      final immediate = await cache.get('duration-key');
      expect(immediate, equals('duration-value'));

      // Wait for expiry
      await Future.delayed(Duration(milliseconds: 600));

      // Should be expired
      final expired = await cache.get('duration-key');
      expect(expired, isNull);
    });

    test('should store value with explicit expiry time', () async {
      final expiry = DateTime.now().add(Duration(milliseconds: 500));
      await cache.set(
        'expiry-key',
        'expiry-value',
        metadata: {'expiry': expiry},
      );

      // Should be available immediately
      final immediate = await cache.get('expiry-key');
      expect(immediate, equals('expiry-value'));

      // Wait for expiry
      await Future.delayed(Duration(milliseconds: 600));

      // Should be expired
      final expired = await cache.get('expiry-key');
      expect(expired, isNull);
    });

    test('should validate TTL and expiry cannot be used together', () async {
      expect(() async {
        await cache.set(
          'invalid',
          'value',
          metadata: {
            'ttl': 300,
            'expiry': DateTime.now().add(Duration(hours: 1)),
          },
        );
      }, throwsA(isA<ArgumentError>()));
    });

    test('should validate expiry time must be in future', () async {
      expect(() async {
        await cache.set(
          'past',
          'value',
          metadata: {'expiry': DateTime.now().subtract(Duration(hours: 1))},
        );
      }, throwsA(isA<ArgumentError>()));
    });

    test('should validate TTL type', () async {
      expect(() async {
        await cache.set(
          'invalid-ttl',
          'value',
          metadata: {'ttl': 'not-a-number'},
        );
      }, throwsA(isA<ArgumentError>()));
    });
  });

  group('PVCache Error Handling', () {
    test('should fail when ExpiryAdapter lacks metadata storage', () {
      expect(() {
        PVCache(
          env: "no-metadata-test-unique",
          adapters: [ExpiryAdapter()],
          storage: InMemory(),
          // metaStorage: missing!
        );
      }, throwsA(isA<Exception>()));
    });
  });

  group('PVCache Multiple Adapters', () {
    test('should work with logging and expiry adapters together', () async {
      final cache = PVCache(
        env: "multi-adapter-test",
        adapters: [
          ExpiryAdapter(), // Priority 0 - runs first
          LoggingAdapter(), // Priority 10 - runs after expiry
        ],
        storage: InMemory(),
        metaStorage: InMemory(),
      );

      // This should trigger both adapters
      await cache.set('logged-data', 'value', metadata: {'ttl': 1});

      // Should be available immediately
      final immediate = await cache.get('logged-data');
      expect(immediate, equals('value'));

      // Wait for expiry
      await Future.delayed(Duration(milliseconds: 1100));

      // Should be expired
      final expired = await cache.get('logged-data');
      expect(expired, isNull);
    });
  });

  group('PVCache Complex Data Types', () {
    late PVCache cache;

    setUp(() {
      cache = expiryMemoryTest();
    });

    test('should handle Map data with TTL', () async {
      final userData = {
        'id': 123,
        'name': 'John Doe',
        'email': 'john@example.com',
        'preferences': {'theme': 'dark', 'language': 'en'},
      };

      await cache.set('user:123', userData, metadata: {'ttl': 1});

      final retrieved = await cache.get('user:123') as Map<String, dynamic>?;
      expect(retrieved, isNotNull);
      expect(retrieved!['name'], equals('John Doe'));
      expect(retrieved['preferences']['theme'], equals('dark'));

      // Wait for expiry
      await Future.delayed(Duration(milliseconds: 1100));

      final expired = await cache.get('user:123');
      expect(expired, isNull);
    });

    test('should handle List data with TTL', () async {
      final items = ['apple', 'banana', 'cherry', 'date'];

      await cache.set('fruits', items, metadata: {'ttl': 1});

      final retrieved = await cache.get('fruits') as List<String>?;
      expect(retrieved, isNotNull);
      expect(retrieved!.length, equals(4));
      expect(retrieved[0], equals('apple'));

      // Wait for expiry
      await Future.delayed(Duration(milliseconds: 1100));

      final expired = await cache.get('fruits');
      expect(expired, isNull);
    });
  });
}
