import 'package:flutter/material.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'UMA DESCRIÇÃO SIMPLES DO APP',
              textAlign: TextAlign.center,
            ),
            const Text(
              'Developed By\nGabriel Benigno Rocha\nWeslley de Jesus Souza Morais',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () => openUrl(),
              child: Image.asset(
                'assets/icons/github-logo.png',
                width: 200,
                height: 200,
              ),
            ),
          ],
        ));
  }
}
