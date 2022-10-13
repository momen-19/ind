import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final categoriesListProvider =
    FutureProvider.autoDispose<List<String>>((ref) async {
  http.Response response =
      await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));
  final data = jsonDecode(response.body);
  final categories =
      data.map<String>((category) => category.toString()).toList();
  return categories;
});

final selectedCategoryProvider =
Provider.autoDispose<String>((ref) => ref.state);