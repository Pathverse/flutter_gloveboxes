import 'package:flutter_test/flutter_test.dart';
import 'package:pv_webenv/parsers/toml.dart';

void main() {
  group('TOMLParser', () {
    late TOMLParser parser;

    setUp(() {
      parser = TOMLParser();
    });

    test('should parse simple key-value pairs', () {
      final lines = ['key1 = "value1"', 'key2 = "value2"', 'key3 = value3'];

      final result = parser.parse(lines);

      expect(result, {'key1': 'value1', 'key2': 'value2', 'key3': 'value3'});
    });

    test('should parse sections', () {
      final lines = [
        '[database]',
        'host = "localhost"',
        'port = 5432',
        'ssl_enabled = true',
        '',
        '[api]',
        'key = "secret123"',
        'version = "v1"',
        'timeout = 30.5',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'database': {'host': 'localhost', 'port': 5432, 'ssl_enabled': true},
        'api': {'key': 'secret123', 'version': 'v1', 'timeout': 30.5},
      });
    });

    test('should parse nested sections', () {
      final lines = [
        '[app.database]',
        'host = "localhost"',
        'port = 5432',
        'ssl_enabled = true',
        '',
        '[app.api]',
        'key = "secret123"',
        'timeout = 30.0',
        'debug = false',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'app': {
          'database': {'host': 'localhost', 'port': 5432, 'ssl_enabled': true},
          'api': {'key': 'secret123', 'timeout': 30.0, 'debug': false},
        },
      });
    });

    test('should ignore empty lines and comments', () {
      final lines = [
        '# This is a comment',
        'key1 = "value1"',
        '',
        '# Another comment',
        '[section]',
        '# Section comment',
        'key2 = "value2"',
        '',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'key1': 'value1',
        'section': {'key2': 'value2'},
      });
    });

    test('should handle values with both single and double quotes', () {
      final lines = [
        'key1 = "double quoted"',
        'key2 = \'single quoted\'',
        'key3 = unquoted',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'key1': 'double quoted',
        'key2': 'single quoted',
        'key3': 'unquoted',
      });
    });

    test('should handle keys and values with spaces', () {
      final lines = [
        ' key1 = " value with spaces " ',
        'key2= value2',
        ' key3 =value3 ',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'key1': ' value with spaces ',
        'key2': 'value2',
        'key3': 'value3',
      });
    });

    test('should handle sections with spaces', () {
      final lines = [
        '[ section with spaces ]',
        'key1 = "value1"',
        '',
        '[another.section]',
        'key2 = "value2"',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'section with spaces': {'key1': 'value1'},
        'another': {
          'section': {'key2': 'value2'},
        },
      });
    });

    test('should ignore lines without equals sign', () {
      final lines = [
        'key1 = "value1"',
        'invalid line without equals',
        '[section]',
        'key2 = "value2"',
        'another invalid line',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'key1': 'value1',
        'section': {'key2': 'value2'},
      });
    });

    test('should handle multiple equals signs in value', () {
      final lines = ['key1 = "value=with=equals"', 'key2 = "normal value"'];

      final result = parser.parse(lines);

      expect(result, {'key1': 'value=with=equals', 'key2': 'normal value'});
    });

    test('should handle empty values', () {
      final lines = ['key1 = ""', 'key2 = \'\'', 'key3 = '];

      final result = parser.parse(lines);

      expect(result, {'key1': '', 'key2': '', 'key3': ''});
    });

    test('should handle complex nested structure', () {
      final lines = [
        '# Application configuration',
        'app_name = "MyApp"',
        'version = "1.0.0"',
        'debug_mode = true',
        'max_retries = 3',
        'timeout_seconds = 30.5',
        '',
        '[database]',
        'host = "localhost"',
        'port = 5432',
        'name = "mydb"',
        'ssl_enabled = false',
        '',
        '[database.credentials]',
        'username = "admin"',
        'password = "secret"',
        '',
        '[api.v1]',
        'endpoint = "/api/v1"',
        'timeout = 30',
        'enabled = true',
        '',
        '[api.v2]',
        'endpoint = "/api/v2"',
        'timeout = 60',
        'enabled = false',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'app_name': 'MyApp',
        'version': '1.0.0',
        'debug_mode': true,
        'max_retries': 3,
        'timeout_seconds': 30.5,
        'database': {
          'host': 'localhost',
          'port': 5432,
          'name': 'mydb',
          'ssl_enabled': false,
          'credentials': {'username': 'admin', 'password': 'secret'},
        },
        'api': {
          'v1': {'endpoint': '/api/v1', 'timeout': 30, 'enabled': true},
          'v2': {'endpoint': '/api/v2', 'timeout': 60, 'enabled': false},
        },
      });
    });

    test('should handle empty input', () {
      final result = parser.parse([]);
      expect(result, isEmpty);
    });

    test('should handle only comments and empty lines', () {
      final lines = ['# Comment 1', '', '# Comment 2', '   ', '# Comment 3'];

      final result = parser.parse(lines);
      expect(result, isEmpty);
    });

    test('should handle sections without content', () {
      final lines = ['[section1]', '[section2]', 'key1 = "value1"'];

      final result = parser.parse(lines);

      expect(result, {
        'section1': {},
        'section2': {'key1': 'value1'},
      });
    });

    test('should overwrite keys in same section', () {
      final lines = [
        '[section]',
        'key1 = "first_value"',
        'key1 = "second_value"',
        'key2 = "value2"',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'section': {'key1': 'second_value', 'key2': 'value2'},
      });
    });

    test('should handle different data types', () {
      final lines = [
        'string_value = "hello world"',
        'integer_value = 42',
        'float_value = 3.14',
        'boolean_true = true',
        'boolean_false = false',
        'unquoted_string = unquoted',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'string_value': 'hello world',
        'integer_value': 42,
        'float_value': 3.14,
        'boolean_true': true,
        'boolean_false': false,
        'unquoted_string': 'unquoted',
      });
    });

    test('should handle boolean values case insensitively', () {
      final lines = [
        'bool1 = TRUE',
        'bool2 = False',
        'bool3 = tRuE',
        'bool4 = FALSE',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'bool1': true,
        'bool2': false,
        'bool3': true,
        'bool4': false,
      });
    });

    test('should handle negative numbers', () {
      final lines = [
        'negative_int = -42',
        'negative_float = -3.14',
        'positive_int = +123',
        'positive_float = +2.71',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'negative_int': -42,
        'negative_float': -3.14,
        'positive_int': 123,
        'positive_float': 2.71,
      });
    });

    test('should handle mixed data types in sections', () {
      final lines = [
        '[database]',
        'host = "localhost"',
        'port = 5432',
        'ssl_enabled = true',
        'timeout = 30.5',
        '',
        '[app]',
        'debug = false',
        'max_connections = 100',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'database': {
          'host': 'localhost',
          'port': 5432,
          'ssl_enabled': true,
          'timeout': 30.5,
        },
        'app': {'debug': false, 'max_connections': 100},
      });
    });

    test('should handle edge cases with data types', () {
      final lines = [
        'zero_int = 0',
        'zero_float = 0.0',
        'large_number = 9223372036854775807', // Max long value
        'scientific_notation = 1.23e-4',
        'boolean_like_string = "true"',
        'number_like_string = "123"',
        'empty_quotes = ""',
        'space_in_quotes = " "',
        'mixed_case_bool = TrUe',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'zero_int': 0,
        'zero_float': 0.0,
        'large_number': 9223372036854775807,
        'scientific_notation': 1.23e-4,
        'boolean_like_string': 'true',
        'number_like_string': '123',
        'empty_quotes': '',
        'space_in_quotes': ' ',
        'mixed_case_bool': true,
      });
    });
  });
}
