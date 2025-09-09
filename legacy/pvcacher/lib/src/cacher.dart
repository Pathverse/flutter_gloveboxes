import 'package:pvcacher/src/adapter.dart';
import 'package:pvcacher/src/ctx.dart';
import 'package:pvcacher/src/handle.dart';

/// Main caching engine that manages cache operations with adapter pattern support.
///
/// PVCacher provides a comprehensive caching system with:
/// - Namespace-based cache isolation
/// - Adapter pattern for extensibility
/// - Lifecycle hooks for operations
/// - Singleton pattern per namespace
class PVCacher {
  static final Map<String, PVCacher> _instances = {};

  /// Returns an unmodifiable view of all registered PVCacher instances.
  ///
  /// This allows inspection of all active caching namespaces without
  /// allowing external modification of the instances map.
  static Map<String, PVCacher> get instances => Map.unmodifiable(_instances);

  /// Executes an action on all registered PVCacher instances.
  ///
  /// Useful for operations like cleanup, statistics gathering, or
  /// applying configuration changes across all caches.
  ///
  /// [action] - Function to execute on each cacher instance
  static Future<void> iterAllCachers(
    Future<void> Function(PVCacher cacher) action,
  ) async {
    for (final cacher in _instances.values) {
      await action(cacher);
    }
  }

  /// Returns a list of all registered namespace identifiers.
  ///
  /// This provides visibility into which namespaces are currently
  /// active in the caching system.
  static List<String> registeredNamespaces() {
    return _instances.keys.toList();
  }

  /// Unique identifier for this cache instance
  final String namespace;

  /// Storage handler responsible for actual data persistence
  final PVCacheHandle handle;

  /// List of adapters that provide additional functionality
  final List<PVCacheAdapter> adapters;

  /// Internal flag tracking initialization state
  bool _ready = false;

  /// Returns true if the cache has been initialized and is ready for operations.
  ///
  /// Cache operations will fail if called before initialization is complete.
  bool get isReady => _ready;

  /// Initializes the cache instance and its handler.
  ///
  /// Must be called before performing any cache operations. This method
  /// is idempotent - calling it multiple times has no additional effect.
  ///
  /// Throws if the handler initialization fails.
  Future<void> init() async {
    if (_ready) {
      return;
    }

    _ready = true;
    await handle.init(_createCtx("init", null, null));
  }

  /// Internal constructor used by the factory to create instances.
  ///
  /// Performs basic validation and calls the handler's onConstruct hook.
  /// Should not be called directly - use the factory constructor instead.
  PVCacher._internal({
    required this.namespace,
    required this.handle,
    required this.adapters,
  }) {
    handle.onConstruct(_createCtx("onConstruct", null, null));
  }

  /// Factory constructor that ensures singleton pattern per namespace.
  ///
  /// Returns existing instance if namespace is already registered,
  /// otherwise creates a new instance. This prevents accidental
  /// duplicate caches for the same namespace.
  ///
  /// [namespace] - Unique identifier for this cache instance
  /// [handle] - Storage handler (required for new instances)
  /// [adapters] - Optional list of adapters for extended functionality
  ///
  /// Throws [Exception] if trying to provide handle/adapters for existing namespace
  /// Throws [ArgumentError] if handle is null for new namespace
  factory PVCacher({
    required String namespace,
    PVCacheHandle? handle,
    List<PVCacheAdapter>? adapters,
  }) {
    if (_instances.containsKey(namespace)) {
      if (handle != null || adapters != null) {
        throw Exception(
          'PVCacher for namespace "$namespace" is already registered. Cannot provide new handle or adapters.',
        );
      }

      return _instances[namespace]!;
    }

    adapters ??= const [];

    if (handle == null) {
      throw ArgumentError("Handle must not be null");
    }

    return _instances.putIfAbsent(namespace, () {
      return PVCacher._internal(
        namespace: namespace,
        handle: handle,
        adapters: adapters ?? const [],
      );
    });
  }

  /// Creates a context object for cache operations.
  ///
  /// Context objects carry all necessary information for cache operations
  /// including metadata, options, and references to the handler and cacher.
  ///
  /// [callingFunc] - Name of the calling function (get, set, etc.)
  /// [key] - Cache key for the operation (null for operations like clear)
  /// [value] - Value for the operation (null for read operations)
  /// [options] - Optional parameters and metadata
  PVCacheCtx _createCtx(
    String callingFunc,
    String? key,
    dynamic value, {
    Map<String, dynamic>? options,
  }) {
    return PVCacheCtx(
      callingFunc: callingFunc,
      options: options ?? {},
      key: key,
      value: value,
      handle: handle,
      cacher: this,
    );
  }

  /// Processes adapter options before operations.
  ///
  /// Allows adapters to modify or validate options before the main
  /// operation executes. Only adapters with [PVOnOptions] mixin
  /// will have their onOptions method called.
  ///
  /// [ctx] - Context containing operation details and options
  Future<void> _handleOptions(PVCacheCtx ctx) async {
    if (adapters.isEmpty) {
      return;
    }
    for (final adapter in adapters) {
      if (adapter.hasOnOptions) {
        await (adapter as PVOnOptions).onOptions(ctx);
      }
    }
  }

  /// Orchestrates the complete lifecycle of a cache operation.
  ///
  /// This is the core method that manages the execution order of:
  /// 1. Handler before/after hooks (beforeAnything, afterAnything)
  /// 2. Operation-specific before/after methods (beforeGet, afterGet, etc.)
  /// 3. Adapter pre/post operation hooks (preGet, postGet, etc.)
  /// 4. Handler operation hooks (preHandlerOperation, postHandlerOperation)
  /// 5. The actual storage operation
  ///
  /// Handler operation hooks run after beforeAnything but before the operation,
  /// making them ideal for operations that need access to loaded metadata.
  ///
  /// [ctx] - Context containing operation details
  /// [beforeOperation] - Handler's before method (beforeGet, beforeSet, etc.)
  /// [afterOperation] - Handler's after method (afterGet, afterSet, etc.)
  /// [operation] - The actual storage operation (get, set, etc.)
  /// [hasPreOp] - Function to check if adapter has pre-operation hook
  /// [preOp] - Function to execute adapter's pre-operation hook
  /// [hasPostOp] - Function to check if adapter has post-operation hook
  /// [postOp] - Function to execute adapter's post-operation hook
  Future<void> _handlePrePostOperation(
    PVCacheCtx ctx,
    Future<dynamic> Function(PVCacheCtx ctx) beforeOperation,
    Future<dynamic> Function(PVCacheCtx ctx) afterOperation,
    Future<dynamic> Function(PVCacheCtx ctx) operation,
    bool Function(PVCacheAdapter adapter) hasPreOp,
    Future<void> Function(PVCacheCtx ctx, PVCacheAdapter adapter) preOp,
    bool Function(PVCacheAdapter adapter) hasPostOp,
    Future<void> Function(PVCacheCtx ctx, PVCacheAdapter adapter) postOp,
  ) async {
    if (handle.beforeAnythingOuter) {
      await ctx.handle.beforeAnything(ctx);
    }
    await beforeOperation(ctx);
    for (final adapter in adapters) {
      if (hasPreOp(adapter)) {
        await preOp(ctx, adapter);
      }
    }

    if (!handle.beforeAnythingOuter) {
      await ctx.handle.beforeAnything(ctx);
    }

    // Pre-handler operation hooks - run after beforeAnything but before operation
    for (final adapter in adapters) {
      if (adapter.hasPreHandlerOperation) {
        await (adapter as PVPreHandlerOperation).preHandlerOperation(ctx);
      }
    }

    if (ctx.flags.abort) {
      return ctx.result;
    }
    final operationResult = await operation(ctx);
    // For operations that return values, always set ctx.result (even if null)
    // For operations that return void, only set if operation returned non-null
    if (operationResult != null || ctx.callingFunc == "get") {
      ctx.result = operationResult;
    }

    // Post-handler operation hooks - run after operation but before afterAnything
    for (final adapter in adapters) {
      if (adapter.hasPostHandlerOperation) {
        await (adapter as PVPostHandlerOperation).postHandlerOperation(ctx);
      }
    }

    if (!handle.afterAnythingOuter) {
      await ctx.handle.afterAnything(ctx);
    }

    await afterOperation(ctx);
    for (final adapter in adapters) {
      if (hasPostOp(adapter)) {
        await postOp(ctx, adapter);
      }
    }

    if (handle.afterAnythingOuter) {
      await ctx.handle.afterAnything(ctx);
    }
  }

  /// Stores a value in the cache with optional metadata.
  ///
  /// The set operation follows this lifecycle:
  /// 1. Process adapter options
  /// 2. Execute beforeSet hooks and adapters
  /// 3. Execute preHandlerOperation adapter hooks
  /// 4. Perform the actual storage operation
  /// 5. Execute postHandlerOperation adapter hooks
  /// 6. Execute afterSet hooks and adapters
  ///
  /// [key] - Unique identifier for the cached value
  /// [value] - Data to store (can be any serializable type)
  /// [options] - Optional metadata and configuration parameters
  Future<void> set(
    String key,
    dynamic value, {
    Map<String, dynamic>? options,
  }) async {
    final ctx = _createCtx("set", key, value, options: options);
    await _handleOptions(ctx);
    await _handlePrePostOperation(
      ctx,
      (ctx) async {
        await handle.beforeSet(ctx);
      },
      (ctx) async {
        await handle.afterSet(ctx);
      },
      (ctx) async {
        await handle.set(ctx);
      },
      (adapter) => adapter.hasPreset,
      (ctx, adapter) => (adapter as PVPreset).preSet(ctx),
      (adapter) => adapter.hasPostset,
      (ctx, adapter) => (adapter as PVPostSet).postSet(ctx),
    );
  }

  /// Retrieves a value from the cache.
  ///
  /// The get operation follows this lifecycle:
  /// 1. Process adapter options
  /// 2. Execute beforeGet hooks and adapters
  /// 3. Execute preHandlerOperation adapter hooks (ideal for expiry checks)
  /// 4. Perform the actual retrieval operation
  /// 5. Execute postHandlerOperation adapter hooks
  /// 6. Execute afterGet hooks and adapters
  ///
  /// Returns null if the key doesn't exist or if an adapter aborts the operation
  /// (e.g., expired item removal).
  ///
  /// [key] - Unique identifier for the cached value
  /// [options] - Optional parameters for retrieval behavior
  Future<dynamic> get(String key, {Map<String, dynamic>? options}) async {
    final ctx = _createCtx("get", key, null, options: options);
    await _handleOptions(ctx);
    await _handlePrePostOperation(
      ctx,
      (ctx) async {
        await handle.beforeGet(ctx);
      },
      (ctx) async {
        await handle.afterGet(ctx);
      },
      (ctx) async {
        return await handle.get(ctx);
      },
      (adapter) => adapter.hasPreGet,
      (ctx, adapter) => (adapter as PVPreGet).preGet(ctx),
      (adapter) => adapter.hasPostGet,
      (ctx, adapter) => (adapter as PVPostGet).postGet(ctx),
    );
    return ctx.result;
  }

  /// Removes a specific key from the cache.
  ///
  /// The remove operation follows the standard lifecycle:
  /// 1. Process adapter options
  /// 2. Execute beforeRemove hooks and adapters
  /// 3. Execute preHandlerOperation adapter hooks
  /// 4. Perform the actual removal operation
  /// 5. Execute postHandlerOperation adapter hooks
  /// 6. Execute afterRemove hooks and adapters
  ///
  /// [key] - Unique identifier for the value to remove
  /// [options] - Optional parameters for removal behavior
  Future<void> remove(String key, {Map<String, dynamic>? options}) async {
    final ctx = _createCtx("remove", key, null, options: options);
    await _handleOptions(ctx);
    await _handlePrePostOperation(
      ctx,
      (ctx) async {
        await handle.beforeRemove(ctx);
      },
      (ctx) async {
        await handle.afterRemove(ctx);
      },
      (ctx) async {
        await handle.remove(ctx);
      },
      (adapter) => adapter.hasPreRemove,
      (ctx, adapter) => (adapter as PVPreRemove).preRemove(ctx),
      (adapter) => adapter.hasPostRemove,
      (ctx, adapter) => (adapter as PVPostRemove).postRemove(ctx),
    );
  }

  /// Removes all entries from the cache.
  ///
  /// The clear operation follows the standard lifecycle:
  /// 1. Process adapter options
  /// 2. Execute beforeClear hooks and adapters
  /// 3. Execute preHandlerOperation adapter hooks
  /// 4. Perform the actual clear operation
  /// 5. Execute postHandlerOperation adapter hooks
  /// 6. Execute afterClear hooks and adapters
  ///
  /// This is a destructive operation that cannot be undone.
  ///
  /// [options] - Optional parameters for clear behavior
  Future<void> clear({Map<String, dynamic>? options}) async {
    final ctx = _createCtx("clear", null, null, options: options);
    await _handleOptions(ctx);
    await _handlePrePostOperation(
      ctx,
      (ctx) async {
        await handle.beforeClear(ctx);
      },
      (ctx) async {
        await handle.afterClear(ctx);
      },
      (ctx) async {
        await handle.clear(ctx);
      },
      (adapter) => adapter.hasPreClear,
      (ctx, adapter) => (adapter as PVPreClear).preClear(ctx),
      (adapter) => adapter.hasPostClear,
      (ctx, adapter) => (adapter as PVPostClear).postClear(ctx),
    );
  }

  /// Checks if a specific key exists in the cache.
  ///
  /// The has operation follows the standard lifecycle:
  /// 1. Process adapter options
  /// 2. Execute beforeHas hooks and adapters
  /// 3. Execute preHandlerOperation adapter hooks
  /// 4. Perform the actual existence check
  /// 5. Execute postHandlerOperation adapter hooks
  /// 6. Execute afterHas hooks and adapters
  ///
  /// Returns true if the key exists, false otherwise.
  /// Adapters may modify this behavior (e.g., returning false for expired items).
  ///
  /// [key] - Unique identifier to check for existence
  /// [options] - Optional parameters for existence check behavior
  Future<bool> has(String key, {Map<String, dynamic>? options}) async {
    final ctx = _createCtx("has", key, null, options: options);
    await _handleOptions(ctx);
    await _handlePrePostOperation(
      ctx,
      (ctx) async {
        await handle.beforeHas(ctx);
      },
      (ctx) async {
        await handle.afterHas(ctx);
      },
      (ctx) async {
        await handle.has(ctx);
      },
      (adapter) => adapter.hasPreHas,
      (ctx, adapter) => (adapter as PVPreHas).preHas(ctx),
      (adapter) => adapter.hasPostHas,
      (ctx, adapter) => (adapter as PVPostHas).postHas(ctx),
    );
    return ctx.result;
  }
}
