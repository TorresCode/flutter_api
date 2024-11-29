import 'package:flutter/material.dart';
import 'package:test/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostController {
  ValueNotifier<List<PostModel>> posts = ValueNotifier<List<PostModel>>([]);
  List<PostModel> _originalPosts = [];

  void onChanged(String value) {
    if (value.isEmpty) {
      // Se o valor do campo estiver vazio, restaura a lista original
      posts.value = _originalPosts;
    } else {
      // Filtra os posts por ID ou título
      posts.value = _originalPosts.where((post) {
        final searchQuery = value.toLowerCase();
        return post.id.toString().contains(searchQuery) || 
               post.title.toLowerCase().contains(searchQuery);
      }).toList();
    }
  }

  Future<void> callApi() async {
    var client = http.Client();
    try {
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      var decodedResponse = jsonDecode(response.body) as List;
      _originalPosts = decodedResponse.map((e) => PostModel.fromJson(e)).toList();
      posts.value = _originalPosts;
    } finally {
      client.close();
    }
  }
}
