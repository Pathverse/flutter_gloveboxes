import 'package:pvcache/pvcache.dart';
import 'package:pvcache_secrets/templates/storage/encrypted.dart';

/// A specialized encrypted storage class that can serve as both main storage and metadata storage.
///
/// This class extends [Encrypted] and mixes in [MetadataStorage], allowing it to be used
/// as both the `storage` and `metaStorage` parameters in PVCache configuration.
///
/// Example usage in helper.dart:
/// ```dart
/// final encrypted = MetableEncrypted();
/// return PVCache(
///   storage: encrypted,      // Same instance for main storage
///   metaStorage: encrypted,  // Same instance for metadata storage
/// );
/// ```
///
/// This enables a unified encrypted storage solution where both data and metadata
/// are stored using the same secure storage backend, simplifying configuration
/// while maintaining encryption for all cache operations.
class MetableEncrypted extends Encrypted with MetadataStorage {
  @override
  bool get storageStrategyNested => false;
}
