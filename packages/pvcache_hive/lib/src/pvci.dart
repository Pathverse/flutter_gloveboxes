import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import 'hboxcore.dart' as hboxcore;

class PVCoDecryptionException implements Exception {
  final String message;
  PVCoDecryptionException(this.message);

  @override
  String toString() => message;
}

class PVCoore {
  static final Map<int, Map Function(dynamic)> _serializerRegistry = {};
  static final Map<int, dynamic Function(Map)> _deserializerRegistry = {};
  static final Map<int, bool Function(dynamic)> _typeCheckRegistry = {};

  static void registerTypeChecker(
    int typeCode,
    bool Function(dynamic) typeChecker,
  ) {
    if (typeCode < 10 || typeCode > 999) {
      throw ArgumentError(
        'Invalid typeCode $typeCode. It must be between 10 and 999.',
      );
    }

    if (_typeCheckRegistry.containsKey(typeCode)) {
      throw ArgumentError(
        'Type checker for typeCode $typeCode is already registered.',
      );
    }

    _typeCheckRegistry[typeCode] = typeChecker;
  }

  static void registerSerializer(
    int typeCode,
    Map Function(dynamic) serializer,
  ) {
    if (typeCode < 10 || typeCode > 999) {
      throw ArgumentError(
        'Invalid typeCode $typeCode. It must be between 10 and 999.',
      );
    }

    if (_serializerRegistry.containsKey(typeCode)) {
      throw ArgumentError(
        'Serializer for typeCode $typeCode is already registered.',
      );
    }

    _serializerRegistry[typeCode] = serializer;
  }

  static void registerDeserializer(
    int typeCode,
    dynamic Function(Map) deserializer,
  ) {
    if (typeCode < 10 || typeCode > 999) {
      throw ArgumentError(
        'Invalid typeCode $typeCode. It must be between 10 and 999.',
      );
    }

    if (_deserializerRegistry.containsKey(typeCode)) {
      throw ArgumentError(
        'Deserializer for typeCode $typeCode is already registered.',
      );
    }

    _deserializerRegistry[typeCode] = deserializer;
  }

  static (Map Function(dynamic), dynamic Function(Map)) _getSerialDefs(
    int typeCode,
  ) {
    final serializer = _serializerRegistry[typeCode];
    final deserializer = _deserializerRegistry[typeCode];

    if (serializer == null || deserializer == null) {
      throw ArgumentError(
        'No serializer/deserializer registered for typeCode $typeCode.',
      );
    }

    return (serializer, deserializer);
  }
}

class PVCo {
  late final int typeCode;
  final dynamic data;

  factory PVCo(
    dynamic data, {
    int tCode = -1,
    bool allowDefaultAssignment = true,
  }) {
    if (data is PVCo) {
      return data;
    }
    return PVCo._internal(
      data,
      tCode: tCode,
      allowDefaultAssignment: allowDefaultAssignment,
    );
  }

  PVCo._internal(
    this.data, {
    int tCode = -1,
    bool allowDefaultAssignment = true,
  }) {
    if (tCode == -1) {
      if (data is ByteData) {
        tCode = 1;
      } else if (data is String ||
          data is num ||
          data is bool ||
          data is List ||
          data is Map ||
          data == null) {
        tCode = 0;
      }
    }

    if (tCode == -1) {
      // auto detect typeCode
      int detectedTypeCode = -1;
      PVCoore._typeCheckRegistry.forEach((code, checker) {
        if (checker(data)) {
          detectedTypeCode = code;
        }
      });

      if (detectedTypeCode == -1) {
        throw ArgumentError(
          'Cannot auto-detect typeCode for data of type ${data.runtimeType}. '
          'Please provide a valid typeCode.',
        );
      }
      tCode = detectedTypeCode;
    }

    if (tCode < 0 || tCode > 999) {
      throw ArgumentError(
        'Invalid typeCode $tCode. It must be between 0 and 999.',
      );
    }

    typeCode = tCode;
  }

  Map _builtinTypecodeHandle() {
    if (typeCode == 0) {
      final hiveCipher = hboxcore.getHiveCipher();
      if (hiveCipher != null) {
        return {
          'typeCode': 0,
          'data': hiveCipher.encryptString(jsonEncode(data)),
        };
      }
      return {'typeCode': 0, 'data': jsonEncode(data)};
    } else if (typeCode == 1 && data is ByteData) {
      return {
        'typeCode': 1,
        'data': base64Encode((data as ByteData).buffer.asUint8List()),
      };
    }

    throw UnimplementedError('Builtin typeCode $typeCode not implemented.');
  }

  Map toJson() {
    late final result;
    if (typeCode < 10) {
      result = _builtinTypecodeHandle();
    } else {
      final (serializer, _) = PVCoore._getSerialDefs(typeCode);
      result = {'typeCode': typeCode, 'data': serializer(data)};
    }

    if (kDebugMode) {
      try {
        jsonEncode(data);
        result['__raw'] = data;
      } catch (e) {

      }
    }
    return result;
  }

  static PVCo _builtinTypecodeDecode(Map json) {
    final typeCode = json['typeCode'] as int? ?? 0;
    if (typeCode == 0) {
      final hiveCipher = hboxcore.getHiveCipher();
      if (hiveCipher != null) {
        late final String decrypted;
        try {
          decrypted = hiveCipher.decryptString(json['data'] as String);
        } catch (e) {
          throw PVCoDecryptionException(
            'Failed to decrypt data with HiveCipher',
          );
        }
        return PVCo(jsonDecode(decrypted), tCode: 0);
      }
      return PVCo(jsonDecode(json['data'] as String), tCode: 0);
    } else if (typeCode == 1) {
      final bytes = base64Decode(json['data'] as String);
      return PVCo(ByteData.view(Uint8List.fromList(bytes).buffer), tCode: 1);
    }

    throw UnimplementedError('Builtin typeCode $typeCode not implemented.');
  }

  static PVCo fromJson(Map json) {
    final typeCode = json['typeCode'] as int? ?? 0;
    final data = json['data'];

    if (typeCode < 10) {
      return _builtinTypecodeDecode(json);
    }

    final (_, deserializer) = PVCoore._getSerialDefs(typeCode);
    return PVCo(deserializer(data as Map), tCode: typeCode);
  }
}
