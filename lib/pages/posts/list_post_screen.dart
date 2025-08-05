import 'package:apiflutter/models/post_model.dart';
import 'package:apiflutter/services/post_service.dart';
import 'package:flutter/material.dart';

class ListPostScreen extends StatelessWidget {
  const ListPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.amber,
      child: FutureBuilder<List<PostModel>>(
        future: PostService.listPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final dataPost = snapshot.data ?? [];
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: dataPost.length,
            itemBuilder: (context, items) {
              final post = dataPost[items];
              return GestureDetector(
               child: ListTile(
                leading: Text(post.id.toString()),
                title: Text(post.title),
                subtitle: Text('userId: ${post.userId}'),
               ),
              );
            },
          );
        },
      ),
    );
  }
}
