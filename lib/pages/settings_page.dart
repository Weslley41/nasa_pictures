import 'package:flutter/material.dart';

import '../providers/picture_provider.dart';

class SettingsDialog extends StatefulWidget {
  final PictureProvider provider;
  const SettingsDialog({super.key, required this.provider});

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  late double _currentCountImages = widget.provider.countPictures.toDouble();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings),
          SizedBox(width: 10),
          Text('Settings'),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      actionsPadding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Select the number of images to display',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 20),
          Slider(
            value: _currentCountImages,
            min: 5,
            max: 20,
            divisions: 3,
            label: _currentCountImages.round().toString(),
            onChanged: (double value) {
              setState(() {
                print('>>> setState: $_currentCountImages to $value');
                _currentCountImages = value;
              });
              // currentCountImages = value;
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            print('>>> Close without saving');
          },
          child: const Text('Close'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            print('>>> updateCount($_currentCountImages)');
            widget.provider.countPictures = _currentCountImages.round();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
