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

Map<String, dynamic> _$FilterByToJson(FilterBy instance) => <String, dynamic>{
  'filter[user_name]': ?instance.userName,
  'filter[user_email]': ?instance.userEmail,
  'filter[store_id]': ?instance.storeId,
  'filter[product_id]': ?instance.productId,
  'filter[variant_id]': ?instance.variantId,
  'filter[order_id]': ?instance.orderId,
  'filter[subscription_id]': ?instance.subscriptionId,
  'filter[subscription_item_id]': ?instance.subscriptionItemId,
  'filter[status]': ?instance.status,
};

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
  pageNumber: (json['page[number]'] as num?)?.toInt(),
  pageSize: (json['page[size]'] as num?)?.toInt(),
);

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'page[number]': ?instance.pageNumber,
      'page[size]': ?instance.pageSize,
    };

SortBy _$SortByFromJson(Map<String, dynamic> json) => SortBy(
  createdAt: json['sort[created_at]'] as String?,
  updatedAt: json['sort[updated_at]'] as String?,
);

Map<String, dynamic> _$SortByToJson(SortBy instance) => <String, dynamic>{
  'sort[created_at]': ?instance.createdAt,
  'sort[updated_at]': ?instance.updatedAt,
};

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
