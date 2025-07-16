import 'package:flutter_test/flutter_test.dart';
import 'package:pv_webenv/parsers/env.dart';

void main() {
  group('ENVParser', () {
    late ENVParser parser;

    setUp(() {
      parser = ENVParser();
    });

    test('should parse simple key-value pairs', () {
      final lines = ['KEY1=value1', 'KEY2=value2', 'KEY3=value3'];

      final result = parser.parse(lines);

      expect(result, {'KEY1': 'value1', 'KEY2': 'value2', 'KEY3': 'value3'});
    });

    test('should ignore empty lines', () {
      final lines = ['KEY1=value1', '', 'KEY2=value2', '   ', 'KEY3=value3'];

      final result = parser.parse(lines);

      expect(result, {'KEY1': 'value1', 'KEY2': 'value2', 'KEY3': 'value3'});
    });

    test('should ignore comment lines starting with #', () {
      final lines = [
        '# This is a comment',
        'KEY1=value1',
        '# Another comment',
        'KEY2=value2',
        '#KEY3=should_be_ignored',
      ];

      final result = parser.parse(lines);

      expect(result, {'KEY1': 'value1', 'KEY2': 'value2'});
    });

    test('should handle values with spaces', () {
      final lines = [
        'KEY1=value with spaces',
        'KEY2= value with leading space',
        'KEY3=value with trailing space ',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'KEY1': 'value with spaces',
        'KEY2': 'value with leading space',
        'KEY3': 'value with trailing space',
      });
    });

    test('should handle keys with spaces (trimmed)', () {
      final lines = [' KEY1 =value1', 'KEY2 =value2', ' KEY3=value3'];

      final result = parser.parse(lines);

      expect(result, {'KEY1': 'value1', 'KEY2': 'value2', 'KEY3': 'value3'});
    });

    test('should ignore lines without equals sign', () {
      final lines = [
        'KEY1=value1',
        'INVALID_LINE_NO_EQUALS',
        'KEY2=value2',
        'ANOTHER_INVALID',
      ];

      final result = parser.parse(lines);

      expect(result, {'KEY1': 'value1', 'KEY2': 'value2'});
    });

    test(
      'should ignore lines with multiple equals signs (only takes first two parts)',
      () {
        final lines = ['KEY1=value1', 'KEY2=value=with=equals', 'KEY3=value3'];

        final result = parser.parse(lines);

        expect(result, {
          'KEY1': 'value1',
          'KEY2': 'value=with=equals',
          'KEY3': 'value3',
        });
      },
    );

    test('should handle empty values', () {
      final lines = ['KEY1=', 'KEY2=value2', 'KEY3='];

      final result = parser.parse(lines);

      expect(result, {'KEY1': '', 'KEY2': 'value2', 'KEY3': ''});
    });

    test('should handle empty input', () {
      final result = parser.parse([]);
      expect(result, isEmpty);
    });

    test('should handle mixed valid and invalid lines', () {
      final lines = [
        '# Comment line',
        'VALID_KEY=valid_value',
        '',
        'INVALID_NO_EQUALS',
        '# Another comment',
        'ANOTHER_KEY=another_value',
        '   ',
        'THIRD_KEY=',
      ];

      final result = parser.parse(lines);

      expect(result, {
        'VALID_KEY': 'valid_value',
        'ANOTHER_KEY': 'another_value',
        'THIRD_KEY': '',
      });
    });
  });
}
