class Color {
  final red;
  final int green;
  final int blue;
  const Color(this.red, this.green, this.blue);
}

enum Price { low, medium, high }

enum ShapeType {
  square('square', Color(255, 0, 0)),
  circle('circle', Color(0, 255, 0)),
  triangle('triangle', Color(0, 0, 255));

  final String name;
  final Color color;

  const ShapeType(this.name, this.color);

  int get red => color.red;
  int get green => color.green;
  int get blue => color.blue;
}

class Shape {
  final String name;
  final ShapeType shapeType;

  Shape(this.name, this.shapeType);
}

void main(List<String> args) {
  var shape = Shape('Square', ShapeType.square);

  print('Shape: ${shape.name}');
  print('Shape Type: ${shape.shapeType.name}');
  print('Shape Color: ${shape.shapeType.color}');
  print('Shape Color Red: ${shape.shapeType.red}');
  print('Shape Color Green: ${shape.shapeType.green}');
  print('Shape Color Blue: ${shape.shapeType.blue}');
}
