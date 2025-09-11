// Utility functions for extracting components from file paths
String _extractFilename(String path) {
  String cleanPath = path;

  if (cleanPath.startsWith('package:')) {
    cleanPath = cleanPath.substring(8);
  }

  cleanPath = cleanPath.replaceAll(RegExp(r':\d+:\d+$'), '');
  cleanPath = cleanPath.replaceAll(RegExp(r':\d+$'), '');

  if (cleanPath.contains('/')) {
    return cleanPath.split('/').last;
  }

  return cleanPath;
}

bool _isBuiltIn(String location) {
  return location.startsWith('dart:');
}

String? _extractPackageName(String location) {
  if (location.startsWith('package:')) {
    final parts = location.split(':');
    if (parts.length > 1) {
      final packagePart = parts[1];
      return packagePart.split('/').first;
    }
  }
  return null;
}

int _extractLineNumber(String location) {
  final parts = location.split(':');
  if (parts.length >= 3) {
    return int.tryParse(parts[parts.length - 2]) ?? 0;
  }
  return 0;
}

int _extractColumnNumber(String location) {
  final parts = location.split(':');
  if (parts.length >= 3) {
    return int.tryParse(parts.last) ?? 0;
  }
  return 0;
}

Set<String> _createFilterSignatures(
  String function,
  String location,
  String? packageName,
) {
  final filterSigSet = {"func:$function", "file:$location"};

  if (packageName != null) {
    filterSigSet.add("pkg:$packageName");
    filterSigSet.add("$packageName:$function");
    filterSigSet.add("$packageName:$location");
  }

  return filterSigSet;
}

// Simple parsing functions
String _parseFunction(String line) {
  // Extract function name from brackets
  final bracketMatch = RegExp(r'\[([^\]]+)\]').firstMatch(line);
  if (bracketMatch != null) {
    return bracketMatch.group(1)!;
  }

  // Traditional format: function (location)
  final traditionalMatch = RegExp(
    r'^(.+?)\s+\(([^)]+)\)',
  ).firstMatch(line.trim());
  if (traditionalMatch != null) {
    return traditionalMatch.group(1)!.trim();
  }

  // Hash format without brackets
  if (line.contains('#')) {
    final withoutPrefix = line.replaceFirst(RegExp(r'^#\d+\s+'), '');
    final locationEndMatch = RegExp(
      r'(\S+:\d+(?::\d+)?)\s+(.+)',
    ).firstMatch(withoutPrefix);
    if (locationEndMatch != null) {
      return locationEndMatch.group(2)!;
    }
  }

  // Fallback
  final parts = line.trim().split(RegExp(r'\s+'));
  return parts.length > 1 ? parts.sublist(1).join(' ') : 'unknown';
}

String _parseLocation(String line) {
  // Traditional format
  final traditionalMatch = RegExp(
    r'^(.+?)\s+\(([^)]+)\)',
  ).firstMatch(line.trim());
  if (traditionalMatch != null) {
    return traditionalMatch.group(2)!.trim();
  }

  // Hash format
  if (line.contains('#')) {
    final bracketMatch = RegExp(r'\[([^\]]+)\]').firstMatch(line);
    if (bracketMatch != null) {
      final beforeBracket = line.substring(0, bracketMatch.start).trim();
      final afterHash = beforeBracket.replaceFirst(RegExp(r'^#\d+\s+'), '');
      return afterHash.trim();
    } else {
      final withoutPrefix = line.replaceFirst(RegExp(r'^#\d+\s+'), '');
      final locationEndMatch = RegExp(
        r'(\S+:\d+(?::\d+)?)\s+(.+)',
      ).firstMatch(withoutPrefix);
      if (locationEndMatch != null) {
        return locationEndMatch.group(1)!;
      }
    }
  }

  // Fallback
  final parts = line.trim().split(RegExp(r'\s+'));
  return parts.isNotEmpty ? parts[0] : 'unknown';
}

// Cache management
final Map<String, StackTraceLine> _cache = {};
final int _maxCacheSize = 256;

StackTraceLine? _getFromCache(String key) {
  if (_cache.containsKey(key)) {
    return _cache[key];
  }

  try {
    if (_cache.length >= _maxCacheSize) {
      final oldestKey = _cache.keys.first;
      _cache.remove(oldestKey);
    }

    final line = StackTraceLine.fromString(key);
    _cache[key] = line;
    return line;
  } catch (e) {
    return null;
  }
}

class StackTraceLine {
  late final String function;
  late final String filePath;
  final bool builtIn;
  final String filename;
  final String? packageName;
  final int lineNumber;
  final int columnNumber;
  final String rawLine;
  final Set<String> _filterSignatures;

  Set<String> get filterSignatures => _filterSignatures.toSet();

  StackTraceLine({
    required String function,
    required String originalFilePath,
    required this.builtIn,
    required this.lineNumber,
    required this.columnNumber,
    required this.filename,
    required this.rawLine,
    required Set<String> filterSignatures,
    this.packageName,
  }) : _filterSignatures = filterSignatures {
    // need to trim stack number
    this.function = function.replaceFirst(RegExp(r'^#\d+\s+'), '');

    filePath = originalFilePath;
  }

  factory StackTraceLine.fromString(String line) {
    line = line.replaceAll('<anonymous closure>', '<a>');

    if (line.trim().isEmpty) {
      throw ArgumentError('Invalid stack trace line format: $line');
    }

    final function = _parseFunction(line);
    final location = _parseLocation(line);

    final builtIn = _isBuiltIn(location);
    final packageName = _extractPackageName(location);
    final lineNumber = _extractLineNumber(location);
    final columnNumber = _extractColumnNumber(location);
    final filterSigSet = _createFilterSignatures(
      function,
      location,
      packageName,
    );

    return StackTraceLine(
      function: function,
      originalFilePath: location,
      builtIn: builtIn,
      packageName: packageName,
      lineNumber: lineNumber,
      columnNumber: columnNumber,
      filename: _extractFilename(location),
      rawLine: line,
      filterSignatures: filterSigSet,
    );
  }

  static StackTraceLine? fromLine(StackTrace stackTrace, int lineNo) {
    final lines = stackTrace.toString().split('\n');
    if (lineNo < 0 || lineNo >= lines.length) {
      return null;
    }
    return _getFromCache(lines[lineNo]);
  }

  static List<StackTraceLine> fromStackTrace(StackTrace stackTrace) {
    final lines = stackTrace.toString().split('\n');

    List<StackTraceLine> stackTraceLines = lines
        .where((line) => line.trim().isNotEmpty)
        .map((line) => _getFromCache(line))
        .where((line) => line != null)
        .cast<StackTraceLine>()
        .toList();

    if (stackTraceLines.isEmpty && lines.isNotEmpty) {
      final firstLine = lines.firstWhere(
        (line) => line.trim().isNotEmpty,
        orElse: () => 'unknown',
      );
      try {
        stackTraceLines.add(
          StackTraceLine(
            function: 'unknown',
            originalFilePath: 'unknown',
            builtIn: false,
            lineNumber: 0,
            columnNumber: 0,
            filename: 'unknown',
            rawLine: firstLine,
            packageName: null,
            filterSignatures: {"func:unknown", "file:unknown"},
          ),
        );
      } catch (e) {
        // If even the fallback fails, ignore and return empty list
      }
    }

    return stackTraceLines;
  }

  factory StackTraceLine.empty() {
    return StackTraceLine(
      function: 'unknown',
      originalFilePath: 'unknown',
      builtIn: false,
      lineNumber: 0,
      columnNumber: 0,
      filename: 'unknown',
      rawLine: 'unknown',
      packageName: null,
      filterSignatures: {"func:unknown", "file:unknown"},
    );
  }

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.writeln('StackTraceLine {');
    buffer.writeln('  function: $function');
    buffer.writeln('  filePath: $filePath');
    buffer.writeln('  builtIn: $builtIn');
    buffer.writeln('  filename: $filename');
    buffer.writeln('  packageName: $packageName');
    buffer.writeln('  lineNumber: $lineNumber');
    buffer.writeln('  columnNumber: $columnNumber');
    buffer.write('}');
    return buffer.toString();
  }

  String toFormatted() {
    return '$function at $filePath:$lineNumber:$columnNumber';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! StackTraceLine) return false;

    return function == other.function &&
        filePath == other.filePath &&
        builtIn == other.builtIn &&
        packageName == other.packageName &&
        lineNumber == other.lineNumber &&
        columnNumber == other.columnNumber;
  }

  @override
  int get hashCode {
    return Object.hash(
      function,
      filePath,
      builtIn,
      packageName,
      lineNumber,
      columnNumber,
    );
  }
}

StackTrace createCurrentStack({int decrementLvs = 2}) {
  var stackTrace = StackTrace.current;
  var stackRealStr = stackTrace.toString();
  stackRealStr = stackRealStr.replaceAll('<anonymous closure>', '<a>');

  var stackReal = stackRealStr.split('\n');

  StackTrace stackTrace2 = StackTrace.fromString(
    stackReal.sublist(1 + decrementLvs).join('\n'),
  );
  return stackTrace2;
}

StackTrace subStack(int lv) {
  var stackTrace = StackTrace.current;
  var stackRealStr = stackTrace.toString();
  stackRealStr = stackRealStr.replaceAll('<anonymous closure>', '<a>');

  var stackReal = stackRealStr.split('\n');

  StackTrace stackTrace2 = StackTrace.fromString(
    stackReal.sublist(1 + lv).join('\n'),
  );
  return stackTrace2;
}

StackTraceLine getTop({int decrementLvs = 2}) {
  var stackTrace = createCurrentStack(decrementLvs: decrementLvs);
  var stackLines = StackTraceLine.fromStackTrace(stackTrace);
  return stackLines.isNotEmpty ? stackLines.first : StackTraceLine.empty();
}
