base class Job {
  Job() {
    print('Job is created');
  }

  void doJob() {
    print('Job is done');
  }

  void doJob2() {
    print('Job2 is done');
  }
}

final class WorkerJob extends Job {
  WorkerJob() {
    print('WorkerJob is created');
  }
}

void main(List<String> args) {
  WorkerJob workerJob = WorkerJob();
}
