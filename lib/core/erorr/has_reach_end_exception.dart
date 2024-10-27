class HasReachEndException implements Exception {
  final String message;
  HasReachEndException([this.message = "There is no more data"]);

  @override
  String toString() => message;
}
