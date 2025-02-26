class Data {
  late final int? id;
  late List<int> myList = fetchList();

  void add(int value) {
    myList.add(value);
  }

  static List<int> fetchList() {
    print("Fetching list from server...");
    return [1, 2, 3];
  }
}

void main(List<String> args) {
  print("Hello, World!");
  var data = Data();
  print("Data object created!");

  print("Before access myList");

  print(data.myList);

  //print(data.id); //Error: Field 'id' has not been initialized.
  data.id = 1;
  data.myList = [3];
  print(data.myList);

  //print(data.id);

  //data.id = 2;//Error id is already initlized
}
