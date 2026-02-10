import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _favoritesKey = 'favorites';
  static const String _downloadsKey = 'downloaded';

  static Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  static Future<void> saveFavorites(List<String> favorites) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_favoritesKey, favorites);
  }

  static Future<List<String>> getDownloadedChapters() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_downloadsKey) ?? [];
  }

  static Future<void> saveDownloadedChapters(List<String> chapters) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_downloadsKey, chapters);
  }
}