
import 'dart:convert';

String jsonDump(Object? obj) {
  return jsonEncode(obj);
}

dynamic jsonLoad(String source) {
  return jsonDecode(source);
}
