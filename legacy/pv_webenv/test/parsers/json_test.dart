import 'package:flutter_test/flutter_test.dart';
import 'package:pv_webenv/parsers/json.dart';

void main() {
  group('JSONParser', () {
    late JSONParser parser;

    setUp(() {
      parser = JSONParser();
    });

    test('should parse simple JSON object', () {
      final lines = ['{', '  "key1": "value1",', '  "key2": "value2"', '}'];

      final result = parser.parse(lines);

      expect(result, {'key1': 'value1', 'key2': 'value2'});
    });

    test('should parse JSON with nested objects', () {
      final lines = [
        '{',
        '  "database": {',
        '    "host": "localhost",',
        '    "port": 5432',
        '  },',
        '  "api_key": "secret123"',
        '}',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'database': {'host': 'localhost', 'port': 5432},
        'api_key': 'secret123',
      });
    });

    test('should parse JSON with arrays', () {
      final lines = [
        '{',
        '  "servers": ["server1", "server2", "server3"],',
        '  "ports": [8080, 8081, 8082]',
        '}',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'servers': ['server1', 'server2', 'server3'],
        'ports': [8080, 8081, 8082],
      });
    });

    test('should ignore comment lines starting with //', () {
      final lines = [
        '// This is a comment',
        '{',
        '  // Another comment',
        '  "key1": "value1",',
        '  "key2": "value2"',
        '  // Final comment',
        '}',
      ];

      final result = parser.parse(lines);

      expect(result, {'key1': 'value1', 'key2': 'value2'});
    });

    test('should ignore empty lines', () {
      final lines = [
        '',
        '{',
        '  "key1": "value1",',
        '',
        '  "key2": "value2"',
        '',
        '}',
      ];

      final result = parser.parse(lines);

      expect(result, {'key1': 'value1', 'key2': 'value2'});
    });

    test('should handle single line JSON', () {
      final lines = ['{"key1": "value1", "key2": "value2"}'];

      final result = parser.parse(lines);

      expect(result, {'key1': 'value1', 'key2': 'value2'});
    });

    test('should handle different data types', () {
      final lines = [
        '{',
        '  "string_value": "hello",',
        '  "number_value": 42,',
        '  "boolean_value": true,',
        '  "null_value": null,',
        '  "float_value": 3.14',
        '}',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'string_value': 'hello',
        'number_value': 42,
        'boolean_value': true,
        'null_value': null,
        'float_value': 3.14,
      });
    });

    test('should handle complex nested structure', () {
      final lines = [
        '{',
        '  "app": {',
        '    "name": "MyApp",',
        '    "version": "1.0.0",',
        '    "features": ["auth", "api", "database"],',
        '    "config": {',
        '      "debug": true,',
        '      "timeout": 30',
        '    }',
        '  }',
        '}',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'app': {
          'name': 'MyApp',
          'version': '1.0.0',
          'features': ['auth', 'api', 'database'],
          'config': {'debug': true, 'timeout': 30},
        },
      });
    });

    test('should handle empty JSON object', () {
      final lines = ['{}'];

      final result = parser.parse(lines);

      expect(result, isEmpty);
    });

    test('should throw FormatException for invalid JSON', () {
      final lines = [
        '{',
        '  "key1": "value1"',
        '  "key2": "value2"', // Missing comma
        '}',
      ];

      expect(() => parser.parse(lines), throwsA(isA<FormatException>()));
    });

    test('should throw FormatException for malformed JSON', () {
      final lines = ['not a json at all'];

      expect(() => parser.parse(lines), throwsA(isA<FormatException>()));
    });

    test('should handle JSON with comments and empty lines mixed', () {
      final lines = [
        '// Configuration file',
        '',
        '{',
        '  // Server settings',
        '  "server": {',
        '    "host": "localhost",',
        '    // Default port',
        '    "port": 3000',
        '  },',
        '',
        '  // API settings',
        '  "api": {',
        '    "version": "v1"',
        '  }',
        '',
        '}',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'server': {'host': 'localhost', 'port': 3000},
        'api': {'version': 'v1'},
      });
    });
  });
}
