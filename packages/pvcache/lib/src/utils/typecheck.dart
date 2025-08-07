

bool isMapNested(Map map) {
  for (final value in map.values) {
    if (value is Map || value is List) {
      return true;
    }
  }
  return false;
}

bool isListNested(List list) {
  for (final value in list) {
    if (value is Map || value is List) {
      return true;
    }
  }
  return false;
}

bool simpleType(dynamic value) {
  return value is String || value is int || value is double || value is bool;
}

bool simpleList(dynamic value) {
  if (value is List) {
    return value.every(simpleType);
  }
  return false;
}

bool simpleMap(dynamic value) {
  if (value is Map) {
    return value.values.every(simpleType);
  }
  return false;
}

bool simpleValue(dynamic value) {
  return simpleType(value) || simpleList(value) || simpleMap(value);
}
