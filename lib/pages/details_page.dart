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
          padding: const EdgeInsetsDirectional.symmetric(vertical: 20),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => {},
                child: Image.network(
                  image.imageUrl,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Title: ${image.title}',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Date: ${image.date}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Description: ${image.explanation}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Copyright: ${image.copyright.trim().replaceAll('\n', ' ')}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
