import 'package:pv_cache/src/core/config.dart';

class SimpleExpiry extends PVCacheEnvConfig {
  SimpleExpiry({
    super.defaultGet = true,
    super.defaultSet = true,
    super.defaultDelete = true,
  }) : super(storageType: PVCacheStorageType(name: "simple_expiry"));

  @override
  Future<bool> isValid(String key) async {
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
    if (defaultGet) {
      // When using default logic, just check expiry and return original value
      final isValid = await this.isValid(key);
      if (!isValid) {
        await invalidCleanup(key);
        return null; // Return null to indicate expired/invalid
      }
      return originalValue; // Return original value if valid
    } else {
      // Custom logic - handle everything ourselves
      // For example, we could implement custom caching logic here
      // like fetching from a different source if expired
      final meta = await getMeta(key);
      if (meta == null) return null;

      final isValid = await this.isValid(key);
      if (!isValid) {
        await invalidCleanup(key);
        // Could implement fallback logic here
        return null;
      }

      // Custom retrieval logic
      // This is just an example - you could implement any custom behavior
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
      // When using default logic, just store metadata if provided
      if (metadata != null) {
        await setMeta(key, metadata);
      }
      return value; // Return the value to be stored
    } else {
      // Custom logic - handle everything ourselves
      // For example, we could implement custom storage logic here
      if (metadata != null) {
        await setMeta(key, metadata);
      }

      // Custom processing logic
      // This is just an example - you could implement any custom behavior
      return value;
    }
  }

  @override
  Future<void> preDelete(String key) async {
    if (defaultDelete) {
      // When using default logic, just clean up metadata
      await deleteMeta(key);
    } else {
      // Custom logic - handle everything ourselves
      // For example, we could implement custom deletion logic here
      await deleteMeta(key);

      // Custom deletion logic
      // This is just an example - you could implement any custom behavior
    }
  }

  @override
  Future<void> postGet(String key, dynamic value) async {
    // No post-processing needed for get operations
  }

  @override
  Future<void> postSet(String key, dynamic value) async {
    // No post-processing needed for set operations
  }

  @override
  Future<void> postDelete(String key) async {
    // No post-processing needed for delete operations
  }
}
