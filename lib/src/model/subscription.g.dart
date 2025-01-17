// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionList _$SubscriptionListFromJson(Map<String, dynamic> json) =>
    SubscriptionList(
      meta: ResourceMeta.fromJson(json['meta'] as Map<String, dynamic>),
      links: json['links'] as Map<String, dynamic>? ?? const {},
      data: (json['data'] as List<dynamic>)
          .map((e) => Subscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      included: (json['included'] as List<dynamic>?)
              ?.map((e) => ResourceData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SubscriptionListToJson(SubscriptionList instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'links': instance.links,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'included': instance.included.map((e) => e.toJson()).toList(),
    };

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) => Subscription(
      id: convertToString(json, 'id') as String,
      storeId: (json['store_id'] as num).toInt(),
      customerId: (json['customer_id'] as num).toInt(),
      orderId: (json['order_id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      variantId: (json['variant_id'] as num).toInt(),
      productName: json['product_name'] as String,
      variantName: json['variant_name'] as String,
      userName: json['user_name'] as String,
      userEmail: json['user_email'] as String,
      status: $enumDecode(_$SubscriptionStatusEnumMap, json['status']),
      statusFormatted: json['status_formatted'] as String,
      cardBrand: json['card_brand'] as String,
      cardLast4Digits: json['card_last_four'] as String,
      pause: json['pause'],
      cancelled: json['cancelled'] as bool,
      trialEndsAt: const DateTimeISO8601NullableConverter()
          .fromJson(json['trial_ends_at'] as String?),
      billingAnchor: (json['billing_anchor'] as num).toInt(),
      renewsAt: const DateTimeISO8601Converter()
          .fromJson(json['renews_at'] as String),
      endsAt: const DateTimeISO8601NullableConverter()
          .fromJson(json['ends_at'] as String?),
      updatedAt: const DateTimeISO8601Converter()
          .fromJson(json['updated_at'] as String),
      testMode: json['test_mode'] as bool,
      urls: json['urls'] == null
          ? null
          : SubscriptionUrls.fromJson(json['urls'] as Map<String, dynamic>),
      firstSubscriptionItem: SubscriptionItem.fromJson(
          json['first_subscription_item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) =>
    <String, dynamic>{
      'type': _$ResourceTypeEnumMap[instance.type]!,
      'id': instance.id,
      'store_id': instance.storeId,
      'customer_id': instance.customerId,
      'order_id': instance.orderId,
      'product_id': instance.productId,
      'variant_id': instance.variantId,
      'product_name': instance.productName,
      'variant_name': instance.variantName,
      'user_name': instance.userName,
      'user_email': instance.userEmail,
      'status': _$SubscriptionStatusEnumMap[instance.status]!,
      'status_formatted': instance.statusFormatted,
      'card_brand': instance.cardBrand,
      'card_last_four': instance.cardLast4Digits,
      if (instance.pause case final value?) 'pause': value,
      'cancelled': instance.cancelled,
      if (const DateTimeISO8601NullableConverter().toJson(instance.trialEndsAt)
          case final value?)
        'trial_ends_at': value,
      'billing_anchor': instance.billingAnchor,
      'renews_at': const DateTimeISO8601Converter().toJson(instance.renewsAt),
      if (const DateTimeISO8601NullableConverter().toJson(instance.endsAt)
          case final value?)
        'ends_at': value,
      'updated_at': const DateTimeISO8601Converter().toJson(instance.updatedAt),
      'test_mode': instance.testMode,
      if (instance.urls?.toJson() case final value?) 'urls': value,
      'first_subscription_item': instance.firstSubscriptionItem.toJson(),
    };

const _$SubscriptionStatusEnumMap = {
  SubscriptionStatus.onTrial: 'on_trial',
  SubscriptionStatus.active: 'active',
  SubscriptionStatus.paused: 'paused',
  SubscriptionStatus.pastDue: 'past_due',
  SubscriptionStatus.unpaid: 'unpaid',
  SubscriptionStatus.cancelled: 'cancelled',
  SubscriptionStatus.expired: 'expired',
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

SubscriptionUrls _$SubscriptionUrlsFromJson(Map<String, dynamic> json) =>
    SubscriptionUrls(
      updatePaymentMethod: json['updatePaymentMethod'] as String?,
      customerPortal: json['customerPortal'] as String?,
      customerPortalUpdateSubscription:
          json['customerPortalUpdateSubscription'] as String?,
    );

Map<String, dynamic> _$SubscriptionUrlsToJson(SubscriptionUrls instance) =>
    <String, dynamic>{
      if (instance.updatePaymentMethod case final value?)
        'updatePaymentMethod': value,
      if (instance.customerPortal case final value?) 'customerPortal': value,
      if (instance.customerPortalUpdateSubscription case final value?)
        'customerPortalUpdateSubscription': value,
    };

SubscriptionItemList _$SubscriptionItemListFromJson(
        Map<String, dynamic> json) =>
    SubscriptionItemList(
      meta: ResourceMeta.fromJson(json['meta'] as Map<String, dynamic>),
      links: json['links'] as Map<String, dynamic>,
      data: (json['data'] as List<dynamic>)
          .map((e) => SubscriptionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      included: (json['included'] as List<dynamic>)
          .map((e) => ResourceData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubscriptionItemListToJson(
        SubscriptionItemList instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'links': instance.links,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'included': instance.included.map((e) => e.toJson()).toList(),
    };

SubscriptionItem _$SubscriptionItemFromJson(Map<String, dynamic> json) =>
    SubscriptionItem(
      id: convertToString(json, 'id') as String,
      subscriptionId: (json['subscription_id'] as num).toInt(),
      priceId: (json['price_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      createdAt: const DateTimeISO8601Converter()
          .fromJson(json['created_at'] as String),
      updatedAt: const DateTimeISO8601Converter()
          .fromJson(json['updated_at'] as String),
    );

Map<String, dynamic> _$SubscriptionItemToJson(SubscriptionItem instance) =>
    <String, dynamic>{
      'type': _$ResourceTypeEnumMap[instance.type]!,
      'id': instance.id,
      'subscription_id': instance.subscriptionId,
      'price_id': instance.priceId,
      'quantity': instance.quantity,
      'created_at': const DateTimeISO8601Converter().toJson(instance.createdAt),
      'updated_at': const DateTimeISO8601Converter().toJson(instance.updatedAt),
    };

SubscriptionItemUpdate _$SubscriptionItemUpdateFromJson(
        Map<String, dynamic> json) =>
    SubscriptionItemUpdate(
      id: json['id'] as String,
      quantity: (json['quantity'] as num).toInt(),
      invoiceImmediately: json['invoice_immediately'] as bool? ?? false,
      disableProration: json['disable_proration'] as bool? ?? false,
    );

const _$SubscriptionItemUpdateFieldMap = <String, String>{
  'id': 'id',
  'quantity': 'quantity',
  'invoiceImmediately': 'invoice_immediately',
  'disableProration': 'disable_proration',
};

// ignore: unused_element
abstract class _$SubscriptionItemUpdatePerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? quantity(int instance) => instance;
  // ignore: unused_element
  static Object? invoiceImmediately(bool instance) => instance;
  // ignore: unused_element
  static Object? disableProration(bool instance) => instance;
}

SubscriptionItemUsage _$SubscriptionItemUsageFromJson(
        Map<String, dynamic> json) =>
    SubscriptionItemUsage(
      periodStart: const DateTimeISO8601Converter()
          .fromJson(json['period_start'] as String),
      periodEnd: const DateTimeISO8601Converter()
          .fromJson(json['period_end'] as String),
      quantity: (json['quantity'] as num).toInt(),
      intervalUnit: $enumDecode(_$IntervalEnumMap, json['interval_unit']),
      intervalQuantity: (json['interval_quantity'] as num).toInt(),
    );

Map<String, dynamic> _$SubscriptionItemUsageToJson(
        SubscriptionItemUsage instance) =>
    <String, dynamic>{
      'period_start':
          const DateTimeISO8601Converter().toJson(instance.periodStart),
      'period_end': const DateTimeISO8601Converter().toJson(instance.periodEnd),
      'quantity': instance.quantity,
      'interval_unit': _$IntervalEnumMap[instance.intervalUnit]!,
      'interval_quantity': instance.intervalQuantity,
    };

const _$IntervalEnumMap = {
  Interval.day: 'day',
  Interval.week: 'week',
  Interval.month: 'month',
  Interval.year: 'year',
};

SubscriptionUpdate _$SubscriptionUpdateFromJson(Map<String, dynamic> json) =>
    SubscriptionUpdate(
      subscriptionId: json['subscriptionId'] as String,
      variantId: json['variantId'] as String?,
      billingAnchor: (json['billing_anchor'] as num?)?.toInt(),
      trialEndsAt: const DateTimeISO8601NullableConverter()
          .fromJson(json['trial_ends_at'] as String?),
      invoiceImmediately: json['invoice_immediately'] as bool?,
      disableProration: json['disable_proration'] as bool?,
      cancelled: json['cancelled'] as bool?,
    );

Map<String, dynamic> _$SubscriptionUpdateToJson(SubscriptionUpdate instance) =>
    <String, dynamic>{
      'subscriptionId': instance.subscriptionId,
      if (instance.variantId case final value?) 'variantId': value,
      if (instance.billingAnchor case final value?) 'billing_anchor': value,
      if (const DateTimeISO8601NullableConverter().toJson(instance.trialEndsAt)
          case final value?)
        'trial_ends_at': value,
      if (instance.invoiceImmediately case final value?)
        'invoice_immediately': value,
      if (instance.disableProration case final value?)
        'disable_proration': value,
      if (instance.cancelled case final value?) 'cancelled': value,
    };
