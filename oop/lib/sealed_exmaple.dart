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
  printJob(Teacher());
}

void printJob(Job job) {
  switch (job) {
    case Teacher():
      print('Teacher');
    case Engineer():
      print('Engineer');
    case Doctor():
      print('Doctor');
  }
}
