// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$SubscriptionsApi extends SubscriptionsApi {
  _$SubscriptionsApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = SubscriptionsApi;

  @override
  Future<Response<Map<String, dynamic>>> getSubscription(
    String id, [
    Map<String, dynamic>? params,
  ]) {
    final Uri $url = Uri.parse('/subscriptions/${id}');
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
  Future<Response<Map<String, dynamic>>> getAllSubscriptions(
      [Map<String, dynamic>? params]) {
    final Uri $url = Uri.parse('/subscriptions');
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
  Future<Response<Map<String, dynamic>>> cancelSubscription(String id) {
    final Uri $url = Uri.parse('/subscriptions/${id}');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> updateSubscription(
    String id,
    Map<String, dynamic> data,
  ) {
    final Uri $url = Uri.parse('/subscriptions/${id}');
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$SubscriptionInvoiceApi extends SubscriptionInvoiceApi {
  _$SubscriptionInvoiceApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = SubscriptionInvoiceApi;

  @override
  Future<Response<Map<String, dynamic>>> getSubscriptionInvoice(
    String id, [
    Map<String, dynamic>? params,
  ]) {
    final Uri $url = Uri.parse('/subscription-invoices/${id}');
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
  Future<Response<Map<String, dynamic>>> getAllSubscriptionInvoices(
      [Map<String, dynamic>? params]) {
    final Uri $url = Uri.parse('/subscription-invoices');
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
  Future<Response<Map<String, dynamic>>> generateSubscriptionInvoice(
      String id) {
    final Uri $url = Uri.parse('/subscription-invoices/${id}/generate-invoice');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$SubscriptionItemsApi extends SubscriptionItemsApi {
  _$SubscriptionItemsApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = SubscriptionItemsApi;

  @override
  Future<Response<Map<String, dynamic>>> getSubscriptionItem(
    String id, [
    Map<String, dynamic>? params,
  ]) {
    final Uri $url = Uri.parse('/subscription-items/${id}');
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
  Future<Response<Map<String, dynamic>>> getAllSubscriptionItems(
      [Map<String, dynamic>? params]) {
    final Uri $url = Uri.parse('/subscription-items');
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
  Future<Response<Map<String, dynamic>>> updateSubscriptionItem(
    String id,
    Map<String, dynamic> data,
  ) {
    final Uri $url = Uri.parse('/subscription-items/${id}');
    final $body = data;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> getCurrentUsage(
      String subscriptionItemId) {
    final Uri $url =
        Uri.parse('/subscription-items/${subscriptionItemId}/current-usage');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }
}
