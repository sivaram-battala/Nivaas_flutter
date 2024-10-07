import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/post_model.dart';

class ApiService {
  static const String apiUrl = 'https://jsonplaceholder.typicode.com/posts/1';

  Future<Post> fetchPost() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
