/// Example Tests - Demonstrates the working examples
import 'package:flutter_test/flutter_test.dart';
import 'package:pvcache/pvcache.dart';
import 'package:pvcache/templates/storage/inmemory.dart';
import 'package:pvcache/templates/adapters/expiry.dart';
import 'package:pvcache/templates/helpers/test.dart';

void main() {
  group('Examples Working Tests', () {
    test('Basic Usage Example', () async {
      // Initialize cache with basic storage
      final cache = PVCache(
        env: "example-basic",
        adapters: [], // No adapters for this basic example
        storage: InMemory(),
      );

      // Store some data
      await cache.set("user:123", {"name": "John Doe", "age": 30});
      await cache.set("config:theme", "dark");

      // Retrieve data
      final user = await cache.get("user:123");
      final theme = await cache.get("config:theme");

      expect(user, {"name": "John Doe", "age": 30});
      expect(theme, "dark");

      // Check if key exists
      final exists = await cache.exists("user:123");
      expect(exists, true);

      // Delete a key
      await cache.delete("config:theme");

      // Try to get deleted key (returns null)
      final deletedTheme = await cache.get("config:theme");
      expect(deletedTheme, null);

      // Clear entire cache
      await cache.clear();

      // Verify cache is empty
      final userAfterClear = await cache.get("user:123");
      expect(userAfterClear, null);
    });

    test('Adapter Usage Example', () async {
      // Initialize cache with ExpiryAdapter for TTL functionality
      final cache = PVCache(
        env: "example-adapter",
        adapters: [
          ExpiryAdapter(), // Enables TTL (time-to-live) functionality
          LoggingAdapter(), // Built-in logging adapter
        ],
        storage: InMemory(),
        metaStorage: InMemory(), // Required for ExpiryAdapter metadata
      );

      // Store data with TTL (expires in 2 seconds)
      await cache.set(
        "temp-data",
        "This will expire soon",
        metadata: {"ttl": 2},
      );

      // Immediately retrieve (should work)
      var tempData = await cache.get("temp-data");
      expect(tempData, "This will expire soon");

      // Wait 1 second (should still work)
      await Future.delayed(Duration(seconds: 1));
      tempData = await cache.get("temp-data");
      expect(tempData, "This will expire soon");

      // Wait another 2 seconds (should be expired)
      await Future.delayed(Duration(seconds: 2));
      tempData = await cache.get("temp-data");
      expect(tempData, null); // Should be null due to expiry

      // Store data with custom expiry time
      final futureTime = DateTime.now().add(Duration(seconds: 3));
      await cache.set(
        "scheduled-data",
        "This expires at a specific time",
        metadata: {"expiry": futureTime.toIso8601String()},
      );

      // Retrieve before expiry
      var scheduledData = await cache.get("scheduled-data");
      expect(scheduledData, "This expires at a specific time");
    });

    test('Advanced Patterns Example', () async {
      // First time: Initialize with full configuration
      final userCache = PVCache(
        env: "example-advanced-user",
        adapters: [ExpiryAdapter()],
        storage: InMemory(),
        metaStorage: InMemory(),
      );

      // Subsequent usage: Just reference by environment name
      final sameUserCache = PVCache(env: "example-advanced-user");

      // These are the same instance
      expect(identical(userCache, sameUserCache), true);

      // Different cache environments for different purposes
      final sessionCache = PVCache(
        env: "example-advanced-session",
        adapters: [ExpiryAdapter()],
        storage: InMemory(),
        metaStorage: InMemory(),
      );

      final configCache = PVCache(
        env: "example-advanced-config",
        adapters: [], // No adapters needed for config
        storage: InMemory(),
      );

      // Store different types of data in appropriate caches
      await userCache.set("profile:123", {
        "name": "Alice Smith",
        "email": "alice@example.com",
      });

      await sessionCache.set(
        "auth:token",
        "jwt-token-here",
        metadata: {"ttl": 3600},
      ); // 1 hour TTL

      await configCache.set("app:settings", {
        "theme": "dark",
        "language": "en",
        "notifications": true,
      });

      // Verify data is stored correctly
      final profile = await userCache.get("profile:123");
      final token = await sessionCache.get("auth:token");
      final settings = await configCache.get("app:settings");

      expect(profile, {"name": "Alice Smith", "email": "alice@example.com"});
      expect(token, "jwt-token-here");
      expect(settings, {
        "theme": "dark",
        "language": "en",
        "notifications": true,
      });

      // Demonstrate selective clearing
      await sessionCache.clear(); // Clear only session data

      // Verify other caches are unaffected
      final userProfile = await userCache.get("profile:123");
      final appSettings = await configCache.get("app:settings");
      final clearedToken = await sessionCache.get("auth:token");

      expect(userProfile, isNotNull);
      expect(appSettings, isNotNull);
      expect(clearedToken, null); // This should be cleared
    });
  });
}
