// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductVariantList _$ProductVariantListFromJson(Map<String, dynamic> json) =>
    ProductVariantList(
      meta: ResourceMeta.fromJson(json['meta'] as Map<String, dynamic>),
      links: json['links'] as Map<String, dynamic>? ?? const {},
      data: (json['data'] as List<dynamic>)
          .map((e) => ProductVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
      included: (json['included'] as List<dynamic>?)
              ?.map((e) => ResourceData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ProductVariantListToJson(ProductVariantList instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'links': instance.links,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'included': instance.included.map((e) => e.toJson()).toList(),
    };

ProductVariant _$ProductVariantFromJson(Map<String, dynamic> json) =>
    ProductVariant(
      id: convertToString(json, 'id') as String,
      productId: (json['product_id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      isSubscription: json['is_subscription'] as bool,
      interval: $enumDecode(_$IntervalEnumMap, json['interval']),
      intervalCount: (json['interval_count'] as num?)?.toInt(),
      trialInterval: json['trial_interval'] as String,
      trialIntervalCount: (json['trial_interval_count'] as num?)?.toInt(),
      payWhatYouWant: json['pay_what_you_want'] as bool,
      minPrice: (json['min_price'] as num).toDouble(),
      suggestedPrice: (json['suggested_price'] as num).toDouble(),
      hasLicenseKeys: json['has_license_keys'] as bool,
      licenseActivationLimit: (json['license_activation_limit'] as num).toInt(),
      isLicenseLimitUnlimited: json['is_license_limit_unlimited'] as bool,
      licenseLengthValue: (json['license_length_value'] as num).toInt(),
      licenseLengthUnit: json['license_length_unit'] as String,
      isLicenseLengthUnlimited: json['is_license_length_unlimited'] as bool,
      sort: (json['sort'] as num).toInt(),
      status: $enumDecode(_$ProductVariantStatusEnumMap, json['status']),
      statusFormatted: json['status_formatted'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      testMode: json['test_mode'] as bool,
      priceModel: json['price_model'] == null
          ? null
          : Price.fromJson(json['price_model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductVariantToJson(ProductVariant instance) =>
    <String, dynamic>{
      'type': _$ResourceTypeEnumMap[instance.type]!,
      'id': instance.id,
      'product_id': instance.productId,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'price': instance.price,
      'is_subscription': instance.isSubscription,
      'interval': _$IntervalEnumMap[instance.interval]!,
      if (instance.intervalCount case final value?) 'interval_count': value,
      'trial_interval': instance.trialInterval,
      if (instance.trialIntervalCount case final value?)
        'trial_interval_count': value,
      'pay_what_you_want': instance.payWhatYouWant,
      'min_price': instance.minPrice,
      'suggested_price': instance.suggestedPrice,
      'has_license_keys': instance.hasLicenseKeys,
      'license_activation_limit': instance.licenseActivationLimit,
      'is_license_limit_unlimited': instance.isLicenseLimitUnlimited,
      'license_length_value': instance.licenseLengthValue,
      'license_length_unit': instance.licenseLengthUnit,
      'is_license_length_unlimited': instance.isLicenseLengthUnlimited,
      'sort': instance.sort,
      'status': _$ProductVariantStatusEnumMap[instance.status]!,
      'status_formatted': instance.statusFormatted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'test_mode': instance.testMode,
      if (instance.priceModel?.toJson() case final value?) 'price_model': value,
    };

const _$IntervalEnumMap = {
  Interval.day: 'day',
  Interval.week: 'week',
  Interval.month: 'month',
  Interval.year: 'year',
};

const _$ProductVariantStatusEnumMap = {
  ProductVariantStatus.pending: 'pending',
  ProductVariantStatus.draft: 'draft',
  ProductVariantStatus.published: 'published',
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
