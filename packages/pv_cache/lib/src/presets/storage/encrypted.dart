import 'package:pv_cache/src/core/config.dart';

import '../../core/toplv.dart';

class Encrypted extends PVCacheEnvConfig {
  Encrypted({
    super.defaultGet = false, // Use custom logic for secure storage
    super.defaultSet = false, // Use custom logic for secure storage
    super.defaultDelete = false, // Use custom logic for secure storage
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
    // Delete from secure storage
    await PVCacheCentral.secureDelete(env: environmentName, key: key);
    await deleteMeta(key);
  }

  @override
  Future<dynamic> preGet(String key, dynamic originalValue) async {
    // Custom logic - get from secure storage
    final meta = await getMeta(key);
    if (meta == null) return null;

    final isValid = await this.isValid(key);
    if (!isValid) {
      await invalidCleanup(key);
      return null;
    }

    // Get from secure storage instead of regular storage
    return await PVCacheCentral.secureGet(env: environmentName, key: key);
  }

  @override
  Future<dynamic> preSet(
    String key,
    dynamic value,
    Map<String, dynamic>? metadata,
  ) async {
    // Store metadata if provided (including expiry)
    if (metadata != null) {
      await setMeta(key, metadata);
    }

    // Store value in secure storage
    await PVCacheCentral.secureSet(
        env: environmentName, key: key, value: value);

    // Return null to indicate we handled storage ourselves
    return null;
  }

  @override
  Future<void> preDelete(String key) async {
    // Delete from both secure storage and metadata
    await PVCacheCentral.secureDelete(env: environmentName, key: key);
    await deleteMeta(key);
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
