import 'package:pv_cache/src/core/options.dart';
import 'package:pv_cache/src/core/toplv.dart' as toplv;

/// Utility methods for cache operations
class CacheUtils {
  /// Simple pattern matching for JSON paths
  /// x/* = encrypt everything in map[x]
  /// x/ss* = encrypt every key in map[x] that starts with 'ss'
  static bool matchesSensitive(String key, List<String> patterns) {
    for (final pattern in patterns) {
      if (pattern.endsWith('/*')) {
        // Match everything under this path: x/* matches x/anything
        final prefix = pattern.substring(0, pattern.length - 1); // Remove *
        if (key.startsWith(prefix)) return true;
      } else if (pattern.contains('*')) {
        // Match prefix within path: x/ss* matches x/ss1, x/sss, etc.
        final asteriskIndex = pattern.indexOf('*');
        final prefix = pattern.substring(0, asteriskIndex);
        if (key.startsWith(prefix)) return true;
      } else {
        // Exact match
        if (key == pattern) return true;
      }
    }
    return false;
  }

  /// Calculate expiry timestamp if lifetime is set
  static int? calculateExpiry(int? lifetimeSeconds) {
    if (lifetimeSeconds == null) return null;
    return DateTime.now()
        .add(Duration(seconds: lifetimeSeconds))
        .millisecondsSinceEpoch;
  }

  /// Check if timestamp is expired
  static bool isExpired(dynamic expiryTimestamp) {
    if (expiryTimestamp == null) return false;
    final expiry = DateTime.fromMillisecondsSinceEpoch(expiryTimestamp);
    return DateTime.now().isAfter(expiry);
  }

  /// Create metadata object for storage
  static Map<String, dynamic> createMetadata({
    dynamic value,
    String? group,
    int? expiryTimestamp,
    required bool encrypted,
    String? encryptedValue,
  }) {
    final metadata = <String, dynamic>{
      'group': group,
      'expiry': expiryTimestamp,
      'encrypted': encrypted,
    };

    if (encryptedValue != null) {
      metadata['encrypted_value'] = encryptedValue;
    } else {
      metadata['value'] = value;
    }

    return metadata;
  }

  /// Validate cache options
  static void validateOptions(CacheOptions options) {
    // Validate that sensitive data has encryption dependencies
    if (options.sensitive != null && options.sensitive!.isNotEmpty) {
      if (options.depends == null) {
        throw ArgumentError(
          'Sensitive data patterns require depends parameter for encryption key location',
        );
      }
    }

    // Validate LRU settings
    if (options.lru == true &&
        options.lruInCount != null &&
        options.lruInCount! < 0) {
      throw ArgumentError('lruInCount must be non-negative');
    }

    // Validate lifetime
    if (options.lifetime != null && options.lifetime! < 0) {
      throw ArgumentError('lifetime must be non-negative');
    }
  }

  /// Check dependency for a cache entry.
  ///
  /// If [sensitive] is true, always check secure storage for the depends key.
  /// Otherwise, patterns:
  /// - 'ENCRYPTED:x': depends on secure storage key 'x'
  /// - 'X:Y': depends on key 'Y' in group 'X' (Hive)
  /// - 'X:*': depends on group 'X' not being empty (Hive)
  static Future<bool> checkDependency(
    String depends, {
    bool sensitive = false,
  }) async {
    if (sensitive) {
      final value = await toplv.secureStorage.read(key: depends);
      return value != null;
    }
    if (depends.startsWith('ENCRYPTED:')) {
      final key = depends.substring('ENCRYPTED:'.length);
      final value = await toplv.secureStorage.read(key: key);
      return value != null;
    } else if (depends.contains(':')) {
      final parts = depends.split(':');
      if (parts.length != 2) return false;
      final group = parts[0];
      final key = parts[1];
      final box = await toplv.getCollectionBox(group);
      if (key == '*') {
        return box.isNotEmpty;
      } else {
        return box.containsKey(key);
      }
    }
    return false;
  }
}
