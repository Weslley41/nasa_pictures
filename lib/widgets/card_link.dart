
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CardLink extends StatelessWidget {
  final String name;
  final String username;
  final String? repository;
  final IconData? icon;

  const CardLink({
    super.key, required this.name, required this.username,
    this.repository, this.icon
  });

  @override
  Widget build(BuildContext context) {
    Future<void> openUrl(url) async {
      if (!await launchUrl(Uri.parse(url))) {
        throw Exception('Não foi possível abrir o link $url');
      }
    }

    final Widget leading;
    if (icon == null) {
      leading = ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          'https://github.com/$username.png',
          width: 50, height: 50
        ),
      );
    } else {
      leading = Icon(icon, size: 50);
    }

    return ListTile(
      leading: leading,
      title: Text(name),
      onTap: () => openUrl('https://github.com/$username/${repository ?? ''}'),
      subtitle: Row(children: [
        const Icon(FontAwesomeIcons.github, size: 15),
        Text(
          '/$username${repository ?? ''}',
          style: Theme.of(context).textTheme.bodySmall,
        )
      ])
    );
  }
}
