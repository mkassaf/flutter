class Person {
  int id;
  String name;
  Person(this.id, this.name);

  @override
  int get hashCode => Object.hash(id, name);

  @override
  bool operator ==(Object other) {
    if (other is! Person) {
      return false;
    }
    return other.hashCode == hashCode;
  }
}

class Data {
  int id;
  String name;
  Data(this.id, this.name);

  @override
  int get hashCode => Object.hash(id, name);

  @override
  bool operator ==(Object other) {
    return other.hashCode == hashCode;
  }
}

void main(List<String> args) {
  var person1 = Person(1, "John");
  var person2 = Person(1, "John");

  var data = Data(1, "John");

  print("person1.hashCode = ${person1.hashCode}");
  print("person2.hashCode = ${person2.hashCode}");

  if (person1 == data) {
    print("person1 and person2 are equal");
  } else {
    print("person1 and person are not equal");
  }
}
