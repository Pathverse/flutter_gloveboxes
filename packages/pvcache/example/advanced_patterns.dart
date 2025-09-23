/// Advanced Cache Patterns Example
///
/// This example demonstrates:
/// - Cache environment management and reuse
/// - Multiple cache instances
/// - Advanced metadata usage
/// - Real-world usage patterns

import 'package:pvcache/pvcache.dart';
import 'package:pvcache/templates/storage/inmemory.dart';
import 'package:pvcache/templates/adapters/expiry.dart';

void main() async {
  print("=== Advanced Pattern: Environment Management ===");

  // First time: Initialize with full configuration
  final userCache = PVCache(
    env: "user-data",
    adapters: [ExpiryAdapter()],
    storage: InMemory(),
    metaStorage: InMemory(),
  );

  // Subsequent usage: Just reference by environment name
  final sameUserCache = PVCache(env: "user-data");

  // These are the same instance
  print("Same cache instance: ${identical(userCache, sameUserCache)}");

  print("\n=== Advanced Pattern: Multiple Cache Environments ===");

  // Different cache environments for different purposes
  final sessionCache = PVCache(
    env: "session-data",
    adapters: [ExpiryAdapter()],
    storage: InMemory(),
    metaStorage: InMemory(),
  );

  final configCache = PVCache(
    env: "config-data",
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

  print("User data stored in user cache");
  print("Session data stored with 1 hour TTL");
  print("Config data stored in config cache");

  print("\n=== Advanced Pattern: Complex Metadata ===");

  // Store data with complex metadata for advanced expiry patterns
  final now = DateTime.now();

  // Cache data that expires at end of business day
  final endOfDay = DateTime(now.year, now.month, now.day, 17, 0); // 5 PM
  if (endOfDay.isAfter(now)) {
    await userCache.set(
      "daily:report",
      "Today's report data",
      metadata: {"expiry": endOfDay.toIso8601String()},
    );
    print("Daily report cached until end of business day");
  }

  // Cache with different TTL based on data type
  await userCache.set(
    "quick:lookup",
    "Fast access data",
    metadata: {"ttl": 300},
  ); // 5 minutes

  await userCache.set(
    "detailed:analysis",
    "Heavy computation result",
    metadata: {"ttl": 7200},
  ); // 2 hours

  print("\n=== Advanced Pattern: Error Handling and Validation ===");

  // Demonstrate proper error handling
  try {
    // This will work fine
    await userCache.set("valid:data", "Good data", metadata: {"ttl": 60});
    print("Valid data stored successfully");

    // This will fail - expiry time in the past
    final pastTime = DateTime.now().subtract(Duration(hours: 1));
    await userCache.set(
      "invalid:data",
      "Bad data",
      metadata: {"expiry": pastTime.toIso8601String()},
    );
  } catch (e) {
    print("Caught expected error: $e");
  }

  print("\n=== Advanced Pattern: Cache Cleanup and Management ===");

  // Get all cache instances
  print("Active cache environments:");
  print("- user-data cache: ${userCache.env}");
  print("- session-data cache: ${sessionCache.env}");
  print("- config-data cache: ${configCache.env}");

  // Demonstrate selective clearing
  await sessionCache.clear(); // Clear only session data
  print("Session cache cleared");

  // Verify other caches are unaffected
  final userProfile = await userCache.get("profile:123");
  final appSettings = await configCache.get("app:settings");

  print("User profile still exists: ${userProfile != null}");
  print("App settings still exist: ${appSettings != null}");

  print("\nAdvanced patterns example completed!");
}
