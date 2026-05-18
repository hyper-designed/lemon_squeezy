import 'package:chopper/chopper.dart';

import '../../utils.dart';

part 'orders_api.chopper.dart';

@ChopperApi()
abstract class OrdersApi extends ChopperService {
  OrdersApi();

  factory OrdersApi.create([ChopperClient? client]) => _$OrdersApi(client);

  @GET(path: '/orders/{id}')
  Future<Response<JsonMap>> getOrder(@Path('id') String id,
      [@QueryMap() Map<String, dynamic>? params]);

  @GET(path: '/orders')
  Future<Response<JsonMap>> getAllOrders(
      [@QueryMap() Map<String, dynamic>? params]);

  @POST(path: '/orders/{id}/generate-invoice', optionalBody: true)
  Future<Response<JsonMap>> generateOrderInvoice(@Path('id') String orderId);
}

@ChopperApi()
abstract class OrderItemsApi extends ChopperService {
  OrderItemsApi();

  factory OrderItemsApi.create([ChopperClient? client]) =>
      _$OrderItemsApi(client);

  @GET(path: '/order-items/{id}')
  Future<Response<JsonMap>> getOrderItem(@Path('id') String id,
      [@QueryMap() Map<String, dynamic>? params]);

  @GET(path: '/order-items')
  Future<Response<JsonMap>> getAllOrderItems(
      [@QueryMap() Map<String, dynamic>? params]);
}
