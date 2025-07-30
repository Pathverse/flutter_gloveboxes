dynamic getMapValue(Map<String, dynamic> map, String path) {
  // Handle empty path
  if (path.isEmpty) {
    return map;
  }

  List<String> keys = path.split('/').where((key) => key.isNotEmpty).toList();
  dynamic value = map;

  for (int i = 0; i < keys.length; i++) {
    String key = keys[i];

    // Check if key is a numeric index for list access
    int? numericIndex = int.tryParse(key);

    // If current value is a list
    if (value is List) {
      if (numericIndex != null) {
        // Access specific index in the list
        if (numericIndex >= 0 && numericIndex < value.length) {
          value = value[numericIndex];
        } else {
          return null; // Index out of bounds
        }
      } else {
        // Extract the property from each object in the list
        List<dynamic> result = [];
        for (dynamic item in value) {
          if (item is Map<String, dynamic> && item.containsKey(key)) {
            result.add(item[key]);
          }
        }

        // Flatten the result if it contains lists (for nested arrays)
        List<dynamic> flattened = [];
        for (dynamic item in result) {
          if (item is List) {
            flattened.addAll(item);
          } else {
            flattened.add(item);
          }
        }

        value = flattened;
      }
    } else if (value is Map<String, dynamic>) {
      value = value[key];
    } else {
      // If value is neither List nor Map, return null
      return null;
    }

    // If we've reached the end of the path, return the value
    if (i == keys.length - 1) {
      return value;
    }
  }

  return value;
}

void setMapValue(Map<String, dynamic> map, String path, dynamic value) {
  List<String> keys = path.split('/').where((key) => key.isNotEmpty).toList();

  if (keys.isEmpty) {
    throw ArgumentError('Path cannot be empty');
  }

  // Navigate to the parent of the target key
  dynamic current = map;
  dynamic parent;
  dynamic parentKey;

  for (int i = 0; i < keys.length - 1; i++) {
    String key = keys[i];
    int? numericIndex = int.tryParse(key);

    if (numericIndex != null) {
      // Handle numeric index for list access
      if (current is! List) {
        // Check if current is a map with existing data
        if (current is Map<String, dynamic> && current.isNotEmpty) {
          throw ArgumentError(
            'Cannot convert non-empty map to list at path: ${keys.sublist(0, i + 1).join('/')}',
          );
        }
        // Create new list
        List<dynamic> newList = <dynamic>[];
        // Update the parent reference
        if (parent != null) {
          if (parent is List) {
            parent[parentKey] = newList;
          } else if (parent is Map<String, dynamic>) {
            parent[parentKey] = newList;
          }
        } else {
          // This is the root level
          map[keys[0]] = newList;
        }
        current = newList;
      }

      // Ensure the list is large enough
      while (current.length <= numericIndex) {
        current.add(null);
      }

      if (current[numericIndex] == null) {
        current[numericIndex] = <String, dynamic>{};
      }

      parent = current;
      parentKey = numericIndex;
      current = current[numericIndex];
    } else {
      // Handle string key for map access
      if (current is! Map<String, dynamic>) {
        if (current is List) {
          throw ArgumentError(
            'Cannot add string key to list at path: ${keys.sublist(0, i + 1).join('/')}',
          );
        }
        // Create new map
        Map<String, dynamic> newMap = <String, dynamic>{};
        // Update the parent reference
        if (parent != null) {
          if (parent is List) {
            parent[parentKey] = newMap;
          } else if (parent is Map<String, dynamic>) {
            parent[parentKey] = newMap;
          }
        } else {
          // This is the root level
          map[keys[0]] = newMap;
        }
        current = newMap;
      }

      // Only create a new map if the key doesn't exist
      if (current[key] == null) {
        current[key] = <String, dynamic>{};
      }

      parent = current;
      parentKey = key;
      current = current[key];
    }
  }

  // Set the final value
  String finalKey = keys.last;
  int? finalNumericIndex = int.tryParse(finalKey);

  if (finalNumericIndex != null) {
    // Handle numeric index for final assignment
    if (current is! List) {
      // Check if current is a map with existing data
      if (current is Map<String, dynamic> && current.isNotEmpty) {
        throw ArgumentError(
          'Cannot convert non-empty map to list at path: ${keys.join('/')}',
        );
      }
      // Create new list
      List<dynamic> newList = <dynamic>[];
      // Update the parent reference
      if (parent != null) {
        if (parent is List) {
          parent[parentKey] = newList;
        } else if (parent is Map<String, dynamic>) {
          parent[parentKey] = newList;
        }
      } else {
        // This is the root level
        map[keys[0]] = newList;
      }
      current = newList;
    }

    // Ensure the list is large enough
    while (current.length <= finalNumericIndex) {
      current.add(null);
    }

    current[finalNumericIndex] = value;
  } else {
    // Handle string key for final assignment
    if (current is! Map<String, dynamic>) {
      if (current is List) {
        throw ArgumentError(
          'Cannot add string key to list at path: ${keys.join('/')}',
        );
      }
      // Create new map
      Map<String, dynamic> newMap = <String, dynamic>{};
      // Update the parent reference
      if (parent != null) {
        if (parent is List) {
          parent[parentKey] = newMap;
        } else if (parent is Map<String, dynamic>) {
          parent[parentKey] = newMap;
        }
      } else {
        // This is the root level
        map[keys[0]] = newMap;
      }
      current = newMap;
    }

    current[finalKey] = value;
  }
}
