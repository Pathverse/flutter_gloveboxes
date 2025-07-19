/// Custom loaders for data files (CSV, TXT, MD)
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Load and parse data files
Future<DataFile> loadDataFile(String assetPath) async {
  debugPrint('📄 Loading data file: $assetPath');

  try {
    final String content = await rootBundle.loadString(assetPath);
    final extension = assetPath.split('.').last.toLowerCase();
    final dataType = _getDataType(extension);

    return DataFile(
      path: assetPath,
      type: dataType,
      rawContent: content,
      parsedData: _parseDataContent(content, dataType),
      metadata: _generateDataMetadata(content, assetPath),
    );
  } catch (e) {
    debugPrint('❌ Failed to load data file: $assetPath - $e');
    rethrow;
  }
}

/// Load CSV data as structured table
Future<CsvData> loadCsvFile(String assetPath) async {
  debugPrint('📊 Loading CSV file: $assetPath');

  final content = await rootBundle.loadString(assetPath);
  final lines = content
      .split('\n')
      .where((line) => line.trim().isNotEmpty)
      .toList();

  if (lines.isEmpty) {
    return CsvData(path: assetPath, headers: [], rows: []);
  }

  final headers = _parseCsvLine(lines.first);
  final rows = lines.skip(1).map((line) => _parseCsvLine(line)).toList();

  return CsvData(
    path: assetPath,
    headers: headers,
    rows: rows,
    metadata: {
      'rowCount': rows.length,
      'columnCount': headers.length,
      'estimatedSize': content.length,
    },
  );
}

/// Load markdown with basic parsing
Future<MarkdownDocument> loadMarkdownFile(String assetPath) async {
  debugPrint('📝 Loading markdown file: $assetPath');

  final content = await rootBundle.loadString(assetPath);

  return MarkdownDocument(
    path: assetPath,
    content: content,
    structure: _parseMarkdownStructure(content),
    wordCount: _countWords(content),
    estimatedReadTime: _estimateReadTime(content),
  );
}

/// Load text file with encoding detection
Future<TextDocument> loadTextFile(String assetPath) async {
  debugPrint('📰 Loading text file: $assetPath');

  final content = await rootBundle.loadString(assetPath);

  return TextDocument(
    path: assetPath,
    content: content,
    lines: content.split('\n'),
    wordCount: _countWords(content),
    characterCount: content.length,
    encoding: 'utf-8', // Assumption for Flutter assets
  );
}

DataFileType _getDataType(String extension) {
  switch (extension) {
    case 'csv':
      return DataFileType.csv;
    case 'txt':
      return DataFileType.text;
    case 'md':
    case 'markdown':
      return DataFileType.markdown;
    default:
      return DataFileType.unknown;
  }
}

dynamic _parseDataContent(String content, DataFileType type) {
  switch (type) {
    case DataFileType.csv:
      return _parseCsvContent(content);
    case DataFileType.markdown:
      return _parseMarkdownStructure(content);
    case DataFileType.text:
      return content.split('\n');
    default:
      return content;
  }
}

List<List<String>> _parseCsvContent(String content) {
  return content
      .split('\n')
      .where((line) => line.trim().isNotEmpty)
      .map((line) => _parseCsvLine(line))
      .toList();
}

List<String> _parseCsvLine(String line) {
  final List<String> fields = [];
  final buffer = StringBuffer();
  bool inQuotes = false;

  for (int i = 0; i < line.length; i++) {
    final char = line[i];

    if (char == '"') {
      inQuotes = !inQuotes;
    } else if (char == ',' && !inQuotes) {
      fields.add(buffer.toString().trim());
      buffer.clear();
    } else {
      buffer.write(char);
    }
  }

  fields.add(buffer.toString().trim());
  return fields;
}

List<MarkdownSection> _parseMarkdownStructure(String content) {
  final sections = <MarkdownSection>[];
  final lines = content.split('\n');

  MarkdownSection? currentSection;
  final contentBuffer = StringBuffer();

  for (final line in lines) {
    if (line.startsWith('#')) {
      // Save previous section
      if (currentSection != null) {
        sections.add(
          currentSection.copyWith(content: contentBuffer.toString().trim()),
        );
        contentBuffer.clear();
      }

      // Start new section
      final level = line.indexOf(' ');
      final title = line.substring(level + 1).trim();
      currentSection = MarkdownSection(title: title, level: level, content: '');
    } else {
      contentBuffer.writeln(line);
    }
  }

  // Add final section
  if (currentSection != null) {
    sections.add(
      currentSection.copyWith(content: contentBuffer.toString().trim()),
    );
  }

  return sections;
}

Map<String, dynamic> _generateDataMetadata(String content, String path) {
  return {
    'fileSize': content.length,
    'lineCount': content.split('\n').length,
    'wordCount': _countWords(content),
    'fileName': path.split('/').last,
    'lastModified': DateTime.now().toIso8601String(),
  };
}

int _countWords(String text) {
  return text.split(RegExp(r'\s+')).where((word) => word.isNotEmpty).length;
}

Duration _estimateReadTime(String text) {
  const wordsPerMinute = 200; // Average reading speed
  final wordCount = _countWords(text);
  final minutes = (wordCount / wordsPerMinute).ceil();
  return Duration(minutes: minutes);
}

/// Data file with parsed content
class DataFile {
  final String path;
  final DataFileType type;
  final String rawContent;
  final dynamic parsedData;
  final Map<String, dynamic> metadata;

  const DataFile({
    required this.path,
    required this.type,
    required this.rawContent,
    required this.parsedData,
    required this.metadata,
  });

  @override
  String toString() =>
      'DataFile(path: $path, type: $type, size: ${rawContent.length})';
}

/// CSV data with headers and rows
class CsvData {
  final String path;
  final List<String> headers;
  final List<List<String>> rows;
  final Map<String, dynamic>? metadata;

  const CsvData({
    required this.path,
    required this.headers,
    required this.rows,
    this.metadata,
  });

  List<Map<String, String>> get records {
    return rows.map((row) {
      final record = <String, String>{};
      for (int i = 0; i < headers.length && i < row.length; i++) {
        record[headers[i]] = row[i];
      }
      return record;
    }).toList();
  }

  @override
  String toString() =>
      'CsvData(${headers.length} columns, ${rows.length} rows)';
}

/// Markdown document with structure
class MarkdownDocument {
  final String path;
  final String content;
  final List<MarkdownSection> structure;
  final int wordCount;
  final Duration estimatedReadTime;

  const MarkdownDocument({
    required this.path,
    required this.content,
    required this.structure,
    required this.wordCount,
    required this.estimatedReadTime,
  });

  @override
  String toString() =>
      'MarkdownDocument(${structure.length} sections, $wordCount words, ${estimatedReadTime.inMinutes}min read)';
}

/// Text document with basic analysis
class TextDocument {
  final String path;
  final String content;
  final List<String> lines;
  final int wordCount;
  final int characterCount;
  final String encoding;

  const TextDocument({
    required this.path,
    required this.content,
    required this.lines,
    required this.wordCount,
    required this.characterCount,
    required this.encoding,
  });

  @override
  String toString() => 'TextDocument(${lines.length} lines, $wordCount words)';
}

/// Markdown section
class MarkdownSection {
  final String title;
  final int level;
  final String content;

  const MarkdownSection({
    required this.title,
    required this.level,
    required this.content,
  });

  MarkdownSection copyWith({String? title, int? level, String? content}) {
    return MarkdownSection(
      title: title ?? this.title,
      level: level ?? this.level,
      content: content ?? this.content,
    );
  }

  @override
  String toString() => 'MarkdownSection(H$level: $title)';
}

enum DataFileType { csv, text, markdown, unknown }
