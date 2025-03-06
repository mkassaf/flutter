import 'package:oop/oop.dart' as oop;

import 'package:oop/person.dart';

import 'package:oop/final_example.dart';

import 'package:oop/base_exmaple2.dart';

void main(List<String> arguments) {
  print(oop.calculate());

  print(oop.sum(1, 2));

  var person = Person("Ahmad", 20);

  person.name = "Ahmad Rami";
  print(person.name);
}

//final class CBook extends Book {}//it is not allowed becasue the parent class is final
