# PVCache

A high-performance, extensible caching library for Dart and Flutter using pre-compiled call frames and adapters.

## Quick Start

```dart
import 'package:pvcache/pvcache.dart';
import 'package:pvcache/templates/storage/inmemory.dart';
import 'package:pvcache/templates/adapters/expiry.dart';

// Basic cache
final cache = PVCache(
  env: "my-cache",
  adapters: [ExpiryAdapter()],
  storage: InMemory(),
  metaStorage: InMemory(),
);

// Store with TTL
await cache.set("key", "value", metadata: {"ttl": 300});
final result = await cache.get("key"); // "value"

// Expires automatically
await Future.delayed(Duration(seconds: 301));
final expired = await cache.get("key"); // null
```

## Core Concepts

### 1. Extensible Interface

The system is built around mixins that let you hook into operation phases:

```dart
// Storage backends implement PVBaseStorage
class MyStorage extends PVBaseStorage with MetadataStorage {
  @override
  Future<void> get(PVCtx ctx) async {
    ctx.value = await myDatabase.get(ctx.key!);
  }
  
  @override
  Future<void> set(PVCtx ctx) async {
    await myDatabase.set(ctx.key!, ctx.value);
  }
  // ... delete, clear, exists
}

// Adapters extend functionality through mixins
class MyAdapter extends PVBaseAdapter with PreGet, PostSet {
  @override
  Future<void> preGet(PVCtx ctx) async {
    // Called before storage.get()
  }
  
  @override
  Future<void> postSet(PVCtx ctx) async {
    // Called after storage.set()
  }
}
```

**Available Mixins:**
- **Operation Hooks**: `PreGet`, `PostGet`, `PreSet`, `PostSet`, `PreDelete`, `PostDelete`, etc.
- **Unified Hooks**: `PreOp` (all pre-operations), `PostOp` (all post-operations) 
- **Metadata Processing**: `OnMetadata`, `ScopedMetadataKeys`
- **Error Handling**: `OnError`, `OnFinally`

### 2. Pre-compiled Call Frame Flow

PVCache builds execution stacks at startup to eliminate runtime overhead:

```
Cache Creation:
1. Analyze adapters → build operation mappings
2. Sort by priority → create execution order
3. Compile call frames → pre-built stacks for each operation

Runtime Execution:
Metadata Processing → Pre-Operation Hooks → Storage Operation → Post-Operation Hooks
```

**Call Frame Structure:**
```dart
// Built once at startup
PVCFrame {
  callstack: [
    metadataProcessor,
    preOpAdapter1,   // priority 0 (highest)
    preOpAdapter2,   // priority 1
    storageOperation, // main function
    postOpAdapter1,  // priority 0
    postOpAdapter2,  // priority 1
  ],
  onError: [errorHandlers...],
  onFinally: [cleanupHandlers...],
}
```

### 3. Adapter System Walkthrough

**How ExpiryAdapter Works:**

```dart
class ExpiryAdapter extends PVBaseAdapter 
    with ScopedMetadataKeys, PreGet, PostSet {
  
  // 1. Scope: Only process operations with TTL/expiry metadata
  @override
  List<String> get metadataKeys => ["ttl", "expiry"];
  
  // 2. PreGet: Check expiration before storage retrieval
  @override
  Future<void> preGet(PVCtx ctx) async {
    final expiry = await ctx.metaStorage!.metaGet(ctx, 'expiry');
    if (expiry != null && DateTime.parse(expiry).isBefore(DateTime.now())) {
      await ctx.metaStorage!.metaDelete(ctx, 'expiry');
      ctx.continueFlow = false; // Skip storage.get() - return null
    }
  }
  
  // 3. PostSet: Store expiration time after successful storage
  @override
  Future<void> postSet(PVCtx ctx) async {
    final expiry = _calculateExpiry(ctx.metadata);
    await ctx.metaStorage!.metaSet(ctx, 'expiry', expiry.toIso8601String());
  }
}
```

**Creating Custom Adapters:**

```dart
// Validation adapter
class ValidationAdapter extends PVBaseAdapter with OnMetadata, PreSet {
  @override
  Future<void> onMetadata(PVCtx ctx) async {
    if (ctx.metadata['validate'] == true) {
      // Process validation rules
    }
  }
  
  @override
  Future<void> preSet(PVCtx ctx) async {
    if (!isValid(ctx.value)) {
      throw ArgumentError('Invalid data');
    }
  }
}

// Logging adapter  
class LoggingAdapter extends PVBaseAdapter with PreOp, PostOp {
  @override
  Future<void> preOp(PVCtx ctx) async {
    print('Operation starting: ${ctx.key}');
  }
  
  @override  
  Future<void> postOp(PVCtx ctx) async {
    print('Operation completed: ${ctx.key}');
  }
}
```

## Installation

```yaml
dependencies:
  pvcache: ^0.0.4
```

## License

MIT License - see [LICENSE](LICENSE) file.
