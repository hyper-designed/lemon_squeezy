import 'package:json_annotation/json_annotation.dart';

import '../utils.dart';
import 'resource.dart';

part 'order.g.dart';

@JsonSerializable()
class OrderList extends ResourceList<Order> {
  OrderList({
    required super.meta,
    super.links,
    required super.data,
    super.included,
  });

  factory OrderList.fromJson(Map<String, dynamic> json) =>
      _$OrderListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OrderListToJson(this);
}

@JsonSerializable()
class Order extends ResourceData {
  @JsonKey(name: 'store_id')
  final int storeId;

  @JsonKey(name: 'customer_id')
  final int customerId;

  final String identifier;

  @JsonKey(name: 'order_number')
  final int orderNumber;

  @JsonKey(name: 'user_name')
  final String userName;

  @JsonKey(name: 'user_email')
  final String userEmail;

  final String currency;

  @JsonKey(name: 'currency_rate')
  final String currencyRate;

  final double subtotal;

  @JsonKey(name: 'setup_fee')
  final double setupFee;

  @JsonKey(name: 'discount_total')
  final double discountTotal;

  final double tax;

  final double total;

  @JsonKey(name: 'refunded_amount')
  final double refundedAmount;

  @JsonKey(name: 'subtotal_usd')
  final double subtotalUsd;

  @JsonKey(name: 'setup_fee_usd')
  final double setupFeeUsd;

  @JsonKey(name: 'discount_total_usd')
  final double discountTotalUsd;

  @JsonKey(name: 'tax_usd')
  final double taxUsd;

  @JsonKey(name: 'total_usd')
  final double totalUsd;

  @JsonKey(name: 'refunded_amount_usd')
  final double refundedAmountUsd;

  @JsonKey(name: 'tax_name')
  final String taxName;

  @JsonKey(name: 'tax_rate')
  final double taxRate;

  @JsonKey(name: 'tax_inclusive')
  final bool taxInclusive;

  final String status;

  @JsonKey(name: 'status_formatted')
  final String statusFormatted;

  final bool refunded;

  @JsonKey(name: 'refunded_at')
  @DateTimeISO8601NullableConverter()
  final DateTime? refundedAt;

  @JsonKey(name: 'subtotal_formatted')
  final String subtotalFormatted;

  @JsonKey(name: 'setup_fee_formatted')
  final String setupFeeFormatted;

  @JsonKey(name: 'discount_total_formatted')
  final String discountTotalFormatted;

  @JsonKey(name: 'tax_formatted')
  final String taxFormatted;

  @JsonKey(name: 'total_formatted')
  final String totalFormatted;

  @JsonKey(name: 'refunded_amount_formatted')
  final String refundedAmountFormatted;

  @JsonKey(name: 'first_order_item')
  final OrderItem firstOrderItem;

  @JsonKey(name: 'created_at')
  @DateTimeISO8601Converter()
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  @DateTimeISO8601Converter()
  final DateTime updatedAt;

  @JsonKey(name: 'test_mode')
  final bool testMode;

  Order({
    required super.id,
    required this.storeId,
    required this.customerId,
    required this.identifier,
    required this.orderNumber,
    required this.userName,
    required this.userEmail,
    required this.currency,
    required this.currencyRate,
    required this.subtotal,
    required this.setupFee,
    required this.discountTotal,
    required this.tax,
    required this.total,
    required this.refundedAmount,
    required this.subtotalUsd,
    required this.setupFeeUsd,
    required this.discountTotalUsd,
    required this.taxUsd,
    required this.totalUsd,
    required this.refundedAmountUsd,
    required this.taxName,
    required this.taxRate,
    required this.taxInclusive,
    required this.status,
    required this.statusFormatted,
    required this.refunded,
    this.refundedAt,
    required this.subtotalFormatted,
    required this.setupFeeFormatted,
    required this.discountTotalFormatted,
    required this.taxFormatted,
    required this.totalFormatted,
    required this.refundedAmountFormatted,
    required this.firstOrderItem,
    required this.createdAt,
    required this.updatedAt,
    required this.testMode,
  }) : super(type: ResourceType.orders);

  factory Order.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('attributes')) {
      json = {
        ...json,
        ...json['attributes'],
      };
    }
    return _$OrderFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$OrderToJson(this);

  @override
  List<Object?> get props => [
        ...super.props,
        storeId,
        customerId,
        identifier,
        orderNumber,
        userName,
        userEmail,
        currency,
        currencyRate,
        subtotal,
        setupFee,
        discountTotal,
        tax,
        total,
        refundedAmount,
        subtotalUsd,
        setupFeeUsd,
        discountTotalUsd,
        taxUsd,
        totalUsd,
        refundedAmountUsd,
        taxName,
        taxRate,
        taxInclusive,
        status,
        statusFormatted,
        refunded,
        refundedAt,
        subtotalFormatted,
        setupFeeFormatted,
        discountTotalFormatted,
        taxFormatted,
        totalFormatted,
        refundedAmountFormatted,
        firstOrderItem,
        createdAt,
        updatedAt,
        testMode,
      ];
}

@JsonSerializable()
class OrderItemList extends ResourceList<OrderItem> {
  OrderItemList({
    required super.meta,
    required super.links,
    required super.data,
    required super.included,
  });

  factory OrderItemList.fromJson(Map<String, dynamic> json) =>
      _$OrderItemListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OrderItemListToJson(this);
}

@JsonSerializable()
class OrderItem extends ResourceData {
  @JsonKey(name: 'order_id')
  final int orderId;

  @JsonKey(name: 'product_id')
  final int productId;

  @JsonKey(name: 'variant_id')
  final int variantId;

  @JsonKey(name: 'product_name')
  final String productName;

  @JsonKey(name: 'variant_name')
  final String variantName;

  final double price;

  final int quantity;

  @JsonKey(name: 'created_at')
  @DateTimeISO8601Converter()
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  @DateTimeISO8601Converter()
  final DateTime updatedAt;

  @JsonKey(name: 'test_mode')
  final bool testMode;

  OrderItem({
    required super.id,
    required this.orderId,
    required this.productId,
    required this.variantId,
    required this.productName,
    required this.variantName,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.testMode,
    this.quantity = 1,
  }) : super(type: ResourceType.orderItems);

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OrderItemToJson(this);

  @override
  List<Object?> get props => [
        ...super.props,
        orderId,
        productId,
        variantId,
        productName,
        variantName,
        price,
        createdAt,
        updatedAt,
        testMode,
        quantity,
      ];
}
