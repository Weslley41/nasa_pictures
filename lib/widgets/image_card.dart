import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imageTitle;
  final String imageDate;
  final String imageUrl;
  const ImageCard({
    super.key,
    required this.imageTitle,
    required this.imageDate,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Image.network(
          imageUrl,
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
                  imageTitle,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  imageDate,
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ],
            )),
      ),
    ]);
  }
}
