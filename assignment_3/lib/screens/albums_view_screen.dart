import 'package:assignment_3/screens/photos_view_screen.dart';
import 'package:assignment_3/widgets/albums_card.dart';
import 'package:flutter/material.dart';
import 'package:assignment_3/api/api_service.dart' as api;

class AlbumsViewScreen extends StatefulWidget {
  const AlbumsViewScreen({super.key});

  @override
  State<AlbumsViewScreen> createState() => _AlbumsViewScreenState();
}

class _AlbumsViewScreenState extends State<AlbumsViewScreen> {
  bool _isLoading = false;

  bool _init = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: api.getAlbums(),
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        PhotosViewScreen.routeName,
                        arguments: snapshot.data?[index].id ?? 0,
                      );
                    },
                    child: AlbumsCardWidget(
                      userId: snapshot.data?[index].userId ?? 0,
                      id: snapshot.data?[index].id ?? 0,
                      title: snapshot.data?[index].title ?? "",
                    ),
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
