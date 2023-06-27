import 'package:flutter/material.dart';
import 'package:nasa_pictures/app/app_routes.dart';
import 'package:nasa_pictures/models/apod_picture.dart';
import 'package:nasa_pictures/pages/about_page.dart';
import 'package:nasa_pictures/pages/details_page.dart';
import 'package:provider/provider.dart';

import '../pages/home.dart';
import '../providers/picture_provider.dart';

class NasaPictures extends StatelessWidget {
  const NasaPictures({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PictureProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NASA Pictures',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.root,
        routes: {
          AppRoutes.root: (context) => const Home(),
          AppRoutes.imageDetails: (context) {
            final image = ModalRoute.of(context)?.settings.arguments as APODPicture;
            return DetailsPage(image: image);
          },
          AppRoutes.aboutPage: (context) => const AboutPage(),
        }
      ),
    );
  }
}
