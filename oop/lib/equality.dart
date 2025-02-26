class Data extends Object {
  String name;
  int id;

  Data(this.name, this.id);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other.runtimeType == runtimeType) {
      other as Data;
      return name == other.name && id == other.id;
    }
    return false;
  }
}

void main(List<String> args) {
  var data1 = Data('John', 1);
  var data2 = Data('John', 1);

  var data3 = data1;

  print(data1 == data2); //true
  print(identical(data2, data1)); //false

  print(data1 == data3); //true
  print(identical(data1, data3)); //true
}
