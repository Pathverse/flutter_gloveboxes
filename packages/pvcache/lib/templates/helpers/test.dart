// ignore_for_file: avoid_print

import 'package:pvcache/src/cache.dart';
import 'package:pvcache/src/adapter.dart';
import 'package:pvcache/src/interface.dart';
import 'package:pvcache/templates/adapters/expiry.dart';
import 'package:pvcache/templates/storage/inmemory.dart';

/// Basic cache setup without adapters for simple testing
PVCache simpleMemoryTest() {
  // Try to get existing instance first, if not exists create with full config
  try {
    return PVCache(env: "simple-memory-test");
  } catch (e) {
    // First time - create with full configuration
    return PVCache(
      env: "simple-memory-test",
      adapters: [],
      storage: InMemory(),
    );
  }
}

/// Cache with TTL/expiry functionality for testing time-based eviction
PVCache expiryMemoryTest() {
  // Try to get existing instance first, if not exists create with full config
  try {
    return PVCache(env: "expiry-memory-test");
  } catch (e) {
    // First time - create with full configuration
    return PVCache(
      env: "expiry-memory-test",
      adapters: [ExpiryAdapter()],
      storage: InMemory(),
      metaStorage: InMemory(),
    );
  }
}

/// Example: Basic cache operations
Future<void> exampleBasicOperations() async {
  final cache = simpleMemoryTest();

  // Store a value
  await cache.set('user:123', {'name': 'John', 'age': 30});

  // Retrieve a value
  final user = await cache.get('user:123');
  print('Retrieved user: $user');

  // Check if key exists
  final exists = await cache.exists('user:123');
  print('User exists: $exists');

  // Delete a value
  await cache.delete('user:123');

  // Clear all values
  await cache.clear();
}

/// Example: TTL (Time To Live) usage
Future<void> exampleTTLUsage() async {
  final cache = expiryMemoryTest();

  // Store with TTL in seconds
  await cache.set('session:abc', 'user_data', metadata: {'ttl': 5});

  // Store with TTL as Duration
  await cache.set(
    'temp:data',
    'temporary',
    metadata: {'ttl': Duration(minutes: 10)},
  );

  // Store with explicit expiry time
  await cache.set(
    'event:xyz',
    'event_data',
    metadata: {'expiry': DateTime.now().add(Duration(hours: 2))},
  );

  // Immediate retrieval (should work)
  final session = await cache.get('session:abc');
  print('Session data: $session');

  // Wait for expiry (in real usage, this would happen automatically)
  await Future.delayed(Duration(seconds: 6));

  // Try to retrieve expired data (should return null)
  final expiredSession = await cache.get('session:abc');
  print('Expired session: $expiredSession'); // Should be null
}

/// Example: Metadata usage patterns
Future<void> exampleMetadataUsage() async {
  final cache = expiryMemoryTest();

  // Multiple metadata can be passed (only expiry/ttl will be processed by ExpiryAdapter)
  await cache.set(
    'product:123',
    {'name': 'Widget', 'price': 29.99},
    metadata: {
      'ttl': 3600, // 1 hour
      'category': 'electronics',
      'priority': 'high',
    },
  );

  // Metadata is available throughout the operation pipeline
  await cache.get('product:123', metadata: {'source': 'api', 'version': '2.1'});
}

/// Example: Error handling scenarios
Future<void> exampleErrorHandling() async {
  try {
    // This will fail - ExpiryAdapter requires metadata storage
    PVCache(
      env: "no-metadata-test",
      adapters: [ExpiryAdapter()],
      storage: InMemory(),
      // metaStorage: missing!
    );
  } catch (e) {
    print('Expected error: $e');
  }

  try {
    final cache = expiryMemoryTest();

    // This will fail - cannot specify both ttl and expiry
    await cache.set(
      'invalid',
      'data',
      metadata: {'ttl': 300, 'expiry': DateTime.now().add(Duration(hours: 1))},
    );
  } catch (e) {
    print('Expected validation error: $e');
  }

  try {
    final cache = expiryMemoryTest();

    // This will fail - expiry time must be in the future
    await cache.set(
      'past',
      'data',
      metadata: {'expiry': DateTime.now().subtract(Duration(hours: 1))},
    );
  } catch (e) {
    print('Expected past time error: $e');
  }
}

/// Example: Custom adapter creation pattern
class LoggingAdapter extends PVAdapter with PreOp {
  LoggingAdapter._internal() : super('LoggingAdapter');

  factory LoggingAdapter() {
    final instance = PVAdapter.getInstance('LoggingAdapter');
    if (instance != null && instance is LoggingAdapter) {
      return instance;
    }
    return LoggingAdapter._internal();
  }

  @override
  int get preOpPriority => 10; // Lower priority than expiry

  @override
  int get preGetPriority => 10;

  @override
  int get preSetPriority => 10;

  @override
  int get preDeletePriority => 10;

  @override
  int get preClearPriority => 10;

  @override
  int get preExistsPriority => 10;

  @override
  Future<void> preOp(PVCtx ctx) async {
    print('LOG: Starting operation for key: ${ctx.key}');
  }
}

/// Example: Multiple adapters working together
Future<void> exampleMultipleAdapters() async {
  final cache = PVCache(
    env: "multi-adapter-test",
    adapters: [
      ExpiryAdapter(), // Priority 0 - runs first
      LoggingAdapter(), // Priority 10 - runs after expiry
    ],
    storage: InMemory(),
    metaStorage: InMemory(),
  );

  // This will trigger both expiry processing and logging
  await cache.set('logged:data', 'value', metadata: {'ttl': 60});

  // This will check expiry and log the retrieval
  final value = await cache.get('logged:data');
  print('Retrieved with logging: $value');
}

/// Run all examples
Future<void> runAllExamples() async {
  print('=== Basic Operations ===');
  await exampleBasicOperations();

  print('\n=== TTL Usage ===');
  await exampleTTLUsage();

  print('\n=== Metadata Usage ===');
  await exampleMetadataUsage();

  print('\n=== Error Handling ===');
  await exampleErrorHandling();

  print('\n=== Multiple Adapters ===');
  await exampleMultipleAdapters();

  print('\n=== All examples completed ===');
}

/// Simple test runner
void main() async {
  await runAllExamples();
}
