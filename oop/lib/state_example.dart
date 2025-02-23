main() {
  var stateExample = StateExample();
  StateExample.sCount();
  stateExample.nsCount();
  stateExample.nsCount();

  print(StateExample.staticCount); // 3
  print(stateExample.noneStaticCount); // 3
}

class StateExample {
  int noneStaticCount = 0;
  static int staticCount = 0;

  static void sCount() {
    staticCount++;
  }

  void nsCount() {
    sCount();
    noneStaticCount++;
  }
}
