import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> openUrl(url) async {
      if (!await launchUrl(Uri.parse(url))) {
        throw Exception('Não foi possível abrir o link $url');
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('About'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "An application that displays a user-defined number of images and their information. This data is obtained from NASA's APOD API",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () =>
                            openUrl('https://github.com/nasa/apod-api'),
                        child: const Icon(
                          FontAwesomeIcons.userAstronaut,
                          size: 100,
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      '(Click on astronaut icon to view the API repository)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'APP Developed By\n\nGabriel Benigno Rocha\nWeslley de Jesus Souza Morais',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () => openUrl(
                            'https://github.com/Weslley41/nasa_pictures'),
                        child: const Icon(
                          FontAwesomeIcons.github,
                          size: 100,
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      '(Click on github icon to view the project repository)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
