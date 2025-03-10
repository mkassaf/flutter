import 'utils.dart';
import 'package:oop/access.dart';

void main(List<String> args) {
  var email = "ahmad@google.com";
  var invaludEmail = "a@b";

  print(email.isEmail); // true
  print(invaludEmail.isEmailValid()); // false

  print(email.getDomain); // google.com
  print(email.getUserName); // ahmad

  var person = Person("Ahmad", 25);
  print(person.name); // Ahmad
  print(person.age); // 25
  print(person.fullName); // Ahmad 25
}
