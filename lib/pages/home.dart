import 'package:flutter/material.dart';
import 'package:nasa_pictures/app/app_routes.dart';
import 'package:nasa_pictures/widgets/image_card.dart';
import 'package:provider/provider.dart';

import '../models/apod_picture.dart';
import '../providers/picture_provider.dart';
import './settings_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();

    print('>>> initState()');
    final provider = Provider.of<PictureProvider>(context, listen: false);
    provider.onerror = showErrorMessage;
    provider.loadPictures();
  }

  void showErrorMessage(String message) {
    print('>>> showSnackbar()');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'An error occurred while loading the images. Please try again later.'
        ),
        duration: Duration(seconds: 3),
      )
    );
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
              onPressed: () => _refreshIndicatorKey.currentState?.show(),
              icon: const Icon(Icons.refresh),
            ),
            IconButton(
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => SettingsDialog(provider: provider),
              ),
              icon: const Icon(Icons.settings),
            ),
            IconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoutes.aboutPage),
              icon: const Icon(Icons.help),
            ),
          ],
        ),
        body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () => provider.reloadPictures(),
        child: GridView.builder(
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

            return GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                AppRoutes.imageDetails, arguments: picture
              ),
              child: ImageCard(
                imageTitle: picture.title,
                imageDate: picture.date,
                imageUrl: picture.imageUrl,
              ),
            );
          },
        ),
      )
    );
  }
}
