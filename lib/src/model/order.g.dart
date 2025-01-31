// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderList _$OrderListFromJson(Map<String, dynamic> json) => OrderList(
      meta: ResourceMeta.fromJson(json['meta'] as Map<String, dynamic>),
      links: json['links'] as Map<String, dynamic>? ?? const {},
      data: (json['data'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
      included: (json['included'] as List<dynamic>?)
              ?.map((e) => ResourceData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$OrderListToJson(OrderList instance) => <String, dynamic>{
      'meta': instance.meta.toJson(),
      'links': instance.links,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'included': instance.included.map((e) => e.toJson()).toList(),
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: convertToString(json, 'id') as String,
      storeId: (json['store_id'] as num).toInt(),
      customerId: (json['customer_id'] as num).toInt(),
      identifier: json['identifier'] as String,
      orderNumber: (json['order_number'] as num).toInt(),
      userName: json['user_name'] as String,
      userEmail: json['user_email'] as String,
      currency: json['currency'] as String,
      currencyRate: json['currency_rate'] as String,
      subtotal: (json['subtotal'] as num).toDouble(),
      setupFee: (json['setup_fee'] as num).toDouble(),
      discountTotal: (json['discount_total'] as num).toDouble(),
      tax: (json['tax'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      refundedAmount: (json['refunded_amount'] as num).toDouble(),
      subtotalUsd: (json['subtotal_usd'] as num).toDouble(),
      setupFeeUsd: (json['setup_fee_usd'] as num).toDouble(),
      discountTotalUsd: (json['discount_total_usd'] as num).toDouble(),
      taxUsd: (json['tax_usd'] as num).toDouble(),
      totalUsd: (json['total_usd'] as num).toDouble(),
      refundedAmountUsd: (json['refunded_amount_usd'] as num).toDouble(),
      taxName: json['tax_name'] as String,
      taxRate: (json['tax_rate'] as num).toDouble(),
      taxInclusive: json['tax_inclusive'] as bool,
      status: json['status'] as String,
      statusFormatted: json['status_formatted'] as String,
      refunded: json['refunded'] as bool,
      refundedAt: const DateTimeISO8601NullableConverter()
          .fromJson(json['refunded_at'] as String?),
      subtotalFormatted: json['subtotal_formatted'] as String,
      setupFeeFormatted: json['setup_fee_formatted'] as String,
      discountTotalFormatted: json['discount_total_formatted'] as String,
      taxFormatted: json['tax_formatted'] as String,
      totalFormatted: json['total_formatted'] as String,
      refundedAmountFormatted: json['refunded_amount_formatted'] as String,
      firstOrderItem:
          OrderItem.fromJson(json['first_order_item'] as Map<String, dynamic>),
      createdAt: const DateTimeISO8601Converter()
          .fromJson(json['created_at'] as String),
      updatedAt: const DateTimeISO8601Converter()
          .fromJson(json['updated_at'] as String),
      testMode: json['test_mode'] as bool,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'type': _$ResourceTypeEnumMap[instance.type]!,
      'id': instance.id,
      'store_id': instance.storeId,
      'customer_id': instance.customerId,
      'identifier': instance.identifier,
      'order_number': instance.orderNumber,
      'user_name': instance.userName,
      'user_email': instance.userEmail,
      'currency': instance.currency,
      'currency_rate': instance.currencyRate,
      'subtotal': instance.subtotal,
      'setup_fee': instance.setupFee,
      'discount_total': instance.discountTotal,
      'tax': instance.tax,
      'total': instance.total,
      'refunded_amount': instance.refundedAmount,
      'subtotal_usd': instance.subtotalUsd,
      'setup_fee_usd': instance.setupFeeUsd,
      'discount_total_usd': instance.discountTotalUsd,
      'tax_usd': instance.taxUsd,
      'total_usd': instance.totalUsd,
      'refunded_amount_usd': instance.refundedAmountUsd,
      'tax_name': instance.taxName,
      'tax_rate': instance.taxRate,
      'tax_inclusive': instance.taxInclusive,
      'status': instance.status,
      'status_formatted': instance.statusFormatted,
      'refunded': instance.refunded,
      if (const DateTimeISO8601NullableConverter().toJson(instance.refundedAt)
          case final value?)
        'refunded_at': value,
      'subtotal_formatted': instance.subtotalFormatted,
      'setup_fee_formatted': instance.setupFeeFormatted,
      'discount_total_formatted': instance.discountTotalFormatted,
      'tax_formatted': instance.taxFormatted,
      'total_formatted': instance.totalFormatted,
      'refunded_amount_formatted': instance.refundedAmountFormatted,
      'first_order_item': instance.firstOrderItem.toJson(),
      'created_at': const DateTimeISO8601Converter().toJson(instance.createdAt),
      'updated_at': const DateTimeISO8601Converter().toJson(instance.updatedAt),
      'test_mode': instance.testMode,
    };

const _$ResourceTypeEnumMap = {
  ResourceType.products: 'products',
  ResourceType.variants: 'variants',
  ResourceType.prices: 'prices',
  ResourceType.orders: 'orders',
  ResourceType.orderItems: 'order_items',
  ResourceType.subscriptions: 'subscriptions',
  ResourceType.subscriptionItems: 'subscription-items',
  ResourceType.subscriptionInvoices: 'subscription-invoices',
  ResourceType.usageRecords: 'usage-records',
};

OrderItemList _$OrderItemListFromJson(Map<String, dynamic> json) =>
    OrderItemList(
      meta: ResourceMeta.fromJson(json['meta'] as Map<String, dynamic>),
      links: json['links'] as Map<String, dynamic>,
      data: (json['data'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      included: (json['included'] as List<dynamic>)
          .map((e) => ResourceData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderItemListToJson(OrderItemList instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'links': instance.links,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'included': instance.included.map((e) => e.toJson()).toList(),
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      id: convertToString(json, 'id') as String,
      orderId: (json['order_id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      variantId: (json['variant_id'] as num).toInt(),
      productName: json['product_name'] as String,
      variantName: json['variant_name'] as String,
      price: (json['price'] as num).toDouble(),
      createdAt: const DateTimeISO8601Converter()
          .fromJson(json['created_at'] as String),
      updatedAt: const DateTimeISO8601Converter()
          .fromJson(json['updated_at'] as String),
      testMode: json['test_mode'] as bool,
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'type': _$ResourceTypeEnumMap[instance.type]!,
      'id': instance.id,
      'order_id': instance.orderId,
      'product_id': instance.productId,
      'variant_id': instance.variantId,
      'product_name': instance.productName,
      'variant_name': instance.variantName,
      'price': instance.price,
      'quantity': instance.quantity,
      'created_at': const DateTimeISO8601Converter().toJson(instance.createdAt),
      'updated_at': const DateTimeISO8601Converter().toJson(instance.updatedAt),
      'test_mode': instance.testMode,
    };
