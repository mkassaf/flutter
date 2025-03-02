class Laptop {
  Laptop() {
    print("Laptop constructor");
  }
}

class MacBook extends Laptop {
  MacBook() {
    print("MacBook constructor");
  }
}

void main() {
  //var laptop = Laptop();
  var macbook =
      MacBook(); //Note: The constructor of the parent class is called first and then the constructor of the child class is called. Which means this line will print ‘Laptop constructor’ and then ‘MacBook constructor’
}
