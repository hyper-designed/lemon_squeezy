// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterBy _$FilterByFromJson(Map<String, dynamic> json) => FilterBy(
      userName: json['filter[user_name]'] as String?,
      userEmail: json['filter[user_email]'] as String?,
      storeId: json['filter[store_id]'] as String?,
      productId: json['filter[product_id]'] as String?,
      variantId: json['filter[variant_id]'] as String?,
      orderId: json['filter[order_id]'] as String?,
      subscriptionId: json['filter[subscription_id]'] as String?,
      subscriptionItemId: json['filter[subscription_item_id]'] as String?,
      status: json['filter[status]'] as String?,
    );

Map<String, dynamic> _$FilterByToJson(FilterBy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filter[user_name]', instance.userName);
  writeNotNull('filter[user_email]', instance.userEmail);
  writeNotNull('filter[store_id]', instance.storeId);
  writeNotNull('filter[product_id]', instance.productId);
  writeNotNull('filter[variant_id]', instance.variantId);
  writeNotNull('filter[order_id]', instance.orderId);
  writeNotNull('filter[subscription_id]', instance.subscriptionId);
  writeNotNull('filter[subscription_item_id]', instance.subscriptionItemId);
  writeNotNull('filter[status]', instance.status);
  return val;
}

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      pageNumber: (json['page[number]'] as num?)?.toInt(),
      pageSize: (json['page[size]'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('page[number]', instance.pageNumber);
  writeNotNull('page[size]', instance.pageSize);
  return val;
}

SortBy _$SortByFromJson(Map<String, dynamic> json) => SortBy(
      createdAt: json['sort[created_at]'] as String?,
      updatedAt: json['sort[updated_at]'] as String?,
    );

Map<String, dynamic> _$SortByToJson(SortBy instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sort[created_at]', instance.createdAt);
  writeNotNull('sort[updated_at]', instance.updatedAt);
  return val;
}

Include _$IncludeFromJson(Map<String, dynamic> json) => Include(
      variants: json['variants'] as bool? ?? false,
      orders: json['orders'] as bool? ?? false,
      subscriptions: json['subscriptions'] as bool? ?? false,
      customer: json['customer'] as bool? ?? false,
      priceModel: json['priceModel'] as bool? ?? false,
      subscriptionItem: json['subscriptionItem'] as bool? ?? false,
    );

Map<String, dynamic> _$IncludeToJson(Include instance) => <String, dynamic>{
      'variants': instance.variants,
      'orders': instance.orders,
      'subscriptions': instance.subscriptions,
      'customer': instance.customer,
      'priceModel': instance.priceModel,
      'subscriptionItem': instance.subscriptionItem,
    };
