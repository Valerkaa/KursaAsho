import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/photo.dart';

class PexelsApi {
  final String apiKey;
  final int perPage;

  PexelsApi({required this.apiKey, this.perPage = 130});

  Future<List<Photo>> fetchPhotos() async {
    final response = await http.get(
      Uri.parse('https://api.pexels.com/v1/curated?per_page=$perPage'),
      headers: {'Authorization': apiKey},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['photos'];
      return data.map((json) => Photo.fromJson({
        ...json,
        'src': {
          'medium': json['src']['medium'],
          'original': json['src']['original'],
        },
      })).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }

}
