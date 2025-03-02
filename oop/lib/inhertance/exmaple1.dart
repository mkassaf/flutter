class Car {
  late String color;
  int? year;

  void start() {
    print("Car started");
  }
}

class Toyota extends Car {
  String? model;
  int? price;

  void showDetails() {
    print("Model: $model");
    print("Price: $price");
  }
}

void main() {
  var toyota = Toyota();
  toyota.color = "Red";
  toyota.year = 2020;
  toyota.model = "Camry";
  toyota.price = 20000;
  toyota.start();
  toyota.showDetails();
}
