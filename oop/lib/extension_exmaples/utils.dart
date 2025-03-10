import 'package:oop/access.dart';

extension StringExt on String {
  bool get isEmail {
    if (isEmpty && length < 5) {
      return false;
    }

    return contains("@") && contains(".");
  }

  bool isEmailValid() {
    if (isEmpty && length < 5) {
      return false;
    }

    return contains("@") && contains(".");
  }

  String get getDomain {
    if (isEmpty && length < 5) {
      return "";
    }

    return split("@")[1];
  }

  String get getUserName {
    if (isEmpty && length < 5) {
      return "";
    }

    return split("@")[0];
  }
}

extension PersonExt on Person {
  String get fullName => "$name $age";
}
