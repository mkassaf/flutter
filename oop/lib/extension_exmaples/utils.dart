bool isEmail(String email) {
  return email.contains("@") && email.contains(".");
}

extension EmailValidation on String {
  bool get isEmail => contains("@") && contains(".");

  bool get isShort => length < 5;

  String get emailDomain => split("@")[1];

  String replaceDomain(String newDomain) {
    return replaceAll(emailDomain, newDomain);
  }
}
