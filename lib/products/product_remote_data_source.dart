
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interceptors/network/api.dart';
import 'package:interceptors/products/models/product_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';


part 'product_remote_data_source.g.dart';

@RestApi()
abstract class ProductRemoteDataSource {
  factory ProductRemoteDataSource(Dio dio, {String baseUrl}) =
  _ProductRemoteDataSource;

  @GET('/products')
  Future<List<ProductModel>> getProducts();


  @POST('/products')
  Future<List<ProductModel>> addProducts(@Body() ProductModel productModel);
}

final productsRemoteDataSource = Provider<ProductRemoteDataSource>(
      (ref) => ProductRemoteDataSource(
    ref.read(dio),
  ),
);
