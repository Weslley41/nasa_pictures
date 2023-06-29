import 'package:flutter/material.dart';
import 'package:nasa_pictures/app/app_routes.dart';
import 'package:nasa_pictures/models/apod_picture.dart';
import 'package:nasa_pictures/pages/about_page.dart';
import 'package:nasa_pictures/pages/details_page.dart';
import 'package:nasa_pictures/providers/design_provider.dart';
import 'package:provider/provider.dart';

import '../pages/home.dart';
import '../providers/picture_provider.dart';

class NasaPictures extends StatefulWidget {
  const NasaPictures({super.key});

  @override
  State<NasaPictures> createState() => NasaPicturesState();

  static NasaPicturesState? of(BuildContext context) =>
      context.findAncestorStateOfType<NasaPicturesState>();
}

class NasaPicturesState extends State<NasaPictures> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PictureProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DesignProvider(),
        )
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NASA Pictures',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(
          useMaterial3: true,
        ),
        themeMode: Provider.of<DesignProvider>(context).themeMode,
        initialRoute: AppRoutes.root,
        routes: {
          AppRoutes.root: (context) => const Home(),
          AppRoutes.imageDetails: (context) {
            final image = ModalRoute.of(context)?.settings.arguments as APODPicture;
            return DetailsPage(image: image);
          },
          AppRoutes.aboutPage: (context) => const AboutPage(),
        }
      )
    );
  }
}
