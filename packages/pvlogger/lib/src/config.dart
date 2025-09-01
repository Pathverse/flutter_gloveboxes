part of 'logger.dart';

class PVLoggerConfig {
  final bool enableStackTraceLine;
  final bool enableChainOfResponsibility;
  final bool enableDirectJsonify;

  const PVLoggerConfig({
    this.enableStackTraceLine = true,
    this.enableChainOfResponsibility = true,
    this.enableDirectJsonify = true,
  });
}
