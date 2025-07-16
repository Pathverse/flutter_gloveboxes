import 'package:pv_webenv/parsers/base.dart';

class ENVParser extends PVEnvBaseParser {
  @override
  Map<String, dynamic> parse(List<String> lines) {
    // Parse environment variables from the provided lines
    final Map<String, dynamic> envMap = {};

    for (var line in lines) {
      if (line.isNotEmpty && !line.startsWith('#')) {
        final equalsIndex = line.indexOf('=');
        if (equalsIndex != -1) {
          final key = line.substring(0, equalsIndex).trim();
          final value = line.substring(equalsIndex + 1).trim();
          envMap[key] = value;
        }
      }
    }

    return envMap;
  }
}
