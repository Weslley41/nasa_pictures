class APODPicture {
  final String title;
  final String copyright;
  final String explanation;
  final String date;
  final String imageUrl;
  final String imageHDUrl;

  APODPicture({
    required this.title,
    required this.copyright,
    required this.explanation,
    required this.date,
    required this.imageUrl,
    required this.imageHDUrl,
  }) {
    if (!_isImageValid) {
      throw ArgumentError.value(
        imageUrl,
        'imageUrl',
        'Must be a valid image URL',
      );
    }
  }

  bool get _isImageValid => imageUrl.endsWith('.jpg');
}
