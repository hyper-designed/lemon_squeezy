import '../../model/models.dart';
import '../endpoints/endpoints.dart';
import '../lemon_squeezy_error.dart';

final class OrdersClient {
  final OrdersApi api;
  final OrderItemsClient items;

  OrdersClient(this.api, this.items);

  Future<Resource<Order>> getOrder(String id, {Include? include}) async {
    final response = await api.getOrder(id, include?.toQueryParam());
    if (response.body != null && response.isSuccessful) {
      return Resource<Order>.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }

  Future<OrderList> getAllOrders({
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
    final response = await api.getAllOrders(queryParams);
    if (response.body != null && response.isSuccessful) {
      return OrderList.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }

  /// Returns the download URL of the generated order invoice.
  Future<String> generateOrderInvoice(String id) async {
    final response = await api.generateOrderInvoice(id);
    if (response.body
        case {'meta': {'urls': {'download_invoice': String url}}}) {
      return url;
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }

  Future<OrderList> getOrdersForUser(String userEmail) async {
    final response =
        await api.getAllOrders(FilterBy(userEmail: userEmail).toQueryParams());
    if (response.body != null && response.isSuccessful) {
      return OrderList.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }
}

class OrderItemsClient {
  final OrderItemsApi api;

  OrderItemsClient(this.api);

  Future<Resource<OrderItem>> getOrderItem(String id,
      {Include? include}) async {
    final response = await api.getOrderItem(id, include?.toQueryParam());
    if (response.body != null && response.isSuccessful) {
      return Resource<OrderItem>.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }

  Future<OrderItemList> getAllOrderItems({
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
    final response = await api.getAllOrderItems(queryParams);
    if (response.body != null && response.isSuccessful) {
      return OrderItemList.fromJson(response.body!);
    }
    throw LemonSqueezyApiError.fromJson(response.body!);
  }
}
