import 'package:get/get.dart';
import 'package:prototype/bindings/counter_binding.dart';
import 'package:prototype/pages/counter.dart';
import 'package:prototype/pages/posts.dart';

import '../bindings/post_binding.dart';

class Pages {
  List<GetPage> getAllPages() {
    return [
      GetPage(name: '/counter', page: () => Counter(), binding: CounterBinding()),
      GetPage(name: '/posts', page: () => Posts(), binding: PostBinding()),
    ];
  }
}