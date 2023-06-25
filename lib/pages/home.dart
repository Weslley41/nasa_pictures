import 'package:flutter/material.dart';
import 'package:nasa_pictures/app/widgets/image_card.dart';
import 'package:provider/provider.dart';

import '../models/apod_picture.dart';
import '../providers/picture_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    print('>>> initState()');
    final provider = Provider.of<PictureProvider>(context, listen: false);
    provider.loadPictures();
  }

  @override
  Widget build(BuildContext context) {
    print('>>> build()');
    final provider = Provider.of<PictureProvider>(context, listen: true);
    final List<APODPicture> pictures = provider.pictures;
    print('>>> count pictures: ${pictures.length}');

    return Scaffold(
        appBar: AppBar(
          title: const Text('NASA Pictures'),
          actions: [
            IconButton(
              onPressed: () => provider.reloadPictures(),
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: GridView.builder(
          padding: const EdgeInsetsDirectional.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: pictures.length,
          itemBuilder: (context, index) {
            final picture = pictures[index];

            return ImageCard(
              imageTitle: picture.title,
              imageDate: picture.date,
              imageUrl: picture.imageUrl,
            );
          },
        ));
  }
}
