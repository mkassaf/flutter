class Laptop {
  String name;
  String color;

  Laptop(this.name, this.color);
}

class MacBook extends Laptop {
  String model = "";
  MacBook(String name, String color, this.model) : super(name, color);
}

void main() {
  var macbook = MacBook("MacBook Pro", "Silver", "A1706");

  print("Name: ${macbook.name}");
  print("Color: ${macbook.color}");
  print("Model: ${macbook.model}");
}
