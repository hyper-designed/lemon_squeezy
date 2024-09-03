// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$OrdersApi extends OrdersApi {
  _$OrdersApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = OrdersApi;

  @override
  Future<Response<Map<String, dynamic>>> getOrder(
    String id, [
    Map<String, dynamic>? params,
  ]) {
    final Uri $url = Uri.parse('/orders/${id}');
    final Map<String, dynamic> $params = params ?? const {};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> getAllOrders(
      [Map<String, dynamic>? params]) {
    final Uri $url = Uri.parse('/orders');
    final Map<String, dynamic> $params = params ?? const {};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> generateOrderInvoice(String orderId) {
    final Uri $url = Uri.parse('/orders/${orderId}/generate-invoice');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$OrderItemsApi extends OrderItemsApi {
  _$OrderItemsApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = OrderItemsApi;

  @override
  Future<Response<Map<String, dynamic>>> getOrderItem(
    String id, [
    Map<String, dynamic>? params,
  ]) {
    final Uri $url = Uri.parse('/order-items/${id}');
    final Map<String, dynamic> $params = params ?? const {};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> getAllOrderItems(
      [Map<String, dynamic>? params]) {
    final Uri $url = Uri.parse('/order-items');
    final Map<String, dynamic> $params = params ?? const {};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
