import 'package:pv_cache/src/core/config.dart';

class Encrypted extends PVCacheEnvConfig {
  Encrypted({
    super.defaultGet = true,
    super.defaultSet = true,
    super.defaultDelete = true,
  }) : super(
          useSecureMeta: true, // Always use secure storage for metadata
        );

  @override
  Future<bool> isValid(String key) async {
    // Check if item has expired using encrypted metadata
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
      // Check if item is valid (not expired)
      final isValid = await this.isValid(key);
      if (!isValid) {
        await invalidCleanup(key);
        return null; // Return null to indicate expired/invalid
      }
      return originalValue; // Return original value if valid
    } else {
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
    // No additional post-processing needed
  }

  @override
  Future<void> postDelete(String key) async {
    // No additional post-processing needed
  }
}
