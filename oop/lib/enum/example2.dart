enum JobType {
  developer("DEV"),
  designer("DES"),
  tester("TES"),
  manager("MAN");

  final String code;
  const JobType(this.code);

  String get codeValue => code;
}

class Person {
  String name;
  JobType jobType;

  Person(this.name, this.jobType);

  void printPerson() {
    print('Name: $name, JobType: $jobType');
  }
}

void main(List<String> args) {
  Person person = Person('John', JobType.developer);
  person.printPerson();

  print(person.jobType.code);

  for (var jobType in JobType.values) {
    print("JobType: $jobType, index: ${jobType.index}");
  }
}
