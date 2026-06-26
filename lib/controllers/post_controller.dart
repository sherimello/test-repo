import 'dart:developer';

import 'package:get/get.dart';
import 'package:prototype/models/post.dart';
import 'package:prototype/network/post_api_service.dart';

class PostController extends GetxController {

  RxList<Post> _posts = <Post>[].obs;
  RxBool _isLoading = false.obs;

  fetchPosts() async {
    _isLoading.value = true;
    _posts.assignAll(await PostApiService().fetchPosts());
    _isLoading.value = false;

    log(_posts.toString());
  }

  List<Post> get posts => _posts;

  bool get isLoading => _isLoading.value;


}