class Laptop {
  Laptop(String name, String color) {
    print("Laptop constructor");
    print("Name: $name");
    print("Color: $color");
  }
}

class MacBook extends Laptop {
  MacBook(String name, String color) : super(name, color) {
    //We must call parent Constructor
    print("MacBook constructor");
  }
}

void main() {
  var macbook = MacBook("MacBook Pro", "Silver");
}
