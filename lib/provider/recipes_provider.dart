import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/recipe_model.dart';

class Items with ChangeNotifier {
  List<Recipe> _items = [];

  List<Recipe> get items {
    return [..._items];
  }

  bool isLoading = true;

  final String url =
      'https://raw.githubusercontent.com/ababicheva/FlutterInternshipTestTask/main/recipes.json';

  Future<void> fetchItems() async {
    try {
      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body) as List<dynamic>;
      data.sort((a, b) {
        return a['id'].compareTo(b['id']);
      });
      List<Recipe> loadedList = [];

      data.forEach((element) {
        loadedList.add(Recipe(
          id: element['id'],
          name: element['name'],
          picture: element['picture'],
          description: element['description'],
        ));
        _items = loadedList;
        isLoading = false;
        notifyListeners();
      });
      print('data is loaded');
    } catch (e) {
      print('data is not loaded');
    }
  }
}
