import 'package:flutter/material.dart';
import 'package:nasa_pictures/models/apod_picture.dart';

class DetailsPage extends StatelessWidget {
  final APODPicture image;

  const DetailsPage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              image.imageUrl,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListTile(
                    title: Text(image.title),
                    leading: const Icon(Icons.photo_camera),
                  ),
                  ListTile(
                    title: Text(image.date),
                    leading: const Icon(Icons.calendar_month),
                  ),
                  ListTile(
                    title: Text(image.copyright),
                    leading: const Icon(Icons.copyright),
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromWidth(double.maxFinite),
                        textStyle: const TextStyle(fontSize: 16)
                      ),
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        showDragHandle: true,
                        builder: (context) => ImageDescription(
                          description: image.explanation,
                        ),
                      ),
                      child: const Text('Show description')
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}

class ImageDescription extends StatelessWidget {
  final String description;

  const ImageDescription({
    super.key, required this.description
  });

  @override
  Widget build(BuildContext context) {
    print('>>> build() - ImageDescription');
    return BottomSheet(
      onClosing: () {},
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0
          ),
          child: Column(
            children: [
              Text(
                description.replaceAll('\n', ''),
                textAlign: TextAlign.justify,
              )
            ],
          ),
        );
      }
    );
  }
}
