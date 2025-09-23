import 'package:pvcache/src/callframe.dart';
import 'package:pvcache/src/interface.dart';

/// Main cache implementation with pre-compiled execution frames.
///
/// PVCache builds call frames at initialization for maximum performance.
/// Each cache operation (get, set, delete, exists, clear) has its own
/// pre-compiled execution pipeline that includes all adapter logic.
class PVCache extends PVBaseCache {
  static final Map<String, PVCache> _instances = {};

  // Pre-compiled execution frames for each operation
  late final PVCFrame _getFrame;
  late final PVCFrame _setFrame;
  late final PVCFrame _deleteFrame;
  late final PVCFrame _existsFrame;
  late final PVCFrame _clearFrame;

  bool _initialized = false;

  PVCache._internal({
    required super.env,
    required super.adapters,
    required super.storage,
    super.metaStorage,
  }) {
    // Build all execution frames at initialization for performance
    final frames = PVCFrame.buildFromCache(storage, adapters);
    _getFrame = frames['get']!;
    _setFrame = frames['set']!;
    _deleteFrame = frames['delete']!;
    _existsFrame = frames['exists']!;
    _clearFrame = frames['clear']!;

    // Initialize all adapters
    for (var adapter in adapters) {
      adapter.init(this);
    }
  }

  /// Creates or retrieves a cache instance for the given environment.
  ///
  /// **First time usage** - Initialize with all parameters:
  /// ```dart
  /// final cache = PVCache(
  ///   env: 'myapp',
  ///   adapters: [ExpiryAdapter()],
  ///   storage: InMemory(),
  ///   metaStorage: InMemory(),
  /// );
  /// ```
  ///
  /// **Subsequent usage** - Retrieve existing instance with just env name:
  /// ```dart
  /// final cache = PVCache(env: 'myapp'); // Gets existing instance
  /// ```
  ///
  /// Uses singleton pattern - only one cache per environment name.
  /// If a cache with the same [env] already exists and you provide
  /// configuration parameters, an exception will be thrown.
  ///
  /// [env] - Environment name (e.g., 'default', 'dev', 'prod')
  /// [adapters] - List of adapters to extend functionality (first time only)
  /// [storage] - Main storage backend (first time only)
  /// [metaStorage] - Optional separate storage for metadata (first time only)
  factory PVCache({
    String env = 'default',
    List<PVBaseAdapter>? adapters,
    PVBaseStorage? storage,
    MetadataStorage? metaStorage,
  }) {
    if (_instances.containsKey(env)) {
      if (adapters != null || storage != null || metaStorage != null) {
        throw Exception('Cache with env $env already exists.');
      }

      return _instances[env]!;
    } else {
      final instance = PVCache._internal(
        env: env,
        adapters: adapters!,
        storage: storage!,
        metaStorage: metaStorage,
      );
      _instances[env] = instance;
      return instance;
    }
  }

  /// Ensures storage backends are initialized before first use.
  Future<void> _ensureInit() async {
    if (!_initialized) {
      await storage.init(this);
      if (metaStorage != null) {
        await metaStorage!.init(this);
      }
      _initialized = true;
    }
  }

  @override
  Future<void> set(
    String key,
    value, {
    Map<String, dynamic> metadata = const {},
  }) async {
    await _ensureInit();

    final ctx = PVCtx.fromCache(
      this,
      key,
      initialValue: value,
      metadata: metadata,
    );
    await _setFrame.call(ctx);
  }

  @override
  Future<void> delete(
    String key, {
    Map<String, dynamic> metadata = const {},
  }) async {
    await _ensureInit();

    final ctx = PVCtx.fromCache(this, key, metadata: metadata);
    await _deleteFrame.call(ctx);
  }

  @override
  Future<void> clear({Map<String, dynamic> metadata = const {}}) async {
    await _ensureInit();

    final ctx = PVCtx.fromCache(this, null, metadata: metadata);
    await _clearFrame.call(ctx);
  }

  @override
  Future<dynamic> get(
    String key, {
    Map<String, dynamic> metadata = const {},
  }) async {
    await _ensureInit();

    final ctx = PVCtx.fromCache(this, key, metadata: metadata);
    await _getFrame.call(ctx);
    return ctx.value;
  }

  @override
  Future<bool> exists(
    String key, {
    Map<String, dynamic> metadata = const {},
  }) async {
    await _ensureInit();
    final ctx = PVCtx.fromCache(this, key, metadata: metadata);
    await _existsFrame.call(ctx);
    return ctx.value ?? false;
  }

  Future<dynamic> ifNotCached(
    String key,
    Future<dynamic> Function() compute, {
    Map<String, dynamic> metadata = const {},
  }) async {
    if (await exists(key, metadata: metadata)) {
      return await get(key, metadata: metadata);
    } else {
      final result = await compute();
      await set(key, result, metadata: metadata);
      return result;
    }
  }
}
