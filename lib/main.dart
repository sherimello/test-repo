import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototype/bindings/counter_binding.dart';
import 'package:prototype/bindings/post_binding.dart';
import 'package:prototype/get%20pages/pages.dart';
import 'package:prototype/pages/counter.dart';
import 'package:prototype/pages/posts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/posts',
      initialBinding: PostBinding(),
      getPages: Pages().getAllPages(),
      home: Posts(),
    );
  }
}