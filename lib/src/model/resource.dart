import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils.dart';
import 'models.dart';

part 'resource.g.dart';

enum ResourceType {
  products,
  variants,
  prices,
  orders,
  @JsonValue('order_items')
  orderItems,
  subscriptions,
  @JsonValue('subscription-items')
  subscriptionItems,
  @JsonValue('subscription-invoices')
  subscriptionInvoices,
  @JsonValue('usage-records')
  usageRecords,
}

@JsonSerializable(createFactory: false)
abstract class ResourceData with EquatableMixin {
  @JsonKey(includeToJson: true)
  final ResourceType type;

  @JsonKey(readValue: convertToString)
  final String id;

  final Map<String, dynamic>? relationships;

  final Map<String, dynamic>? links;

  ResourceData({
    required this.type,
    required this.id,
    this.relationships,
    this.links,
  });

  factory ResourceData.fromJson(Map<String, dynamic> json) =>
      typedFromJson(json);

  static T typedFromJson<T extends ResourceData>(Map<String, dynamic> json) {
    final ResourceType? type = _$ResourceTypeEnumMap.entries
        .firstWhereOrNull((entry) => entry.value == json['type'])
        ?.key;
    if (type == null) {
      throw ArgumentError('Invalid resource type: ${json['type']}');
    }
    return switch (type) {
      ResourceType.products => Product.fromJson(json),
      ResourceType.variants => ProductVariant.fromJson(json),
      ResourceType.prices => Price.fromJson(json),
      ResourceType.orders => Order.fromJson(json),
      ResourceType.orderItems => OrderItem.fromJson(json),
      ResourceType.subscriptions => Subscription.fromJson(json),
      ResourceType.subscriptionItems => SubscriptionItem.fromJson(json),
      ResourceType.subscriptionInvoices => SubscriptionInvoice.fromJson(json),
      ResourceType.usageRecords => UsageRecord.fromJson(json),
    } as T;
  }

  Map<String, dynamic> toJson();

  @override
  List<Object?> get props => [type, id, relationships, links];
}

@JsonSerializable(genericArgumentFactories: true)
class Resource<T extends ResourceData> with EquatableMixin {
  final T data;

  final List<ResourceData> included;

  final Map<String, dynamic>? links;

  Resource({
    required this.data,
    this.links,
    this.included = const [],
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return _$ResourceFromJson(
      json,
      (object) {
        return ResourceData.typedFromJson<T>({
          ...object as Map<String, dynamic>,
          'included': json['included'],
        });
      },
    );
  }

  Map<String, dynamic> toJson() => _$ResourceToJson(
        this,
        (data) => data.toJson(),
      );

  Resource<T> copyWith({
    T? data,
    Map<String, dynamic>? links,
    List<ResourceData>? included,
  }) {
    return Resource(
      data: data ?? this.data,
      links: links ?? this.links,
      included: included ?? this.included,
    );
  }

  @override
  List<Object?> get props => [data, links, included];
}

@JsonSerializable()
class ResourceMeta with EquatableMixin {
  final Page page;

  ResourceMeta({required this.page});

  factory ResourceMeta.fromJson(Map<String, dynamic> json) =>
      _$ResourceMetaFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceMetaToJson(this);

  @override
  List<Object?> get props => [page];
}

@JsonSerializable(genericArgumentFactories: true)
class ResourceList<R extends ResourceData> with EquatableMixin {
  final ResourceMeta meta;

  final Map<String, dynamic> links;

  final List<R> data;

  final List<ResourceData> included;

  ResourceList({
    required this.meta,
    this.links = const {},
    required this.data,
    this.included = const [],
  });

  factory ResourceList.fromJson(Map<String, dynamic> json) =>
      _$ResourceListFromJson(
        json,
        (json) => ResourceData.typedFromJson<R>(json as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() =>
      _$ResourceListToJson(this, (data) => data.toJson());

  /// copyWith
  ResourceList copyWith({
    ResourceMeta? meta,
    Map<String, dynamic>? links,
    List<R>? data,
    List<ResourceData>? included,
  }) {
    return ResourceList(
      meta: meta ?? this.meta,
      links: links ?? this.links,
      data: data ?? this.data,
      included: included ?? this.included,
    );
  }

  @override
  List<Object?> get props => [meta, links, data, included];
}
