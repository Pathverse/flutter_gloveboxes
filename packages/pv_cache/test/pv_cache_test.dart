import 'package:flutter_test/flutter_test.dart';
import 'package:hive_ce/hive.dart';
import 'package:pv_cache/lib.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pv_cache/src/core/toplv.dart' as toplv;
import 'dart:io';

class MockFlutterSecureStorage implements FlutterSecureStorage {
  final Map<String, String> _storage = {};
  void clearMockStorage() => _storage.clear();
  @override
  Future<bool> containsKey({
    required String key,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async => _storage.containsKey(key);
  @override
  Future<void> delete({
    required String key,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async => _storage.remove(key);
  @override
  Future<void> deleteAll({
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async => _storage.clear();
  @override
  Future<String?> read({
    required String key,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async => _storage[key];
  @override
  Future<Map<String, String>> readAll({
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async => Map<String, String>.from(_storage);
  @override
  Future<void> write({
    required String key,
    required String? value,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    if (value != null) {
      _storage[key] = value;
    } else {
      _storage.remove(key);
    }
  }

  @override
  Future<bool> isCupertinoProtectedDataAvailable({
    IOSOptions? iOptions,
  }) async => false;
  @override
  void registerListener({
    required String key,
    required void Function(String?) listener,
  }) {}
  @override
  void unregisterAllListeners({
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) {}
  @override
  void unregisterAllListenersForKey({
    required String key,
    IOSOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    MacOsOptions? mOptions,
    WindowsOptions? wOptions,
  }) {}
  @override
  void unregisterListener({
    required String key,
    required void Function(String?) listener,
  }) {}
  @override
  Stream<bool> get onCupertinoProtectedDataAvailabilityChanged =>
      Stream.value(false);
  @override
  AndroidOptions get aOptions => const AndroidOptions();
  @override
  IOSOptions get iOptions => const IOSOptions();
  @override
  LinuxOptions get lOptions => const LinuxOptions();
  @override
  MacOsOptions get mOptions => const MacOsOptions();
  @override
  WebOptions get webOptions => const WebOptions();
  @override
  WindowsOptions get wOptions => const WindowsOptions();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('PVCache Comprehensive Tests', () {
    late PVCache cache;
    late MockFlutterSecureStorage mockSecureStorage;
    setUpAll(() async {
      final tempDir = Directory.systemTemp.createTempSync('pv_cache_test');
      Hive.init(tempDir.path);
      mockSecureStorage = MockFlutterSecureStorage();
      toplv.secureStorage = mockSecureStorage;
      cache = await PVCache.getInstance(debug: true);
    });
    tearDownAll(() async {
      await Hive.close();
    });
    setUp(() async {
      await cache.clear();
      mockSecureStorage.clearMockStorage();
    });

    group('Basic Cache Operations', () {
      test('store and retrieve string', () async {
        await cache.putWithOptions('k', 'v');
        expect(await cache.getWithOptions('k'), 'v');
      });
      test('store and retrieve int', () async {
        await cache.putWithOptions('num', 42);
        expect(await cache.getWithOptions<int>('num'), 42);
      });
      test('store and retrieve bool', () async {
        await cache.putWithOptions('b', true);
        expect(await cache.getWithOptions<bool>('b'), true);
      });
      test('delete and clear', () async {
        await cache.putWithOptions('del', 'x');
        await cache.deleteWithOptions('del');
        expect(await cache.getWithOptions('del'), isNull);
        await cache.putWithOptions('a', 1);
        await cache.clear();
        expect(await cache.getAllKeys(), isEmpty);
      });
    });

    group('JSON Operations', () {
      test('store and retrieve map', () async {
        final m = {'a': 1, 'b': true};
        await cache.putWithOptions('map', m);
        expect(await cache.getWithOptions<Map<String, dynamic>>('map'), m);
      });
      test('store and retrieve list', () async {
        final l = [1, 2, 3];
        await cache.putWithOptions('list', l);
        expect(await cache.getWithOptions<List<dynamic>>('list'), l);
      });
    });

    group('Encrypted Storage', () {
      test('store and retrieve encrypted string', () async {
        await cache.putWithOptions(
          'enc',
          'secret',
          options: const CacheOptions(encrypted: true),
        );
        expect(
          await cache.getWithOptions(
            'enc',
            options: const CacheOptions(encrypted: true),
          ),
          'secret',
        );
      });
      test('fail to retrieve encrypted data without flag', () async {
        await cache.putWithOptions(
          'enc2',
          'secret',
          options: const CacheOptions(encrypted: true),
        );
        expect(await cache.getWithOptions('enc2'), isNull);
      });
    });

    group('Sensitive Data', () {
      test('store and retrieve with master key', () async {
        await cache.putWithOptions(
          'master',
          'm',
          options: const CacheOptions(encrypted: true),
        );
        final v = {'public': 'x', 'secret': 'y'};
        final opts = CacheOptions(sensitive: ['secret'], depends: 'master');
        await cache.putWithOptions('sens', v, options: opts);
        expect(
          await cache.getWithOptions<Map<String, dynamic>>(
            'sens',
            options: opts,
          ),
          v,
        );
      });
      test('fail if master key missing', () async {
        final opts = CacheOptions(sensitive: ['secret'], depends: 'nope');
        expect(
          () => cache.putWithOptions('fail', {'secret': 'x'}, options: opts),
          throwsA(isA<ArgumentError>()),
        );
      });
    });

    group('Dependency Logic', () {
      test('ENCRYPTED:x dependency', () async {
        expect(
          () => cache.putWithOptions(
            'fail',
            'v',
            options: CacheOptions(depends: 'ENCRYPTED:nope'),
          ),
          throwsA(isA<ArgumentError>()),
        );
        await cache.putWithOptions(
          'mk',
          'v',
          options: const CacheOptions(encrypted: true),
        );
        final opts = CacheOptions(depends: 'ENCRYPTED:mk');
        await cache.putWithOptions('ok', 'v', options: opts);
        expect(await cache.getWithOptions('ok', options: opts), 'v');
      });
      test('X:Y dependency', () async {
        expect(
          () => cache.putWithOptions(
            'fail2',
            'v',
            options: CacheOptions(depends: 'g:missing'),
          ),
          throwsA(isA<ArgumentError>()),
        );
        await cache.putWithOptions('k', 'v', options: CacheOptions(group: 'g'));
        final opts = CacheOptions(depends: 'g:k');
        await cache.putWithOptions('ok2', 'v', options: opts);
        expect(await cache.getWithOptions('ok2', options: opts), 'v');
      });
      test('X:* dependency', () async {
        expect(
          () => cache.putWithOptions(
            'fail3',
            'v',
            options: CacheOptions(depends: 'g2:*'),
          ),
          throwsA(isA<ArgumentError>()),
        );
        await cache.putWithOptions(
          'k2',
          'v',
          options: CacheOptions(group: 'g2'),
        );
        final opts = CacheOptions(depends: 'g2:*');
        await cache.putWithOptions('ok3', 'v', options: opts);
        expect(await cache.getWithOptions('ok3', options: opts), 'v');
      });
      test('get returns null if dependency not satisfied', () async {
        expect(
          await cache.getWithOptions(
            'fail',
            options: CacheOptions(depends: 'ENCRYPTED:nope'),
          ),
          isNull,
        );
        expect(
          await cache.getWithOptions(
            'fail2',
            options: CacheOptions(depends: 'g:missing'),
          ),
          isNull,
        );
        expect(
          await cache.getWithOptions(
            'fail3',
            options: CacheOptions(depends: 'g2:*'),
          ),
          isNull,
        );
      });
    });

    group('Expiry', () {
      test('entry expires', () async {
        await cache.putWithOptions(
          'exp',
          'gone',
          options: const CacheOptions(lifetime: 1),
        );
        expect(
          await cache.getWithOptions(
            'exp',
            options: const CacheOptions(lifetime: 1),
          ),
          'gone',
        );
        await Future.delayed(const Duration(seconds: 2));
        expect(
          await cache.getWithOptions(
            'exp',
            options: const CacheOptions(lifetime: 1),
          ),
          isNull,
        );
      });
    });

    group('LRU/LFU', () {
      test('LRU eviction', () async {
        const options = CacheOptions(lru: true, lruInCount: 0);
        await cache.putWithOptions('lru1', 'v1', options: options);
        await cache.putWithOptions('lru2', 'v2', options: options);
        await cache.putWithOptions('lru3', 'v3', options: options);
        expect(await cache.getWithOptions('lru1', options: options), 'v1');
        expect(await cache.getWithOptions('lru2', options: options), 'v2');
        expect(await cache.getWithOptions('lru3', options: options), 'v3');
      });
      test('LFU eviction', () async {
        const options = CacheOptions(lru: true, lruInCount: 10);
        await cache.putWithOptions('lfu1', 'v1', options: options);
        await cache.putWithOptions('lfu2', 'v2', options: options);
        for (int i = 0; i < 5; i++) {
          await cache.getWithOptions('lfu1', options: options);
        }
        await cache.getWithOptions('lfu2', options: options);
        expect(await cache.getWithOptions('lfu1', options: options), 'v1');
        expect(await cache.getWithOptions('lfu2', options: options), 'v2');
      });
    });

    group('Grouping', () {
      test('grouped entries', () async {
        await cache.putWithOptions(
          'gk1',
          'v1',
          options: CacheOptions(group: 'g1'),
        );
        await cache.putWithOptions(
          'gk2',
          'v2',
          options: CacheOptions(group: 'g2'),
        );
        expect(
          await cache.getWithOptions('gk1', options: CacheOptions(group: 'g1')),
          'v1',
        );
        expect(
          await cache.getWithOptions('gk2', options: CacheOptions(group: 'g2')),
          'v2',
        );
      });
    });

    group('Error Handling', () {
      test('invalid options', () async {
        expect(
          () => CacheOptions(encrypted: true, sensitive: ['x'], depends: 'y'),
          throwsA(isA<AssertionError>()),
        );
        expect(
          () => CacheOptions(sensitive: ['x'], depends: null),
          throwsA(isA<AssertionError>()),
        );
        expect(
          () => CacheOptions(lru: true, lifetime: 1),
          throwsA(isA<AssertionError>()),
        );
        expect(
          () => CacheOptions(lru: false, lruInCount: 10),
          throwsA(isA<AssertionError>()),
        );
        expect(
          () => CacheOptions(lruInCount: 10),
          throwsA(isA<AssertionError>()),
        );
      });
    });

    group('Real-World Scenarios', () {
      test('user session', () async {
        final session = {
          'id': 'u1',
          'token': 't',
          'exp': DateTime.now().toIso8601String(),
        };
        await cache.putWithOptions(
          'session',
          session,
          options: const CacheOptions(group: 'user_sessions', lifetime: 3600),
        );
        expect(
          await cache.getWithOptions<Map<String, dynamic>>(
            'session',
            options: const CacheOptions(group: 'user_sessions', lifetime: 3600),
          ),
          session,
        );
      });
      test('api token cache', () async {
        await cache.putWithOptions(
          'access_token',
          'at',
          options: const CacheOptions(encrypted: true, lifetime: 3600),
        );
        await cache.putWithOptions(
          'refresh_token',
          'rt',
          options: const CacheOptions(encrypted: true, lifetime: 86400),
        );
        expect(
          await cache.getWithOptions(
            'access_token',
            options: const CacheOptions(encrypted: true, lifetime: 3600),
          ),
          'at',
        );
        expect(
          await cache.getWithOptions(
            'refresh_token',
            options: const CacheOptions(encrypted: true, lifetime: 86400),
          ),
          'rt',
        );
      });
      test('api response cache', () async {
        final apiResp = {
          'status': 'ok',
          'data': [1, 2, 3],
        };
        await cache.putWithOptions(
          'api_1',
          apiResp,
          options: const CacheOptions(
            lru: true,
            lruInCount: 50,
            group: 'api_responses',
          ),
        );
        expect(
          await cache.getWithOptions<Map<String, dynamic>>(
            'api_1',
            options: const CacheOptions(
              lru: true,
              lruInCount: 50,
              group: 'api_responses',
            ),
          ),
          apiResp,
        );
      });
    });
  });
}
