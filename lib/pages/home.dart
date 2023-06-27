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
            onPressed: () => provider.reloadPictures(),
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
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.aboutPage),
            icon: const Icon(Icons.help),
          ),
        ],
      ),
      body: FutureBuilder(
        future: provider.loadPictures(),
        builder: (context, snapshot) {
          print('>>> FutureBuilder()');
          Widget child;
          if (snapshot.connectionState == ConnectionState.waiting) {
            child = const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            child = const Center(child: Text('Failed to load pictures.', style: TextStyle(fontSize: 30)));
          } else {
            print('>>> count pictures: ${pictures.length}');
            // child = const Text('Deu bom', style: TextStyle(fontSize: 30));
            child = GridView.builder(
              padding: const EdgeInsetsDirectional.all(20),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: pictures.length,
              itemBuilder: (_, index) => ImageCard(picture: pictures[index]),
            );
          }

          return RefreshIndicator(
            key: _refreshIndicatorKey,
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            onRefresh: () {
              print('>>> RefreshIndicator -> onRefresh');
              provider.reloadPictures();
              return Future.delayed(Duration.zero);
            },
            child: child,
          );
        }
      ),
    );
  }
}
