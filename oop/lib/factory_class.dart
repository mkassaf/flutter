void main(List<String> arguments) {
  var primary = Button.from({'title': 'Save', 'color': 'Blue'});
  var primary2 = Button.from({'title': 'Save', 'color': 'Red'});

  if (identical(primary, primary2)) {
    print('Equal');
  } else {
    print('Not Equal');
  }

  primary2.color = 'Yellow';
  print(primary.color); //Yellow
  print(primary2.color); //Yellow
}

class Button {
  final String title;
  String color;

  static final Map<String, Button> _cache = {};

  Button._internal({required this.title}) : color = 'Green';

  factory Button(String name) {
    return _cache.putIfAbsent(name, () => Button._internal(title: name));
  }

  factory Button.from(Map<String, String> data) {
    if (data['title'] == null || data['color'] == null) {
      throw ArgumentError('Title and color are required');
    }
    var myButton = Button(data['title']!);
    myButton.color = data['color']!;
    return myButton;
  }
}
