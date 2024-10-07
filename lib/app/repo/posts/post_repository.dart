import 'package:nivaas/app/models/post_model.dart';
import 'package:nivaas/app/services/posts/posts_api_service.dart';

class PostRepository {
  final ApiService _apiService = ApiService();

  Future<Post> getPost() async {
    return await _apiService.fetchPost();
  }
}
