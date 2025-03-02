class Laptop {
  String name;
  String color;

  Laptop({required this.name, required this.color});
}

class MacBook extends Laptop {
  String model;
  MacBook(String name, String color, this.model)
      : super(name: name, color: color);
}

void main() {
  var macbook = MacBook("MacBook Pro", "Silver", "M1");

  print("Name: ${macbook.name}");
  print("Color: ${macbook.color}");
  print("Model: ${macbook.model}");
}
