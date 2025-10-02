import 'package:pvlogger/src/core/event.dart';

enum AdapterIntent {
  filter,
  action,
  print,
  http,
  storage,
  unknown,
  custom, 
  error,
  buildEvent,
}

class PVLogAdapter {
  List<AdapterIntent> get intents => [];
  int? get levelFilter => null;
}

mixin EventBuilder on PVLogAdapter {
  @override
  List<AdapterIntent> get intents => [AdapterIntent.buildEvent];

  void buildEvent(
    PreEventContext context,
    List<PVLogAdapter> upcomingAdapters,
  );
}

mixin Action on PVLogAdapter {
  @override
  List<AdapterIntent> get intents => [AdapterIntent.action];

  bool get isAsync => false;

  void action(PVLogEvent event);

  Future<void> actionAsync(PVLogEvent event);
}

mixin Filter on PVLogAdapter {
  @override
  List<AdapterIntent> get intents => [AdapterIntent.filter];
  
  bool filter(PreEventContext context);
}
