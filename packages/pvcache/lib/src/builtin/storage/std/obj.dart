import 'package:pvcache/src/core/sobject.dart';
import 'dart:convert';

class StdObject extends PVSObject {
  final Map<String, dynamic> metadata;

  StdObject._internal({
    required super.rawValue,
    super.jsonString,
    super.typeId,
    Map<String, dynamic>? metadata,
  }) : metadata = metadata ?? {},
       super.internal();

  factory StdObject(
    dynamic value, {
    int? typeId,
    Map<String, dynamic>? metadata,
  }) {
    return StdObject._internal(
      rawValue: value,
      typeId: typeId,
      metadata: metadata,
    );
  }

  factory StdObject.fromJson(Map<String, dynamic> map) {
    int? typeId;
    if (map.containsKey('typeId')) {
      typeId = map['typeId'] as int?;
    }
    dynamic raw = map['raw'];
    String? jsonString = map['json'] as String?;
    String? metadataString = map['metadata'] as String?;

    Map<String, dynamic>? metadata;
    if (metadataString != null && metadataString.isNotEmpty) {
      try {
        metadata = jsonDecode(metadataString) as Map<String, dynamic>;
      } catch (e) {
        metadata = {};
      }
    } else {
      metadata = {};
    }

    return StdObject._internal(
      rawValue: raw,
      jsonString: jsonString,
      typeId: typeId,
      metadata: metadata,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    var map = super.toJson();

    // Serialize metadata to JSON string
    try {
      map['metadata'] = jsonEncode(metadata);
    } catch (e) {
      map['metadata'] = '{}'; // Empty JSON object as fallback
    }

    return map;
  }
}
