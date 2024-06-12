class Photo {
  final int id;
  final String photographer;
  final String imageUrl;
  final String fullImageUrl; // Новое поле для полноразмерного изображения

  Photo({
    required this.id,
    required this.photographer,
    required this.imageUrl,
    required this.fullImageUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      photographer: json['photographer'],
      imageUrl: json['src']['medium'],
      fullImageUrl: json['src']['original'],
    );
  }
}
