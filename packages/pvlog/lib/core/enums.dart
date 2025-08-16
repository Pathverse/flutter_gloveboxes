enum PVLevel {
  error(1),
  debug(200),
  info(300),
  all(0);

  final int value;
  const PVLevel(this.value);
}
