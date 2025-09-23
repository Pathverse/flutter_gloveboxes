// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:hive_ce/hive.dart';
import 'package:pvcacher/utils/serialize.dart';

class StdObject {
  final dynamic rawValue;
  final String? jsonString;
  final bool isSimple;

  StdObject._internal({
    required this.rawValue,
    this.jsonString,
    required this.isSimple,
  });

  /// Create a StdObject from any value
  factory StdObject(dynamic value) {
    final isSimpleValue = simpleValue(value);

    if (isSimpleValue) {
      // Store simple values directly
      return StdObject._internal(rawValue: value, isSimple: true);
    } else {
      // Convert complex values to JSON
      final jsonStr = jsonify(value);
      return StdObject._internal(
        rawValue: value,
        jsonString: jsonStr,
        isSimple: false,
      );
    }
  }

  /// Create StdObject from JSON map
  factory StdObject.fromJson(Map<String, dynamic> map) {
    final isSimple = map['isSimple'] as bool? ?? false;

    if (isSimple) {
      // Simple value stored directly
      return StdObject._internal(rawValue: map['raw'], isSimple: true);
    } else {
      // Complex value stored as JSON string
      final jsonStr = map['json'] as String?;
      if (jsonStr == null) {
        throw Exception('Complex StdObject must have json field');
      }

      dynamic rawValue;
      try {
        rawValue = jsonDecode(jsonStr);
      } catch (e) {
        throw Exception('Failed to decode JSON: $e');
      }

      return StdObject._internal(
        rawValue: rawValue,
        jsonString: jsonStr,
        isSimple: false,
      );
    }
  }

  /// Convert to JSON map
  Map<String, dynamic> toJson() {
    if (isSimple) {
      return {'raw': rawValue, 'isSimple': true};
    } else {
      return {'json': jsonString, 'isSimple': false};
    }
  }

  dynamic toObject() {
    if (isSimple) {
      return rawValue;
    } else {
      return jsonDecode(jsonString!);
    }
  }

  /// Get the actual value
  dynamic get value => rawValue;
}

// Hive TypeAdapter for StdObject
class StdObjectAdapter extends TypeAdapter<StdObject> {
  @override
  final int typeId = 0;

  @override
  StdObject read(BinaryReader reader) {
    final map = reader.readMap().cast<String, dynamic>();
    return StdObject.fromJson(map);
  }

  @override
  void write(BinaryWriter writer, StdObject obj) {
    writer.writeMap(obj.toJson());
  }
}
