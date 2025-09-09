import 'package:pvcacher/src/cacher.dart';
import 'package:pvcacher/src/handle.dart';
import 'package:pvcacher/src/adapter.dart';

class PVCACHER {
  static String defaultNamespace = 'default';
  static final Map<String, String> _aliases = {};

  /// Register an alias for a namespace
  static void alias(String aliasName, String namespace) {
    if (aliasName.contains(':')) {
      throw Exception('Alias name cannot contain colon (:)');
    }
    if (PVCacher.instances.containsKey(aliasName)) {
      throw Exception('Alias "$aliasName" conflicts with existing namespace');
    }
    _aliases[aliasName] = namespace;
  }

  /// Remove an alias
  static void removeAlias(String aliasName) {
    _aliases.remove(aliasName);
  }

  /// Get all registered aliases
  static Map<String, String> get aliases => Map.unmodifiable(_aliases);

  /// Resolve namespace from key (supports namespace:key and alias:key format)
  static (String, String) resolveNamespace(String key) {
    if (!key.contains(':')) {
      return (defaultNamespace, key);
    }
    int colonIndex = key.indexOf(':');
    String namespaceOrAlias = key.substring(0, colonIndex);
    String subKey = key.substring(colonIndex + 1);

    // Check if it's an alias first
    if (_aliases.containsKey(namespaceOrAlias)) {
      return (_aliases[namespaceOrAlias]!, subKey);
    }

    // Check if it's a direct namespace
    if (PVCacher.instances.containsKey(namespaceOrAlias)) {
      return (namespaceOrAlias, subKey);
    }

    // Neither alias nor namespace exists
    throw Exception(
      'Unknown namespace or alias "$namespaceOrAlias". Use PVCACHER.register() or PVCACHER.alias() first.',
    );
  }

  /// Register a cache configuration for a namespace
  static void register(
    String namespace, {
    required PVCacheHandle handle,
    List<PVCacheAdapter>? adapters,
    bool isDefault = false,
  }) {
    // Check for conflicts with aliases
    if (_aliases.containsKey(namespace)) {
      throw Exception(
        'Cannot register namespace "$namespace" - it conflicts with existing alias',
      );
    }

    // Create the cache (PVCacher handles singleton management internally)
    PVCacher(namespace: namespace, handle: handle, adapters: adapters);

    if (isDefault) {
      defaultNamespace = namespace;
    }
  }

  /// Get cache instance for namespace
  static PVCacher _getCache(String namespace) {
    final cache = PVCacher.instances[namespace];
    if (cache == null) {
      throw Exception(
        'Cache for namespace "$namespace" not registered. Use PVCACHER.register() first.',
      );
    }
    return cache;
  }

  /// Set a value in cache
  static Future<void> set(
    String key,
    dynamic value, {
    Map<String, dynamic>? options,
  }) async {
    var (namespace, subKey) = resolveNamespace(key);
    var cache = _getCache(namespace);
    await cache.set(subKey, value, options: options);
  }

  /// Get a value from cache
  static Future<dynamic> get(
    String key, {
    Map<String, dynamic>? options,
  }) async {
    var (namespace, subKey) = resolveNamespace(key);
    var cache = _getCache(namespace);
    return await cache.get(subKey, options: options);
  }

  /// Remove a value from cache
  static Future<void> remove(
    String key, {
    Map<String, dynamic>? options,
  }) async {
    var (namespace, subKey) = resolveNamespace(key);
    var cache = _getCache(namespace);
    await cache.remove(subKey, options: options);
  }

  /// Clear cache (or specific pattern)
  static Future<void> clear(String key, {Map<String, dynamic>? options}) async {
    var (namespace, subKey) = resolveNamespace(key);
    var cache = _getCache(namespace);
    await cache.clear(options: options);
  }

  /// Check if key exists in cache
  static Future<bool> has(String key, {Map<String, dynamic>? options}) async {
    var (namespace, subKey) = resolveNamespace(key);
    var cache = _getCache(namespace);
    return await cache.has(subKey, options: options);
  }

  /// Cache-or-compute pattern
  static Future<dynamic> ifNotCached(
    String key,
    Future<dynamic> Function() action, {
    Map<String, dynamic>? options,
  }) async {
    var (namespace, subKey) = resolveNamespace(key);
    var cache = _getCache(namespace);

    // Check if exists
    final exists = await cache.has(subKey, options: options);

    if (exists) {
      // Return cached value if found
      return await cache.get(subKey, options: options);
    } else {
      // If not found, compute and cache
      final result = await action();
      await cache.set(subKey, result, options: options);
      return result;
    }
  }

  /// Get list of registered namespaces
  static List<String> getRegisteredNamespaces() {
    return PVCacher.registeredNamespaces();
  }

  /// Clear all registered caches
  static void clearRegistrations() {
    // Note: PVCacher doesn't expose a way to clear instances
    // This would need to be implemented in PVCacher if needed
    throw UnimplementedError(
      'Clearing registrations not supported. PVCacher manages instances internally.',
    );
  }

  /// Initialize all registered caches
  static Future<void> initAll() async {
    await PVCacher.iterAllCachers((cacher) => cacher.init());
  }
}
