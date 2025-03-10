sealed class Job {
  void run();
}

class Teacher extends Job {
  void run() {
    print('Teaching');
  }
}

class Engineer extends Job {
  void run() {
    print('Engineering');
  }
}

class Doctor extends Job {
  void run() {
    print('Doctoring');
  }
}

void main(List<String> args) {
  print(getName(Teacher()));
}

String getName(Job job) {
  return switch (job) {
    Teacher() => 'Teacher',
    Engineer() => 'Engineer',
    _ => 'Unknown'
  };
}
