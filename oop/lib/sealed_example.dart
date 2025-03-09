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

//Pattern in dart (switch)
String handle(Result result) {
  return switch (result) {
    Success() => 'Success',
    Failure() => 'Failure',
    _ => 'Loading' //default
  };
}
