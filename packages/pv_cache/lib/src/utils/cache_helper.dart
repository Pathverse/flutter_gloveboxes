import 'package:pv_cache/src/core/options.dart';

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
}
