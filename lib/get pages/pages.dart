import 'package:get/get.dart';
import 'package:prototype/bindings/counter_binding.dart';
import 'package:prototype/bindings/post_binding.dart';
import 'package:prototype/pages/counter.dart';
import 'package:prototype/pages/posts.dart';

class Pages {
  List<GetPage> getAllPages() {
    return [
      GetPage(name: '/counter', page: () => Counter(), binding: CounterBinding()),
      GetPage(name: '/post', page: () => Posts(), binding: PostBinding()),
    ];
  }
}