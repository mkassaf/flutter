void main() {
  try {
    init("");
  } on ConnectToUnSecureServerException catch (e) {
    print("ConnectToUnSecureServerException: $e");
    throw InvalidPathException("Invalid path");
  } on ServerBusyException {
    //try again after some time
    print("ServerBusyException");
    init("https://busy-server");
  } on Exception catch (e, s) {
    print("Exception: $e , stack trace: $s");
  } on Error catch (e) {
    print("Error: $e");
  } catch (e) {
    print("Unknown exception: $e");
  }
}

//0.01 -> 0.001 -> 0.0001 -> 0.00001 -> 0.000001
//0.5 -> 0.25 -> 0.125 -> 0.0625 -> 0.03125
void init(String path) {
  print("Connecting to server");
  if (path.isEmpty) {
    print("Path is empty");
    throw "Invalid path";
  }
  if (!path.contains("https")) {
    print("Connecting to unsecure server");
    throw ConnectToUnSecureServerException("Connecting to unsecure server");
  }

  if (path.contains("busy-server")) {
    print("Connecting to example server");
    throw ServerBusyException("The server is busy");
  }

  //logic

  print("Connected to server");

  //logic

  if (path.contains("error")) {
    throw Exception("Error occurred");
  }
}

String getDefaultPath() {
  return "https://example.com";
}

class ConnectToUnSecureServerException implements Exception {
  final String message;

  ConnectToUnSecureServerException(this.message);

  @override
  String toString() {
    return message;
  }
}

class ServerBusyException implements Exception {
  final String message;

  ServerBusyException(this.message);

  @override
  String toString() {
    return message;
  }
}

class InvalidPathException implements Exception {
  final String message;

  InvalidPathException(this.message);

  @override
  String toString() {
    return message;
  }
}
