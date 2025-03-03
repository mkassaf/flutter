class Laptop {
  // Method
  void display() {
    print("Laptop display");
  }
}

class MacBook extends Laptop {
  // Method
  void display() {
    print("MacBook display");
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

  handler(laptops);
}

void handler(List<Laptop> laptops) {
  for (var laptop in laptops) {
    laptop.display();
  }
}
