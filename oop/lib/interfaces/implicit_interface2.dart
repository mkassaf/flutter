abstract class Callable {
  void callMe();
}

class Person implements Callable {
  String name;

  Person(this.name) {
    print('Person constructor');
  }

  @override
  void callMe() {
    print('Person callMe');
  }

  String get className => 'Person';
}

class ExtPerson extends Person {
  ExtPerson(super.name) {
    print('ExtPerson constructor');
  }
}

class PersonImpl implements Callable {
  PersonImpl() {
    print('PersonImpl constructor');
  }

  @override
  void callMe() {
    print('PersonImpl callMe');
  }

  @override
  String get name => 'PersonImpl name';

  @override
  set name(String name) {
    print('PersonImpl name setter');
  }

  @override
  String get className => 'PersonImpl';
}

void main(List<String> args) {
  var person = ExtPerson("ahmad"); //two constructors will be called
  person.callMe(); // called super class method

  person.name = "ahmad"; // setter will be called
  print(person.name); // getter will be called

  var personImpl = PersonImpl();
  personImpl.callMe();

  personImpl.name = "ahmad";
  print(personImpl.name);
  print(personImpl.className);
}
