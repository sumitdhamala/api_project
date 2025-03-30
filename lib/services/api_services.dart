import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<dynamic>> getPosts() async {
    final response = await http.get(Uri.parse("$baseUrl/posts"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    throw Exception("Failer to load posts");
  }

  Future<Map<String, dynamic>> createPost(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse("$baseUrl/posts"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    throw Exception("Failed to create post");
  }

  Future<Map<String, dynamic>> updatePost(
      int id, Map<String, dynamic> data) async {
    final response = await http.patch(Uri.parse("$baseUrl/posts/$id"),
        headers: {"Content-Type": "application/json"}, body: json.encode(data));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    throw Exception("Failed to update Post");
  }

  Future delectePost(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/posts/$id"));
    if (response.statusCode == 200) {
      throw Exception("Failed to delete post");
    }
  }
}
