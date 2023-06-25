import 'package:flutter/material.dart';
import 'package:nasa_pictures/models/apod_picture.dart';

class DetailsPage extends StatelessWidget {
  final APODPicture image;

  const DetailsPage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                image.imageUrl,
              ),
              Text(
                image.title,
              ),
              Text(
                image.date,
              ),
              Text(
                image.explanation,
              ),
              Text(
                image.copyright,
              ),
            ],
          ),
        ));
  }
}
