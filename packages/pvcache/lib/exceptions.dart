
class CacheExpiredException implements Exception {
  final String message;

  CacheExpiredException(this.message);

  @override
  String toString() => 'PVCache: $message';
}

class CacheReservedNameException implements Exception {
  final String name;

  CacheReservedNameException(this.name);

  @override
  String toString() => 'PVCache: Cannot use reserved name "$name"';
}