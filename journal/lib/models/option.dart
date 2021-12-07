class Option {
  final String key;
  final String value;

  Option({
    required this.key,
    required this.value,
  });

  @override
  String toString() {
    return key;
  }
}