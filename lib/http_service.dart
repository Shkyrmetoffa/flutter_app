import 'dart:convert';

import 'package:flutter_app/global.dart';
import 'package:flutter_app/models/post_model.dart';
import 'package:http/http.dart';

class HttpService {
  final String postUrl = baseUrl;

  Future<List<Post>> getPosts() async {
    Response res = await get(postUrl);

    if(res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;
    } else {
      throw('Can"t get posts');
    }
  }
}