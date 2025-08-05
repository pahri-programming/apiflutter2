import 'package:flutter/material.dart';
import 'package:apiflutter/models/photo_model.dart'; // sesuaikan nama filenya

class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;

  const PhotoDetailScreen({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo #${photo.id}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tampilkan gambar full
            if (photo.url != null) Image.network(
                photo.url!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 16),
            Text(
              photo.title ?? '',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 8),
            Text('Album ID: ${photo.albumId}'),
            const SizedBox(height: 4),
            Text('Thumbnail:'),
            if (photo.thumbnailUrl != null)
              Image.network(
                photo.thumbnailUrl!,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
          ],
        ),
      ),
    );
  }
}
