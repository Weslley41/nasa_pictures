import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/apod_picture.dart';

class PictureProvider with ChangeNotifier {
  final String apiKey = dotenv.env['API_KEY']!;
  final String baseUrl = 'https://api.nasa.gov/planetary/apod';
  late final Function onerror;
  final List<APODPicture> _pictures = [];
  late int statusCode;
  int _countPictures = 10;
  int _invalidPictures = 0;

  List<APODPicture> get pictures => _pictures;
  int get countPictures => _countPictures;
  APODPicture getPicture(int index) => _pictures[index];

  set countPictures(int value) {
    print('>>> update countPictures');
    _countPictures = value;
    notifyListeners();
  }

  Future<void> loadPictures() async {
    final int count = _invalidPictures == 0 ? _countPictures : _invalidPictures;
    _invalidPictures = 0;
    print('>>> loadPictures($count)');
    final String url = '$baseUrl?api_key=$apiKey&count=$count';
    final request = await http.get(Uri.parse(url)).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        print('>>> loadPictures() - Timeout');
        return http.Response('Error timeout', 408);
      }
    );
    statusCode = request.statusCode;

    if (request.statusCode == HttpStatus.ok) {
      final data = jsonDecode(request.body);
      data.forEach((picture) => loadValidPicture(picture));

      if (_invalidPictures > 0) {
        await loadPictures();
      } else {
        print('>>> loading completed');
      }
    } else {
      _pictures.clear();
      onerror('An error occurred while loading the images. Please try again later.');
      return Future.error('Failed to load pictures');
    }
  }

  void loadValidPicture(Map<String, dynamic> picture) {
    print('>>> pictureValid()');
    APODPicture apodPicture;
    try {
      apodPicture = APODPicture(
        title: picture['title'] ?? 'No title',
        copyright: picture['copyright'] ?? 'No copyright',
        explanation: picture['explanation'] ?? 'No explanation',
        date: picture['date'] ?? 'No date',
        imageUrl: picture['url']!,
        imageHDUrl: picture['hdurl'] ?? picture['url']!,
      );

      _pictures.add(apodPicture);
    } catch (e) {
      print('>>> Picture Invalid');
      _invalidPictures++;
    }
  }

  void reloadPictures() {
    print('>>> reloadPictures()');
    _pictures.clear();
    notifyListeners();
  }
}
