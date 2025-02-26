library access;

part 'util/access_part1.dart';
part 'util/part2.dart';

int sum(int a, int b) {
  return a + b;
}

class Person {
  String _name;
  int age;
  Person(this._name, this.age);

  String get name {
    if (_name.length > 1) {
      return _name;
    }
    return 'N/A';
  }

  set name(String name) {
    if (name.length > 1) {
      _name = name;
    }
  }
}
