import 'package:dio/dio.dart';

import '../models/post.dart';

class PostApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    )
  );
  
  Future<List<Post>> fetchPosts() async{
    
    try {
      var _response = await _dio.get('/posts');

      if(_response.statusCode == 200) {

        List<dynamic> data = _response.data;

        return data.map((item) {
          return Post(
            userId: item['userId'], id: item['id'], title: item['title'], body: item['body'],
          );
        }).toList();

      }

      else {
        throw Exception("Api Exception Encountered!");
      }

    }
    
    catch(e) {
      throw e.toString();
    }
    
  }
  
}