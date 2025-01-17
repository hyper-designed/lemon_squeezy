// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceList _$PriceListFromJson(Map<String, dynamic> json) => PriceList(
      meta: ResourceMeta.fromJson(json['meta'] as Map<String, dynamic>),
      links: json['links'] as Map<String, dynamic>? ?? const {},
      data: (json['data'] as List<dynamic>)
          .map((e) => Price.fromJson(e as Map<String, dynamic>))
          .toList(),
      included: (json['included'] as List<dynamic>?)
              ?.map((e) => ResourceData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PriceListToJson(PriceList instance) => <String, dynamic>{
      'meta': instance.meta.toJson(),
      'links': instance.links,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'included': instance.included.map((e) => e.toJson()).toList(),
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      id: convertToString(json, 'id') as String,
      variantId: (json['variant_id'] as num).toInt(),
      category: $enumDecode(_$PriceCategoryEnumMap, json['category']),
      scheme: $enumDecode(_$PriceSchemeEnumMap, json['scheme']),
      usageAggregation: $enumDecodeNullable(
          _$UsageAggregationEnumMap, json['usageAggregation']),
      unitPrice: (json['unit_price'] as num?)?.toDouble(),
      unitPriceDecimal: convertToString(json, 'unit_price_decimal') as String?,
      setupFeeEnabled: json['setup_fee_enabled'] as bool?,
      setupFee: (json['setup_fee'] as num?)?.toInt(),
      packageSize: (json['package_size'] as num?)?.toInt() ?? 1,
      tiers: (json['tiers'] as List<dynamic>?)
          ?.map((e) => PriceTier.fromJson(e as Map<String, dynamic>))
          .toList(),
      renewalInterval:
          $enumDecodeNullable(_$IntervalEnumMap, json['renewal_interval_unit']),
      renewalIntervalQuantity:
          (json['renewal_interval_quantity'] as num?)?.toInt(),
      trialInterval:
          $enumDecodeNullable(_$IntervalEnumMap, json['trial_interval_unit']),
      trialIntervalQuantity: (json['trial_interval_quantity'] as num?)?.toInt(),
      minPrice: (json['min_price'] as num?)?.toDouble(),
      suggestedPrice: (json['suggested_price'] as num?)?.toDouble(),
      taxCode: json['tax_code'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'type': _$ResourceTypeEnumMap[instance.type]!,
      'id': instance.id,
      'variant_id': instance.variantId,
      'category': _$PriceCategoryEnumMap[instance.category]!,
      'scheme': _$PriceSchemeEnumMap[instance.scheme]!,
      if (_$UsageAggregationEnumMap[instance.usageAggregation]
          case final value?)
        'usageAggregation': value,
      if (instance.unitPrice case final value?) 'unit_price': value,
      if (instance.unitPriceDecimal case final value?)
        'unit_price_decimal': value,
      if (instance.setupFeeEnabled case final value?)
        'setup_fee_enabled': value,
      if (instance.setupFee case final value?) 'setup_fee': value,
      'package_size': instance.packageSize,
      if (instance.tiers?.map((e) => e.toJson()).toList() case final value?)
        'tiers': value,
      if (_$IntervalEnumMap[instance.renewalInterval] case final value?)
        'renewal_interval_unit': value,
      if (instance.renewalIntervalQuantity case final value?)
        'renewal_interval_quantity': value,
      if (_$IntervalEnumMap[instance.trialInterval] case final value?)
        'trial_interval_unit': value,
      if (instance.trialIntervalQuantity case final value?)
        'trial_interval_quantity': value,
      if (instance.minPrice case final value?) 'min_price': value,
      if (instance.suggestedPrice case final value?) 'suggested_price': value,
      'tax_code': instance.taxCode,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$PriceCategoryEnumMap = {
  PriceCategory.oneTime: 'one_time',
  PriceCategory.subscription: 'subscription',
  PriceCategory.leadMagnet: 'lead_magnet',
  PriceCategory.payWhatYouWant: 'pay_what_you_want',
};

const _$PriceSchemeEnumMap = {
  PriceScheme.standard: 'standard',
  PriceScheme.package: 'package',
  PriceScheme.graduated: 'graduated',
  PriceScheme.volume: 'volume',
};

const _$UsageAggregationEnumMap = {
  UsageAggregation.sum: 'sum',
  UsageAggregation.lastDuringPeriod: 'last_during_period',
  UsageAggregation.lastEver: 'last_ever',
  UsageAggregation.max: 'max',
};

const _$IntervalEnumMap = {
  Interval.day: 'day',
  Interval.week: 'week',
  Interval.month: 'month',
  Interval.year: 'year',
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

PriceTier _$PriceTierFromJson(Map<String, dynamic> json) => PriceTier(
      lastUnit: (PriceTier._readLastUnit(json, 'last_unit') as num?)?.toInt(),
      unitPrice: (json['unit_price'] as num?)?.toDouble(),
      unitPriceDecimal: json['unit_price_decimal'] as String?,
      fixedFee: (json['fixed_fee'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PriceTierToJson(PriceTier instance) => <String, dynamic>{
      if (instance.lastUnit case final value?) 'last_unit': value,
      if (instance.unitPrice case final value?) 'unit_price': value,
      if (instance.unitPriceDecimal case final value?)
        'unit_price_decimal': value,
      if (instance.fixedFee case final value?) 'fixed_fee': value,
    };
