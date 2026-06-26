import 'package:get/get.dart';
import 'package:prototype/controllers/counter_controller.dart';

class CounterBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CounterController());
  }

}