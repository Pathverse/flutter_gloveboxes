/// Basic PVCache Usage Example
///
/// This example demonstrates the fundamental concepts:
/// - How to initialize a cache
/// - How to store and retrieve data
/// - Basic cache operations

import 'package:pvcache/pvcache.dart';
import 'package:pvcache/templates/storage/inmemory.dart';

void main() async {
  // Initialize cache with basic storage
  final cache = PVCache(
    env: "basic-example",
    adapters: [], // No adapters for this basic example
    storage: InMemory(),
  );

  // Store some data
  await cache.set("user:123", {"name": "John Doe", "age": 30});
  await cache.set("config:theme", "dark");

  // Retrieve data
  final user = await cache.get("user:123");
  final theme = await cache.get("config:theme");

  print("User: $user");
  print("Theme: $theme");

  // Check if key exists
  final exists = await cache.exists("user:123");
  print("User exists: $exists");

  // Delete a key
  await cache.delete("config:theme");

  // Try to get deleted key (returns null)
  final deletedTheme = await cache.get("config:theme");
  print("Deleted theme: $deletedTheme");

  // Clear entire cache
  await cache.clear();

  // Verify cache is empty
  final userAfterClear = await cache.get("user:123");
  print("User after clear: $userAfterClear");
}
