import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nivaas/app/bloc/posts/post_event.dart';
import 'package:nivaas/app/bloc/posts/post_state.dart';
import 'package:nivaas/app/bloc/posts/posts_bloc.dart';
import 'package:nivaas/app/repo/posts/post_repository.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail'),
      ),
      body: BlocProvider(
        create: (context) => PostBloc(PostRepository())..add(FetchPost()),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostInitial) {
              return Center(child: Text('Welcome!'));
            } else if (state is PostLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PostLoaded) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title: ${state.post.title}', style: TextStyle(fontSize: 20)),
                    SizedBox(height: 8),
                    Text('Body: ${state.post.body}', style: TextStyle(fontSize: 16)),
                  ],
                ),
              );
            } else if (state is PostError) {
              return Center(child: Text(state.message));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
