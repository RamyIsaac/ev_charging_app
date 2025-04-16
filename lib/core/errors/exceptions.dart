class CustomException implements Exception {
  final String message;
  CustomException({required this.message});

  @override
  String toString() {
    // TODO: implement toString
    return message;
  }
}
