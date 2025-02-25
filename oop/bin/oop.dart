import 'package:oop/oop.dart' as oop;

import 'package:oop/person.dart';

void main(List<String> arguments) {
  print(oop.calculate());

  print(oop.sum(1, 2));

  var person = Person("Ahmad", 20);

  person.name = "Ahmad Rami";
  print(person.name);
}
