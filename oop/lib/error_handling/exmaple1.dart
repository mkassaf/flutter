import 'dart:async';

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
  if (path.length < 5) {
    throw FormatException("Path is too short");
  }
  // Do something with the path
  //logic here

  //Thi style is not recommended
  throw "Error: Cannot change profile pic"; //Exit the function

  return TaskResult.success;
}

void main(List<String> args) {
  var connection = Database();
  try {
    connection
        .open(); //IO/network operation can throw exception (timeout, network error, etc)
    //var result = changeProfilePic("122222");
    // print("Task result: $result");
    connection
        .insert(); //IO/network operation can throw exception (timeout, network error, etc)
  } on Exception catch (e, s) {
    print("Exception: ${e.toString()} \n $s");
  } on Error catch (e) {
    print("Error: ${e.toString()}");
  } catch (e) {
    print("Catch any exception: ${e.toString()}");
  } finally {
    print("Finally block");
    try {
      connection.close(); // will not be called if exception is thrown
    } catch (e) {
      print("Error closing connection: ${e.toString()}");
    }
  }
  //print("Do task 1");

  Profile profile = Profile(connection);
  profile.changeProfilePic("path");
}

class Profile {
  Database db;

  Profile(this.db);

  void changeProfilePic(String path) {
    int tries = 0;
    while (tries < 3) {
      try {
        db.insert();
      } on TimeoutException {
        //3 seconds
        tries++;
        print("Retrying...$tries");
        if (tries == 3) {
          print("Failed to insert data");
        }
      }
    }
  }
}

// 1% of requests

class Database {
  void open() {
    //open connection
    print("Database opened");
  }

  void insert() {
    //insert data
    throw TimeoutException("Database is busy or timeout");
    print("Data inserted");
  }

  void close() {
    //close connection
    print("Database closed");
  }
}
