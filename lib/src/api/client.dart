import 'package:chopper/chopper.dart' hide Level;
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import '../model/models.dart';
import 'endpoints/endpoints.dart';
import 'interceptors.dart';

class LemonSqueezy {
  static const String baseUrl = 'https://api.lemonsqueezy.com/$apiVersion';
  static const String noCorsBaseUrl =
      'https://api-cors-anywhere.lemonsqueezy.com/$apiVersion';

  static const String apiVersion = 'v1';

  LemonSqueezy({
    required this.apiKey,
    bool enableLogging = false,
    this.httpClient,

    /// Whether to use the CORS Anywhere proxy server. This proxy server is
    /// useful when attempting to make a request with a null Origin header
    /// (e.g. from a sandboxed iframe in a Figma plugin).
    /// REF: https://docs.lemonsqueezy.com/api#making-requests
    this.corsAnywhere = false,
  }) : _loggingEnabled = enableLogging {
    _createClients(enableLogging: enableLogging, corsAnywhere: corsAnywhere);
  }

  final http.Client? httpClient;
  final String apiKey;
  final bool corsAnywhere;
  late ChopperClient _chopperClient;

  bool _loggingEnabled = false;

  bool get loggingEnabled => _loggingEnabled;

  ProductsClient? _products;

  ProductsClient get products => _products!;

  OrdersClient? _orders;

  OrdersClient get orders => _orders!;

  SubscriptionsClient? _subscriptions;

  SubscriptionsClient get subscriptions => _subscriptions!;

  PriceClient? _prices;

  PriceClient get prices => _prices!;

  UsageRecordsClient? _usageRecords;

  UsageRecordsClient get usageRecords => _usageRecords!;

  void _createClients({
    required bool enableLogging,
    required bool corsAnywhere,
  }) {
    final List<ChopperService> services = [
      ProductsApi.create(),
      ProductVariantsApi.create(),
      PriceApi.create(),
      OrdersApi.create(),
      OrderItemsApi.create(),
      SubscriptionsApi.create(),
      SubscriptionInvoiceApi.create(),
      SubscriptionItemsApi.create(),
      UsageRecordsApi.create(),
    ];
    _chopperClient = ChopperClient(
      baseUrl: Uri.parse(corsAnywhere ? noCorsBaseUrl : baseUrl),
      client: httpClient,
      interceptors: [
        LemonSqueezyEssentialHeadersInterceptor(),
        LemonSqueezyAuthHeadersInterceptor(apiKey: apiKey),
        if (enableLogging) HttpLoggingInterceptor(),
      ],
      services: services,
      converter: const JsonConverter(),
      errorConverter: const JsonConverter(),
    );

    _subscriptions = SubscriptionsClient(
      _chopperClient.getService(),
      SubscriptionInvoicesClient(_chopperClient.getService()),
      SubscriptionItemsClient(_chopperClient.getService()),
    );
    _products = ProductsClient(_chopperClient.getService(),
        ProductVariantsClient(_chopperClient.getService()));
    _orders = OrdersClient(_chopperClient.getService(),
        OrderItemsClient(_chopperClient.getService()));
    _prices = PriceClient(_chopperClient.getService());
    _usageRecords = UsageRecordsClient(_chopperClient.getService());

    if (enableLogging) {
      Logger.root.level = Level.ALL; // defaults to Level.INFO
      Logger.root.onRecord.listen((record) {
        print('${record.level.name}: ${record.time}: ${record.message}');
      });
    }
  }

  /// Enable/disable logging for all requests.
  void setLogging(bool value) {
    _loggingEnabled = value;
    _createClients(enableLogging: value, corsAnywhere: corsAnywhere);
  }
}

class ProductsClient {
  final ProductsApi api;

  final ProductVariantsClient variants;

  ProductsClient(this.api, this.variants);

  Future<Response<Resource<Product>>> getProduct(String id,
          {Include? include}) =>
      api.getProduct(id, include?.toQueryParam()).then((response) =>
          response.copyWith(
              body: response.body != null && response.isSuccessful
                  ? Resource<Product>.fromJson(response.body!)
                  : null));

  Future<Response<ProductList>> getAllProducts({
    Include? include,
    FilterBy? filterBy,
    SortBy? sortBy,
    Pagination? pagination,
  }) async {
    final Map<String, dynamic> queryParams = {
      ...?include?.toQueryParam(),
      ...?filterBy?.toQueryParams(),
      ...?sortBy?.toQueryParams(),
      ...?pagination?.toQueryParams(),
    };
    final productListResponse = await api.getAllProducts(queryParams).then(
        (response) => response.copyWith(
            body: response.body != null && response.isSuccessful
                ? ProductList.fromJson(response.body!)
                : null));

    // Fetch price models and link them with their variants
    if (include?.variants == true && productListResponse.isSuccessful) {
      ProductList productList = productListResponse.body!;
      final List<Product> products = [];
      for (final Product product in productList.data) {
        final Response<ProductVariantList> response =
            await getProductVariants(product.id, include: Include.priceModel());
        if (response.isSuccessful) {
          products.add(product.copyWith(variants: response.body!.data));
        } else {
          products.add(product);
        }
      }
      return productListResponse.copyWith(
          body: productList.copyWith(data: products));
    }

    return productListResponse;
  }

  Future<Response<ProductVariantList>> getProductVariants(String id,
          {Include? include}) =>
      api.getProductVariants(id, include?.toQueryParam()).then((response) =>
          response.copyWith(
              body: response.body != null && response.isSuccessful
                  ? ProductVariantList.fromJson(response.body!)
                  : null));
}

class ProductVariantsClient {
  final ProductVariantsApi api;

  ProductVariantsClient(this.api);

  Future<Response<Resource<ProductVariant>>> getVariant(String id,
          {Include? include}) =>
      api.getVariant(id, include?.toQueryParam()).then((response) =>
          response.copyWith(
              body: response.body != null && response.isSuccessful
                  ? Resource<ProductVariant>.fromJson(response.body!)
                  : null));

  Future<Response<ProductVariantList>> getAllVariants({
    Include? include,
    FilterBy? filterBy,
    SortBy? sortBy,
    Pagination? pagination,
  }) {
    final Map<String, dynamic> queryParams = {
      ...?include?.toQueryParam(),
      ...?filterBy?.toQueryParams(),
      ...?sortBy?.toQueryParams(),
      ...?pagination?.toQueryParams(),
    };
    return api.getAllVariants(queryParams).then((response) => response.copyWith(
        body: response.body != null && response.isSuccessful
            ? ProductVariantList.fromJson(response.body!)
            : null));
  }
}

class PriceClient {
  final PriceApi api;

  PriceClient(this.api);

  Future<Response<Resource<Price>>> getPrice(String priceId,
          {Include? include}) =>
      api.getPrice(priceId, include?.toQueryParam()).then((response) =>
          response.copyWith(
              body: response.body != null && response.isSuccessful
                  ? Resource<Price>.fromJson(response.body!)
                  : null));

  Future<Response<PriceList>> getAllPrices({
    FilterBy? filterBy,
    SortBy? sortBy,
    Pagination? pagination,
    Include? include,
  }) {
    final Map<String, dynamic> queryParams = {
      ...?filterBy?.toQueryParams(),
      ...?sortBy?.toQueryParams(),
      ...?pagination?.toQueryParams(),
      ...?include?.toQueryParam(),
    };
    return api.getAllPrices(queryParams).then((response) => response.copyWith(
        body: response.body != null && response.isSuccessful
            ? PriceList.fromJson(response.body!)
            : null));
  }
}

class OrdersClient {
  final OrdersApi api;
  final OrderItemsClient items;

  OrdersClient(this.api, this.items);

  Future<Response<Resource<Order>>> getOrder(String id, {Include? include}) =>
      api.getOrder(id, include?.toQueryParam()).then((response) =>
          response.copyWith(
              body: response.body != null && response.isSuccessful
                  ? Resource<Order>.fromJson(response.body!)
                  : null));

  Future<Response<OrderList>> getAllOrders({
    FilterBy? filterBy,
    SortBy? sortBy,
    Pagination? pagination,
    Include? include,
  }) {
    final Map<String, dynamic> queryParams = {
      ...?filterBy?.toQueryParams(),
      ...?sortBy?.toQueryParams(),
      ...?pagination?.toQueryParams(),
      ...?include?.toQueryParam(),
    };
    return api.getAllOrders(queryParams).then((response) => response.copyWith(
        body: response.body != null && response.isSuccessful
            ? OrderList.fromJson(response.body!)
            : null));
  }

  /// Returns the download URL of the generated order invoice.
  Future<Response<String>> generateOrderInvoice(String id) {
    return api.generateOrderInvoice(id).then((response) {
      String? downloadUrl;
      if (response.body
          case {'meta': {'urls': {'download_invoice': String url}}}) {
        downloadUrl = url;
      }
      return response.copyWith(body: downloadUrl);
    });
  }

  Future<Response<OrderList>> getOrdersForUser(String userEmail) => api
      .getAllOrders(FilterBy(userEmail: userEmail).toQueryParams())
      .then((response) => response.copyWith(
          body: response.body != null && response.isSuccessful
              ? OrderList.fromJson(response.body!)
              : null));
}

class OrderItemsClient {
  final OrderItemsApi api;

  OrderItemsClient(this.api);

  Future<Response<Resource<OrderItem>>> getOrderItem(String id,
          {Include? include}) =>
      api.getOrderItem(id, include?.toQueryParam()).then((response) =>
          response.copyWith(
              body: response.body != null && response.isSuccessful
                  ? Resource<OrderItem>.fromJson(response.body!)
                  : null));

  Future<Response<OrderItemList>> getAllOrderItems({
    FilterBy? filterBy,
    SortBy? sortBy,
    Pagination? pagination,
    Include? include,
  }) {
    final Map<String, dynamic> queryParams = {
      ...?filterBy?.toQueryParams(),
      ...?sortBy?.toQueryParams(),
      ...?pagination?.toQueryParams(),
      ...?include?.toQueryParam(),
    };
    return api.getAllOrderItems(queryParams).then((response) =>
        response.copyWith(
            body: response.body != null && response.isSuccessful
                ? OrderItemList.fromJson(response.body!)
                : null));
  }
}

class SubscriptionsClient {
  final SubscriptionsApi api;
  final SubscriptionInvoicesClient invoices;
  final SubscriptionItemsClient items;

  SubscriptionsClient(this.api, this.invoices, this.items);

  Future<Response<Resource<Subscription>>> getSubscription(String id,
          {Include? include}) =>
      api.getSubscription(id, include?.toQueryParam()).then((response) =>
          response.copyWith(
              body: response.body != null && response.isSuccessful
                  ? Resource<Subscription>.fromJson(response.body!)
                  : null));

  Future<Response<SubscriptionList>> getSubscriptionsForUser(
          String userEmail) =>
      api
          .getAllSubscriptions(FilterBy(userEmail: userEmail).toQueryParams())
          .then((response) => response.copyWith(
              body: response.body != null && response.isSuccessful
                  ? SubscriptionList.fromJson(response.body!)
                  : null));

  Future<Response<SubscriptionList>> getAllSubscriptions({
    FilterBy? filterBy,
    SortBy? sortBy,
    Pagination? pagination,
    Include? include,
  }) {
    final Map<String, dynamic> queryParams = {
      ...?filterBy?.toQueryParams(),
      ...?sortBy?.toQueryParams(),
      ...?pagination?.toQueryParams(),
      ...?include?.toQueryParam(),
    };
    return api.getAllSubscriptions(queryParams).then((response) =>
        response.copyWith(
            body: response.body != null && response.isSuccessful
                ? SubscriptionList.fromJson(response.body!)
                : null));
  }

  Future<Response<Resource<Subscription>>> cancelSubscription(String id) =>
      api.cancelSubscription(id).then((response) => response.copyWith(
          body: response.body != null && response.isSuccessful
              ? Resource<Subscription>.fromJson(response.body!)
              : null));

  Future<Response<Subscription>> updateSubscription(
      String subscriptionId, SubscriptionUpdate update) {
    return api.updateSubscription(subscriptionId, update.toJson()).then(
        (response) => response.copyWith(
            body: response.body != null && response.isSuccessful
                ? Subscription.fromJson(response.body!)
                : null));
  }
}

class SubscriptionInvoicesClient {
  final SubscriptionInvoiceApi api;

  SubscriptionInvoicesClient(this.api);

  Future<Response<Resource<SubscriptionInvoice>>> getSubscriptionInvoice(
          String id,
          {Include? include}) =>
      api.getSubscriptionInvoice(id, include?.toQueryParam()).then((response) =>
          response.copyWith(
              body: response.body != null && response.isSuccessful
                  ? Resource<SubscriptionInvoice>.fromJson(response.body!)
                  : null));

  Future<Response<SubscriptionInvoiceList>> getAllSubscriptionInvoices({
    FilterBy? filterBy,
    SortBy? sortBy,
    Pagination? pagination,
    Include? include,
  }) {
    final Map<String, dynamic> queryParams = {
      ...?filterBy?.toQueryParams(),
      ...?sortBy?.toQueryParams(),
      ...?pagination?.toQueryParams(),
      ...?include?.toQueryParam(),
    };
    return api.getAllSubscriptionInvoices(queryParams).then((response) =>
        response.copyWith(
            body: response.body != null && response.isSuccessful
                ? SubscriptionInvoiceList.fromJson(response.body!)
                : null));
  }

  /// Returns the download URL of the generated invoice.
  Future<Response<String>> generateSubscriptionInvoice(String id) =>
      api.generateSubscriptionInvoice(id).then((response) {
        String? downloadUrl;
        if (response.body
            case {'meta': {'urls': {'download_invoice': String url}}}) {
          downloadUrl = url;
        }
        return response.copyWith(body: downloadUrl);
      });
}

class SubscriptionItemsClient {
  final SubscriptionItemsApi api;

  SubscriptionItemsClient(this.api);

  Future<Response<Resource<SubscriptionItem>>> getSubscriptionItem(String id,
          {Include? include}) =>
      api.getSubscriptionItem(id, include?.toQueryParam()).then((response) =>
          response.copyWith(
              body: response.body != null && response.isSuccessful
                  ? Resource<SubscriptionItem>.fromJson(response.body!)
                  : null));

  Future<Response<SubscriptionItemList>> getAllSubscriptionItems({
    FilterBy? filterBy,
    SortBy? sortBy,
    Pagination? pagination,
    Include? include,
  }) {
    final Map<String, dynamic> queryParams = {
      ...?filterBy?.toQueryParams(),
      ...?sortBy?.toQueryParams(),
      ...?pagination?.toQueryParams(),
      ...?include?.toQueryParam(),
    };
    return api.getAllSubscriptionItems(queryParams).then((response) =>
        response.copyWith(
            body: response.body != null && response.isSuccessful
                ? SubscriptionItemList.fromJson(response.body!)
                : null));
  }

  Future<Response<Resource<SubscriptionItem>>> updateSubscriptionItem(
      SubscriptionItemUpdate update) {
    return api.updateSubscriptionItem(update.id, update.toJson()).then(
        (response) => response.copyWith(
            body: response.body != null && response.isSuccessful
                ? Resource<SubscriptionItem>.fromJson(response.body!)
                : null));
  }

  Future<Response<SubscriptionItemUsage>> getCurrentUsage(
      String subscriptionItemId) {
    return api.getCurrentUsage(subscriptionItemId).then((response) =>
        response.copyWith(
            body: response.body != null && response.isSuccessful
                ? SubscriptionItemUsage.fromJson(response.body!)
                : null));
  }
}

class UsageRecordsClient {
  final UsageRecordsApi api;

  UsageRecordsClient(this.api);

  Future<Response<Resource<UsageRecord>>> getUsageRecord(String id,
          {Include? include}) =>
      api.getUsageRecord(id, include?.toQueryParam()).then((response) =>
          response.copyWith(
              body: response.body != null && response.isSuccessful
                  ? Resource<UsageRecord>.fromJson(response.body!)
                  : null));

  Future<Response<UsageRecordList>> getAllUsageRecords({
    FilterBy? filterBy,
    SortBy? sortBy,
    Pagination? pagination,
    Include? include,
  }) {
    final Map<String, dynamic> queryParams = {
      ...?filterBy?.toQueryParams(),
      ...?sortBy?.toQueryParams(),
      ...?pagination?.toQueryParams(),
      ...?include?.toQueryParam(),
    };
    return api.getAllUsageRecords(queryParams).then((response) =>
        response.copyWith(
            body: response.body != null && response.isSuccessful
                ? UsageRecordList.fromJson(response.body!)
                : null));
  }

  Future<List<UsageRecord>> getFilteredUsageRecords({
    FilterBy? filterBy,
    SortBy? sortBy,
    Pagination? pagination,
    Include? include,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final Map<String, dynamic> queryParams = {
      ...?filterBy?.toQueryParams(),
      ...?sortBy?.toQueryParams(),
      ...?pagination?.toQueryParams(),
      ...?include?.toQueryParam(),
    };
    final response = await api.getAllUsageRecords(queryParams).then(
        (response) => response.copyWith(
            body: response.body != null && response.isSuccessful
                ? UsageRecordList.fromJson(response.body!)
                : null));

    if (!response.isSuccessful) {
      throw response.error!;
    }

    final List<UsageRecord> records = response.body!.data;

    if (startDate != null) {
      records.removeWhere((record) => record.createdAt.isBefore(startDate));
    }
    if (endDate != null) {
      records.removeWhere((record) => !record.createdAt.isBefore(endDate));
    }

    return records;
  }

  Future<Response<Resource<UsageRecord>>> createUsageRecord(
      UsageRecordCreate create) {
    return api.createUsageRecord(create.toJson()).then((response) =>
        response.copyWith(
            body: response.body != null && response.isSuccessful
                ? Resource<UsageRecord>.fromJson(response.body!)
                : null));
  }
}
