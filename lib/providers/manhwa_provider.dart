import 'package:flutter/material.dart';

class ManhwaProvider extends ChangeNotifier {
  // Your state variables
  bool _isLoading = false;
  List<String> _manhwaList = [];

  // Getters for state
  bool get isLoading => _isLoading;
  List<String> get manhwaList => _manhwaList;

  // Fetch manhwa data
  Future<void> fetchManhwa() async {
    _isLoading = true;
    notifyListeners();

    // Simulate network request
    await Future.delayed(Duration(seconds: 2));
    _manhwaList = ['Manhwa 1', 'Manhwa 2', 'Manhwa 3'];

    _isLoading = false;
    notifyListeners();
  }

  // Additional methods to manipulate state can be added below
}