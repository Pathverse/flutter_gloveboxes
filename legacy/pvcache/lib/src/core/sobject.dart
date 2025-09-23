import 'dart:convert';

import 'package:pvcache/src/core/toplv.dart';
import 'package:pvcache/src/utils/typecheck.dart';

abstract class PVCacheTypeAdapter {
  List<Type> get supportedTypes;
  int get typeId;

  PVSObject fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson(dynamic value);

  PVSObject serialize(dynamic value);
  bool get hasDeserialize => false;
  dynamic deserialize(PVSObject object);
}

final Map<int, PVCacheTypeAdapter> _typeAdapters = {};

class PVSObject {
  /// Register a type adapter for a specific type ID.
  /// This allows custom serialization and deserialization of complex objects.
  static void registerTypeAdapter(PVCacheTypeAdapter adapter) {
    if (adapter.typeId <= 1) {
      throw Exception('Type ID must be greater than 1 for custom adapters.');
    }

    if (_typeAdapters.containsKey(adapter.typeId)) {
      throw Exception(
        'Type adapter for typeId ${adapter.typeId} is already registered.',
      );
    }
    _typeAdapters[adapter.typeId] = adapter;
  }

  static PVCacheTypeAdapter? resolveTypeAdapter({int? typeId, dynamic value}) {
    if (typeId != null) {
      return _typeAdapters[typeId];
    } else if (value != null) {
      var valueType = value.runtimeType;
      for (var adapter in _typeAdapters.values) {
        if (adapter.supportedTypes.contains(valueType)) {
          return adapter;
        }
      }
    }
    return null;
  }

  // serializable object
  final dynamic rawValue;
  final String? jsonString;
  final int typeId;

  // internal constructor
  PVSObject.internal({required this.rawValue, String? jsonString, int? typeId})
    : typeId = typeId ?? (simpleValue(rawValue) ? 0 : 1),
      jsonString =
          jsonString ??
          (simpleValue(rawValue) ? null : _encodeToJson(rawValue));

  static String? _encodeToJson(dynamic value) {
    try {
      return jsonEncode(value);
    } catch (e) {
      throw Exception('Failed to encode object to JSON: $e');
    }
  }

  factory PVSObject.fromJson(Map<String, dynamic> map) {
    int? typeId;
    if (map.containsKey('typeId')) {
      typeId = map['typeId'] as int?;
    }

    if (typeId != null && _typeAdapters.containsKey(typeId)) {
      // Use the registered type adapter to deserialize
      var adapter = _typeAdapters[typeId]!;
      return adapter.fromJson(map);
    }

    // Deserialize from JSON
    dynamic raw;
    if (map.containsKey('raw')) {
      raw = map['raw'];
    }

    if (!map.containsKey("json") && raw == null) {
      throw Exception('PVSObject must have either raw or json field.');
    }

    var jsonstring = map['json'] as String?;
    // if no jsonstring, we assume we have a primitive value
    if (jsonstring == null) {
      typeId ??= 0; // default typeId for primitive values
      return PVSObject.internal(rawValue: raw, typeId: typeId);
    }
    // if json string provided and raw is null, we parse the json
    if (jsonstring.isNotEmpty) {
      try {
        raw = jsonDecode(jsonstring);
      } catch (e) {
        throw Exception('Failed to decode JSON: $e');
      }
    }
    typeId ??= 1; // default typeId for complex objects

    return PVSObject.internal(
      rawValue: raw,
      jsonString: jsonstring,
      typeId: typeId,
    );
  }

  factory PVSObject(dynamic value, {int? typeId}) {
    if (simpleValue(value)) {
      typeId ??= 0;
      return PVSObject.internal(rawValue: value, typeId: typeId);
    } else {
      var adapter = resolveTypeAdapter(typeId: typeId, value: value);
      if (adapter != null) {
        return adapter.serialize(value);
      }
      typeId ??= 1; // default typeId for complex objects
      return PVSObject.internal(rawValue: value, typeId: typeId);
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{"json": jsonString, "typeId": typeId};
    if (PVCacheTopLv.debugMode) {
      map['raw'] = rawValue;
    }
    return map;
  }

  dynamic get value {
    if (typeId == 0) {
      return rawValue; // primitive value
    }
    PVCacheTypeAdapter? adapter = resolveTypeAdapter(typeId: typeId);
    if (typeId == 1 || adapter == null || !adapter.hasDeserialize) {
      return jsonDecode(jsonString ?? jsonEncode(rawValue));
    }

    return adapter.deserialize(this);
  }
}
