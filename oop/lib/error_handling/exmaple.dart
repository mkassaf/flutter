class Database {
  void connect(String Url) {
    if (Url == null || Url.isEmpty) {
      throw ArgumentError("url cannot be null or empty");
    }
    //logic to connect
    var status = init(); // busy, timeout, error, success

    if (status == "busy" || status == "timeout") {
      throw Exception("Database is busy or timeout");
    }
  }

  String init() {
    //logic
    return "init";
  }
}

void main(List<String> args) {
  var db = Database();

  try {
    db.connect("anyiput");
  } catch (e) {
    print(e);
  }

  //continue

  db.insert(); //error
}
