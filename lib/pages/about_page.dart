import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/card_link.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 50
          ),
          child: Column(
            children: [
              Text(
                'NASA Pictures',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'An application that displays a user-defined number of images and their information. This data is obtained from NASA\'s APOD API.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              Text(
                'APP Developed By',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const CardLink(
                name: 'Gabriel Benigno',
                username: 'DuckAllLife',
              ),
              const CardLink(
                name: 'Weslley Souza',
                username: 'Weslley41',
              ),
              Text(
                'Other links',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const CardLink(
                name: 'See the source code',
                username: 'Weslley41',
                repository: '/nasa_pictures',
                icon: FontAwesomeIcons.github,
              ),
              const CardLink(
                name: 'NASA\'s APOD API',
                username: 'nasa',
                repository: '/apod-api',
                icon: FontAwesomeIcons.github,
              ),
            ]
          ),
        ),
      )
    );
  }
}
