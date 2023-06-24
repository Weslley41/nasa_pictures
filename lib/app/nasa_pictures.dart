import 'package:flutter/material.dart';
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
        home: const Home(),
      ),
    );
  }
}
