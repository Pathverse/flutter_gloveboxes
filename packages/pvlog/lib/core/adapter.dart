part of 'logger.dart';

int _uniqueId = 0;

abstract class PvLogAdapter {
  final int _id = _uniqueId++;

  int get id => _id;

  @override
  String toString() {
    return 'PvLogAdapter{id: $_id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PvLogAdapter && other._id == _id;
  }

  @override
  int get hashCode => _id.hashCode;

  // Filter functionality
  bool get hasFilter => false;
  bool shouldLog(PVLogger logger) {
    throw UnimplementedError('shouldLog not implemented');
  }

  // Formatter functionality
  bool get hasFormatter => false;
  List<String> format(PVLogEvent event) {
    throw UnimplementedError('format not implemented');
  }

  // Output functionality
  bool get hasOutput => false;
  void output(PVLogEvent event) {
    throw UnimplementedError('output not implemented');
  }

  // Forward functionality
  bool get hasForward => false;
  void forward(PVLogEvent event) {
    throw UnimplementedError('forward not implemented');
  }
}
