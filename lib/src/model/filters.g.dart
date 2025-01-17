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
      if (instance.userName case final value?) 'filter[user_name]': value,
      if (instance.userEmail case final value?) 'filter[user_email]': value,
      if (instance.storeId case final value?) 'filter[store_id]': value,
      if (instance.productId case final value?) 'filter[product_id]': value,
      if (instance.variantId case final value?) 'filter[variant_id]': value,
      if (instance.orderId case final value?) 'filter[order_id]': value,
      if (instance.subscriptionId case final value?)
        'filter[subscription_id]': value,
      if (instance.subscriptionItemId case final value?)
        'filter[subscription_item_id]': value,
      if (instance.status case final value?) 'filter[status]': value,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      pageNumber: (json['page[number]'] as num?)?.toInt(),
      pageSize: (json['page[size]'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      if (instance.pageNumber case final value?) 'page[number]': value,
      if (instance.pageSize case final value?) 'page[size]': value,
    };

SortBy _$SortByFromJson(Map<String, dynamic> json) => SortBy(
      createdAt: json['sort[created_at]'] as String?,
      updatedAt: json['sort[updated_at]'] as String?,
    );

Map<String, dynamic> _$SortByToJson(SortBy instance) => <String, dynamic>{
      if (instance.createdAt case final value?) 'sort[created_at]': value,
      if (instance.updatedAt case final value?) 'sort[updated_at]': value,
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
