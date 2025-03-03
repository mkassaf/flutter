import 'car.dart';

class Toyota extends Car {
  String? model;
  int? price;

  Toyota(super._color, super.year, this.model);

  Toyota.corolla(super._color, super.year)
      : model = 'Corolla',
        price = 20000;

  void showDetails() {
    print("Model: $model");
    print("Price: $price");
  }
}

class Corolla extends Toyota {
  Corolla(String color, int year) : super.corolla(color, year);
}

class NamedCar extends Car {
  String name;

  NamedCar({required String color, required int year, required this.name})
      : super(color, year);
}

class CarNamed2 extends NamedCar {
  CarNamed2({required super.color, required super.year, required super.name});
}

class PostionalCar extends NamedCar {
  PostionalCar(String color, int year, String name)
      : super(color: color, year: year, name: name);
}

void main(List<String> args) {
  var myCar = Toyota('red', 2021, 'Corolla');

  print(myCar.year);
  print(myCar.model);

  NamedCar namedCar = NamedCar(color: 'blue', year: 2020, name: 'My Car');
  print(namedCar.name);
  print(namedCar.year);

  CarNamed2 carNamed2 = CarNamed2(color: 'green', year: 2022, name: 'My Car 2');
  print(carNamed2.name);
}
