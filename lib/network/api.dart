import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const String baseUrl = 'https://fakestoreapi.com';

final dio = Provider<Dio>(
      (ref) => Dio(
    BaseOptions(baseUrl: baseUrl),
  ),
);