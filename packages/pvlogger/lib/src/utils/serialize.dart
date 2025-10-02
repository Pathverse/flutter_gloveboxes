import 'dart:convert';

const encoder = JsonEncoder.withIndent('\t');

bool simpleValue(dynamic value) {
  // Handle primitive types
  if (value is int || value is double || value is String || value is bool) {
    return true;
  }

  // Handle collections
  if (value is List || value is Set) {
    for (var item in value) {
      if (!simpleValue(item)) {
        return false;
      }
    }
    return true;
  }

  if (value is Map) {
    for (var entry in value.entries) {
      if (entry.key is! String || !simpleValue(entry.value)) {
        return false;
      }
    }
    return true;
  }

  // All other types are not simple
  return false;
}

String jsonify(dynamic value) {
  try {
    // First attempt: direct JSON encoding
    return encoder.convert(value);
  } catch (e) {
    // Fallback: handle complex objects by parsing components
    return encoder.convert(_makeJsonSafe(value));
  }
}

dynamic _makeJsonSafe(dynamic value) {
  // Handle null
  if (value == null) {
    return null;
  }

  // Handle primitive types
  if (value is int || value is String || value is bool) {
    return value;
  }

  // Handle special double cases
  if (value is double) {
    if (value.isInfinite || value.isNaN) {
      return value.toString();
    }
    return value;
  }

  // Handle List
  if (value is List) {
    return value.map((item) => _makeJsonSafe(item)).toList();
  }

  // Handle Set
  if (value is Set) {
    return value.map((item) => _makeJsonSafe(item)).toList();
  }

  // Handle Map
  if (value is Map) {
    final result = <String, dynamic>{};
    for (var entry in value.entries) {
      final key = entry.key.toString();
      result[key] = _makeJsonSafe(entry.value);
    }
    return result;
  }

  // For all other types, convert to string
  return value.toString();
}