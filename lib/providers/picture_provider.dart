import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/apod_picture.dart';

class PictureProvider with ChangeNotifier {
  final String apiKey = dotenv.env['API_KEY']!;
  final String baseUrl = 'https://api.nasa.gov/planetary/apod';
  final List<APODPicture> _pictures = [];
  int _countPictures = 10;
  int _invalidPictures = 0;

  List<APODPicture> get pictures => _pictures;
  APODPicture getPicture(int index) => _pictures[index];

  Future<void> loadPictures() async {
    final int count = _invalidPictures == 0 ? _countPictures : _invalidPictures;
    print('>>> loadPictures($count)');
    _invalidPictures = 0;
    final String url = '$baseUrl?api_key=$apiKey&count=$count';
    final request = await http.get(Uri.parse(url));
    if (request.body.isNotEmpty) {
      final data = jsonDecode(request.body);
      data.forEach((picture) => loadValidPicture(picture));
      if (_invalidPictures > 0) {
        loadPictures();
      } else {
        print('>>> NOTIFY');
        notifyListeners();
      }
    } else {
      //ADICIONAR UMA EXIBICIÇÃO PARA O USUÁRIO RECERREGAR DEVIDO A FALHA
      //NA COMUNICAÇÃO COM O SERVIDOR
      loadPictures();
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
    loadPictures();
  }

  void updateCountImages(int count) {
    print('>>> updateCountImages()');
    _countPictures = count;
    reloadPictures();
  }
}