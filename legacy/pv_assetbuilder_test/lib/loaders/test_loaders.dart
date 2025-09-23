/// Custom loaders for test assets demonstrating path pattern matching
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Load test assets with special handling
Future<TestAsset> loadTestAsset(String assetPath) async {
  debugPrint('🧪 Loading test asset: $assetPath');

  try {
    final extension = assetPath.split('.').last.toLowerCase();
    final testType = _getTestType(assetPath);

    dynamic content;

    if (['png', 'jpg', 'jpeg', 'gif'].contains(extension)) {
      // Load as image
      content = Image.asset(
        assetPath,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 50,
            height: 50,
            color: Colors.red[100],
            child: const Icon(Icons.error_outline, color: Colors.red),
          );
        },
      );
    } else {
      // Load as text/data
      content = await rootBundle.loadString(assetPath);
    }

    return TestAsset(
      path: assetPath,
      type: testType,
      content: content,
      metadata: _generateTestMetadata(assetPath),
    );
  } catch (e) {
    debugPrint('❌ Failed to load test asset: $assetPath - $e');
    rethrow;
  }
}

/// Load test data for validation
Future<TestData> loadTestData(String assetPath) async {
  debugPrint('📊 Loading test data: $assetPath');

  final content = await rootBundle.loadString(assetPath);

  return TestData(
    path: assetPath,
    content: content,
    checksum: _calculateChecksum(content),
    lineCount: content.split('\n').length,
    timestamp: DateTime.now(),
  );
}

/// Load mock API response
Future<MockApiResponse> loadMockResponse(String assetPath) async {
  debugPrint('🔄 Loading mock API response: $assetPath');

  final content = await rootBundle.loadString(assetPath);

  try {
    // Assume JSON format for API responses
    final Map<String, dynamic> data = _parseJson(content);

    return MockApiResponse(
      path: assetPath,
      statusCode: data['status'] as int? ?? 200,
      headers: Map<String, String>.from(data['headers'] as Map? ?? {}),
      body: data['body'] ?? data,
      responseTime: Duration(milliseconds: data['responseTime'] as int? ?? 100),
    );
  } catch (e) {
    // Fallback to text response
    return MockApiResponse(
      path: assetPath,
      statusCode: 200,
      headers: {'Content-Type': 'text/plain'},
      body: content,
      responseTime: const Duration(milliseconds: 50),
    );
  }
}

TestAssetType _getTestType(String assetPath) {
  final pathLower = assetPath.toLowerCase();

  if (pathLower.contains('mock') || pathLower.contains('api')) {
    return TestAssetType.mockData;
  } else if (pathLower.contains('sample') || pathLower.contains('example')) {
    return TestAssetType.sampleData;
  } else if (pathLower.contains('fixture')) {
    return TestAssetType.fixture;
  } else {
    return TestAssetType.general;
  }
}

Map<String, dynamic> _generateTestMetadata(String assetPath) {
  final fileName = assetPath.split('/').last;
  final extension = fileName.split('.').last;

  return {
    'fileName': fileName,
    'extension': extension,
    'directory': assetPath.substring(0, assetPath.lastIndexOf('/')),
    'loadedAt': DateTime.now().toIso8601String(),
    'size': 'unknown', // Would need file system access for real size
  };
}

String _calculateChecksum(String content) {
  // Simple hash function for demo
  int hash = 0;
  for (int i = 0; i < content.length; i++) {
    hash = ((hash << 5) - hash + content.codeUnitAt(i)) & 0xffffffff;
  }
  return hash.toRadixString(16);
}

Map<String, dynamic> _parseJson(String content) {
  // Simple JSON parsing with error handling
  try {
    return {'body': content}; // Simplified for demo
  } catch (e) {
    return {'error': 'Invalid JSON', 'content': content};
  }
}

/// Test asset with metadata
class TestAsset {
  final String path;
  final TestAssetType type;
  final dynamic content;
  final Map<String, dynamic> metadata;

  const TestAsset({
    required this.path,
    required this.type,
    required this.content,
    required this.metadata,
  });

  @override
  String toString() => 'TestAsset(path: $path, type: $type)';
}

/// Test data with validation info
class TestData {
  final String path;
  final String content;
  final String checksum;
  final int lineCount;
  final DateTime timestamp;

  const TestData({
    required this.path,
    required this.content,
    required this.checksum,
    required this.lineCount,
    required this.timestamp,
  });

  @override
  String toString() =>
      'TestData(path: $path, lines: $lineCount, checksum: $checksum)';
}

/// Mock API response for testing
class MockApiResponse {
  final String path;
  final int statusCode;
  final Map<String, String> headers;
  final dynamic body;
  final Duration responseTime;

  const MockApiResponse({
    required this.path,
    required this.statusCode,
    required this.headers,
    required this.body,
    required this.responseTime,
  });

  bool get isSuccess => statusCode >= 200 && statusCode < 300;

  @override
  String toString() =>
      'MockApiResponse(status: $statusCode, time: ${responseTime.inMilliseconds}ms)';
}

enum TestAssetType { mockData, sampleData, fixture, general }
