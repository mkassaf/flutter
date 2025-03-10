import 'excplict_interface.dart';
import 'excplict_interface2.dart';

class Example implements ExplicitInterface {
  @override
  void method1() {
    print('method1');
  }

  @override
  void method2() {
    print('method2');
  }
}
