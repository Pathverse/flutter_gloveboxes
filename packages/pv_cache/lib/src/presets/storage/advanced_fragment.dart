/// Advanced Fragment Cache Storage
///
/// This storage type provides hierarchical caching with fragment resolution for complex data structures.
/// It's designed for scenarios where you have large objects that can be broken down into smaller,
/// independently cacheable fragments.
///
/// ## How it works:
///
/// 1. **Fragment Configuration**: Define how your data should be fragmented using `FragmentConfig`
/// 2. **Glob Pattern Matching**: Both name and path support glob patterns for flexible key matching
/// 3. **Lazy Loading**: Main data is fetched via callbacks only when not cached
/// 4. **Fragment References**: Large objects store references to fragments instead of full data
/// 5. **Automatic Resolution**: Fragment references are automatically resolved when accessed
/// 6. **Independent Caching**: Each fragment can be cached/expired independently
///
/// ## Usage Example:
///
/// ```dart
/// // Define fragment configurations with glob patterns and smart fragments
/// final fragmentConfigs = [
///   FragmentConfig(
///     name: "world*",           // Matches: world, world1, world2, etc.
///     path: "/",
///     callback: fetchWorldData,
///     fragments: ["world*/region*"], // Regular fragments
///     smartFragments: [
///       SmartFragment("x/x*", "in_{name}_id"), // Dynamic key generation
///       SmartFragment("users/*", "user_{id}_{name}"), // Multiple field interpolation
///     ],
///   ),
///   FragmentConfig(name: "region*", path: "world*/region*", callback: fetchRegionData),
///   FragmentConfig(name: "user*", path: "users/*", callback: fetchUserData),
/// ];
///
/// // Create storage
/// final storage = AdvancedFragment(fragmentConfigs: fragmentConfigs);
///
/// // Set up environment
/// await PVCache.setEnv('game', storage);
///
/// // Usage - glob pattern matching for flexible key access
/// final worldData = await PVCache.get('game:world1');    // Matches "world*" pattern
/// final regionData = await PVCache.get('game:region1');  // Matches "region*" pattern
/// final userData = await PVCache.get('game:user123');    // Matches "user*" pattern
///
/// // Smart fragment example:
/// // For data: {"x": {"x1": {"name": "www", "id": 3}}}
/// // SmartFragment("x/x*", "in_{name}_id") generates key: "in_www_3"
/// ```
///
/// ## Glob Pattern Support:
///
/// - **Simple Patterns**: `world*` matches any key starting with "world"
/// - **Suffix Patterns**: `*data` matches any key ending with "data"
/// - **Exact Patterns**: `world1` matches only "world1"
/// - **Path Patterns**: `world*/region*` matches hierarchical paths
/// - **Collision Handling**: Only the first matching pattern is used
///
/// ## Key Features:
///
/// - **Glob Pattern Matching**: Flexible key matching using glob patterns
/// - **Smart Fragments**: Dynamic key generation using data field interpolation
/// - **Regular Fragments**: Traditional path-based fragment storage
/// - **Automatic Fragment Management**: Fragments are created and resolved transparently
/// - **Callback-based Loading**: Fresh data fetched only when cache misses occur
/// - **Reference Resolution**: Fragment references (`@fragment:fragmentKey`) resolved automatically
/// - **Expiry Support**: Individual fragments can have different expiry times
/// - **Memory Efficient**: Large objects broken into smaller, manageable pieces
/// - **Collision Detection**: Prevents fragment key conflicts during setup
///
/// ## Smart Fragments:
///
/// Smart fragments provide dynamic key generation based on data content:
/// - **Path Patterns**: Use glob patterns to match data paths (e.g., `"x/x*"`)
/// - **Name Resolution**: Generate keys using field interpolation (e.g., `"in_{name}_id"`)
/// - **Field Interpolation**: Replace `{field}` with actual data values
/// - **Multiple Fields**: Support multiple field replacements in a single pattern
///
/// ### Smart Fragment Examples:
/// ```dart
/// // Data: {"x": {"x1": {"name": "www", "id": 3}}}
/// SmartFragment("x/x*", "in_{name}_id")     // Generates: "in_www_3"
/// SmartFragment("users/*", "user_{id}")     // For user data with id field
/// SmartFragment("*", "item_{type}_{status}") // Multiple field interpolation
/// ```
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
/// - Dynamic key patterns with similar data structures
/// - Data with natural identifiers that make good cache keys

import 'package:flutter/foundation.dart';
import 'package:pv_cache/src/core/config.dart';
import 'package:pv_cache/utils/glob.dart';

/// Smart fragment configuration for dynamic key generation
class SmartFragment {
  final String pathPattern;
  final String nameResolve;

  SmartFragment(this.pathPattern, this.nameResolve);

  /// Generate a key from data using the nameResolve pattern
  String generateKey(Map<String, dynamic> data) {
    String result = nameResolve;

    // Replace {name} patterns with actual values from data
    final regex = RegExp(r'\{([^}]+)\}');
    result = result.replaceAllMapped(regex, (match) {
      final fieldName = match.group(1);
      if (fieldName != null && data.containsKey(fieldName)) {
        return data[fieldName].toString();
      }
      return match.group(0) ?? '';
    });

    return result;
  }

  /// Check if this smart fragment matches a given path pattern
  bool matchesPath(String path) {
    return simpleGlob(pathPattern, path);
  }
}

/// Configuration for a fragment in the advanced cache
class FragmentConfig {
  final String name;
  final String path;
  final Future<Map<String, dynamic>> Function() callback;
  final List<String>? fragments;
  final List<SmartFragment>? smartFragments;

  FragmentConfig({
    required this.name,
    required this.path,
    required this.callback,
    this.fragments,
    this.smartFragments,
  });

  /// Check if this config matches a given key using glob patterns
  bool matchesKey(String key) {
    return simpleGlob(name, key) || simpleGlob(path, key);
  }

  /// Check if this config's name matches a given key using glob patterns
  bool matchesName(String key) {
    return simpleGlob(name, key);
  }

  /// Check if this config's path matches a given key using glob patterns
  bool matchesPath(String key) {
    return simpleGlob(path, key);
  }
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
    cacheDebugPrint('🔍 [AdvancedFragment] preGet called: key=$key');

    if (defaultGet) {
      // If originalValue is null, check if we have a fragment config
      if (originalValue == null) {
        cacheDebugPrint(
            '🔍 [AdvancedFragment] originalValue is null, checking for config...');
        final config = _findMatchingConfig(key);
        if (config != null) {
          cacheDebugPrint(
              '🔍 [AdvancedFragment] Found matching config for key=$key, calling _loadFragmentData');
          // Load fragment data using callback
          final result = await _loadFragmentData(key, config);
          cacheDebugPrint(
              '🔍 [AdvancedFragment] _loadFragmentData returned: $result');
          return result;
        } else {
          cacheDebugPrint(
              '🔍 [AdvancedFragment] No matching config found for key=$key');
        }
      } else {
        cacheDebugPrint(
            '🔍 [AdvancedFragment] originalValue exists, checking if needs fragment resolution');
        // Value exists, check metadata to see if we should resolve fragments
        final meta = await getMeta(key);
        final shouldResolveFragments = meta?['resolve_fragments'] ?? true;

        if (shouldResolveFragments && originalValue is Map<String, dynamic>) {
          cacheDebugPrint(
              '🔍 [AdvancedFragment] Resolving fragment references for existing data');
          return await _resolveFragmentReferences(originalValue);
        } else {
          cacheDebugPrint(
              '🔍 [AdvancedFragment] Fragment resolution disabled or not needed, returning original value');
        }
      }

      return originalValue;
    } else {
      cacheDebugPrint('🔍 [AdvancedFragment] Custom logic mode');
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
      // Store metadata if provided (including expiry and fragment resolution control)
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
    cacheDebugPrint('💾 [AdvancedFragment] postSet called: key=$key');

    // Check if we have pending fragment data for this key
    final pendingData = _pendingFragmentData[key];
    cacheDebugPrint(
        '💾 [AdvancedFragment] Pending data for key=$key: $pendingData');

    if (pendingData != null) {
      final config = _findMatchingConfig(key);
      cacheDebugPrint('💾 [AdvancedFragment] Config found: ${config?.name}');

      if (config != null) {
        await _storeFragmentData(config, pendingData);
      }

      // Clean up pending data
      _pendingFragmentData.remove(key);
      cacheDebugPrint(
          '💾 [AdvancedFragment] Cleaned up pending data for key=$key');
    } else {
      cacheDebugPrint(
          '💾 [AdvancedFragment] No pending data found for key=$key');
    }
  }

  /// Store fragment data based on configuration
  Future<void> _storeFragmentData(
      FragmentConfig config, Map<String, dynamic> pendingData) async {
    // Store regular fragments
    if (config.fragments != null) {
      await _storeRegularFragments(config.fragments!, pendingData);
    }

    // Store smart fragments
    if (config.smartFragments != null) {
      await _storeSmartFragments(config.smartFragments!, pendingData);
    }
  }

  /// Store regular fragments
  Future<void> _storeRegularFragments(
      List<String> fragments, Map<String, dynamic> pendingData) async {
    cacheDebugPrint(
        '🧩 [AdvancedFragment] Storing ${fragments.length} regular fragments');

    for (final fragment in fragments) {
      final fragmentName = fragment.split('/').last;
      final fragmentData = pendingData[fragmentName] ?? {};

      cacheDebugPrint(
          '🧩 [AdvancedFragment] Storing regular fragment: $fragmentName = $fragmentData');
      await rawSet(fragmentName, fragmentData);
      cacheDebugPrint(
          '🧩 [AdvancedFragment] Regular fragment $fragmentName stored successfully');
    }
  }

  /// Store smart fragments
  Future<void> _storeSmartFragments(List<SmartFragment> smartFragments,
      Map<String, dynamic> pendingData) async {
    cacheDebugPrint('🧠 [AdvancedFragment] Storing smart fragments');

    for (final smartFragment in smartFragments) {
      final matchingPaths = getMapGlob(smartFragment.pathPattern, pendingData);

      for (final path in matchingPaths) {
        final pathData = _getDataAtPath(pendingData, path);
        if (pathData is Map<String, dynamic>) {
          final generatedKey = smartFragment.generateKey(pathData);

          cacheDebugPrint(
              '🧠 [AdvancedFragment] Storing smart fragment: $generatedKey = $pathData');
          await rawSet(generatedKey, pathData);
          cacheDebugPrint(
              '🧠 [AdvancedFragment] Smart fragment $generatedKey stored successfully');
        }
      }
    }
  }

  @override
  Future<void> postDelete(String key) async {
    // No additional post-processing needed
  }

  /// Load fragment data using callback and prepare for caching
  Future<Map<String, dynamic>?> _loadFragmentData(
      String key, FragmentConfig config) async {
    cacheDebugPrint(
        '📥 [AdvancedFragment] _loadFragmentData called for key=$key');

    try {
      // Call the callback to get fresh data
      final freshData = await _fetchDataFromCallback(key, config);
      if (freshData == null) return null;

      // Process fragments if they exist
      if (_hasFragments(config)) {
        return await _processFragments(key, config, freshData);
      } else {
        cacheDebugPrint(
            '📥 [AdvancedFragment] No fragments, returning fresh data directly');
        return freshData;
      }
    } catch (e) {
      cacheDebugPrint(
          '❌ [AdvancedFragment] Error loading fragment data for key=$key: $e');
      return null;
    }
  }

  /// Fetch data from callback
  Future<Map<String, dynamic>?> _fetchDataFromCallback(
      String key, FragmentConfig config) async {
    cacheDebugPrint('📞 [AdvancedFragment] Calling callback for key=$key');
    try {
      final freshData = await config.callback();
      cacheDebugPrint('📞 [AdvancedFragment] Callback returned: $freshData');
      return freshData;
    } catch (e) {
      cacheDebugPrint('❌ [AdvancedFragment] Callback failed for key=$key: $e');
      return null;
    }
  }

  /// Check if config has any fragments
  bool _hasFragments(FragmentConfig config) {
    return (config.fragments != null && config.fragments!.isNotEmpty) ||
        (config.smartFragments != null && config.smartFragments!.isNotEmpty);
  }

  /// Process fragments and smart fragments
  Future<Map<String, dynamic>> _processFragments(
      String key, FragmentConfig config, Map<String, dynamic> freshData) async {
    cacheDebugPrint('⚙️ [AdvancedFragment] Processing fragments for key=$key');

    // Store the original fresh data temporarily for postSet to process
    _pendingFragmentData[key] = freshData;
    cacheDebugPrint(
        '⚙️ [AdvancedFragment] Stored pending data for key=$key: $freshData');

    final fragmentReferences = <String, String>{};

    // Process regular fragments
    if (config.fragments != null) {
      _processRegularFragments(config.fragments!, fragmentReferences);
    }

    // Process smart fragments
    if (config.smartFragments != null) {
      await _processSmartFragments(
          config.smartFragments!, freshData, fragmentReferences);
    }

    cacheDebugPrint(
        '⚙️ [AdvancedFragment] Returning fragment references: $fragmentReferences');
    return fragmentReferences;
  }

  /// Process regular fragments
  void _processRegularFragments(
      List<String> fragments, Map<String, String> fragmentReferences) {
    cacheDebugPrint(
        '🧩 [AdvancedFragment] Processing ${fragments.length} regular fragments');

    for (final fragment in fragments) {
      // Extract fragment name from path (e.g., "w/w1" -> "w1")
      final fragmentName = fragment.split('/').last;

      // Create reference to where the fragment will be cached
      fragmentReferences[fragmentName] = '@fragment:$fragmentName';
      cacheDebugPrint(
          '🧩 [AdvancedFragment] Created reference: $fragmentName -> @fragment:$fragmentName');
    }
  }

  /// Process smart fragments
  Future<void> _processSmartFragments(
      List<SmartFragment> smartFragments,
      Map<String, dynamic> freshData,
      Map<String, String> fragmentReferences) async {
    cacheDebugPrint(
        '🧠 [AdvancedFragment] Processing ${smartFragments.length} smart fragments');

    for (final smartFragment in smartFragments) {
      final matchingPaths = getMapGlob(smartFragment.pathPattern, freshData);
      cacheDebugPrint(
          '🧠 [AdvancedFragment] SmartFragment pattern ${smartFragment.pathPattern} matches: $matchingPaths');

      for (final path in matchingPaths) {
        final pathData = _getDataAtPath(freshData, path);
        if (pathData is Map<String, dynamic>) {
          final generatedKey = smartFragment.generateKey(pathData);
          fragmentReferences[path] = '@fragment:$generatedKey';
          cacheDebugPrint(
              '🧠 [AdvancedFragment] SmartFragment: $path -> @fragment:$generatedKey');
        }
      }
    }
  }

  /// Get data at a specific path
  dynamic _getDataAtPath(Map<String, dynamic> data, String path) {
    final segments = path.split('/');
    dynamic current = data;

    for (final segment in segments) {
      if (current is Map<String, dynamic> && current.containsKey(segment)) {
        current = current[segment];
      } else {
        return null;
      }
    }

    return current;
  }

  /// Find the first matching config for a given key using glob patterns
  FragmentConfig? _findMatchingConfig(String key) {
    for (final config in fragmentConfigs) {
      if (config.matchesKey(key)) {
        cacheDebugPrint(
            '🔍 [AdvancedFragment] Found matching config: ${config.name} for key: $key');
        return config;
      }
    }
    return null;
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
        cacheDebugPrint(
            '🔗 [AdvancedFragment] Resolving fragment reference: $fragmentKey');

        // First try to get the fragment directly
        var fragmentData = await rawGet(fragmentKey);

        // If fragment doesn't exist, check if we need to load the parent
        if (fragmentData == null) {
          cacheDebugPrint(
              '🔗 [AdvancedFragment] Fragment $fragmentKey not found, checking if parent needs loading');

          // Find which parent key this fragment belongs to using glob patterns
          String? parentKey;
          FragmentConfig? parentConfig;

          for (final config in fragmentConfigs) {
            if (config.fragments != null) {
              for (final fragment in config.fragments!) {
                final fragmentName = fragment.split('/').last;
                if (fragmentName == fragmentKey) {
                  parentKey = config.name;
                  parentConfig = config;
                  break;
                }
              }
              if (parentKey != null) break;
            }
          }

          if (parentKey != null && parentConfig != null) {
            cacheDebugPrint(
                '🔗 [AdvancedFragment] Found parent key: $parentKey, loading parent data');

            // Check if parent exists
            final parentData = await rawGet(parentKey);
            if (parentData == null) {
              // Parent doesn't exist, load it first
              cacheDebugPrint(
                  '🔗 [AdvancedFragment] Parent $parentKey doesn\'t exist, calling parent callback');
              final loadedParentData =
                  await _loadFragmentData(parentKey, parentConfig);
              if (loadedParentData != null) {
                // Now try to get the fragment again
                fragmentData = await rawGet(fragmentKey);
                cacheDebugPrint(
                    '🔗 [AdvancedFragment] After loading parent, fragment $fragmentKey = $fragmentData');
              }
            } else {
              cacheDebugPrint(
                  '🔗 [AdvancedFragment] Parent $parentKey exists but fragment $fragmentKey is missing');
            }
          }
        }

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

  /// Clear all fragments for a given key using glob patterns
  Future<void> clearFragment(String key) async {
    final config = _findMatchingConfig(key);
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

  /// Check if a key has fragment configuration using glob patterns
  bool hasFragmentConfig(String key) {
    return _findMatchingConfig(key) != null;
  }

  /// Get fragment configuration for a key using glob patterns
  FragmentConfig? getFragmentConfig(String key) {
    return _findMatchingConfig(key);
  }

  /// Get all used fragment keys (for debugging)
  Set<String> getUsedFragmentKeys() {
    return Set.unmodifiable(_usedFragmentKeys);
  }
}
