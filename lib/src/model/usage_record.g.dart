// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usage_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsageRecordList _$UsageRecordListFromJson(Map<String, dynamic> json) =>
    UsageRecordList(
      meta: ResourceMeta.fromJson(json['meta'] as Map<String, dynamic>),
      links: json['links'] as Map<String, dynamic>? ?? const {},
      data: (json['data'] as List<dynamic>)
          .map((e) => UsageRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      included: (json['included'] as List<dynamic>?)
              ?.map((e) => ResourceData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UsageRecordListToJson(UsageRecordList instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'links': instance.links,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'included': instance.included.map((e) => e.toJson()).toList(),
    };

UsageRecord _$UsageRecordFromJson(Map<String, dynamic> json) => UsageRecord(
      id: convertToString(json, 'id') as String,
      subscriptionItemId: (json['subscription_item_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      action: $enumDecodeNullable(_$UsageActionEnumMap, json['action']),
      createdAt: const DateTimeISO8601Converter()
          .fromJson(json['created_at'] as String),
      updatedAt: const DateTimeISO8601Converter()
          .fromJson(json['updated_at'] as String),
    );

Map<String, dynamic> _$UsageRecordToJson(UsageRecord instance) {
  final val = <String, dynamic>{
    'type': _$ResourceTypeEnumMap[instance.type]!,
    'id': instance.id,
    'subscription_item_id': instance.subscriptionItemId,
    'quantity': instance.quantity,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('action', _$UsageActionEnumMap[instance.action]);
  val['created_at'] =
      const DateTimeISO8601Converter().toJson(instance.createdAt);
  val['updated_at'] =
      const DateTimeISO8601Converter().toJson(instance.updatedAt);
  return val;
}

const _$UsageActionEnumMap = {
  UsageAction.increment: 'increment',
  UsageAction.set: 'set',
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

UsageRecordCreate _$UsageRecordCreateFromJson(Map<String, dynamic> json) =>
    UsageRecordCreate(
      quantity: (json['quantity'] as num).toInt(),
      subscriptionItemId: json['subscriptionItemId'] as String,
      action: $enumDecode(_$UsageActionEnumMap, json['action']),
    );
