base class Job {
  String title;
  double salary;
  Job(this.title, this.salary);

  void showJob() {
    print('Title: $title, Salary: $salary');
  }
}

sealed class ConvertToPdfJob2 extends Job {
  ConvertToPdfJob2(String title) : super(title, 0);

  @override
  void showJob() {
    print('Convert to PDF');
  }
}

//class ConvertToPdfJob implements Job {  }
