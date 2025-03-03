class Person {
  String name;
  int age;

  Person(this.name, this.age);

  String showName() => 'Name: $name';

  void showAge() {
    print(age);
  }
}

class Student extends Person {
  String school;

  Student(String name, int age, this.school) : super(name, age);

  @override
  String showName() => 'Student ${super.name}';
}

main() {
  var student = new Student('Tom', 18, 'MIT');
  print(student.showName());

  var macbookpro = MacBookPro();
  macbookpro.display();
}

class Laptop {
  // Method
  void display() {
    print("Laptop display");
  }
}

class MacBook extends Laptop {
  // Method
  void display() {
    print("MacBook display");
    super.display();
  }
}

class MacBookPro extends MacBook {
  // Method
  void display() {
    print("MacBookPro display");
    super.display();
  }
}
