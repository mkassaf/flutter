abstract interface class Cleanable {
  void clean();
}

abstract interface class Workable {
  void work();
}

abstract interface class Printable {
  void printInfo();
}

abstract interface class Listenable {
  void listen();
}

class Wash implements Cleanable, Workable, Printable {
  @override
  void clean() {
    print('clean');
  }

  @override
  void work() {
    print('work');
  }

  @override
  void printInfo() {
    print('printWash');
  }
}

class Radio implements Printable, Listenable {
  @override
  void printInfo() {
    print('printRadio');
  }

  @override
  void listen() {
    print('listen');
  }
}

class Tv implements Workable, Printable {
  @override
  void work() {
    print('work');
  }

  @override
  void printInfo() {
    print('printTv');
  }
}

void main(List<String> args) {
  Wash wash = Wash();

  callCleanable(wash);
  callWorkable(wash);
  callPrintable(wash);
}

void callCleanable(Cleanable cleanable) {
  cleanable.clean();
}

void callWorkable(Workable workable) {
  workable.work();
}

void callPrintable(Printable printable) {
  printable.printInfo();
}
