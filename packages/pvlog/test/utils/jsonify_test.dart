import 'package:flutter_test/flutter_test.dart';
import 'package:pvlog/utils/serialize.dart';

void main() {
  group('jsonify', () {
    test('should handle primitive types directly', () {
      expect(jsonify(42), equals('42'));
      expect(jsonify(3.14), equals('3.14'));
      expect(jsonify('hello'), equals('"hello"'));
      expect(jsonify(true), equals('true'));
      expect(jsonify(false), equals('false'));
      expect(jsonify(null), equals('null'));
    });

    test('should handle empty collections', () {
      expect(jsonify([]), equals('[]'));
      expect(jsonify({}), equals('{}'));
      expect(jsonify(<int>{}), equals('[]')); // empty set
    });

    test('should handle simple lists with indentation', () {
      final result = jsonify([1, 2, 3]);
      expect(result, contains('\t'));
      expect(result, contains('1'));
      expect(result, contains('2'));
      expect(result, contains('3'));
    });

    test('should handle simple maps with indentation', () {
      final result = jsonify({'a': 1, 'b': 2});
      expect(result, contains('\t'));
      expect(result, contains('"a"'));
      expect(result, contains('"b"'));
      expect(result, contains('1'));
      expect(result, contains('2'));
    });

    test('should handle nested collections', () {
      final complex = {
        'list': [1, 2, 3],
        'nested': {'inner': 'value', 'number': 42},
      };
      final result = jsonify(complex);
      expect(result, contains('list'));
      expect(result, contains('nested'));
      expect(result, contains('inner'));
      expect(result, contains('value'));
    });

    test('should handle sets by converting to lists', () {
      final result = jsonify({1, 2, 3});
      expect(result, contains('1'));
      expect(result, contains('2'));
      expect(result, contains('3'));
      // Should be formatted as an array
      expect(result.trim().startsWith('['), isTrue);
      expect(result.trim().endsWith(']'), isTrue);
    });

    test('should handle custom objects by converting to string', () {
      final custom = CustomTestClass();
      final result = jsonify(custom);

      // Should contain the string representation of the object
      expect(result, contains('CustomTestClass'));
      // Should be JSON-encoded as a string
      expect(result.startsWith('"'), isTrue);
      expect(result.endsWith('"'), isTrue);
    });

    test('should handle mixed collections with custom objects', () {
      final custom = CustomTestClass();
      final mixed = [1, 'string', custom, true];
      final result = jsonify(mixed);

      expect(result, contains('1'));
      expect(result, contains('"string"'));
      expect(result, contains('CustomTestClass'));
      expect(result, contains('true'));
    });

    test('should handle maps with non-string keys', () {
      final mapWithIntKeys = {1: 'one', 2: 'two', 3: 'three'};
      final result = jsonify(mapWithIntKeys);

      // Keys should be converted to strings
      expect(result, contains('"1"'));
      expect(result, contains('"2"'));
      expect(result, contains('"3"'));
      expect(result, contains('"one"'));
      expect(result, contains('"two"'));
      expect(result, contains('"three"'));
    });

    test('should handle deeply nested structures with custom objects', () {
      final custom1 = CustomTestClass();
      final custom2 = CustomTestClass();

      final complex = {
        'level1': {
          'level2': [
            {'custom': custom1, 'value': 123},
            {
              'custom': custom2,
              'list': [1, 2, custom1],
            },
          ],
        },
      };

      final result = jsonify(complex);
      expect(result, contains('level1'));
      expect(result, contains('level2'));
      expect(result, contains('CustomTestClass'));
      expect(result, contains('123'));
    });

    test('should handle circular reference protection through toString', () {
      // This tests that complex objects are handled via toString()
      // which naturally breaks potential circular references
      final custom = CustomTestClass();
      final withReference = {'self': custom, 'other': custom};

      final result = jsonify(withReference);
      expect(result, contains('CustomTestClass'));
      // Should appear twice since the same object is referenced twice
      final matches = 'CustomTestClass'.allMatches(result).length;
      expect(matches, equals(2));
    });

    test('should maintain JSON format with proper escaping', () {
      final specialChars = {
        'quote': '"hello"',
        'newline': 'line1\nline2',
        'tab': 'before\tafter',
        'backslash': 'path\\to\\file',
      };

      final result = jsonify(specialChars);

      // Should be valid JSON - check for proper escaping
      expect(result, contains('\\"hello\\"'));
      expect(result, contains('\\n'));
      expect(result, contains('\\t'));
      expect(result, contains('\\\\'));
    });

    test('should handle edge cases gracefully', () {
      expect(jsonify(double.infinity), contains('"Infinity"'));
      expect(jsonify(double.negativeInfinity), contains('"-Infinity"'));
      expect(jsonify(double.nan), contains('"NaN"'));

      // Very large numbers
      expect(jsonify(9223372036854775807), isNotEmpty);

      // Empty strings
      expect(jsonify(''), equals('""'));
    });

    test('should preserve original formatting with indentation', () {
      final data = {
        'array': [1, 2, 3],
        'object': {'key': 'value'},
      };

      final result = jsonify(data);

      // Should use tab indentation
      expect(result, contains('\t'));

      // Should be multi-line
      expect(result.contains('\n'), isTrue);

      // Should be properly formatted
      final lines = result.split('\n');
      expect(lines.length, greaterThan(3)); // Multi-line output
    });

    test('should fallback to makeJsonSafe for problematic objects', () {
      // Test objects that would normally fail JSON encoding
      final problematicData = [
        DateTime.now(), // DateTime objects need special handling
        RegExp(r'\d+'), // RegExp objects
        () => 'function', // Function objects
      ];

      final result = jsonify(problematicData);

      // Should not throw and should contain string representations
      expect(result, isNotEmpty);
      // Check for actual DateTime string format (ISO format or toString)
      expect(result, anyOf(contains('2025'), contains('DateTime')));
      expect(result, contains('RegExp'));
      expect(result, contains('Closure'));
    });

    test('should handle null values in collections', () {
      final dataWithNulls = {
        'nullValue': null,
        'list': [1, null, 'string'],
        'nested': {'inner': null},
      };

      final result = jsonify(dataWithNulls);
      expect(result, contains('null'));
      expect(result, contains('"nullValue"'));
      expect(result, contains('"list"'));
      expect(result, contains('"nested"'));
    });

    test('should handle very deep nesting', () {
      final deep = {
        'level1': {
          'level2': {
            'level3': {
              'level4': {
                'level5': [1, 2, 3],
              },
            },
          },
        },
      };

      final result = jsonify(deep);
      expect(result, contains('level1'));
      expect(result, contains('level2'));
      expect(result, contains('level3'));
      expect(result, contains('level4'));
      expect(result, contains('level5'));
    });

    test('should handle mixed types in nested structures', () {
      final mixed = {
        'primitives': [1, 'string', true, 3.14, null],
        'collections': {
          'set': {1, 2, 3},
          'list': ['a', 'b', 'c'],
          'map': {'nested': 'value'},
        },
        'custom': CustomTestClass(),
      };

      final result = jsonify(mixed);
      expect(result, contains('primitives'));
      expect(result, contains('collections'));
      expect(result, contains('custom'));
      expect(result, contains('CustomTestClass'));
    });

    test('should handle different numeric types', () {
      final numbers = {
        'int': 42,
        'double': 3.14159,
        'negative': -123,
        'zero': 0,
        'infinity': double.infinity,
        'negativeInfinity': double.negativeInfinity,
        'nan': double.nan,
      };

      final result = jsonify(numbers);
      expect(result, contains('42'));
      expect(result, contains('3.14159'));
      expect(result, contains('-123'));
      expect(result, contains('0'));
      expect(result, contains('"Infinity"'));
      expect(result, contains('"-Infinity"'));
      expect(result, contains('"NaN"'));
    });
  });

  group('jsonify with toJson and toString methods', () {
    test('should handle objects with toJson method by calling toJson', () {
      // Objects with toJson() should be serialized properly via their toJson method
      final jsonSerializable = JsonSerializableClass(
        name: 'John Doe',
        age: 30,
        hobbies: ['reading', 'coding', 'gaming'],
      );

      final result = jsonify(jsonSerializable);

      // Should contain the properties from toJson(), not toString representation
      expect(result, contains('"name"'));
      expect(result, contains('"John Doe"'));
      expect(result, contains('"age"'));
      expect(result, contains('30'));
      expect(result, contains('"hobbies"'));
      expect(result, contains('"reading"'));
    });

    test('should handle complex serializable objects with toJson', () {
      final complex = ComplexSerializableClass(
        id: 'test-123',
        createdAt: DateTime(2023, 1, 1, 12, 0, 0),
        metadata: {'version': '1.0', 'active': true},
      );

      final result = jsonify(complex);

      // Should use toJson representation
      expect(result, contains('"id"'));
      expect(result, contains('"test-123"'));
      expect(result, contains('"createdAt"'));
      expect(result, contains('2023-01-01T12:00:00.000'));
      expect(result, contains('"metadata"'));
    });

    test('should handle objects with only toString method', () {
      final toStringOnly = ToStringOnlyClass(
        description: 'Test object',
        value: 42.5,
      );

      final result = jsonify(toStringOnly);

      // Should use toString representation
      expect(result, contains('ToStringOnlyClass'));
      expect(result, contains('Test object'));
      expect(result, contains('42.5'));
    });

    test(
      'should handle problematic toJson methods by falling back to toString',
      () {
        final problematic = ProblematicJsonClass('sensitive data');

        final result = jsonify(problematic);

        // Should fall back to toString when toJson fails
        expect(result, contains('ProblematicJsonClass'));
        expect(result, contains('sensitive data'));
      },
    );

    test(
      'should handle collections containing objects with toJson/toString',
      () {
        final jsonSerializable = JsonSerializableClass(
          name: 'Alice',
          age: 25,
          hobbies: ['painting'],
        );
        final toStringOnly = ToStringOnlyClass(
          description: 'Collection item',
          value: 3.14,
        );

        final collection = [
          'simple string',
          42,
          jsonSerializable,
          toStringOnly,
          {'nested': 'map'},
        ];

        final result = jsonify(collection);

        expect(result, contains('simple string'));
        expect(result, contains('42'));
        expect(result, contains('JsonSerializableClass'));
        expect(result, contains('Alice'));
        expect(result, contains('ToStringOnlyClass'));
        expect(result, contains('Collection item'));
        expect(result, contains('nested'));
      },
    );

    test('should handle maps with custom objects as values', () {
      final data = {
        'user': JsonSerializableClass(
          name: 'Bob Smith',
          age: 35,
          hobbies: ['swimming'],
        ),
        'config': ToStringOnlyClass(
          description: 'App configuration',
          value: 100.0,
        ),
        'metadata': {'version': '2.0', 'timestamp': DateTime.now()},
      };

      final result = jsonify(data);

      expect(result, contains('user'));
      expect(result, contains('config'));
      expect(result, contains('metadata'));
      expect(result, contains('JsonSerializableClass'));
      expect(result, contains('Bob Smith'));
      expect(result, contains('ToStringOnlyClass'));
      expect(result, contains('App configuration'));
    });

    test('should handle nested structures with mixed serializable objects', () {
      final nested = {
        'level1': {
          'users': [
            JsonSerializableClass(name: 'User1', age: 20, hobbies: ['reading']),
            JsonSerializableClass(name: 'User2', age: 25, hobbies: ['writing']),
          ],
          'config': ToStringOnlyClass(
            description: 'System config',
            value: 50.0,
          ),
          'problematic': ProblematicJsonClass('test data'),
        },
      };

      final result = jsonify(nested);

      expect(result, contains('level1'));
      expect(result, contains('users'));
      expect(result, contains('User1'));
      expect(result, contains('User2'));
      expect(result, contains('System config'));
      expect(result, contains('ProblematicJsonClass'));
      expect(result, contains('test data'));
    });

    test(
      'should maintain JSON structure with custom object string representations',
      () {
        final mixed = {
          'primitive': 123,
          'custom1': JsonSerializableClass(name: 'Test', age: 30, hobbies: []),
          'custom2': ToStringOnlyClass(description: 'Example', value: 7.5),
          'array': [
            'string',
            JsonSerializableClass(
              name: 'Array User',
              age: 40,
              hobbies: ['sports'],
            ),
          ],
        };

        final result = jsonify(mixed);

        // Should be valid JSON structure
        expect(result, contains('"primitive"'));
        expect(result, contains('"custom1"'));
        expect(result, contains('"custom2"'));
        expect(result, contains('"array"'));

        // Custom objects should be string-encoded
        expect(result, contains('JsonSerializableClass'));
        expect(result, contains('ToStringOnlyClass'));
        expect(result, contains('Test'));
        expect(result, contains('Example'));
        expect(result, contains('Array User'));

        // Should maintain proper indentation
        expect(result, contains('\t'));
      },
    );

    test('should handle edge cases with custom objects', () {
      // Objects with null/empty values
      final emptyUser = JsonSerializableClass(name: '', age: 0, hobbies: []);
      final nullDescription = ToStringOnlyClass(description: '', value: 0.0);

      final edgeCases = {
        'empty': emptyUser,
        'null_like': nullDescription,
        'actual_null': null,
      };

      final result = jsonify(edgeCases);

      expect(result, contains('empty'));
      expect(result, contains('null_like'));
      expect(result, contains('actual_null'));
      expect(result, contains('null'));
      expect(result, contains('JsonSerializableClass'));
      expect(result, contains('ToStringOnlyClass'));
    });

    test(
      'should handle very complex nested structures with custom objects',
      () {
        final superComplex = {
          'app': {
            'users': [
              JsonSerializableClass(
                name: 'Admin',
                age: 45,
                hobbies: ['management'],
              ),
              JsonSerializableClass(
                name: 'User',
                age: 28,
                hobbies: ['browsing'],
              ),
            ],
            'settings': {
              'theme': ToStringOnlyClass(description: 'Dark theme', value: 1.0),
              'performance': ToStringOnlyClass(
                description: 'High performance',
                value: 100.0,
              ),
              'experimental': ProblematicJsonClass('feature flags'),
            },
            'analytics': {
              'sessions': 1000,
              'errors': [
                ProblematicJsonClass('error 1'),
                ProblematicJsonClass('error 2'),
              ],
            },
          },
        };

        final result = jsonify(superComplex);

        // Verify all levels are present
        expect(result, contains('app'));
        expect(result, contains('users'));
        expect(result, contains('settings'));
        expect(result, contains('analytics'));

        // Verify custom objects are handled
        expect(result, contains('Admin'));
        expect(result, contains('User'));
        expect(result, contains('Dark theme'));
        expect(result, contains('High performance'));
        expect(result, contains('feature flags'));
        expect(result, contains('error 1'));
        expect(result, contains('error 2'));

        // Verify structure integrity
        expect(result, contains('1000'));
        expect(result.split('\n').length, greaterThan(10)); // Multi-line
      },
    );
  });
}

// Helper class for testing custom objects
class CustomTestClass {
  final String value = 'test';

  @override
  String toString() => 'CustomTestClass{value: $value}';
}

// Helper class with toJson method
class JsonSerializableClass {
  final String name;
  final int age;
  final List<String> hobbies;

  JsonSerializableClass({
    required this.name,
    required this.age,
    required this.hobbies,
  });

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age, 'hobbies': hobbies};
  }

  @override
  String toString() => 'JsonSerializableClass(name: $name, age: $age)';
}

// Helper class with both toJson and custom toString
class ComplexSerializableClass {
  final String id;
  final DateTime createdAt;
  final Map<String, dynamic> metadata;

  ComplexSerializableClass({
    required this.id,
    required this.createdAt,
    required this.metadata,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'metadata': metadata,
    };
  }

  @override
  String toString() =>
      'ComplexSerializableClass{id: $id, timestamp: ${createdAt.millisecondsSinceEpoch}}';
}

// Helper class that only has toString (no toJson)
class ToStringOnlyClass {
  final String description;
  final double value;

  ToStringOnlyClass({required this.description, required this.value});

  @override
  String toString() =>
      'ToStringOnlyClass(description: "$description", value: $value)';
}

// Helper class that has toJson but it throws an exception
class ProblematicJsonClass {
  final String data;

  ProblematicJsonClass(this.data);

  Map<String, dynamic> toJson() {
    throw Exception('Serialization failed for: $data');
  }

  @override
  String toString() => 'ProblematicJsonClass{data: $data}';
}
