sealed class Result {
  void showResult();
}

class Success extends Result {
  @override
  void showResult() {
    print('Success');
  }
}

class Failure extends Result {
  @override
  void showResult() {
    print('Failure');
  }
}

class Loading extends Result {
  @override
  void showResult() {
    print('Loading');
  }
}

void main(List<String> args) {
  print(handle(Loading()));
}

String handle(Result result) {
  String res = '';
  switch (result) {
    case Success():
      res = 'Success';
    case Failure():
      res = 'Failure';
    case Loading():
      res = 'Loading';
  }

  return res;
}
