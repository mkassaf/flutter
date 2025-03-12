class Laptop {
  // Method
  void display() {
    print("Laptop display");
  }
}

class MacBook extends Laptop {
  // Method
  @override
  void display() {
    print("MacBook display");
  }

  void displayMacBook() {
    print("MacBook displayMacBook");
  }
}

class MacBookPro extends MacBook {
  // Method
  void display() {
    print("MacBookPro display");
  }
}

void main(List<String> args) {
  List<Laptop> laptops = [Laptop(), MacBook(), MacBookPro()];

  Laptop mac = MacBookPro();

  mac as MacBookPro;

  mac.displayMacBook();

  handler(laptops);
}

void handler(List<Laptop> laptops) {
  for (var laptop in laptops) {
    laptop.display();
  }
}
