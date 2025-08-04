bool simplePatternMatch(String pattern, String value) {
  // count number of * in pattern
  int count = pattern.split('*').length - 1;
  bool contained = count >= 1;
  if (count > 1) {
    return false; // More than one wildcard is not supported
  }
  if (!contained) {
    return value == pattern;
  }

  // split pattern by *
  final index = pattern.indexOf('*');
  final start = pattern.substring(0, index);
  final end = pattern.substring(index + 1);

  if (start.isEmpty && end.isEmpty) {
    return true; // Pattern is just a wildcard
  }

  if (start.isEmpty) {
    return value.endsWith(end); // Pattern starts with a wildcard
  }

  if (end.isEmpty) {
    return value.startsWith(start); // Pattern ends with a wildcard
  }

  // Pattern has both start and end parts
  return value.startsWith(start) && value.endsWith(end);
}

dynamic deepGet(Map<String, dynamic> map, String key) {
  final parts = key.split('/');
  dynamic current = map;

  for (final part in parts) {
    if (current is Map<String, dynamic> && current.containsKey(part)) {
      current = current[part];
    } else {
      return null; // Key not found
    }
  }

  return current;
}

void deepSet(Map<String, dynamic> map, String key, dynamic value) {
  final parts = key.split('/');
  Map<String, dynamic> current = map;

  for (int i = 0; i < parts.length - 1; i++) {
    final part = parts[i];
    if (!current.containsKey(part)) {
      current[part] = {};
    }
    current = current[part] as Map<String, dynamic>;
  }

  current[parts.last] = value;
}

// function to iter all nested keys (non-recursive)
Iterable<String> nestedKeys(Map<String, dynamic> map, String currentKey) sync* {
  final stack = <MapEntry<Map<String, dynamic>, String>>[];
  stack.add(MapEntry(map, currentKey));

  while (stack.isNotEmpty) {
    final entry = stack.removeLast();
    final currentMap = entry.key;
    final prefix = entry.value;

    for (final key in currentMap.keys) {
      final fullKey = prefix.isEmpty ? key : '$prefix/$key';
      yield fullKey;
      final value = currentMap[key];
      if (value is Map<String, dynamic>) {
        stack.add(MapEntry(value, fullKey));
      } else if (value is List) {
        for (final item in value) {
          if (item is Map<String, dynamic>) {
            stack.add(MapEntry(item, fullKey));
          }
        }
      }
    }
  }
}

Map<String, dynamic> extractFromMap(
  Map<String, dynamic> map,
  List<String> patterns,
) {
  final results = <String, dynamic>{};

  for (final key in nestedKeys(map, '')) {
    if (patterns.any((pattern) => simplePatternMatch(pattern, key))) {
      final value = deepGet(map, key);
      if (value != null) {
        results[key] = value;
      }
    }
  }

  return results;
}
