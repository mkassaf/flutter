class InvalidProfileException implements Exception {
  final String message;

  const InvalidProfileException(this.message);

  @override
  String toString() {
    return message;
  }
}

void main(List<String> args) {
  try {
    throw InvalidProfileException("Invalid profile");
  } on InvalidProfileException catch (e) {
    print(e);
  }
}
