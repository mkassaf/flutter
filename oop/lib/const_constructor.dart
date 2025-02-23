void main(List<String> arguments) {
  const primary = Button.primary(title: 'Save');
  var primary2 = Button.primary(title: 'Save');

  if (identical(primary, primary2)) {
    print('Equal');
  } else {
    print('Not Equal');
  }

  print(primary.title);
  print(primary.color);
}

class Button {
  final String title;
  final String color;

  const Button({required this.title, required this.color});

  const Button.primary({required String title})
      : this(title: title, color: 'Blue');

  Button.secondary({required this.title}) : color = 'Green';

  Button.danger({required this.title}) : color = 'Red';
}
