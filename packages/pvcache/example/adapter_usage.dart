/// Adapter Creation and Usage Example
///
/// This example demonstrates:
/// - How to create custom adapters
/// - How to use built-in adapters like ExpiryAdapter
/// - How adapters integrate with cache operations

// ignore_for_file: avoid_print

import 'package:pvcache/pvcache.dart';
import 'package:pvcache/templates/storage/inmemory.dart';
import 'package:pvcache/templates/adapters/expiry.dart';
import 'package:pvcache/templates/helpers/test.dart';

void main() async {
  // Initialize cache with ExpiryAdapter for TTL functionality
  final cache = PVCache(
    env: "adapter-example",
    adapters: [
      ExpiryAdapter(), // Enables TTL (time-to-live) functionality
      LoggingAdapter(), // Built-in logging adapter
    ],
    storage: InMemory(),
    metaStorage: InMemory(), // Required for ExpiryAdapter metadata
  );

  print("=== Adapter Example: TTL Functionality ===");

  // Store data with TTL (expires in 2 seconds)
  await cache.set("temp-data", "This will expire soon", metadata: {"ttl": 2});
  print("Stored temp data with 2-second TTL");

  // Immediately retrieve (should work)
  var tempData = await cache.get("temp-data");
  print("Retrieved immediately: $tempData");

  // Wait 1 second (should still work)
  await Future.delayed(Duration(seconds: 1));
  tempData = await cache.get("temp-data");
  print("Retrieved after 1 second: $tempData");

  // Wait another 2 seconds (should be expired)
  await Future.delayed(Duration(seconds: 2));
  tempData = await cache.get("temp-data");
  print("Retrieved after expiry: $tempData"); // Should be null

  print("\n=== Adapter Example: Metadata Usage ===");

  // Store data with custom expiry time
  final futureTime = DateTime.now().add(Duration(seconds: 3));
  await cache.set(
    "scheduled-data",
    "This expires at a specific time",
    metadata: {"expiry": futureTime.toIso8601String()},
  );

  print(
    "Stored data with specific expiry time: ${futureTime.toIso8601String()}",
  );

  // Retrieve before expiry
  var scheduledData = await cache.get("scheduled-data");
  print("Retrieved before expiry: $scheduledData");

  print("\n=== Adapter Example: Error Handling ===");

  try {
    // This will fail - cannot specify both ttl and expiry
    await cache.set(
      "invalid-data",
      "This will fail",
      metadata: {"ttl": 10, "expiry": DateTime.now().toIso8601String()},
    );
  } catch (e) {
    print("Expected error caught: $e");
  }

  print("\nAdapter example completed!");
}
