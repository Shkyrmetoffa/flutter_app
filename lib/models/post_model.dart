import 'package:flutter/material.dart';

class Post {
  final int id;
  final String date;

  Post({
    @required this.id,
    @required this.date,
    });

    factory Post.fromJson(Map<String, dynamic> json) {
      return Post(
        date: json['date'] as String,
        id: json['id'] as int,
      );
    }
}
