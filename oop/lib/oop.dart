library oop;

import 'state_example.dart';
import 'factory_class.dart';

part 'util/util.dart';

int calculate() {
  Button primary = Button('Save');
  return 6 * 7;
}

class Person {
  int _id;

  Person(this._id);
}
