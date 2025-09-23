import 'package:pvlogger/src/ctx.dart';
import 'package:pvlogger/src/event.dart';

class PVLogAdapter {
  bool get requestContext => false;
}

mixin Action on PVLogAdapter {
  void action(PVLogEvent event, {PVLogContext? ctx});
}

mixin NamespaceFilter on PVLogAdapter {
  bool filter(String namespace);
}

mixin ScopeFilter on PVLogAdapter {
  bool filter(List<String> scopes);
}

mixin Filter on PVLogAdapter {
  bool filter(PVLogEvent event, {PVLogContext? ctx});
}

mixin Formatter on PVLogAdapter {
  List<String> format(PVLogEvent event, {PVLogContext? ctx});
}

mixin AsyncAction on PVLogAdapter {
  Future<void> action(PVLogEvent event, {PVLogContext? ctx});
}

mixin AsyncFilter on PVLogAdapter {
  Future<bool> filter(PVLogEvent event, {PVLogContext? ctx});
}
