import 'package:pvcache/config.dart';
import 'package:pvcache/utils/debug.dart';
import 'package:pvcache/utils/match.dart';

/// Configuration for how fragments should be parsed and processed
///
/// Defines transformation rules for matched fragment data:
/// - [justFlatten]: Converts nested maps to flat key-value pairs using '/' notation
/// - [fstringMethod]: String template for formatting (future implementation)
/// - [parseNameMethod]: Custom function for processing fragment data
///
/// Only one processing method can be active at a time.
class FraggerParseConfig {
  /// When true, flattens nested Map structures into flat key-value pairs
  /// Example: {'user': {'name': 'John'}} becomes {'user/name': 'John'}
  final bool justFlatten;

  /// String template method for formatting fragment values (placeholder for future use)
  final String? fstringMethod;

  /// Custom processing function that receives (key, value, adapter) and returns processed value
  final Function(String key, dynamic value, PVAdapter? adapter)?
  parseNameMethod;

  /// Creates a FraggerParseConfig with exactly one processing method
  ///
  /// Steps:
  /// 1. Initialize processing options
  /// 2. Validate that only one method is specified
  /// 3. Throw error if multiple methods are configured
  FraggerParseConfig({
    this.justFlatten = false,
    this.fstringMethod,
    this.parseNameMethod,
  }) {
    int count = 0;
    if (fstringMethod != null) {
      count++;
    }
    if (parseNameMethod != null) {
      count++;
    }
    if (justFlatten) {
      count++;
    }
    if (count > 1) {
      throw ArgumentError(
        'FraggerParseConfig can only have one of justFlatten, fstringMethod, or parseNameMethod set.',
      );
    }
  }
}

/// Fragment storage strategy for matched data
enum FragmentStorageStrategy {
  /// Remove fragment from main data (pop)
  pop,

  /// Replace fragment with @fragment:key reference
  reference,

  /// Use custom function to handle fragment
  custom,
}

/// Configuration for fetching and fragmenting data based on key patterns
class FraggerFetchConfig {
  /// Pattern to match against cache keys (supports '*' wildcard)
  /// Example: 'user_*' matches 'user_123', 'user_profile', etc.
  final String pattern;

  /// Function to fetch bulk data when pattern matches but data not in cache
  /// Returns Map<String, dynamic> where keys are cache keys and values are the data
  final Future<Map<String, dynamic>> Function(String pattern)? fetchMethod;

  /// Map of fragment patterns to their processing configurations
  /// Key: pattern for identifying fragments within fetched data
  /// Value: how to process those fragments
  final Map<String, FraggerParseConfig> frags;

  /// Strategy for storing fragments (pop, reference, or custom)
  final FragmentStorageStrategy fragmentStrategy;

  /// Custom handler for fragment storage when using FragmentStorageStrategy.custom
  /// Receives (fragmentPath, fragmentValue, mainData) and returns replacement value
  final dynamic Function(
    String key,
    dynamic value,
    Map<String, dynamic> mainData,
  )?
  customFragmentHandler;

  /// Creates a FraggerFetchConfig with validation
  FraggerFetchConfig({
    required this.pattern,
    this.fetchMethod,
    this.frags = const {},
    this.fragmentStrategy = FragmentStorageStrategy.reference,
    this.customFragmentHandler,
  }) {
    if (fragmentStrategy == FragmentStorageStrategy.custom &&
        customFragmentHandler == null) {
      throw ArgumentError(
        'customFragmentHandler must be provided when using FragmentStorageStrategy.custom',
      );
    }
  }
}

/// Clean, stateless Fragger adapter for pattern-based data fragmentation
///
/// Processes data on-the-fly without internal state tracking or metadata storage.
/// Fragments are stored directly in cache storage where they can be inspected.
class Fragger implements PVAdapter {
  final List<FraggerFetchConfig> configs;

  Fragger(this.configs);

  @override
  bool get hasPreMethods => true;

  @override
  bool get hasPostMethods => true;

  @override
  Future<void> init(PVCacheConfig config) async {
    // Stateless - no initialization needed
  }

  @override
  Future<void> clear(PVCacheConfig config) async {
    // Stateless - no internal state to clear
  }

  @override
  Future<void> clearMeta(PVCacheConfig config) async {
    // Stateless - no metadata to clear
  }

  /// Find matching config for a given key pattern
  FraggerFetchConfig? _findMatchingConfig(String key) {
    for (final config in configs) {
      if (simplePatternMatch(config.pattern, key)) {
        return config;
      }
    }
    return null;
  }

  /// Process value according to frag configuration
  dynamic _processFragment(
    String key,
    dynamic value,
    FraggerParseConfig fragConfig,
  ) {
    if (fragConfig.justFlatten) {
      // Flatten nested structures
      if (value is Map<String, dynamic>) {
        final flattened = <String, dynamic>{};
        for (final entry in nestedKeys(value, '')) {
          final nestedValue = deepGet(value, entry);
          flattened[entry] = nestedValue;
        }
        return flattened;
      }
      return value;
    }

    if (fragConfig.parseNameMethod != null) {
      // Use custom parsing method
      return fragConfig.parseNameMethod!(key, value, this);
    }

    if (fragConfig.fstringMethod != null) {
      // Apply string formatting (placeholder for future implementation)
      return value;
    }

    return value;
  }

  /// Remove a value from a nested map using path notation
  void _removeFromNestedMap(Map<String, dynamic> map, String path) {
    final parts = path.split('/');
    Map<String, dynamic> current = map;

    // Navigate to the parent
    for (int i = 0; i < parts.length - 1; i++) {
      final part = parts[i];
      if (current.containsKey(part) && current[part] is Map<String, dynamic>) {
        current = current[part] as Map<String, dynamic>;
      } else {
        return; // Path doesn't exist
      }
    }

    // Remove the final key
    current.remove(parts.last);
  }

  @override
  Future<(dynamic, bool)> preGet(
    String key,
    Map metadata,
    PVCacheConfig config,
  ) async {
    cacheDebugPrint('🧩 Fragger.preGet: key="$key"');

    // Check if we have a matching config for this key
    final matchingConfig = _findMatchingConfig(key);
    if (matchingConfig == null) {
      cacheDebugPrint('🧩 Fragger.preGet: No matching pattern for key="$key"');
      return (null, true); // Continue with normal get
    }

    cacheDebugPrint(
      '🧩 Fragger.preGet: Found matching pattern="${matchingConfig.pattern}" for key="$key"',
    );

    // If we have a fetch method, try to fetch bulk data
    if (matchingConfig.fetchMethod != null) {
      cacheDebugPrint(
        '🔄 Fragger.preGet: Attempting to fetch data for pattern="${matchingConfig.pattern}"',
      );
      try {
        final fetchedData = await matchingConfig.fetchMethod!(
          matchingConfig.pattern,
        );

        // Process and store the fetched data
        final processedData = <String, dynamic>{};
        final fragmentsToStore = <String, dynamic>{};

        for (final entry in fetchedData.entries) {
          final mainKey = entry.key;
          final mainValue = entry.value;

          if (mainValue is Map<String, dynamic>) {
            // Use extractFromMap to find fragments within the main data
            final fragmentPatterns = matchingConfig.frags.keys.toList();
            final extractedFragments = extractFromMap(
              mainValue,
              fragmentPatterns,
            );

            // Process extracted fragments
            final processedMainData = Map<String, dynamic>.from(mainValue);

            for (final fragEntry in extractedFragments.entries) {
              final fragPath = fragEntry.key;
              dynamic fragValue = fragEntry.value;

              // Find matching frag config and apply processing
              for (final fragPattern in matchingConfig.frags.keys) {
                if (simplePatternMatch(fragPattern, fragPath)) {
                  final fragConfig = matchingConfig.frags[fragPattern]!;
                  fragValue = _processFragment(fragPath, fragValue, fragConfig);
                  break;
                }
              }

              // Generate unique fragment key for storage
              final fragmentKey = '${mainKey}_${fragPath.replaceAll('/', '_')}';

              // Apply storage strategy to determine how fragment is handled
              switch (matchingConfig.fragmentStrategy) {
                case FragmentStorageStrategy.pop:
                  // Remove fragment from main data, store separately
                  _removeFromNestedMap(processedMainData, fragPath);
                  fragmentsToStore[fragmentKey] = fragValue;
                  break;
                case FragmentStorageStrategy.reference:
                  // Replace fragment with reference, store separately
                  deepSet(
                    processedMainData,
                    fragPath,
                    '@fragment:$fragmentKey',
                  );
                  fragmentsToStore[fragmentKey] = fragValue;
                  break;
                case FragmentStorageStrategy.custom:
                  // Use custom handler to determine replacement value
                  final customResult = matchingConfig.customFragmentHandler!(
                    fragPath,
                    fragValue,
                    processedMainData,
                  );
                  if (customResult != null) {
                    deepSet(processedMainData, fragPath, customResult);
                  }
                  fragmentsToStore[fragmentKey] = fragValue;
                  break;
              }
            }

            processedData[mainKey] = processedMainData;
          } else {
            // Non-map value, include as-is
            processedData[mainKey] = mainValue;
          }
        }

        // Store all extracted fragments using the configured storage adapter
        for (final fragmentEntry in fragmentsToStore.entries) {
          await config.setAdapter.set(
            fragmentEntry.key,
            fragmentEntry.value,
            config,
          );
          cacheDebugPrint(
            '🧩 Fragger.preGet: Stored fragment "${fragmentEntry.key}"',
          );
        }

        // Store the processed main data
        for (final processedEntry in processedData.entries) {
          await config.setAdapter.set(
            processedEntry.key,
            processedEntry.value,
            config,
          );
        }

        // Return the specific requested key if it exists in processed data
        if (processedData.containsKey(key)) {
          cacheDebugPrint('✅ Fragger.preGet: Found in fetched data: $key');
          return (
            processedData[key],
            false,
          ); // Return fetched value, halt chain
        }
      } catch (e) {
        cacheDebugPrint(
          '❌ Fragger.preGet: Fetch failed for pattern="${matchingConfig.pattern}": $e',
        );
      }
    }

    cacheDebugPrint(
      '🧩 Fragger.preGet: No data available for key="$key", continuing with storage',
    );
    return (null, true); // Continue with normal get
  }

  @override
  Future<(dynamic, bool)> preSet(
    String key,
    dynamic value,
    Map<String, dynamic>? metadata,
    PVCacheConfig config,
  ) async {
    cacheDebugPrint('🧩 Fragger.preSet: key="$key", value="$value"');

    // Check if we have a matching config for this key
    final matchingConfig = _findMatchingConfig(key);
    if (matchingConfig == null) {
      cacheDebugPrint('🧩 Fragger.preSet: No matching pattern for key="$key"');
      return (value, true); // Continue with normal set
    }

    cacheDebugPrint(
      '🧩 Fragger.preSet: Found matching pattern="${matchingConfig.pattern}" for key="$key"',
    );

    // Process fragments according to strategy if value is a Map
    if (value is Map<String, dynamic>) {
      final processedData = <String, dynamic>{};
      final fragmentsToStore = <String, dynamic>{};

      for (final entry in value.entries) {
        final entryKey = entry.key;
        dynamic entryValue = entry.value;

        // Check if this entry matches a fragment pattern
        bool isFragment = false;
        FraggerParseConfig? fragConfig;
        for (final fragPattern in matchingConfig.frags.keys) {
          if (simplePatternMatch(fragPattern, entryKey)) {
            fragConfig = matchingConfig.frags[fragPattern]!;
            entryValue = _processFragment(entryKey, entryValue, fragConfig);
            isFragment = true;
            break;
          }
        }

        if (isFragment) {
          // Handle fragment according to strategy
          switch (matchingConfig.fragmentStrategy) {
            case FragmentStorageStrategy.pop:
              // Store fragment separately, don't include in main data
              fragmentsToStore[entryKey] = entryValue;
              break;
            case FragmentStorageStrategy.reference:
              // Store fragment separately and add reference to main data
              fragmentsToStore[entryKey] = entryValue;
              processedData[entryKey] = '@fragment:$entryKey';
              break;
            case FragmentStorageStrategy.custom:
              // Use custom handler
              final customResult = matchingConfig.customFragmentHandler!(
                entryKey,
                entryValue,
                processedData,
              );
              if (customResult != null) {
                processedData[entryKey] = customResult;
              }
              fragmentsToStore[entryKey] = entryValue;
              break;
          }
        } else {
          // Not a fragment, include in main data
          processedData[entryKey] = entryValue;
        }
      }

      // Store fragments using the storage adapter
      for (final fragmentEntry in fragmentsToStore.entries) {
        await config.setAdapter.set(
          fragmentEntry.key,
          fragmentEntry.value,
          config,
        );
        cacheDebugPrint(
          '🧩 Fragger.preSet: Stored fragment "${fragmentEntry.key}"',
        );
      }

      cacheDebugPrint(
        '🧩 Fragger.preSet: Processed fragmentation for pattern="${matchingConfig.pattern}"',
      );
      return (
        processedData,
        true,
      ); // Continue with storage using processed value
    } else {
      // Non-map value, process normally
      dynamic processedValue = value;
      for (final fragPattern in matchingConfig.frags.keys) {
        if (simplePatternMatch(fragPattern, key)) {
          final fragConfig = matchingConfig.frags[fragPattern]!;
          processedValue = _processFragment(key, value, fragConfig);
          cacheDebugPrint(
            '🧩 Fragger.preSet: Applied frag processing for pattern="$fragPattern"',
          );
          break;
        }
      }

      cacheDebugPrint(
        '🧩 Fragger.preSet: Processed single value for pattern="${matchingConfig.pattern}"',
      );
      return (
        processedValue,
        true,
      ); // Continue with storage using processed value
    }
  }

  @override
  Future<bool> preDelete(String key, PVCacheConfig config) async {
    // Stateless - no fragment cache to clean up
    return true; // Continue with delete
  }

  @override
  Future<void> postGet(String key, dynamic value, PVCacheConfig config) async {
    // Resolve fragment references if value contains them
    if (value != null && value is Map<String, dynamic>) {
      final resolvedValue = await _resolveFragmentReferences(value, config);
      if (resolvedValue != value) {
        // Re-store the resolved value
        await config.setAdapter.set(key, resolvedValue, config);
        cacheDebugPrint(
          '🔗 Fragger.postGet: Resolved fragment references for key="$key"',
        );
      }
    }
  }

  @override
  Future<void> postSet(String key, dynamic value, PVCacheConfig config) async {
    // No post-processing needed
  }

  @override
  Future<void> postDelete(String key, PVCacheConfig config) async {
    // No post-processing needed
  }

  // Storage operations not implemented - use noSuchMethod
  @override
  dynamic noSuchMethod(Invocation invocation) {
    throw UnsupportedError(
      'Fragger adapter only provides fragmentation logic through pre/post hooks. Storage operations should be handled by other adapters.',
    );
  }

  /// Get basic statistics about Fragger configuration
  ///
  /// Returns information about configured patterns and strategies.
  /// Note: Since Fragger is stateless, this only shows configuration info.
  Map<String, dynamic> getStats() {
    return {
      'type': 'Fragger',
      'patterns': configs.map((c) => c.pattern).toList(),
      'totalConfigs': configs.length,
      'strategies': configs
          .map((c) => c.fragmentStrategy.toString())
          .toSet()
          .toList(),
      'hasCustomHandlers': configs.any((c) => c.customFragmentHandler != null),
      'stateless': true,
    };
  }

  /// Resolve fragment references in a map
  Future<Map<String, dynamic>> _resolveFragmentReferences(
    Map<String, dynamic> data,
    PVCacheConfig config,
  ) async {
    final resolvedData = <String, dynamic>{};

    for (final entry in data.entries) {
      final value = entry.value;

      if (value is String && value.startsWith('@fragment:')) {
        // This is a fragment reference, resolve it
        final fragmentKey = value.substring('@fragment:'.length);
        cacheDebugPrint(
          '🔗 Fragger._resolveFragmentReferences: Resolving fragment reference: $fragmentKey',
        );

        // Get the fragment from storage
        final fragmentData = await config.getAdapter.get(fragmentKey, config);
        resolvedData[entry.key] = fragmentData ?? {};
        cacheDebugPrint(
          '🔗 Fragger._resolveFragmentReferences: Resolved $fragmentKey = $fragmentData',
        );
      } else if (value is Map<String, dynamic>) {
        // Recursively resolve nested references
        resolvedData[entry.key] = await _resolveFragmentReferences(
          value,
          config,
        );
      } else {
        // Regular value, keep as is
        resolvedData[entry.key] = value;
      }
    }

    return resolvedData;
  }
}
