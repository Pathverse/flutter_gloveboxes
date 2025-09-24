/// Base class for all cache implementations.
///
/// This defines the common interface that all cache types must implement.
/// It holds the core components: environment name, adapters for extending
/// functionality, and storage backends for data persistence.
///
/// The cache system uses a pre-compilation approach where operation call stacks
/// are built at startup to eliminate runtime overhead. Adapters extend functionality
/// through mixins that hook into different points of the operation flow.
class PVBaseCache {
  /// The environment name for this cache instance (e.g., 'default', 'dev', 'prod')
  ///
  /// Used for cache instance management and reuse. Multiple calls with the same
  /// environment name will return the same cache instance (singleton pattern).
  final String env;

  /// List of adapters that extend cache functionality (expiry, logging, etc.)
  ///
  /// Adapters are executed in priority order (0=highest priority) and can implement
  /// various mixins like PreGet, PostSet, OnMetadata for operation hooking.
  final List<PVBaseAdapter> adapters;

  /// Main storage backend where cache data is stored
  ///
  /// Must implement PVBaseStorage interface. Can be in-memory, file-based,
  /// database-backed, or any custom storage implementation.
  final PVBaseStorage storage;

  /// Optional separate storage for metadata (can be same as main storage)
  ///
  /// Required by adapters like ExpiryAdapter that need to persist metadata.
  /// Must implement MetadataStorage mixin for standardized metadata operations.
  /// Supports both flattened (key::metakey) and nested (map-based) strategies.
  final MetadataStorage? metaStorage;

  PVBaseCache({
    required this.env,
    required List<PVBaseAdapter> adapters,
    required this.storage,
    this.metaStorage,
  }) : adapters = const <PVBaseAdapter>[] + adapters;

  /// Stores a value in the cache with the given key.
  ///
  /// Operations flow through the pre-compiled call stack:
  /// 1. Metadata processing (onMetadata) - validates and normalizes metadata
  /// 2. Pre-operation hooks (preSet) - executed by priority
  /// 3. Main storage operation
  /// 4. Post-operation hooks (postSet) - executed by priority
  /// 5. Error/finally handlers if needed
  ///
  /// [key] - The unique identifier for the cached value
  /// [value] - The data to store (can be any type)
  /// [metadata] - Optional data passed to adapters for processing (e.g., TTL, expiry)
  ///
  /// Example:
  /// ```dart
  /// await cache.set('user:123', userData, metadata: {'ttl': 300});
  /// ```
  Future<void> set(
    String key,
    dynamic value, {
    Map<String, dynamic> metadata = const {},
  }) {
    throw UnimplementedError();
  }

  /// Removes a value from the cache.
  ///
  /// Executes preDelete hooks, main deletion, then postDelete hooks.
  /// Adapters can prevent deletion by setting ctx.continueFlow = false.
  ///
  /// [key] - The identifier of the value to remove
  /// [metadata] - Optional data passed to adapters for processing
  Future<void> delete(String key, {Map<String, dynamic> metadata = const {}}) {
    throw UnimplementedError();
  }

  /// Removes all values from the cache.
  ///
  /// Executes preClear hooks, clears main storage, then postClear hooks.
  /// Note: key is null in the context for clear operations.
  ///
  /// [metadata] - Optional data passed to adapters for processing
  Future<void> clear({Map<String, dynamic> metadata = const {}}) {
    throw UnimplementedError();
  }

  /// Retrieves a value from the cache.
  ///
  /// The most complex operation with comprehensive adapter integration:
  /// 1. Metadata processing (if metadata provided)
  /// 2. Pre-get hooks (preGet) - can short-circuit by setting ctx.continueFlow = false
  /// 3. Main storage retrieval (if not short-circuited)
  /// 4. Post-get hooks (postGet) - can modify retrieved value
  /// 5. Error/finally handlers if needed
  ///
  /// Pre-get hooks are commonly used for:
  /// - Expiry checking (ExpiryAdapter)
  /// - Cache warming
  /// - Access logging
  ///
  /// [key] - The identifier of the value to retrieve
  /// [metadata] - Optional data passed to adapters for processing
  /// Returns the cached value or null if not found/expired
  ///
  /// Example:
  /// ```dart
  /// final userData = await cache.get('user:123');
  /// ```
  Future<dynamic> get(String key, {Map<String, dynamic> metadata = const {}}) {
    throw UnimplementedError();
  }

  /// Checks if a key exists in the cache.
  ///
  /// Executes preExists hooks, storage exists check, then postExists hooks.
  /// Adapters can override the result by modifying ctx.value (true/false).
  ///
  /// [key] - The identifier to check for
  /// [metadata] - Optional data passed to adapters for processing
  /// Returns true if the key exists and is valid, false otherwise
  ///
  /// Note: For TTL-enabled caches, this may return false for expired keys
  /// even if they physically exist in storage.
  Future<bool> exists(String key, {Map<String, dynamic> metadata = const {}}) {
    throw UnimplementedError();
  }
}

/// Base class for all cache adapters.
///
/// Adapters extend cache functionality by implementing mixins that hook into
/// different points of the cache operation flow. The system uses a singleton
/// pattern where each unique ID (uid) can only have one adapter instance.
///
/// Common adapter patterns:
/// - **ExpiryAdapter**: TTL/expiry functionality using ScopedMetadataKeys + PreGet + PostSet
/// - **LoggingAdapter**: Operation logging using PreOp + PostOp
/// - **ValidationAdapter**: Data validation using OnMetadata + PreSet
/// - **CacheWarmingAdapter**: Proactive loading using PreGet
///
/// Adapter execution follows priority order (0=highest, 1, 2, 3...) within each phase.
class PVBaseAdapter {
  /// Unique identifier for this adapter instance
  ///
  /// Must be unique across all adapters in a cache instance. The constructor
  /// automatically registers the adapter in a static registry to prevent duplicates.
  /// Factory constructors should check getInstance(uid) before creating new instances.
  final String uid;

  PVBaseAdapter(this.uid);

  /// Optional initialization method called when adapter is added to a cache.
  ///
  /// Use this for:
  /// - Validating cache configuration (e.g., ExpiryAdapter requires metaStorage)
  /// - Setting up adapter-specific resources
  /// - Registering event listeners
  ///
  /// Made synchronous to allow proper exception handling during cache creation.
  ///
  /// [cache] - The cache instance this adapter is being added to
  void init(PVBaseCache cache) {
    // Optional initialization logic for the adapter
  }
}

/// Abstract interface for cache storage backends.
///
/// Implementations define how cache data is actually stored and retrieved
/// (in-memory, file system, database, etc.). Storage backends receive PVCtx
/// objects containing the operation data and can modify ctx.value to return results.
///
/// All storage operations work with PVCtx objects that contain:
/// - key: The cache key being operated on
/// - value: The current value being processed
/// - metadata: Additional operation data
/// - storage/metaStorage: Storage backend references
///
/// For metadata-aware storage, implement the MetadataStorage mixin which provides
/// standardized metadata operations (metaGet, metaSet, metaDelete) with support
/// for both flattened and nested storage strategies.
abstract class PVBaseStorage {
  /// Initialize the storage with the given cache instance.
  ///
  /// Called once when the storage is first used with a cache.
  /// Use for setup tasks like creating directories, connecting to databases, etc.
  ///
  /// [cache] - The cache instance using this storage
  Future<void> init(PVBaseCache cache);

  /// Whether this storage has metadata operation hooks.
  ///
  /// Set to true if your storage needs to perform special operations
  /// before/after metadata processing (e.g., transaction management).
  bool get hasMetaHook => false;

  /// Hook called before metadata processing begins.
  ///
  /// Only called if hasMetaHook returns true. Use for setup like
  /// starting transactions or acquiring locks.
  ///
  /// [ctx] - The operation context
  Future<void> beforeMetaOperation(PVCtx ctx) async {}

  /// Hook called after metadata processing completes.
  ///
  /// Only called if hasMetaHook returns true. Use for cleanup like
  /// committing transactions or releasing locks.
  ///
  /// [ctx] - The operation context
  Future<void> afterMetaOperation(PVCtx ctx) async {}

  /// Store a value in the storage backend.
  ///
  /// The value to store is in ctx.value. Implementations should persist
  /// ctx.value using ctx.key as the identifier.
  ///
  /// [ctx] - Contains key, value, and operation metadata
  Future<void> set(PVCtx ctx);

  /// Remove a value from the storage backend.
  ///
  /// Remove the entry identified by ctx.key from storage.
  ///
  /// [ctx] - Contains key and operation metadata
  Future<void> delete(PVCtx ctx);

  /// Remove all values from the storage backend.
  ///
  /// Clear all entries from storage. Note that ctx.key will be null
  /// for clear operations.
  ///
  /// [ctx] - Contains operation metadata (key is null)
  Future<void> clear(PVCtx ctx);

  /// Retrieve a value from the storage backend.
  ///
  /// Look up the value for ctx.key and set ctx.value to the result.
  /// Set ctx.value to null if the key is not found.
  ///
  /// [ctx] - Contains key, operation metadata; set ctx.value with result
  Future<void> get(PVCtx ctx);

  /// Check if a key exists in the storage backend.
  ///
  /// Check if ctx.key exists in storage and set ctx.value to true/false.
  ///
  /// [ctx] - Contains key, operation metadata; set ctx.value to bool result
  Future<void> exists(PVCtx ctx);
}

/// Context object passed through all cache operations.
///
/// Contains the operation data, metadata, storage references, and runtime state.
/// Adapters can read and modify this context as operations flow through the system.
///
/// The context carries state through the entire operation lifecycle:
/// 1. Created with initial operation parameters
/// 2. Passed through metadata processing
/// 3. Flows through pre-operation hooks
/// 4. Used in main storage operation
/// 5. Passed through post-operation hooks
/// 6. Final cleanup in error/finally handlers
///
/// Key properties for adapters:
/// - **value**: Current data being processed (adapters can modify)
/// - **continueFlow**: Set to false to short-circuit operations
/// - **errorHandled**: Set to true to prevent error propagation
/// - **metaStorageCache**: Performance cache for metadata operations
class PVCtx {
  /// The cache key being operated on (null for clear operations)
  final String? key;

  /// function intent
  final String functionIntent;

  /// The initial value passed to the operation.
  ///
  /// Preserved throughout the operation for reference. Use ctx.value
  /// for the current processing value as it may be modified by adapters.
  late final dynamic initialValue;

  /// Metadata passed to the operation for adapter processing.
  ///
  /// Common metadata keys:
  /// - 'ttl': Time-to-live in seconds (ExpiryAdapter)
  /// - 'expiry': Specific expiration DateTime (ExpiryAdapter)
  /// - Custom adapter-specific metadata
  final Map<String, dynamic> metadata;

  /// Main storage backend reference.
  ///
  /// Used by the cache system for primary data operations.
  /// May be null in minimal contexts used for metadata-only operations.
  final PVBaseStorage? storage;

  /// Optional metadata storage backend reference.
  ///
  /// Required by adapters that need to persist metadata (like ExpiryAdapter).
  /// Should implement MetadataStorage mixin for standardized operations.
  final MetadataStorage? metaStorage;

  // Runtime state that changes during operation execution

  /// Current value being processed (adapters can modify this).
  ///
  /// Starts as initialValue but adapters can transform it during processing.
  /// Storage backends should use this value for actual storage operations.
  dynamic value;

  /// Controls whether operation should continue to next step.
  ///
  /// Adapters can set this to false to short-circuit operations:
  /// - In preGet: Skip main storage retrieval
  /// - In preSet: Skip main storage write
  /// - In preDelete: Skip main storage deletion
  /// - etc.
  bool continueFlow = true;

  /// Exception caught during operation (if any).
  ///
  /// Set by the call frame system when exceptions occur.
  /// Error handlers can inspect this to determine response.
  Exception? exception;

  /// Stack trace from caught exception (if any).
  ///
  /// Provides debugging context for error handlers.
  StackTrace? stackTrace;

  /// Flag set by error handlers to indicate the error has been handled.
  ///
  /// When set to true:
  /// - Prevents automatic error rethrowing
  /// - Skips remaining error handlers in the chain
  /// - For main-specific errors: skips general error handlers
  bool errorHandled = false;

  /// Additional data adapters can store for communication.
  ///
  /// Shared storage space for adapters to pass data between operation phases.
  /// Use for coordination between different adapters or operation stages.
  late final Map<String, dynamic> extra;

  /// Per-adapter private data storage to prevent adapter conflicts.
  ///
  /// Each adapter gets isolated storage accessed via getAdapterData().
  /// Prevents adapters from accidentally interfering with each other's data.
  late final Map<String, dynamic> _perAdapterData;

  /// Cache for metadata storage values to avoid redundant fetches.
  ///
  /// CRITICAL: Must be properly initialized to prevent runtime panics.
  /// MetadataStorage mixin operations depend on this cache being available.
  /// When using PVCtx.minimal(), manually inherit: `ctx.metaStorageCache = parent.metaStorageCache`
  late final Map<String, dynamic> metaStorageCache;

  PVCtx({
    this.functionIntent = '',
    this.key,
    required this.initialValue,
    required this.metadata,
    required this.storage,
    this.metaStorage,
  }) : value = initialValue;

  /// Creates a context from a cache instance and operation parameters.
  ///
  /// This is the primary factory for creating contexts in cache operations.
  /// Properly initializes all maps and storage references.
  ///
  /// [cache] - The cache instance performing the operation
  /// [key] - The cache key (null for clear operations)
  /// [initialValue] - Initial value for the operation
  /// [metadata] - Additional data for adapter processing
  factory PVCtx.fromCache(
    String functionIntent,
    PVBaseCache cache,
    String? key, {
    dynamic initialValue,
    Map<String, dynamic> metadata = const {},
  }) {
    final ctx = PVCtx(
      functionIntent: functionIntent,
      key: key,
      initialValue: initialValue,
      metadata: metadata,
      storage: cache.storage,
      metaStorage: cache.metaStorage,
    );
    // Initialize all late final maps to prevent access errors
    ctx.extra = <String, dynamic>{};
    ctx._perAdapterData = <String, dynamic>{};
    ctx.metaStorageCache = <String, dynamic>{};
    return ctx;
  }

  /// Creates a minimal context for lightweight operations.
  ///
  /// WARNING: This factory does NOT initialize metaStorageCache and other maps.
  /// Only use when you don't need storage operations or metadata access.
  ///
  /// If you need to use MetadataStorage operations, you MUST manually inherit
  /// the cache from a parent context:
  /// ```dart
  /// final mini = PVCtx.minimal(key);
  /// mini.metaStorageCache = parentCtx.metaStorageCache;  // CRITICAL!
  /// ```
  ///
  /// [key] - The cache key
  /// [value] - Optional initial value
  factory PVCtx.minimal(String key, {dynamic value}) {
    return PVCtx(
      functionIntent: '',
      key: key,
      initialValue: value,
      metadata: const {},
      storage: null,
      metaStorage: null,
    );
  }

  /// Gets private data storage for a specific adapter.
  ///
  /// Each adapter gets its own isolated data map to prevent
  /// conflicts between adapters that need to store state.
  ///
  /// The data persists throughout the operation lifecycle and can be
  /// used to pass information between different mixin methods of the same adapter.
  ///
  /// [adapter] - The adapter requesting its private storage
  /// Returns a mutable map specific to the adapter's uid
  Map<String, dynamic> getAdapterData(PVBaseAdapter adapter) {
    return _perAdapterData.putIfAbsent(adapter.uid, () => <String, dynamic>{})
        as Map<String, dynamic>;
  }
}

/// Mixin providing standardized metadata storage operations.
///
/// This mixin should be applied to PVBaseStorage implementations that need
/// to handle metadata persistence (required by adapters like ExpiryAdapter).
///
/// Supports two storage strategies:
///
/// **Flattened Strategy** (storageStrategyNested = false):
/// - Metadata stored as separate keys using flattenKeyMethod
/// - Example: key "user:123" with metadata "expiry" → "user:123::expiry"
/// - Simple key-value operations, direct deletion
///
/// **Nested Strategy** (storageStrategyNested = true, default):
/// - Metadata stored as maps within the key's value
/// - Example: key "user:123" → {"expiry": "2025-09-10...", "otherMeta": "value"}
/// - Efficient for multiple metadata per key, automatic cleanup of empty maps
///
/// All operations use the context's metaStorageCache for performance optimization.
mixin MetadataStorage on PVBaseStorage {
  /// Whether to use nested (map-based) or flattened (separate keys) storage.
  ///
  /// - true (default): Store metadata as nested maps, efficient for multiple metadata
  /// - false: Store metadata as flattened keys, simpler for single metadata
  bool get storageStrategyNested => true;

  /// Function to generate flattened keys when using flattened strategy.
  ///
  /// Default implementation: "key::metakey"
  /// Override to customize the key format for your storage backend.
  String Function(String, String) get flattenKeyMethod {
    return (String key, String metaKey) => '$key::$metaKey';
  }

  Future<dynamic> metaGet(
    PVCtx pctx,
    String metaKey, {
    bool force = false,
  }) async {
    if (!force && pctx.metaStorageCache.containsKey(metaKey)) {
      return pctx.metaStorageCache[metaKey];
    }

    if (!storageStrategyNested) {
      final ctx = PVCtx.minimal(flattenKeyMethod(pctx.key!, metaKey));
      await get(ctx);
      if (ctx.value == null) {
        return null;
      }
      pctx.metaStorageCache[metaKey] = ctx.value;
      return ctx.value;
    } else {
      final PVCtx ctx = PVCtx.minimal(pctx.key!);
      await get(ctx);
      if (ctx.value == null) {
        return null;
      }
      if (ctx.value is! Map<String, dynamic>) {
        throw Exception('Expected metadata to be a Map<String, dynamic>');
      }
      pctx.metaStorageCache[ctx.key!] = (ctx.value as Map<String, dynamic>);
      return (ctx.value as Map<String, dynamic>)[metaKey];
    }
  }

  Future<void> metaSet(PVCtx pctx, String metaKey, dynamic metaValue) async {
    if (!storageStrategyNested) {
      final ctx = PVCtx.minimal(
        flattenKeyMethod(pctx.key!, metaKey),
        value: metaValue,
      );
      await set(ctx);
      pctx.metaStorageCache[metaKey] = metaValue;
    } else {
      final PVCtx ctx = PVCtx.minimal(pctx.key!);
      await get(ctx);
      Map<String, dynamic> metaMap;
      if (ctx.value == null) {
        metaMap = <String, dynamic>{};
      } else {
        if (ctx.value is! Map<String, dynamic>) {
          throw Exception('Expected metadata to be a Map<String, dynamic>');
        }
        metaMap = ctx.value as Map<String, dynamic>;
      }
      metaMap[metaKey] = metaValue;
      ctx.value = metaMap;
      await set(ctx);
      pctx.metaStorageCache[metaKey] = metaValue;
    }
  }

  Future<void> metaDelete(PVCtx pctx, String metaKey) async {
    if (!storageStrategyNested) {
      final ctx = PVCtx.minimal(flattenKeyMethod(pctx.key!, metaKey));
      await delete(ctx);
      pctx.metaStorageCache.remove(metaKey);
    } else {
      final PVCtx ctx = PVCtx.minimal(pctx.key!);
      await get(ctx);
      if (ctx.value == null) {
        return;
      }
      if (ctx.value is! Map<String, dynamic>) {
        throw Exception('Expected metadata to be a Map<String, dynamic>');
      }
      final metaMap = ctx.value as Map<String, dynamic>;
      if (metaMap.containsKey(metaKey)) {
        metaMap.remove(metaKey);
        if (metaMap.isEmpty) {
          await delete(ctx);
          pctx.metaStorageCache.clear();
        } else {
          ctx.value = metaMap;
          await set(ctx);
          pctx.metaStorageCache.remove(metaKey);
        }
      }
    }
  }
}
