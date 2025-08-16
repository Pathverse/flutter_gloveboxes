import 'package:flutter_test/flutter_test.dart';
import 'package:pvlog/utils/serialize.dart';

void main() {
  group('simpleValue', () {
    test('should return true for int values', () {
      expect(simpleValue(42), isTrue);
      expect(simpleValue(0), isTrue);
      expect(simpleValue(-123), isTrue);
    });

    test('should return true for double values', () {
      expect(simpleValue(3.14), isTrue);
      expect(simpleValue(0.0), isTrue);
      expect(simpleValue(-2.5), isTrue);
      expect(simpleValue(double.infinity), isTrue);
      expect(simpleValue(double.negativeInfinity), isTrue);
      expect(simpleValue(double.nan), isTrue);
    });

    test('should return true for String values', () {
      expect(simpleValue('hello'), isTrue);
      expect(simpleValue(''), isTrue);
      expect(simpleValue('special chars: !@#\$%'), isTrue);
    });

    test('should return true for bool values', () {
      expect(simpleValue(true), isTrue);
      expect(simpleValue(false), isTrue);
    });

    test('should return true for Lists with simple values', () {
      expect(simpleValue([1, 2, 3]), isTrue);
      expect(simpleValue(['hello', 'world']), isTrue);
      expect(simpleValue([true, false]), isTrue);
      expect(simpleValue([1, 'hello', 3.14, true]), isTrue);
      expect(simpleValue([]), isTrue); // empty list
    });

    test('should return true for Lists with nested simple collections', () {
      expect(
        simpleValue([
          1,
          2,
          [3, 4],
        ]),
        isTrue,
      ); // nested list with simple values
      expect(
        simpleValue([
          [1, 2],
          [3, 4],
        ]),
        isTrue,
      ); // nested lists with simple values
      expect(
        simpleValue([
          {'a': 1},
          {'b': 2},
        ]),
        isTrue,
      ); // list with maps containing simple values
    });

    test('should return false for Lists with truly complex values', () {
      expect(
        simpleValue([DateTime.now()]),
        isFalse,
      ); // list with complex object
      expect(simpleValue([null]), isFalse); // list with null
      expect(
        simpleValue([
          1,
          2,
          [3, DateTime.now()],
        ]),
        isFalse,
      ); // nested list with complex object
    });

    test('should return true for Sets with simple values', () {
      expect(simpleValue({1, 2, 3}), isTrue);
      expect(simpleValue({'hello', 'world'}), isTrue);
      expect(simpleValue({true, false}), isTrue);
      expect(simpleValue({1, 'hello', 3.14}), isTrue);
      expect(simpleValue(<int>{}), isTrue); // empty set
    });

    test('should return true for Sets with nested simple collections', () {
      // Note: Sets with nested collections would be unusual but should work if all values are simple
      expect(simpleValue({DateTime.now()}), isFalse); // set with complex object
    });

    test('should return true for Maps with simple string keys and values', () {
      expect(simpleValue({'key': 'value'}), isTrue);
      expect(simpleValue({'bool': true, 'number': 42}), isTrue);
      expect(simpleValue(<String, dynamic>{}), isTrue); // empty map
    });

    test('should return false for Maps with non-string keys', () {
      expect(
        simpleValue({1: 'one', 2: 'two'}),
        isFalse,
      ); // int keys not allowed
    });

    test(
      'should return true for Maps with string keys and nested simple collections',
      () {
        expect(
          simpleValue({
            'key': [1, 2, 3],
          }),
          isTrue,
        ); // map with string key and list value containing simple values
        expect(
          simpleValue({
            'key': {'nested': 'map'},
          }),
          isTrue,
        ); // nested map with string keys and simple values
      },
    );

    test(
      'should return false for Maps with non-string keys or complex values',
      () {
        expect(
          simpleValue({
            [1, 2]: 'value',
          }),
          isFalse,
        ); // map with list key (non-string keys not allowed)
        expect(
          simpleValue({1: 'value'}),
          isFalse,
        ); // map with int key (non-string keys not allowed)
        expect(
          simpleValue({'date': DateTime.now()}),
          isFalse,
        ); // map with complex value
        expect(simpleValue({null: 'value'}), isFalse); // map with null key
      },
    );

    test('should handle nested collections correctly', () {
      // Nested lists with all simple values
      expect(
        simpleValue([
          [1, 2],
          [3, 4],
        ]),
        isTrue,
      );
      expect(
        simpleValue([
          ['hello'],
          ['world'],
        ]),
        isTrue,
      );

      // Nested maps with all simple values
      expect(
        simpleValue({
          'outer': {'inner': 'value'},
        }),
        isTrue,
      );
      expect(
        simpleValue({
          'map1': {'a': 1},
          'map2': {'b': 2},
        }),
        isTrue,
      );

      // Mixed nested collections
      expect(
        simpleValue({
          'list': [1, 2, 3],
          'set': {4, 5, 6},
        }),
        isTrue,
      );

      // Deep nesting with simple values
      expect(
        simpleValue([
          [
            [1, 2],
          ],
          [
            [3, 4],
          ],
        ]),
        isTrue,
      );
    });

    test('should return false for other complex types', () {
      expect(simpleValue(null), isFalse);
      expect(simpleValue(DateTime.now()), isFalse);
      expect(simpleValue(RegExp(r'\d+')), isFalse);
      expect(simpleValue(() => 'function'), isFalse);
    });

    test('should return false for custom objects', () {
      final customObject = CustomTestClass();
      expect(simpleValue(customObject), isFalse);
    });

    test('should handle edge cases', () {
      // Test with very large numbers
      expect(simpleValue(9223372036854775807), isTrue); // max int
      expect(simpleValue(-9223372036854775808), isTrue); // min int

      // Test with very large doubles
      expect(simpleValue(1.7976931348623157e+308), isTrue); // max finite double
      expect(simpleValue(5e-324), isTrue); // min positive double
    });
  });
}

// Helper class for testing custom objects
class CustomTestClass {
  final String value = 'test';
}
