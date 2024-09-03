import 'package:chopper/chopper.dart';

import '../../utils.dart';

part 'subscriptions_api.chopper.dart';

@ChopperApi()
abstract class SubscriptionsApi extends ChopperService {
  SubscriptionsApi();

  factory SubscriptionsApi.create([ChopperClient? client]) =>
      _$SubscriptionsApi(client);

  @Get(path: '/subscriptions/{id}')
  Future<Response<JsonMap>> getSubscription(@Path('id') String id,
      [@QueryMap() Map<String, dynamic>? params]);

  @Get(path: '/subscriptions')
  Future<Response<JsonMap>> getAllSubscriptions(
      [@QueryMap() Map<String, dynamic>? params]);

  @Delete(path: '/subscriptions/{id}')
  Future<Response<JsonMap>> cancelSubscription(@Path('id') String id);

  @Patch(path: '/subscriptions/{id}')
  Future<Response<JsonMap>> updateSubscription(
      @Path('id') String id, @Body() Map<String, dynamic> data);
}

@ChopperApi()
abstract class SubscriptionInvoiceApi extends ChopperService {
  SubscriptionInvoiceApi();

  factory SubscriptionInvoiceApi.create([ChopperClient? client]) =>
      _$SubscriptionInvoiceApi(client);

  @Get(path: '/subscription-invoices/{id}')
  Future<Response<JsonMap>> getSubscriptionInvoice(@Path('id') String id,
      [@QueryMap() Map<String, dynamic>? params]);

  @Get(path: '/subscription-invoices')
  Future<Response<JsonMap>> getAllSubscriptionInvoices(
      [@QueryMap() Map<String, dynamic>? params]);

  @Get(path: '/subscription-invoices/{id}/generate-invoice')
  Future<Response<JsonMap>> generateSubscriptionInvoice(@Path('id') String id);
}

/// REF: https://docs.lemonsqueezy.com/api/subscription-items
@ChopperApi()
abstract class SubscriptionItemsApi extends ChopperService {
  SubscriptionItemsApi();

  factory SubscriptionItemsApi.create([ChopperClient? client]) =>
      _$SubscriptionItemsApi(client);

  /// REF: https://docs.lemonsqueezy.com/api/subscription-items#retrieve-a-subscription-item
  @Get(path: '/subscription-items/{id}')
  Future<Response<JsonMap>> getSubscriptionItem(@Path('id') String id,
      [@QueryMap() Map<String, dynamic>? params]);

  /// REF: https://docs.lemonsqueezy.com/api/subscription-items#list-all-subscription-items
  @Get(path: '/subscription-items')
  Future<Response<JsonMap>> getAllSubscriptionItems(
      [@QueryMap() Map<String, dynamic>? params]);

  /// REF: https://docs.lemonsqueezy.com/api/subscription-items#update-a-subscription-item
  @Patch(path: '/subscription-items/{id}')
  Future<Response<JsonMap>> updateSubscriptionItem(
      @Path('id') String id, @Body() Map<String, dynamic> data);

  /// REF: https://docs.lemonsqueezy.com/api/subscription-items#retrieve-a-subscription-item-s-current-usage
  @Get(path: '/subscription-items/{id}/current-usage')
  Future<Response<JsonMap>> getCurrentUsage(
      @Path('id') String subscriptionItemId);
}
