import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nivaas/app/repo/posts/post_repository.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostInitial()) {
    on<FetchPost>((event, emit) async {
      emit(PostLoading());

      try {
        final post = await postRepository.getPost();
        emit(PostLoaded(post));
      } catch (e) {
        emit(PostError('Failed to fetch post'));
      }
    });
  }
}
