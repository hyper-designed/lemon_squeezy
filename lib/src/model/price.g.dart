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

Map<String, dynamic> _$PriceToJson(Price instance) {
  final val = <String, dynamic>{
    'type': _$ResourceTypeEnumMap[instance.type]!,
    'id': instance.id,
    'variant_id': instance.variantId,
    'category': _$PriceCategoryEnumMap[instance.category]!,
    'scheme': _$PriceSchemeEnumMap[instance.scheme]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'usageAggregation', _$UsageAggregationEnumMap[instance.usageAggregation]);
  writeNotNull('unit_price', instance.unitPrice);
  writeNotNull('unit_price_decimal', instance.unitPriceDecimal);
  writeNotNull('setup_fee_enabled', instance.setupFeeEnabled);
  writeNotNull('setup_fee', instance.setupFee);
  val['package_size'] = instance.packageSize;
  writeNotNull('tiers', instance.tiers?.map((e) => e.toJson()).toList());
  writeNotNull(
      'renewal_interval_unit', _$IntervalEnumMap[instance.renewalInterval]);
  writeNotNull('renewal_interval_quantity', instance.renewalIntervalQuantity);
  writeNotNull(
      'trial_interval_unit', _$IntervalEnumMap[instance.trialInterval]);
  writeNotNull('trial_interval_quantity', instance.trialIntervalQuantity);
  writeNotNull('min_price', instance.minPrice);
  writeNotNull('suggested_price', instance.suggestedPrice);
  val['tax_code'] = instance.taxCode;
  val['created_at'] = instance.createdAt;
  val['updated_at'] = instance.updatedAt;
  return val;
}

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

Map<String, dynamic> _$PriceTierToJson(PriceTier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('last_unit', instance.lastUnit);
  writeNotNull('unit_price', instance.unitPrice);
  writeNotNull('unit_price_decimal', instance.unitPriceDecimal);
  writeNotNull('fixed_fee', instance.fixedFee);
  return val;
}
