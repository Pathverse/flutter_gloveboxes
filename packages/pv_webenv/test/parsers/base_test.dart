import 'package:flutter_test/flutter_test.dart';
import 'package:pv_webenv/parsers/base.dart';

// Concrete implementation for testing the abstract base class
class TestParser extends PVEnvBaseParser {
  @override
  Map<String, dynamic> parse(List<String> lines) {
    return {'test': 'implementation'};
  }
}

void main() {
  group('PVEnvBaseParser', () {
    late TestParser parser;

    setUp(() {
      parser = TestParser();
    });

    test('should be instantiable through concrete implementation', () {
      expect(parser, isA<PVEnvBaseParser>());
    });

    test('should have parse method that returns Map<String, dynamic>', () {
      final result = parser.parse(['test']);
      expect(result, isA<Map<String, dynamic>>());
      expect(result['test'], equals('implementation'));
    });

    test('should handle empty list', () {
      final result = parser.parse([]);
      expect(result, isA<Map<String, dynamic>>());
    });
  });
}
