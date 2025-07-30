/// Advanced Fragment Cache Storage
///
/// This storage type provides hierarchical caching with fragment resolution for complex data structures.
/// It's designed for scenarios where you have large objects that can be broken down into smaller,
/// independently cacheable fragments.
///
/// ## How it works:
///
/// 1. **Fragment Configuration**: Define how your data should be fragmented using `FragmentConfig`
/// 2. **Lazy Loading**: Main data is fetched via callbacks only when not cached
/// 3. **Fragment References**: Large objects store references to fragments instead of full data
/// 4. **Automatic Resolution**: Fragment references are automatically resolved when accessed
/// 5. **Independent Caching**: Each fragment can be cached/expired independently
///
/// ## Usage Example:
///
/// ```dart
/// // Define fragment configurations
/// final fragmentConfigs = [
///   FragmentConfig(
///     name: "world",
///     path: "/",
///     callback: fetchWorldData,
///     fragments: ["world/region1", "world/region2"], // Optional sub-fragments
///   ),
///   FragmentConfig(name: "region1", path: "world/region1", callback: fetchRegion1),
///   FragmentConfig(name: "region2", path: "world/region2", callback: fetchRegion2),
/// ];
///
/// // Create storage
/// final storage = AdvancedFragment(fragmentConfigs: fragmentConfigs);
///
/// // Set up environment
/// await PVCache.setEnv('game', storage);
///
/// // Usage - data fragmentation for efficient caching
/// final worldData = await PVCache.get('game:world'); // Triggers callback, fragments data into w1, w2, w3 pieces
///                                                    // Returns: {'w1': '@fragment:w1', 'w2': '@fragment:w2', 'w3': '@fragment:w3'}
/// final region1 = await PVCache.get('game:w1');      // Direct access to fragment piece
/// final region2 = await PVCache.get('game:w2');      // Direct access to fragment piece
/// final region3 = await PVCache.get('game:w3');      // Direct access to fragment piece
/// ```
///
/// ## Key Features:
///
/// - **Automatic Fragment Management**: Fragments are created and resolved transparently
/// - **Callback-based Loading**: Fresh data fetched only when cache misses occur
/// - **Reference Resolution**: Fragment references (`@fragment:fragmentKey`) resolved automatically
/// - **Expiry Support**: Individual fragments can have different expiry times
/// - **Memory Efficient**: Large objects broken into smaller, manageable pieces
/// - **Collision Detection**: Prevents fragment key conflicts during setup
///
/// ## Fragment Reference Format:
///
/// Internally, fragment references use the format: `@fragment:fragmentKey`
/// These are automatically resolved to actual fragment data when accessed.
///
/// ## Best Use Cases:
///
/// - Game world data (worlds → regions → areas)
/// - User profiles with sections (profile → preferences → history)
/// - Product catalogs (categories → subcategories → items)
/// - Large configuration objects with logical groupings

import 'package:flutter/foundation.dart';
import 'package:pv_cache/src/core/config.dart';

/// Configuration for a fragment in the advanced cache
class FragmentConfig {
  final String name;
  final String path;
  final Future<Map<String, dynamic>> Function() callback;
  final List<String>? fragments;

  FragmentConfig({
    required this.name,
    required this.path,
    required this.callback,
    this.fragments,
  });
}

/// Advanced fragment storage for hierarchical map caching
class AdvancedFragment extends PVCacheEnvConfig {
  final List<FragmentConfig> fragmentConfigs;
  final Map<String, FragmentConfig> _configMap = {};
  final Set<String> _usedFragmentKeys = {};
  final Map<String, Map<String, dynamic>> _pendingFragmentData = {};

  AdvancedFragment({
    super.defaultGet = true,
    super.defaultSet = true,
    super.defaultDelete = true,
    required this.fragmentConfigs,
  }) : super(
          storageType: PVCacheStorageType(name: "advanced_fragment"),
          handlesCacheMiss: true, // Enable cache miss handling for callbacks
        ) {
    // Build config map for quick lookup and validate fragment keys
    for (final config in fragmentConfigs) {
      _configMap[config.name] = config;

      // Validate fragment keys to prevent collisions
      if (config.fragments != null) {
        for (final fragment in config.fragments!) {
          final fragmentName = fragment.split('/').last;
          final fragmentKey = '${config.name}_$fragmentName';

          if (_usedFragmentKeys.contains(fragmentKey)) {
            throw ArgumentError(
                'Fragment key collision detected: $fragmentKey');
          }
          _usedFragmentKeys.add(fragmentKey);
        }
      }
    }
  }

  @override
  Future<bool> isValid(String key) async {
    // Check if item has expired using metadata
    final meta = await getMeta(key);
    if (meta == null) return true;

    final expiry = meta['expiry'];
    if (expiry == null) return true;

    final expiryTime = DateTime.tryParse(expiry.toString());
    if (expiryTime == null) return true;

    return DateTime.now().isBefore(expiryTime);
  }

  @override
  Future<void> invalidCleanup(String key) async {
    await rawDelete(key);
  }

  @override
  Future<dynamic> preGet(String key, dynamic originalValue) async {
    debugPrint(
        '[AdvancedFragment] preGet called: key=$key, originalValue=$originalValue');

    if (defaultGet) {
      // If originalValue is null, check if we have a fragment config
      if (originalValue == null) {
        debugPrint(
            '[AdvancedFragment] originalValue is null, checking for config...');
        final config = _configMap[key];
        if (config != null) {
          debugPrint(
              '[AdvancedFragment] Found config for key=$key, calling _loadFragmentData');
          // Load fragment data using callback
          final result = await _loadFragmentData(key, config);
          debugPrint('[AdvancedFragment] _loadFragmentData returned: $result');
          return result;
        } else {
          debugPrint('[AdvancedFragment] No config found for key=$key');
        }
      } else {
        debugPrint(
            '[AdvancedFragment] originalValue exists, checking if needs fragment resolution');
        // Value exists, resolve fragment references if needed
        if (originalValue is Map<String, dynamic>) {
          debugPrint(
              '[AdvancedFragment] Resolving fragment references for existing data');
          return await _resolveFragmentReferences(originalValue);
        }
      }

      debugPrint('[AdvancedFragment] Returning original value: $originalValue');
      return originalValue;
    } else {
      debugPrint('[AdvancedFragment] Custom logic mode');
      // Custom logic - handle everything ourselves
      final meta = await getMeta(key);
      if (meta == null) return null;

      final isValid = await this.isValid(key);
      if (!isValid) {
        await invalidCleanup(key);
        return null;
      }

      // Custom retrieval logic here
      return originalValue;
    }
  }

  @override
  Future<dynamic> preSet(
    String key,
    dynamic value,
    Map<String, dynamic>? metadata,
  ) async {
    if (defaultSet) {
      // Store metadata if provided (including expiry)
      if (metadata != null) {
        await setMeta(key, metadata);
      }
      return value; // Return the value to be stored
    } else {
      // Custom logic - handle everything ourselves
      if (metadata != null) {
        await setMeta(key, metadata);
      }

      // Custom processing logic here
      return value;
    }
  }

  @override
  Future<void> preDelete(String key) async {
    if (defaultDelete) {
      // Clean up metadata when deleting
      await deleteMeta(key);
    } else {
      // Custom logic - handle everything ourselves
      await deleteMeta(key);

      // Custom deletion logic here
    }
  }

  @override
  Future<void> postGet(String key, dynamic value) async {
    // No additional post-processing needed
  }

  @override
  Future<void> postSet(String key, dynamic value) async {
    debugPrint('[AdvancedFragment] postSet called: key=$key, value=$value');

    // Check if we have pending fragment data for this key
    final pendingData = _pendingFragmentData[key];
    debugPrint('[AdvancedFragment] Pending data for key=$key: $pendingData');

    if (pendingData != null) {
      final config = _configMap[key];
      debugPrint(
          '[AdvancedFragment] Config found: ${config?.name}, fragments: ${config?.fragments}');

      if (config?.fragments != null) {
        debugPrint(
            '[AdvancedFragment] Processing ${config!.fragments!.length} fragments');
        // Now store each fragment piece as an independent cache entry
        for (final fragment in config.fragments!) {
          final fragmentName = fragment.split('/').last;
          final fragmentData = pendingData[fragmentName] ?? {};

          debugPrint(
              '[AdvancedFragment] Storing fragment: $fragmentName = $fragmentData');
          // Store fragment using normal cache flow
          await rawSet(fragmentName, fragmentData);
          debugPrint(
              '[AdvancedFragment] Fragment $fragmentName stored successfully');
        }
      }

      // Clean up pending data
      _pendingFragmentData.remove(key);
      debugPrint('[AdvancedFragment] Cleaned up pending data for key=$key');
    } else {
      debugPrint('[AdvancedFragment] No pending data found for key=$key');
    }
  }

  @override
  Future<void> postDelete(String key) async {
    // No additional post-processing needed
  }

  /// Load fragment data using callback and prepare for caching
  Future<Map<String, dynamic>?> _loadFragmentData(
      String key, FragmentConfig config) async {
    debugPrint('[AdvancedFragment] _loadFragmentData called for key=$key');

    try {
      // Call the callback to get fresh data
      debugPrint('[AdvancedFragment] Calling callback for key=$key');
      final freshData = await config.callback();
      debugPrint('[AdvancedFragment] Callback returned: $freshData');

      // If this config has fragments, prepare fragment data structure
      if (config.fragments != null && config.fragments!.isNotEmpty) {
        debugPrint(
            '[AdvancedFragment] Processing ${config.fragments!.length} fragments for key=$key');

        // Store the original fresh data temporarily for postSet to process
        _pendingFragmentData[key] = freshData;
        debugPrint(
            '[AdvancedFragment] Stored pending data for key=$key: $freshData');

        final fragmentReferences = <String, String>{};

        for (final fragment in config.fragments!) {
          // Extract fragment name from path (e.g., "w/w1" -> "w1")
          final fragmentName = fragment.split('/').last;

          // Create reference to where the fragment will be cached
          fragmentReferences[fragmentName] = '@fragment:$fragmentName';
          debugPrint(
              '[AdvancedFragment] Created reference: $fragmentName -> @fragment:$fragmentName');
        }

        debugPrint(
            '[AdvancedFragment] Returning fragment references: $fragmentReferences');
        // Return the lightweight reference map (normal cache flow will store it)
        return fragmentReferences;
      } else {
        debugPrint(
            '[AdvancedFragment] No fragments, returning fresh data directly');
        // No fragments, return the data directly (let normal cache flow store it)
        return freshData;
      }
    } catch (e) {
      debugPrint('[AdvancedFragment] Callback failed for key=$key: $e');
      // If callback fails, return null
      return null;
    }
  }

  /// Resolve fragment references in a map
  Future<Map<String, dynamic>> _resolveFragmentReferences(
      Map<String, dynamic> data) async {
    final resolvedData = <String, dynamic>{};

    for (final entry in data.entries) {
      final value = entry.value;

      if (value is String && value.startsWith('@fragment:')) {
        // This is a fragment reference, resolve it
        final fragmentKey = value.substring('@fragment:'.length);
        final fragmentData = await rawGet(fragmentKey);
        resolvedData[entry.key] = fragmentData ?? {};
      } else {
        // Regular value, keep as is
        resolvedData[entry.key] = value;
      }
    }

    return resolvedData;
  }

  /// Get a specific fragment by key
  Future<Map<String, dynamic>?> getFragmentData(String fragmentKey) async {
    return await rawGet(fragmentKey) as Map<String, dynamic>?;
  }

  /// Set a fragment with expiry
  Future<void> setFragment(
    String key,
    Map<String, dynamic> data, {
    Duration? expiry,
  }) async {
    Map<String, dynamic>? metadata;
    if (expiry != null) {
      final expiryTime = DateTime.now().add(expiry);
      metadata = {'expiry': expiryTime.toIso8601String()};
    }

    // Store metadata
    if (metadata != null) {
      await setMeta(key, metadata);
    }

    // Store data directly
    await rawSet(key, data);
  }

  /// Clear all fragments for a given key
  Future<void> clearFragment(String key) async {
    final config = _configMap[key];
    if (config?.fragments != null) {
      // Clear main key using rawDelete
      await rawDelete(key);

      // Clear all fragment keys
      for (final fragment in config!.fragments!) {
        final fragmentName = fragment.split('/').last;
        final fragmentKey = '${key}_$fragmentName';
        await rawDelete(fragmentKey);
      }
    } else {
      await rawDelete(key);
    }
  }

  /// Get all fragment configurations
  List<FragmentConfig> getFragmentConfigs() {
    return List.unmodifiable(fragmentConfigs);
  }

  /// Check if a key has fragment configuration
  bool hasFragmentConfig(String key) {
    return _configMap.containsKey(key);
  }

  /// Get fragment configuration for a key
  FragmentConfig? getFragmentConfig(String key) {
    return _configMap[key];
  }

  /// Get all used fragment keys (for debugging)
  Set<String> getUsedFragmentKeys() {
    return Set.unmodifiable(_usedFragmentKeys);
  }
}
