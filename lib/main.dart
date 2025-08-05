
import 'package:apiflutter/pages/photo/list_photo_screen.dart';
import 'package:apiflutter/pages/posts/list_post_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fatch Data'),
        ),
        body: ListPhotoScreen(),
      ),
    );
  }
}