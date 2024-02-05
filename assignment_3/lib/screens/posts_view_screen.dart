import 'package:assignment_3/widgets/posts_card.dart';
import 'package:flutter/material.dart';
import 'package:assignment_3/api/api_service.dart' as api;

class PostsViewScreen extends StatefulWidget {
  const PostsViewScreen({super.key});

  @override
  State<PostsViewScreen> createState() => _PostsViewScreenState();
}

class _PostsViewScreenState extends State<PostsViewScreen> {
  bool _isLoading = false;
  bool _init = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: api.getPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.error != null) {
              return const Center(
                child: Text("Something went wrong"),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return PostsCardWidget(
                    userId: snapshot.data?[index].userId ?? 0,
                    id: snapshot.data?[index].id ?? 0,
                    title: snapshot.data?[index].title ?? "",
                    body: snapshot.data?[index].body ?? "",
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
