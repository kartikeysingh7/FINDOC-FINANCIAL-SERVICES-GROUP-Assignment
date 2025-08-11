import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc_app/api/api_exceptions.dart';
import 'package:flutter_bloc_app/models/photo.dart';

class ApiClient {
  final http.Client httpClient;
  static const baseUrl = 'https://picsum.photos';

  ApiClient({required this.httpClient});

  Future<List<Photo>> fetchPhotos(int count) async {
    try {
      final response = await httpClient.get(
        Uri.parse('$baseUrl/v2/list?page=1&limit=$count'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Photo.fromJson(json)).toList();
      } else {
        throw ApiException(
            message: 'Failed to load photos', statusCode: response.statusCode);
      }
    } catch (e) {
      throw ApiException(message: 'Network error: $e');
    }
  }

  String getPhotoUrl(String id, int width, int height) {
    return '$baseUrl/id/$id/$width/$height';
  }
}