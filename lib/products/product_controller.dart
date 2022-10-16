import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interceptors/products/models/product_model.dart';
import 'package:interceptors/products/product_remote_data_source.dart';
import 'package:riverpod/riverpod.dart';
import 'package:http/http.dart' as http;

final products = FutureProvider.autoDispose<List<ProductModel>>(
  (ref) async => ref.watch(productsRemoteDataSource).getProducts(),
);


final productsListProvider =
    FutureProvider.family<List<ProductModel>, String>((ref, cat) async {
  http.Response response = await http
      .get(Uri.parse('https://fakestoreapi.com/products/category/$cat'));
  final data = jsonDecode(response.body);
  return data!
      .map<ProductModel>((product) => ProductModel.fromJson(product))
      .toList();
});

final detailsProduct =
    Provider.autoDispose<ProductModel>((ref) => throw UnimplementedError());


final productsListSearch =
Provider<ProductModel>((ref) => throw UnimplementedError());



AutoDisposeFutureProvider<List<ProductModel>> productsSearch = products;


