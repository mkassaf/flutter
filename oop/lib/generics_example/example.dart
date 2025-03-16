abstract class Job<T> {
  T process(T value);
}

void callList(List<int> value) {
  print(value);
}

E call<E>(E value) {
  print(value);

  return value;
}

void callInt(int value) {
  print(value + 1);
}

class PDF {}

class Json {}

class PdfJob implements Job<PDF> {
  @override
  PDF process(PDF value) {
    print('Processing PDF');
    return value;
  }
}

class JsonJob extends Job<Json> {
  @override
  Json process(Json value) {
    print('Processing JSON');
    return value;
  }
}

class ClassWithTwoGenirce<T, F> {
  T value1;
  F value2;

  ClassWithTwoGenirce(this.value1, this.value2);
}

T first<T>(List<T> ts) {
  // Do some initial work or error checking, then...
  T tmp = ts[0];
  // Do some additional checking or processing...
  return tmp;
}

Object firstWithout(List ts) {
  // Do some initial work or error checking, then...
  dynamic tmp = ts[0];
  // Do some additional checking or processing...
  return tmp;
}

void main(List<String> args) {
  Job<PDF> job = PdfJob();
  PDF pdf = PDF();
  job.process(pdf);

  Job<Json> job2 = JsonJob();
  Json json = Json();
  job2.process(json);

  var value = call(10);
  var value2 = call('Hello');

  callInt(10);

  var classWithTwoGenirce = ClassWithTwoGenirce<int, String>(10, 'Hello');
  print(classWithTwoGenirce.value1);
  print(classWithTwoGenirce.value2);

  var first1 = firstWithout([1, 2, 3]);

  first1 as int;

  print(first1.isEven);

  var first2 = first(["1", "2", "3"]);
  first2.length;

  var first3 = first([1, 2, 3]);

  first3.isEven;
}
