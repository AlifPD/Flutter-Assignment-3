import 'package:assignment_3/widgets/photos_card.dart';
import 'package:flutter/material.dart';
import 'package:assignment_3/api/api_service.dart' as api;

class PhotosViewScreen extends StatefulWidget {
  static const routeName = '/photoViewScreen';

  const PhotosViewScreen({super.key});

  @override
  State<PhotosViewScreen> createState() => _PhotosViewScreenState();
}

class _PhotosViewScreenState extends State<PhotosViewScreen> {
  bool _isLoading = false;

  bool _init = true;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: api.getPhotos(args),
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
                  return PhotosCardWidget(
                    albumId: snapshot.data?[index].albumId ?? 0,
                    id: snapshot.data?[index].id ?? 0,
                    title: snapshot.data?[index].title ?? "",
                    url: snapshot.data?[index].url ?? "",
                    thumbnailUrl: snapshot.data?[index].thumbnailUrl ?? "",
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
