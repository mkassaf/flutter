class Person {
  int id;
  String name;

  Person(this.id, this.name);
}

class BadData extends Person {
  String address;

  BadData(super.id, super.name, this.address);
}

//The problem with this releashionship is that the BadData is not a person, it has a person.

class Data {
  Person person;
  String address;

  Data(this.person, this.address);
}
