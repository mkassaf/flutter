abstract class ImplicitInterface {
  void method();
}

class Child extends ImplicitInterface {
  Child() {
    print('Child constructor');
  }

  @override
  void method() {
    print('Child method');
  }
}

class InterfaceImpl implements ImplicitInterface {
  @override
  void method() {
    print('InterfaceImpl method');
  }
}

class Child2 {
  Child2() {
    print('Child2 constructor');
  }

  void method2() {
    print('ChildImpl method');
  }
}

class ChildImpl implements Child2 {
  ChildImpl() {
    print('ChildImpl constructor');
  }

  @override
  void method2() {
    print('ChildImpl method');
  }
}

sealed class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void showName() {
    print('Name: $name');
  }
}

class PersonImpl implements Person {
  PersonImpl() {
    print('PersonImpl constructor');
  }

  @override
  String get name => "John";

  @override
  set name(String value) => print('name setter');

  @override
  int get age => 0;

  @override
  set age(int value) => print('age setter');

  @override
  void showName() {
    print('Name: $name');
  }
}

void main() {
  var person = PersonImpl();

  person.name = 'John'; //setter
  print(person.name); //getter
}
