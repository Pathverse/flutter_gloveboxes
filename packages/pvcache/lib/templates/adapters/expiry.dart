import 'package:pvcache/src/adapter.dart';
import 'package:pvcache/src/interface.dart';

/// TTL (Time To Live) adapter that automatically expires cached values.
///
/// This adapter implements automatic expiration of cache entries based on
/// metadata keys 'expiry' or 'ttl'. It requires metadata storage for
/// persistence of expiration data.
///
/// Usage:
/// ```dart
/// cache.set('key', 'value', metadata: {'ttl': 300}); // 5 minutes
/// cache.set('key2', 'value2', metadata: {'expiry': DateTime.now().add(Duration(hours: 1))});
/// ```
class ExpiryAdapter extends PVAdapter with ScopedMetadataKeys, PreGet, PostSet {
  ExpiryAdapter._internal(super.uid);

  factory ExpiryAdapter({String uid = "expiry-adapter"}) {
    // Check if PVAdapter already exists for this uid
    final existing = PVAdapter.getInstance(uid);
    if (existing != null && existing is ExpiryAdapter) {
      return existing;
    }

    // Create new instance
    return ExpiryAdapter._internal(uid);
  }

  @override
  List<String> get scopedMetadataKeys => ['expiry', 'ttl'];

  @override
  String get scopedMetadataKeysMatch => 'any'; // Either 'expiry' OR 'ttl'

  @override
  bool get allowSharedKeys => false; // Exclusive control over expiry/ttl keys

  @override
  int get onMetadataPriority => 0; // High priority for expiry processing

  @override
  int get preGetPriority => 0; // Check expiry before retrieving

  @override
  int get postSetPriority => 100; // Lower priority for storing expiry data

  @override
  void init(PVBaseCache cache) {
    if (cache.metaStorage == null) {
      throw Exception(
        'ExpiryAdapter ($uid) requires metadata storage for persistence of expiration data. '
        'This adapter cannot function without metadata storage. '
        'Please provide a metaStorage instance when creating the cache.',
      );
    }
  }

  @override
  Future<void> onMetadata(PVCtx ctx) async {
    // Validate and normalize expiry metadata
    final metadata = ctx.metadata;

    if (metadata.containsKey('ttl') && metadata.containsKey('expiry')) {
      throw ArgumentError(
        'Cannot specify both ttl and expiry. Use one or the other.',
      );
    }

    DateTime? expiryTime;

    if (metadata.containsKey('ttl')) {
      final ttl = metadata['ttl'];
      if (ttl is int) {
        expiryTime = DateTime.now().add(Duration(seconds: ttl));
      } else if (ttl is Duration) {
        expiryTime = DateTime.now().add(ttl);
      } else {
        throw ArgumentError('ttl must be an int (seconds) or Duration object');
      }
    } else if (metadata.containsKey('expiry')) {
      final expiry = metadata['expiry'];
      if (expiry is DateTime) {
        expiryTime = expiry;
      } else if (expiry is String) {
        expiryTime = DateTime.tryParse(expiry);
        if (expiryTime == null) {
          throw ArgumentError('expiry string must be a valid ISO 8601 date');
        }
      } else {
        throw ArgumentError(
          'expiry must be a DateTime object or ISO 8601 string',
        );
      }
    }

    if (expiryTime != null) {
      // Store normalized expiry time in adapter data
      final adapterData = ctx.getAdapterData(this);
      adapterData['expiryTime'] = expiryTime;

      // Validate expiry time is in the future
      if (expiryTime.isBefore(DateTime.now())) {
        throw ArgumentError('Expiry time must be in the future');
      }
    }
  }

  @override
  Future<void> preGet(PVCtx ctx) async {
    if (ctx.key == null || ctx.metaStorage == null) return;

    // Use MetadataStorage mixin to get expiry time
    final expiryValue = await ctx.metaStorage!.metaGet(ctx, 'expiry');

    if (expiryValue != null) {
      final expiryTime = DateTime.parse(expiryValue as String);

      if (DateTime.now().isAfter(expiryTime)) {
        // Key has expired - remove both data and expiry metadata
        await _removeExpiredKey(ctx);
        ctx.value = null; // Indicate key not found
        ctx.continueFlow = false; // Skip main get operation
      }
    }
  }

  @override
  Future<void> postSet(PVCtx ctx) async {
    if (ctx.key == null || ctx.metaStorage == null) return;

    final adapterData = ctx.getAdapterData(this);
    final expiryTime = adapterData['expiryTime'] as DateTime?;

    if (expiryTime != null) {
      // Use MetadataStorage mixin to store expiry metadata
      await ctx.metaStorage!.metaSet(
        ctx,
        'expiry',
        expiryTime.toIso8601String(),
      );
    }
  }

  /// Removes an expired key from both main storage and expiry metadata
  Future<void> _removeExpiredKey(PVCtx ctx) async {
    if (ctx.key == null || ctx.metaStorage == null || ctx.storage == null) {
      return;
    }

    // Remove main data - use the existing context
    await ctx.storage!.delete(ctx);

    // Remove expiry metadata using MetadataStorage mixin
    final minictx = PVCtx.minimal(ctx.key!);
    minictx.metaStorageCache = ctx.metaStorageCache;
    await ctx.metaStorage!.metaDelete(minictx, 'expiry');
  }

  /// Performs cleanup of all expired keys for a specific cache instance
  Future<int> cleanupExpiredKeys(PVBaseCache cache) async {
    if (cache.metaStorage == null) return 0;

    int cleanedCount = 0;
    final now = DateTime.now();

    // Note: This implementation assumes the storage backend supports key enumeration
    // For production use, you might need to maintain an index of expiry keys
    // or implement this based on your specific storage backend capabilities

    try {
      // Get all expiry keys (this would need to be implemented based on storage type)
      final expiryKeys = await _getAllExpiryKeys(cache.metaStorage!);

      for (final expiryKey in expiryKeys) {
        // Use minimal context for metadata operations
        final checkCtx = PVCtx.minimal(expiryKey);
        final expiryValue = await cache.metaStorage!.metaGet(
          checkCtx,
          'expiry',
        );

        if (expiryValue != null) {
          final expiryTime = DateTime.parse(expiryValue as String);

          if (now.isAfter(expiryTime)) {
            // Create context for cleanup - this represents the original key
            final cleanupCtx = PVCtx(
              key: expiryKey,
              initialValue: null,
              metadata: const {},
              storage: cache.storage,
              metaStorage: cache.metaStorage,
            );

            await _removeExpiredKey(cleanupCtx);
            cleanedCount++;
          }
        }
      }
    } catch (e) {
      // Log cleanup errors but don't throw to avoid breaking normal operations
    }

    return cleanedCount;
  }

  /// Gets all expiry keys from metadata storage
  /// This is a placeholder that needs implementation based on storage backend
  Future<List<String>> _getAllExpiryKeys(PVBaseStorage metaStorage) async {
    // This would need to be implemented based on the storage backend's capabilities
    // For example, if using InMemory storage, you could access the keys directly
    // For database storage, you might query for keys with 'expiry:' prefix

    // For now, return empty list - real implementation would depend on storage type
    return [];
  }
}
