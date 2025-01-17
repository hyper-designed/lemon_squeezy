// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionInvoiceList _$SubscriptionInvoiceListFromJson(
        Map<String, dynamic> json) =>
    SubscriptionInvoiceList(
      meta: ResourceMeta.fromJson(json['meta'] as Map<String, dynamic>),
      links: json['links'] as Map<String, dynamic>? ?? const {},
      data: (json['data'] as List<dynamic>)
          .map((e) => SubscriptionInvoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      included: (json['included'] as List<dynamic>?)
              ?.map((e) => ResourceData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SubscriptionInvoiceListToJson(
        SubscriptionInvoiceList instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'links': instance.links,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'included': instance.included.map((e) => e.toJson()).toList(),
    };

SubscriptionInvoice _$SubscriptionInvoiceFromJson(Map<String, dynamic> json) =>
    SubscriptionInvoice(
      id: convertToString(json, 'id') as String,
      storeId: (json['store_id'] as num).toInt(),
      subscriptionId: (json['subscription_id'] as num).toInt(),
      customerId: (json['customer_id'] as num).toInt(),
      userName: json['user_name'] as String,
      userEmail: json['user_email'] as String,
      billingReason: json['billing_reason'] as String,
      cardBrand: json['card_brand'] as String,
      cardLast4Digits: json['card_last_four'] as String,
      currency: json['currency'] as String,
      currencyRate: json['currency_rate'] as String,
      status: $enumDecode(_$SubscriptionInvoiceStatusEnumMap, json['status']),
      statusFormatted: json['status_formatted'] as String,
      refunded: json['refunded'] as bool,
      refundedAt: const DateTimeISO8601NullableConverter()
          .fromJson(json['refunded_at'] as String?),
      subtotal: (json['subtotal'] as num).toDouble(),
      discountTotal: (json['discount_total'] as num).toDouble(),
      tax: (json['tax'] as num).toDouble(),
      taxInclusive: json['tax_inclusive'] as bool,
      total: (json['total'] as num).toDouble(),
      refundedAmount: (json['refunded_amount'] as num).toDouble(),
      subtotalUsd: (json['subtotal_usd'] as num).toDouble(),
      discountTotalUsd: (json['discount_total_usd'] as num).toDouble(),
      taxUsd: (json['tax_usd'] as num).toDouble(),
      totalUsd: (json['total_usd'] as num).toDouble(),
      refundedAmountUsd: (json['refunded_amount_usd'] as num).toDouble(),
      subtotalFormatted: json['subtotal_formatted'] as String,
      discountTotalFormatted: json['discount_total_formatted'] as String,
      taxFormatted: json['tax_formatted'] as String,
      refundedAmountFormatted: json['refunded_amount_formatted'] as String,
      urls: json['urls'] as Map<String, dynamic>,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      testMode: json['test_mode'] as bool,
    );

Map<String, dynamic> _$SubscriptionInvoiceToJson(
        SubscriptionInvoice instance) =>
    <String, dynamic>{
      'type': _$ResourceTypeEnumMap[instance.type]!,
      'id': instance.id,
      'store_id': instance.storeId,
      'subscription_id': instance.subscriptionId,
      'customer_id': instance.customerId,
      'user_name': instance.userName,
      'user_email': instance.userEmail,
      'billing_reason': instance.billingReason,
      'card_brand': instance.cardBrand,
      'card_last_four': instance.cardLast4Digits,
      'currency': instance.currency,
      'currency_rate': instance.currencyRate,
      'status': _$SubscriptionInvoiceStatusEnumMap[instance.status]!,
      'status_formatted': instance.statusFormatted,
      'refunded': instance.refunded,
      if (const DateTimeISO8601NullableConverter().toJson(instance.refundedAt)
          case final value?)
        'refunded_at': value,
      'subtotal': instance.subtotal,
      'discount_total': instance.discountTotal,
      'tax': instance.tax,
      'tax_inclusive': instance.taxInclusive,
      'total': instance.total,
      'refunded_amount': instance.refundedAmount,
      'subtotal_usd': instance.subtotalUsd,
      'discount_total_usd': instance.discountTotalUsd,
      'tax_usd': instance.taxUsd,
      'total_usd': instance.totalUsd,
      'refunded_amount_usd': instance.refundedAmountUsd,
      'subtotal_formatted': instance.subtotalFormatted,
      'discount_total_formatted': instance.discountTotalFormatted,
      'tax_formatted': instance.taxFormatted,
      'refunded_amount_formatted': instance.refundedAmountFormatted,
      'urls': instance.urls,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'test_mode': instance.testMode,
    };

const _$SubscriptionInvoiceStatusEnumMap = {
  SubscriptionInvoiceStatus.pending: 'pending',
  SubscriptionInvoiceStatus.paid: 'paid',
  SubscriptionInvoiceStatus.voided: 'void',
  SubscriptionInvoiceStatus.refunded: 'refunded',
  SubscriptionInvoiceStatus.partiallyRefunded: 'partially_refunded',
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
