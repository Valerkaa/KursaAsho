import 'package:flutter/material.dart';
import 'package:kursa/models/photo.dart';

class FullScreenImagePage extends StatelessWidget {
  final Photo photo;

  const FullScreenImagePage({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Фотограф: ' + photo.photographer),
      ),
      body: Center(
        child: Image.network(
          photo.fullImageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
