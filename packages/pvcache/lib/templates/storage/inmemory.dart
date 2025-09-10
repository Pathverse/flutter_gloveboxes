import 'package:pvcache/src/interface.dart';

/// Simple in-memory storage implementation for testing and basic usage.
///
/// Stores all cache data in a Map that exists only while the application
/// is running. Data is lost when the application restarts.
class InMemory extends PVBaseStorage with MetadataStorage{
  final Map<String, dynamic> _storage = {};

  /// Direct access to the internal storage map (for testing/debugging)
  Map<String, dynamic> get storage => _storage;

  @override
  Future<void> clear(PVCtx ctx) async {
    _storage.clear();
  }

  @override
  Future<void> delete(PVCtx ctx) async {
    _storage.remove(ctx.key);
  }

  @override
  Future<void> exists(PVCtx ctx) async {
    ctx.value = _storage.containsKey(ctx.key);
  }

  @override
  Future<void> get(PVCtx ctx) async {
    ctx.value = _storage[ctx.key];
  }

  @override
  Future<void> init(PVBaseCache cache) async {
    // No initialization needed for in-memory storage
  }

  @override
  Future<void> set(PVCtx ctx) async {
    _storage[ctx.key!] = ctx.value;
  }
}
