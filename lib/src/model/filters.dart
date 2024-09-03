import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filters.g.dart';

@JsonSerializable()
class FilterBy with EquatableMixin {
  @JsonKey(name: 'filter[user_name]')
  final String? userName;
  @JsonKey(name: 'filter[user_email]')
  final String? userEmail;
  @JsonKey(name: 'filter[store_id]')
  final String? storeId;
  @JsonKey(name: 'filter[product_id]')
  final String? productId;
  @JsonKey(name: 'filter[variant_id]')
  final String? variantId;
  @JsonKey(name: 'filter[order_id]')
  final String? orderId;
  @JsonKey(name: 'filter[subscription_id]')
  final String? subscriptionId;
  @JsonKey(name: 'filter[subscription_item_id]')
  final String? subscriptionItemId;
  @JsonKey(name: 'filter[status]')
  final String? status;

  FilterBy({
    this.userName,
    this.userEmail,
    this.storeId,
    this.productId,
    this.variantId,
    this.orderId,
    this.subscriptionId,
    this.subscriptionItemId,
    this.status,
  });

  factory FilterBy.fromJson(Map<String, dynamic> json) =>
      _$FilterByFromJson(json);

  Map<String, dynamic> toJson() => _$FilterByToJson(this);

  Map<String, dynamic> toQueryParams() => toJson();

  @override
  List<Object?> get props => [
        userName,
        userEmail,
        storeId,
        productId,
        variantId,
        orderId,
        subscriptionId,
        subscriptionItemId,
        status,
      ];
}

@JsonSerializable()
class Pagination with EquatableMixin {
  @JsonKey(name: 'page[number]')
  final int? pageNumber;
  @JsonKey(name: 'page[size]')
  final int? pageSize;

  Pagination({
    this.pageNumber,
    this.pageSize,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);

  Map<String, dynamic> toQueryParams() => toJson();

  @override
  List<Object?> get props => [pageNumber, pageSize];
}

@JsonSerializable()
class SortBy with EquatableMixin {
  @JsonKey(name: 'sort[created_at]')
  final String? createdAt;
  @JsonKey(name: 'sort[updated_at]')
  final String? updatedAt;

  SortBy({
    this.createdAt,
    this.updatedAt,
  });

  factory SortBy.fromJson(Map<String, dynamic> json) => _$SortByFromJson(json);

  Map<String, dynamic> toJson() => _$SortByToJson(this);

  Map<String, dynamic> toQueryParams() => toJson();

  @override
  List<Object?> get props => [createdAt, updatedAt];
}

@JsonSerializable()
class Include with EquatableMixin {
  final bool variants;
  final bool orders;
  final bool subscriptions;
  final bool customer;
  final bool priceModel;
  final bool subscriptionItem;

  const Include({
    this.variants = false,
    this.orders = false,
    this.subscriptions = false,
    this.customer = false,
    this.priceModel = false,
    this.subscriptionItem = false,
  })  : assert(
            variants ||
                orders ||
                subscriptions ||
                customer ||
                priceModel ||
                subscriptionItem,
            'At least one include must be true'),
        assert(
            !(variants &
                orders &
                subscriptions &
                customer &
                priceModel &
                subscriptionItem),
            'Only one include can be true');

  const Include.variants() : this(variants: true);

  const Include.orders() : this(orders: true);

  const Include.subscriptions() : this(subscriptions: true);

  const Include.customer() : this(customer: true);

  const Include.priceModel() : this(priceModel: true);

  const Include.subscriptionItem() : this(subscriptionItem: true);

  factory Include.fromJson(Map<String, dynamic> json) =>
      _$IncludeFromJson(json);

  Map<String, dynamic> toJson() => _$IncludeToJson(this);

  Set<String> get values => {
        if (variants) 'variants',
        if (orders) 'orders',
        if (subscriptions) 'subscriptions',
        if (customer) 'customer',
        if (priceModel) 'price-model',
        if (subscriptionItem) 'subscription-item',
      };

  Map<String, dynamic> toQueryParam() => {'include': values.join(',')};

  @override
  List<Object?> get props => [variants, orders, subscriptions, customer];
}
