import 'dart:math' as math;
import 'package:oop/access.dart';

void main() {
  var result = math.max(1, 2);
  var result2 = min(1, 2);

  print(sum(2, 3));

  var person = Person('Alice', 30);

  person.name = 'A';
  print(person.name);
}
