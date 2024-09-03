// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ResourceDataToJson(ResourceData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('stringify', instance.stringify);
  val['hashCode'] = instance.hashCode;
  val['type'] = _$ResourceTypeEnumMap[instance.type]!;
  val['id'] = instance.id;
  writeNotNull('relationships', instance.relationships);
  writeNotNull('links', instance.links);
  val['props'] = instance.props;
  return val;
}

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

Resource<T> _$ResourceFromJson<T extends ResourceData>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Resource<T>(
      data: fromJsonT(json['data']),
      links: json['links'] as Map<String, dynamic>?,
      included: (json['included'] as List<dynamic>?)
              ?.map((e) => ResourceData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ResourceToJson<T extends ResourceData>(
  Resource<T> instance,
  Object? Function(T value) toJsonT,
) {
  final val = <String, dynamic>{
    'data': toJsonT(instance.data),
    'included': instance.included.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('links', instance.links);
  return val;
}

ResourceMeta _$ResourceMetaFromJson(Map<String, dynamic> json) => ResourceMeta(
      page: Page.fromJson(json['page'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResourceMetaToJson(ResourceMeta instance) =>
    <String, dynamic>{
      'page': instance.page.toJson(),
    };

ResourceList<R> _$ResourceListFromJson<R extends ResourceData>(
  Map<String, dynamic> json,
  R Function(Object? json) fromJsonR,
) =>
    ResourceList<R>(
      meta: ResourceMeta.fromJson(json['meta'] as Map<String, dynamic>),
      links: json['links'] as Map<String, dynamic>? ?? const {},
      data: (json['data'] as List<dynamic>).map(fromJsonR).toList(),
      included: (json['included'] as List<dynamic>?)
              ?.map((e) => ResourceData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ResourceListToJson<R extends ResourceData>(
  ResourceList<R> instance,
  Object? Function(R value) toJsonR,
) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'links': instance.links,
      'data': instance.data.map(toJsonR).toList(),
      'included': instance.included.map((e) => e.toJson()).toList(),
    };
