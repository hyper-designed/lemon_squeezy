// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductList _$ProductListFromJson(Map<String, dynamic> json) => ProductList(
      meta: ResourceMeta.fromJson(json['meta'] as Map<String, dynamic>),
      links: json['links'] as Map<String, dynamic>? ?? const {},
      data: (json['data'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      included: (json['included'] as List<dynamic>?)
              ?.map((e) => ResourceData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ProductListToJson(ProductList instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'links': instance.links,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'included': instance.included.map((e) => e.toJson()).toList(),
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: convertToString(json, 'id') as String,
      storeId: (json['store_id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      status: $enumDecode(_$ProductStatusEnumMap, json['status']),
      statusFormatted: json['status_formatted'] as String,
      thumbUrl: json['thumb_url'] as String?,
      largeThumbUrl: json['large_thumb_url'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      priceFormatted: json['price_formatted'] as String,
      fromPrice: (json['from_price'] as num?)?.toDouble(),
      toPrice: (json['to_price'] as num?)?.toDouble(),
      payWhatYouWant: json['pay_what_you_want'] as bool,
      buyNowUrl: json['buy_now_url'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      testMode: json['test_mode'] as bool,
      variants: (Product._readVariants(json, 'variants') as List<dynamic>?)
              ?.map((e) => ProductVariant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ProductToJson(Product instance) {
  final val = <String, dynamic>{
    'type': _$ResourceTypeEnumMap[instance.type]!,
    'id': instance.id,
    'store_id': instance.storeId,
    'name': instance.name,
    'slug': instance.slug,
    'description': instance.description,
    'status': _$ProductStatusEnumMap[instance.status]!,
    'status_formatted': instance.statusFormatted,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('thumb_url', instance.thumbUrl);
  writeNotNull('large_thumb_url', instance.largeThumbUrl);
  writeNotNull('price', instance.price);
  val['price_formatted'] = instance.priceFormatted;
  writeNotNull('from_price', instance.fromPrice);
  writeNotNull('to_price', instance.toPrice);
  val['pay_what_you_want'] = instance.payWhatYouWant;
  val['buy_now_url'] = instance.buyNowUrl;
  val['created_at'] = instance.createdAt;
  val['updated_at'] = instance.updatedAt;
  val['test_mode'] = instance.testMode;
  val['variants'] = instance.variants.map((e) => e.toJson()).toList();
  return val;
}

const _$ProductStatusEnumMap = {
  ProductStatus.draft: 'draft',
  ProductStatus.published: 'published',
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
