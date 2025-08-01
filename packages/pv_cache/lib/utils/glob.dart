bool simpleGlob(String pattern, String value) {
  if (pattern.isEmpty || value.isEmpty) return false;

  if (pattern == '*') return true;

  if (!pattern.contains('*')) {
    return pattern == value;
  }

  // allow only one *
  if (pattern.split('*').length > 2) {
    throw Exception('Invalid pattern: $pattern');
  }

  if (pattern.startsWith('*') && value.endsWith(pattern.substring(1))) {
    return true;
  }

  if (pattern.endsWith('*') &&
      value.startsWith(pattern.substring(0, pattern.length - 1))) {
    return true;
  }

  // split pattern into 2
  final left = pattern.split('*')[0];
  final right = pattern.split('*')[1];

  if (left.isNotEmpty && !value.startsWith(left)) return false;

  if (right.isNotEmpty && !value.endsWith(right)) return false;

  return true;
}

List<String> collectAllPaths(Map<String, dynamic> map) {
  final result = <String>[];

  void traverse(List<String> pathSegments, dynamic currentValue) {
    if (currentValue is! Map<String, dynamic> && currentValue is! List) {
      result.add(pathSegments.join('/'));
      return;
    }

    if (currentValue is Map<String, dynamic>) {
      currentValue.forEach((k, v) {
        traverse([...pathSegments, k], v);
      });
    } else if (currentValue is List) {
      for (int i = 0; i < currentValue.length; i++) {
        traverse([...pathSegments, '$i'], currentValue[i]);
      }
    }
  }

  traverse([], map);
  return result;
}

List<String> getMapGlob(String pattern, Map<String, dynamic> map) {
  // Simple case: if pattern is just '*', collect all paths
  if (pattern == '*') {
    return collectAllPaths(map);
  }

  final result = <String>[];

  // Split the pattern into path segments for hierarchical matching
  final patternSegments = pattern.split('/');

  void traverse(
      List<String> pathSegments, dynamic currentValue, int patternIndex) {
    // If we've reached a leaf node (non-Map, non-List)
    if (currentValue is! Map<String, dynamic> && currentValue is! List) {
      // Check if we've matched all pattern segments
      if (patternIndex >= patternSegments.length) {
        result.add(pathSegments.join('/'));
      }
      return;
    }

    // If we've exhausted all pattern segments, stop
    if (patternIndex >= patternSegments.length) {
      return;
    }

    // Get the current pattern segment
    final currentPatternSegment = patternSegments[patternIndex];

    if (currentValue is Map<String, dynamic>) {
      currentValue.forEach((k, v) {
        // Check if this key matches the current pattern segment
        if (simpleGlob(currentPatternSegment, k)) {
          // If the pattern segment ends with *, we can continue matching deeper
          // or stop here if we've matched all segments
          if (currentPatternSegment.endsWith('*') &&
              patternIndex == patternSegments.length - 1) {
            // This is the last segment and it ends with *, so collect all leaves from here
            void collectLeavesFromHere(
                List<String> currentPath, dynamic value) {
              if (value is! Map<String, dynamic> && value is! List) {
                result.add(currentPath.join('/'));
                return;
              }
              // For Maps and Lists, add the path itself and also collect all leaves
              result.add(currentPath.join('/'));
              if (value is Map<String, dynamic>) {
                value.forEach((key, val) {
                  collectLeavesFromHere([...currentPath, key], val);
                });
              } else if (value is List) {
                for (int i = 0; i < value.length; i++) {
                  collectLeavesFromHere([...currentPath, '$i'], value[i]);
                }
              }
            }

            collectLeavesFromHere([...pathSegments, k], v);
          } else {
            traverse([...pathSegments, k], v, patternIndex + 1);
          }
        }
      });
    } else if (currentValue is List) {
      for (int i = 0; i < currentValue.length; i++) {
        final indexStr = '$i';
        // Check if this index matches the current pattern segment
        if (simpleGlob(currentPatternSegment, indexStr)) {
          // If the pattern segment ends with *, we can continue matching deeper
          // or stop here if we've matched all segments
          if (currentPatternSegment.endsWith('*') &&
              patternIndex == patternSegments.length - 1) {
            // This is the last segment and it ends with *, so collect all leaves from here
            void collectLeavesFromHere(
                List<String> currentPath, dynamic value) {
              if (value is! Map<String, dynamic> && value is! List) {
                result.add(currentPath.join('/'));
                return;
              }
              // For Maps and Lists, add the path itself and also collect all leaves
              result.add(currentPath.join('/'));
              if (value is Map<String, dynamic>) {
                value.forEach((key, val) {
                  collectLeavesFromHere([...currentPath, key], val);
                });
              } else if (value is List) {
                for (int i = 0; i < value.length; i++) {
                  collectLeavesFromHere([...currentPath, '$i'], value[i]);
                }
              }
            }

            collectLeavesFromHere([...pathSegments, indexStr], currentValue[i]);
          } else {
            traverse(
                [...pathSegments, indexStr], currentValue[i], patternIndex + 1);
          }
        }
      }
    }
  }

  // Special handling for patterns that start with * (like *e, *city)
  if (patternSegments.length == 1 && patternSegments[0].startsWith('*')) {
    void findMatchingLeaves(List<String> pathSegments, dynamic currentValue) {
      if (currentValue is! Map<String, dynamic> && currentValue is! List) {
        // Check if the full path matches the pattern
        final fullPath = pathSegments.join('/');
        if (simpleGlob(patternSegments[0], fullPath)) {
          result.add(fullPath);
        }
        return;
      }

      if (currentValue is Map<String, dynamic>) {
        currentValue.forEach((k, v) {
          findMatchingLeaves([...pathSegments, k], v);
        });
      } else if (currentValue is List) {
        for (int i = 0; i < currentValue.length; i++) {
          findMatchingLeaves([...pathSegments, '$i'], currentValue[i]);
        }
      }
    }

    findMatchingLeaves([], map);
    return result;
  }

  traverse([], map, 0);
  return result;
}
