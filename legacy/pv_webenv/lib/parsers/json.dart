import 'base.dart';
import 'dart:convert';

class JSONParser extends PVEnvBaseParser {
  @override
  Map<String, dynamic> parse(List<String> lines) {
    // simply load json
    //joining lines into a single string by stripping comments
    String line = "";
    for (var lineContent in lines) {
      if (!lineContent.trim().startsWith('//') &&
          lineContent.trim().isNotEmpty) {
        line += '$lineContent\n';
      }
    }

    final jsonData = json.decode(line) as Map<String, dynamic>;

    return jsonData;
  }
}
