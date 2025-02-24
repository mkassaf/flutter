import 'dart:math';

import 'package:oop/oop.dart';

void main(List<String> arguments) {
  Button btn = Button(title: 'Click me', color: 'Blue');

  print(btn.toString());

  print(calculate());
}

class Button extends Object {
  final String title;
  final String color;

  const Button({required this.title, required this.color});

  const Button.primary({required String title})
      : this(title: title, color: 'Blue');

  Button.secondary({required this.title}) : color = 'Green';

  Button.danger({required this.title}) : color = 'Red';

  @override
  String toString() {
    return "Button: {title: $title, color: $color}";
  }
}
