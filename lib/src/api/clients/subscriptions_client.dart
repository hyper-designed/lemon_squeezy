import 'package:chopper/chopper.dart';

import '../../model/models.dart';
import '../endpoints/endpoints.dart';
import '../lemon_squeezy_error.dart';

final class SubscriptionsClient {
  final SubscriptionsApi api;
  final SubscriptionInvoicesClient invoices;
  final SubscriptionItemsClient items;

  SubscriptionsClient(this.api, this.invoices, this.items);

  Future<Resource<Subscription>> getSubscription(String id, {Include? include}) async {
    final response = await api.getSubscription(id, include?.toQueryParam());
    if (response.body != null && response.isSuccessful) {
      return Resource<Subscription>.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }

  Future<SubscriptionList> getSubscriptionsForUser(String userEmail) async {
    final response = await api.getAllSubscriptions(FilterBy(userEmail: userEmail).toQueryParams());
    if (response.body != null && response.isSuccessful) {
      return SubscriptionList.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }

  Future<SubscriptionList> getAllSubscriptions({
    FilterBy? filterBy,
    SortBy? sortBy,
    Pagination? pagination,
    Include? include,
  }) async {
    final Map<String, dynamic> queryParams = {
      ...?filterBy?.toQueryParams(),
      ...?sortBy?.toQueryParams(),
      ...?pagination?.toQueryParams(),
      ...?include?.toQueryParam(),
    };
    final response = await api.getAllSubscriptions(queryParams);
    if (response.body != null && response.isSuccessful) {
      return SubscriptionList.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }

  Future<Resource<Subscription>> cancelSubscription(String id) async {
    final response = await api.cancelSubscription(id);
    if (response.body != null && response.isSuccessful) {
      return Resource<Subscription>.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }

  Future<Subscription> updateSubscription(String subscriptionId, SubscriptionUpdate update) async {
    final response = await api.updateSubscription(subscriptionId, update.toJson());
    if (response.body != null && response.isSuccessful) {
      return Subscription.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }
}

class SubscriptionInvoicesClient {
  final SubscriptionInvoiceApi api;

  SubscriptionInvoicesClient(this.api);

  Future<Resource<SubscriptionInvoice>> getSubscriptionInvoice(String id, {Include? include}) async {
    final response = await api.getSubscriptionInvoice(id, include?.toQueryParam());
    if (response.body != null && response.isSuccessful) {
      return Resource<SubscriptionInvoice>.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }

  Future<SubscriptionInvoiceList> getAllSubscriptionInvoices({
    FilterBy? filterBy,
    SortBy? sortBy,
    Pagination? pagination,
    Include? include,
  }) async {
    final Map<String, dynamic> queryParams = {
      ...?filterBy?.toQueryParams(),
      ...?sortBy?.toQueryParams(),
      ...?pagination?.toQueryParams(),
      ...?include?.toQueryParam(),
    };
    final response = await api.getAllSubscriptionInvoices(queryParams);
    if (response.body != null && response.isSuccessful) {
      return SubscriptionInvoiceList.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }

  /// Returns the download URL of the generated invoice.
  Future<String> generateSubscriptionInvoice(String id) async {
    final response = await api.generateSubscriptionInvoice(id);
    if (response.body case {'meta': {'urls': {'download_invoice': String url}}}) {
      return url;
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }
}

class SubscriptionItemsClient {
  final SubscriptionItemsApi api;

  SubscriptionItemsClient(this.api);

  Future<Resource<SubscriptionItem>> getSubscriptionItem(String id, {Include? include}) async {
    final response = await api.getSubscriptionItem(id, include?.toQueryParam());
    if (response.body != null && response.isSuccessful) {
      return Resource<SubscriptionItem>.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }

  Future<SubscriptionItemList> getAllSubscriptionItems({
    FilterBy? filterBy,
    SortBy? sortBy,
    Pagination? pagination,
    Include? include,
  }) async {
    final Map<String, dynamic> queryParams = {
      ...?filterBy?.toQueryParams(),
      ...?sortBy?.toQueryParams(),
      ...?pagination?.toQueryParams(),
      ...?include?.toQueryParam(),
    };
    final response = await api.getAllSubscriptionItems(queryParams);
    if (response.body != null && response.isSuccessful) {
      return SubscriptionItemList.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }

  Future<Resource<SubscriptionItem>> updateSubscriptionItem(SubscriptionItemUpdate update) async {
    final response = await api.updateSubscriptionItem(update.id, update.toJson());
    if (response.body != null && response.isSuccessful) {
      return Resource<SubscriptionItem>.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }

  Future<SubscriptionItemUsage> getCurrentUsage(String subscriptionItemId) async {
    final response = await api.getCurrentUsage(subscriptionItemId);
    if (response.body != null && response.isSuccessful) {
      return SubscriptionItemUsage.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }
} 