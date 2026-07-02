import 'package:get/get.dart';
import 'package:prototype/controllers/counter_controller.dart';
import 'package:prototype/controllers/post_controller.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => PostController());
  }
}
