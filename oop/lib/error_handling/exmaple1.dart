enum TaskResult {
  success,
  timeout,
  busy,
  invalidPath;
}

TaskResult changeProfilePic(String path) {
  if (path.isEmpty) {
    //can I get the path from another source?
    //if no =>
    throw ArgumentError("Path cannot be empty");
  }

  // Do something with the path
  //logic here

  return TaskResult.success;
}

void main(List<String> args) {
  try {
    var result = changeProfilePic("");
    print("Task result: $result");
  } on FormatException catch (e) {
    print("Error: ${e.toString()}");
  } on Exception catch (e) {
    print("Error: ${e.toString()}");
  } on ArgumentError catch (e) {
    print("Error: ${e.toString()}");
  }
  var result = changeProfilePic("");

  print("Do task 1");
}
