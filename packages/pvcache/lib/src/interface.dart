/// Base class for all cache implementations.
///
/// This defines the common interface that all cache types must implement.
/// It holds the core components: environment name, adapters for extending
/// functionality, and storage backends for data persistence.
class PVBaseCache {
  /// The environment name for this cache instance (e.g., 'default', 'dev', 'prod')
  final String env;

  /// List of adapters that extend cache functionality (expiry, logging, etc.)
  final List<PVBaseAdapter> adapters;

  /// Main storage backend where cache data is stored
  final PVBaseStorage storage;

  /// Optional separate storage for metadata (can be same as main storage)
  final PVBaseStorage? metaStorage;

  PVBaseCache({
    required this.env,
    required List<PVBaseAdapter> adapters,
    required this.storage,
    this.metaStorage,
  }) : adapters = const <PVBaseAdapter>[] + adapters;

  /// Stores a value in the cache with the given key.
  ///
  /// [key] - The unique identifier for the cached value
  /// [value] - The data to store (can be any type)
  /// [metadata] - Optional data passed to adapters for processing
  Future<void> set(
    String key,
    dynamic value, {
    Map<String, dynamic> metadata = const {},
  }) {
    throw UnimplementedError();
  }

  /// Removes a value from the cache.
  ///
  /// [key] - The identifier of the value to remove
  /// [metadata] - Optional data passed to adapters for processing
  Future<void> delete(String key, {Map<String, dynamic> metadata = const {}}) {
    throw UnimplementedError();
  }

  /// Removes all values from the cache.
  ///
  /// [metadata] - Optional data passed to adapters for processing
  Future<void> clear({Map<String, dynamic> metadata = const {}}) {
    throw UnimplementedError();
  }

  /// Retrieves a value from the cache.
  ///
  /// [key] - The identifier of the value to retrieve
  /// [metadata] - Optional data passed to adapters for processing
  /// Returns the cached value or null if not found
  Future<dynamic> get(String key, {Map<String, dynamic> metadata = const {}}) {
    throw UnimplementedError();
  }

  /// Checks if a key exists in the cache.
  ///
  /// [key] - The identifier to check for
  /// [metadata] - Optional data passed to adapters for processing
  /// Returns true if the key exists, false otherwise
  Future<bool> exists(String key, {Map<String, dynamic> metadata = const {}}) {
    throw UnimplementedError();
  }
}

/// Base class for all cache adapters.
///
/// Adapters extend cache functionality by implementing mixins that hook into
/// different points of the cache operation flow (before/after operations,
/// metadata processing, error handling).
class PVBaseAdapter {
  /// Unique identifier for this adapter instance
  final String uid;

  PVBaseAdapter(this.uid);

  void init(PVBaseCache cache) {
    // Optional initialization logic for the adapter
  }
}

/// Abstract interface for cache storage backends.
///
/// Implementations define how cache data is actually stored and retrieved
/// (in-memory, file system, database, etc.).
abstract class PVBaseStorage {
  /// Initialize the storage with the given cache instance
  Future<void> init(PVBaseCache cache);

  /// Store a value in the storage backend
  Future<void> set(PVCtx ctx);

  /// Remove a value from the storage backend
  Future<void> delete(PVCtx ctx);

  /// Remove all values from the storage backend
  Future<void> clear(PVCtx ctx);

  /// Retrieve a value from the storage backend
  Future<void> get(PVCtx ctx);

  /// Check if a key exists in the storage backend
  Future<void> exists(PVCtx ctx);
}

/// Context object passed through all cache operations.
///
/// Contains the operation data, metadata, storage references, and runtime state.
/// Adapters can read and modify this context as operations flow through the system.
class PVCtx {
  /// The cache key being operated on (null for clear operations)
  final String? key;

  /// The initial value passed to the operation
  final dynamic initalValue;

  /// Metadata passed to the operation for adapter processing
  final Map<String, dynamic> metadata;

  /// Main storage backend reference
  final PVBaseStorage storage;

  /// Optional metadata storage backend reference
  final PVBaseStorage? metaStorage;

  // Runtime state that changes during operation execution

  /// Current value being processed (adapters can modify this)
  dynamic value;

  /// Controls whether operation should continue to next step
  bool continueFlow = true;

  /// Exception caught during operation (if any)
  Exception? exception;

  /// Stack trace from caught exception (if any)
  StackTrace? stackTrace;

  /// Flag set by error handlers to indicate the error has been handled
  /// and should not be rethrown. When set to true during main-specific
  /// error handlers, general error handlers will be skipped.
  bool errorHandled = false;

  /// Additional data adapters can store for communication
  final Map<String, dynamic> extra = {};

  /// Per-adapter private data storage to prevent adapter conflicts
  final Map<String, dynamic> _perAdapterData = {};

  PVCtx({
    this.key,
    required this.initalValue,
    required this.metadata,
    required this.storage,
    this.metaStorage,
  }) : value = initalValue;

  /// Creates a context from a cache instance and operation parameters.
  ///
  /// [cache] - The cache instance performing the operation
  /// [key] - The cache key (null for clear operations)
  /// [initalValue] - Initial value for the operation
  /// [metadata] - Additional data for adapter processing
  factory PVCtx.fromCache(
    PVBaseCache cache,
    String? key, {
    dynamic initalValue,
    Map<String, dynamic> metadata = const {},
  }) {
    return PVCtx(
      key: key,
      initalValue: initalValue,
      metadata: metadata,
      storage: cache.storage,
      metaStorage: cache.metaStorage,
    );
  }

  /// Gets private data storage for a specific adapter.
  ///
  /// Each adapter gets its own isolated data map to prevent
  /// conflicts between adapters that need to store state.
  Map<String, dynamic> getAdapterData(PVBaseAdapter adapter) {
    return _perAdapterData.putIfAbsent(adapter.uid, () => <String, dynamic>{})
        as Map<String, dynamic>;
  }
}
