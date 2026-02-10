import 'package:http/http.dart' as http;
import 'dart:convert';
import 'constants.dart';
import '../models/manhwa_model.dart';

class ApiService {
  static Future<List<Manhwa>> fetchManhwas() async {
    try {
      final response = await http.get(
        Uri.parse(
          '[31m${AppConstants.mangaDexApi}/manga?limit=${AppConstants.itemsPerPage}&order[follows]=desc&tags[]=${AppConstants.manhwaTag}',
        ),
      ).timeout(AppConstants.apiTimeout);

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'] as List;
        return data.map((m) => Manhwa.fromJson(m)).toList();
      } else {
        throw Exception('Failed to load manhwas: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching manhwas: $e');
    }
  }

  static Future<List<Chapter>> fetchChapters(String manhwaId) async {
    try {
      final response = await http.get(
        Uri.parse(
          '${AppConstants.mangaDexApi}/chapter?manga=[31m$manhwaId&limit=10',
        ),
      ).timeout(AppConstants.apiTimeout);

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'] as List;
        return data.map((c) => Chapter.fromJson(c)).toList();
      } else {
        throw Exception('Failed to load chapters');
      }
    } catch (e) {
      throw Exception('Error fetching chapters: $e');
    }
  }
}