import 'utils.dart';

void main(List<String> args) {
  String email = "a@google.com";
  String invaludEmail = "a@b";

  print(email.isEmail); // true
  print(invaludEmail.isEmail); // false

  print(invaludEmail.isShort);

  print(email.emailDomain);

  print(invaludEmail.replaceDomain("najah.edu"));
}
