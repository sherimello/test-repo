import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototype/controllers/counter_controller.dart';

class Counter extends GetView<CounterController> {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(CupertinoIcons.add),
        onPressed: () {
          controller.increment();
        },
      ),
      appBar: AppBar(title: Text('GetX'), centerTitle: true),
      body: Center(
        child: Obx(
          () => Text(
            controller.counter.toString(),
            style: TextStyle(fontSize: 31, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
