import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/app_routes.dart';
import '../models/apod_picture.dart';
import '../pages/about_page.dart';
import '../pages/details_page.dart';
import '../pages/home.dart';
import '../providers/design_provider.dart';
import '../providers/picture_provider.dart';
import '../theme.dart';

class NasaPictures extends StatefulWidget {
  const NasaPictures({super.key});

  @override
  State<NasaPictures> createState() => NasaPicturesState();

  static NasaPicturesState? of(BuildContext context) {
    return context.findAncestorStateOfType<NasaPicturesState>();
  }
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
        theme: lightTheme,
        darkTheme: darkTheme,
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
