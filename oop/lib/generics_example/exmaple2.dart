class Data<T> {
  T data;
  Data(this.data);
}

void main(List<String> args) {
  var data = Data<String>("Hello");
  print(data.data);

  Data<int> data2 = Data(10);
  print(data2.data);

  print(data2.data + 10);

  var data4 = handle("String");
  print(data4.runtimeType); //String

  var data6 = handle<int>(11);
  print(data6.runtimeType); //int

  var first1 = first([1, 2, 3]);

  print(first1 + 1);

  List<String> first2 = ["111"];

  Map<String, int> first3 = {"key": 1};
}

E handle<E>(E data) {
  return data;
}

T first<T>(List<T> ts) {
  // Do some initial work or error checking, then...
  T tmp = ts[0];
  // Do some additional checking or processing...
  return tmp;
}
