import 'package:chopper/chopper.dart';

import '../../utils.dart';

part 'products_api.chopper.dart';

@ChopperApi()
abstract class ProductsApi extends ChopperService {
  ProductsApi();

  factory ProductsApi.create([ChopperClient? client]) => _$ProductsApi(client);

  @GET(path: '/products/{id}')
  Future<Response<JsonMap>> getProduct(@Path('id') String id,
      [@QueryMap() Map<String, dynamic>? params]);

  @GET(path: '/products/{id}/variants')
  Future<Response<JsonMap>> getProductVariants(@Path('id') String productId,
      [@QueryMap() Map<String, dynamic>? params]);

  @GET(path: '/products')
  Future<Response<JsonMap>> getAllProducts(
      [@QueryMap() Map<String, dynamic>? params]);
}

@ChopperApi()
abstract class ProductVariantsApi extends ChopperService {
  ProductVariantsApi();

  factory ProductVariantsApi.create([ChopperClient? client]) =>
      _$ProductVariantsApi(client);

  @GET(path: '/variants/{id}')
  Future<Response<JsonMap>> getVariant(@Path('id') String id,
      [@QueryMap() Map<String, dynamic>? params]);

  @GET(path: '/variants')
  Future<Response<JsonMap>> getAllVariants(
      [@QueryMap() Map<String, dynamic>? params]);
}
