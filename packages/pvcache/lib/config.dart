import 'dart:collection';
import 'dart:convert';
import 'dart:math';
import 'package:pvcache/exceptions.dart';
import 'package:pvcache/core.dart' show PVCacheCore;

part 'adapters/std.dart';
part 'adapters/secure.dart';

class PVSerializer {
  Future<String> serialize(dynamic value) async {
    // if is list or map, convert to JSON string
    if (value is List || value is Map) {
      return jsonEncode(value);
    }

    return value.toString();
  }

  Future<dynamic> deserialize(String value) async {
    // if is list or map, convert from JSON string
    if (value.startsWith('[') || value.startsWith('{')) {
      return jsonDecode(value);
    }
    return value;
  }

  /// Generate a hash-based seeded ID using current timestamp
  String generateMetaId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = Random(timestamp);
    final randomPart = random.nextInt(999999).toString().padLeft(6, '0');
    return 'meta:${timestamp}_$randomPart';
  }

  /// Format secure meta storage: <meta:timestamp_id>{metaJson} -> actualDataKey
  String formatSecureMeta(Map<String, dynamic> meta, String actualDataKey) {
    final metaId = generateMetaId();
    final metaJson = jsonEncode(meta);
    return '<$metaId>{$metaJson} -> $actualDataKey';
  }

  /// Parse secure meta format to extract meta and actual data key
  (Map<String, dynamic> meta, String actualDataKey)? parseSecureMeta(
    String secureMetaValue,
  ) {
    // Pattern: <meta:timestamp_id>{metaJson} -> actualDataKey
    final pattern = RegExp(r'<meta:[^>]+>\{([^}]+)\} -> (.+)');
    final match = pattern.firstMatch(secureMetaValue);

    if (match != null) {
      try {
        final metaJson = match.group(1)!;
        final actualDataKey = match.group(2)!;
        final meta = Map<String, dynamic>.from(jsonDecode(metaJson));
        return (meta, actualDataKey);
      } catch (e) {
        return null;
      }
    }
    return null;
  }
}

final PVSerializer defaultSerializer = PVSerializer();

class PVCacheConfig {
  final String name;
  final bool secureMeta;
  final bool secureData;
  final Type? type;
  final bool isMap;
  late final String overwriteGet;
  late final String overwriteSet;
  late final String overwriteDelete;
  late final String overwriteClear;
  late final String overwriteMetaGet;
  late final String overwriteMetaSet;
  late final String overwriteMetaDelete;
  late final String overwriteMetaClear;
  final PVSerializer serializer;

  late final LinkedHashMap<String, PVAdapter> adapters;
  final Map<String, dynamic> defaultMeta;

  PVCacheConfig({
    required this.name,
    this.defaultMeta = const {},
    this.secureMeta = false,
    this.secureData = false,
    this.type,
    this.isMap = false,
    LinkedHashMap<String, PVAdapter>? adapters,
    String? overwriteGet,
    String? overwriteSet,
    String? overwriteDelete,
    String? overwriteClear,
    String? overwriteMetaGet,
    String? overwriteMetaSet,
    String? overwriteMetaDelete,
    String? overwriteMetaClear,
    PVSerializer? serializer,
    bool createDefaultAdapters = true,
  }) : serializer = serializer ?? defaultSerializer {
    // Auto-configure adapter overrides based on security settings
    final dataAdapter = secureData ? 'secure' : 'std';
    final metaAdapter = secureMeta ? 'secure' : 'std';

    this.overwriteGet = overwriteGet ?? dataAdapter;
    this.overwriteSet = overwriteSet ?? dataAdapter;
    this.overwriteDelete = overwriteDelete ?? dataAdapter;
    this.overwriteClear = overwriteClear ?? dataAdapter;
    this.overwriteMetaGet = overwriteMetaGet ?? metaAdapter;
    this.overwriteMetaSet = overwriteMetaSet ?? metaAdapter;
    this.overwriteMetaDelete = overwriteMetaDelete ?? metaAdapter;
    this.overwriteMetaClear = overwriteMetaClear ?? metaAdapter;

    // Auto-configure adapters based on security settings
    if (adapters != null) {
      this.adapters = LinkedHashMap<String, PVAdapter>.from(adapters);
    } else {
      this.adapters = LinkedHashMap<String, PVAdapter>();
    }

    if (createDefaultAdapters) {
      // Add default adapters if not already present
      this.adapters.putIfAbsent('std', () => StdAdapter());
      this.adapters.putIfAbsent('secure', () => SecureAdapter());
    }
  }

  // Helper methods to get designated adapters based on overwrite settings
  PVAdapter get getAdapter => adapters[overwriteGet]!;
  PVAdapter get setAdapter => adapters[overwriteSet]!;
  PVAdapter get deleteAdapter => adapters[overwriteDelete]!;
  PVAdapter get clearAdapter => adapters[overwriteClear]!;
  PVAdapter get metaGetAdapter => adapters[overwriteMetaGet]!;
  PVAdapter get metaSetAdapter => adapters[overwriteMetaSet]!;
  PVAdapter get metaDeleteAdapter => adapters[overwriteMetaDelete]!;
  PVAdapter get metaClearAdapter => adapters[overwriteMetaClear]!;

  // Direct storage helpers for internal adapter use (bypasses hooks and reserved name checks)
  Future<void> setMetaDirect(String key, Map<String, dynamic> metadata) async {
    final adapter = metaSetAdapter;
    await adapter.setMeta(key, metadata, this);
  }

  Future<Map<String, dynamic>> getMetaDirect(String key) async {
    try {
      final adapter = metaGetAdapter;
      final result = await adapter.getMeta(key, this);
      return Map<String, dynamic>.from(result);
    } catch (e) {
      return <String, dynamic>{};
    }
  }

  Future<void> deleteMetaDirect(String key) async {
    final adapter = metaDeleteAdapter;
    await adapter.deleteMeta(key, this);
  }
}

abstract class PVAdapter {
  bool get hasPreMethods => true;
  bool get hasPostMethods => false;

  Future<void> set(String key, dynamic value, PVCacheConfig config);
  Future<void> setMeta(String key, Map metadata, PVCacheConfig config);
  Future<dynamic> get(String key, PVCacheConfig config);
  Future<Map> getMeta(String key, PVCacheConfig config);
  Future<void> delete(String key, PVCacheConfig config);
  Future<void> deleteMeta(String key, PVCacheConfig config);
  Future<void> clear(PVCacheConfig config);
  Future<void> clearMeta(PVCacheConfig config);
  Future<void> init(PVCacheConfig config);

  Future<(dynamic value, bool shouldContinue)> preGet(
    String key,
    Map metadata,
    PVCacheConfig config,
  );
  Future<(dynamic value, bool shouldContinue)> preSet(
    String key,
    dynamic value,
    Map<String, dynamic>? metadata,
    PVCacheConfig config,
  );
  Future<bool> preDelete(String key, PVCacheConfig config);
  Future<void> postGet(String key, dynamic value, PVCacheConfig config);
  Future<void> postSet(String key, dynamic value, PVCacheConfig config);
  Future<void> postDelete(String key, PVCacheConfig config);
}
