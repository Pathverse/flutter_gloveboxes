Map<String, dynamic> forbidPVLoggerPrefixInMetadata(Map<String, dynamic> metadata) {
  for (var entry in metadata.entries) {
    if (entry.key.startsWith("pvlogger_")) {
      throw ArgumentError("PVLogger prefix is not allowed in metadata");
    }
  }
  return metadata;
}