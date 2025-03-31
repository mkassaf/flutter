class Connection {
  static int maxNumberOfException = 0;

  int id;

  Connection(this.id);
  void open() {
    print('opening connection');
    if (maxNumberOfException >= 3) {
      throw Exception('Max number of exceptions reached');
    }
    maxNumberOfException++;
    print("connection opened");
  }

  void readData() {
    print('read data');
    if (id < 4) {
      throw Exception('Error reading data');
    }
  }

  void close() {
    print('close connection');
    if (maxNumberOfException > 0) {
      maxNumberOfException--;
    }
  }
}

void main(List<String> args) {
  var connect1 = Connection(1);
  var connect2 = Connection(2);
  var connect3 = Connection(3);
  var connect4 = Connection(4);

  process(connect1);
  process(connect2);
  process(connect3);
  process(connect4);
}

void process(Connection connection) {
  try {
    connection.open();
    connection.readData();
    print('Data read successfully');
  } catch (e) {
    print('Error: ${e.toString()}');
  } finally {
    try {
      connection.close();
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }
}
