// all method absterct
// you can not instantiate this class
// you can only implement this class

abstract interface class ExplicitInterface {
  void method1();
  void method2();
}

class Example extends ExplicitInterface {
  @override
  void method1() {
    print('method1');
  }

  @override
  void method2() {
    print('method2');
  }
}

abstract interface class Readable {
  void read();
}

abstract interface class Writable {
  void write();
}

abstract interface class Listenable {
  void listen();
}

abstract interface class Printable {
  void printInfo();
}

class Book implements Readable, Writable, Printable, Listenable {
  @override
  void read() {
    print('read');
  }

  @override
  void write() {
    print('write');
  }

  @override
  void listen() {
    print('listen');
  }

  @override
  void printInfo() {
    print('printBook');
  }
}

class Database implements Readable, Writable, Printable {
  @override
  void read() {
    print('read');
  }

  @override
  void write() {
    print('write');
  }

  @override
  void printInfo() {
    print('printBook');
  }
}

class EventListener implements Printable, Listenable {
  @override
  void listen() {
    print('listen');
  }

  @override
  void printInfo() {
    print('printEventListener');
  }
}

void main(List<String> args) {
  var book = Book();

  book.read();
  book.write();
  book.listen();
  book.printInfo();

  handle(Book());
  handle(Database());
  handle(EventListener());
}

void handle(Printable printable) {
  printable.printInfo();
}
