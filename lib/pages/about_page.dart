import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse('https://github.com/Weslley41/nasa_pictures');

    Future<void> openUrl() async {
      if (!await launchUrl(url)) {
        throw Exception('Não foi possível abrir o link $url');
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('About'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              '"UMA DESCRIÇÃO SIMPLES DO APP"',
              textAlign: TextAlign.center,
            ),
            const Text(
              'Developed By\n\nGabriel Benigno Rocha\nWeslley de Jesus Souza Morais',
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
                      onTap: () => openUrl(),
                      child: const Icon(
                        FontAwesomeIcons.github,
                        size: 128,
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
        ));
  }
}
