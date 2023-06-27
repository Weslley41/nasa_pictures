import 'package:flutter/material.dart';

import '../app/app_routes.dart';
import '../models/apod_picture.dart';

class ImageCard extends StatelessWidget {
  final APODPicture picture;
  const ImageCard({
    super.key,
    required this.picture
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        AppRoutes.imageDetails, arguments: picture
      ),
      child: Stack(children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.network(
            picture.imageUrl,
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 5.0,
          bottom: 10.0,
          child: Container(
            width: 180.0,
            color: Colors.black26,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  picture.title,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  picture.date,
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ),
        ),
      ]),
    );
  }
}
