import 'package:chopper/chopper.dart' hide Level;
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import 'clients/clients.dart';
import 'endpoints/endpoints.dart';
import 'interceptors.dart';

final class LemonSqueezyClient {
  static const String baseUrl = 'https://api.lemonsqueezy.com/$apiVersion';
  static const String noCorsBaseUrl =
      'https://api-cors-anywhere.lemonsqueezy.com/$apiVersion';

  static const String apiVersion = 'v1';

  LemonSqueezyClient({
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
