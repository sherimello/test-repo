import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototype/controllers/post_controller.dart';

class Posts extends GetView<PostController> {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          controller.fetchPosts();
        }),
        body: controller.isLoading
            ? Center(child: CircularProgressIndicator(color: Colors.black))
            : ListView.builder(
                itemCount: controller.posts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                        tileColor: Colors.black12,
                        subtitle: Text(controller.posts[index].body),
                        title: Text(controller.posts[index].title)),
                  );
                },
              ),
      ),
    );
  }
}
