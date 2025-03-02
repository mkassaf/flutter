class Person {
  int id;
  String name;

  Person(this.id, this.name);

  @override
  bool operator ==(Object other) {
    print("== called");
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType == runtimeType) {
      other as Person;
      return id == other.id && name == other.name;
    }
    return false;
  }
}

class Data {
  int id;
  Data(this.id);

  @override
  bool operator ==(Object other) {
    print("==  in Data called");
    if (identical(this, other)) {
      return true;
    }
    if (other is Data) {
      return id == other.id;
    }
    return false;
  }
}

void main() {
  var person1 = Person(1, "Ahmad"); //new object with new location in mem
  var person2 = Person(1, "Ahmad"); //new object with new location in mem

  if (person2 == Data(1)) {
    print('Equle');
  } else {
    print('Not equle');
  }

  if (identical(person1, person2)) {
    print('identical');
  }
}
