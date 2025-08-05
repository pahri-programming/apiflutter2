import 'package:apiflutter/models/photo_model.dart'; // ganti PostModel → Photo
import 'package:apiflutter/services/photo_service.dart';
import 'package:flutter/material.dart';
import 'photo_detail_screen.dart'; // import detail screen

class ListPhotoScreen extends StatelessWidget {
  const ListPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ganti Container → Scaffold
      appBar: AppBar(title: const Text('Daftar Photo')),
      body: FutureBuilder<List<Photo>>(
        future: PhotoService
            .listPhoto(), // kalo kamu rename jadi PhotoService.listPhotos()
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final photos = snapshot.data ?? [];
          return ListView.builder(
            itemCount: photos.length,
            itemBuilder: (context, index) {
              final photo = photos[index];
              return ListTile(
                leading: Text(photo.id.toString()),
                title: Text(photo.title ?? ''),
                subtitle: Text('Album: ${photo.albumId}'),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PhotoDetailScreen(photo: photo),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
