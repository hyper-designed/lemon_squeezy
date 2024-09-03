import 'package:json_annotation/json_annotation.dart';

import '../utils.dart';
import 'resource.dart';
import 'variant.dart';

part 'product.g.dart';

@JsonSerializable()
class ProductList extends ResourceList<Product> {
  ProductList({
    required super.meta,
    super.links,
    required super.data,
    super.included,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) {
    final ProductList result = _$ProductListFromJson(json);
    final Iterable<ProductVariant> allVariants =
        result.included.whereType<ProductVariant>();
    List<Product> products = [];
    for (final product in result.data) {
      final List<ProductVariant> productVariants = allVariants
          .where((item) => item.productId.toString() == product.id)
          .toList();
      products.add(product.copyWith(variants: productVariants));
    }
    return result.copyWith(data: products);
  }

  @override
  ProductList copyWith({
    ResourceMeta? meta,
    Map<String, dynamic>? links,
    List<Product>? data,
    List<ResourceData>? included,
  }) {
    return ProductList(
      meta: meta ?? this.meta,
      links: links ?? this.links,
      data: data ?? this.data,
      included: included ?? this.included,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$ProductListToJson(this);
}

enum ProductStatus {
  draft,
  published;
}

@JsonSerializable()
class Product extends ResourceData {
  @JsonKey(name: 'store_id')
  final int storeId;

  final String name;

  final String slug;

  final String description;

  final ProductStatus status;

  @JsonKey(name: 'status_formatted')
  final String statusFormatted;

  @JsonKey(name: 'thumb_url')
  final String? thumbUrl;

  @JsonKey(name: 'large_thumb_url')
  final String? largeThumbUrl;

  final double? price;

  @JsonKey(name: 'price_formatted')
  final String priceFormatted;

  @JsonKey(name: 'from_price')
  final double? fromPrice;

  @JsonKey(name: 'to_price')
  final double? toPrice;

  @JsonKey(name: 'pay_what_you_want')
  final bool payWhatYouWant;

  @JsonKey(name: 'buy_now_url')
  final String buyNowUrl;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @DateTimeISO8601Converter()
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @DateTimeISO8601Converter()
  @JsonKey(name: 'test_mode')
  final bool testMode;

  @JsonKey(readValue: _readVariants)
  final List<ProductVariant> variants;

  static Object? _readVariants(Map json, String key) =>
      json['included'] ?? json[key];

  Product({
    required super.id,
    required this.storeId,
    required this.name,
    required this.slug,
    required this.description,
    required this.status,
    required this.statusFormatted,
    this.thumbUrl,
    this.largeThumbUrl,
    this.price,
    required this.priceFormatted,
    this.fromPrice,
    this.toPrice,
    required this.payWhatYouWant,
    required this.buyNowUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.testMode,
    this.variants = const [],
  }) : super(type: ResourceType.products);

  factory Product.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('attributes')) {
      json = {
        ...json,
        ...json['attributes'],
      };
    }
    return _$ProductFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Product copyWith({
    String? id,
    int? storeId,
    String? name,
    String? slug,
    String? description,
    ProductStatus? status,
    String? statusFormatted,
    String? thumbUrl,
    String? largeThumbUrl,
    double? price,
    String? priceFormatted,
    double? fromPrice,
    double? toPrice,
    bool? payWhatYouWant,
    String? buyNowUrl,
    String? createdAt,
    String? updatedAt,
    bool? testMode,
    List<ProductVariant>? variants,
  }) {
    return Product(
      id: id ?? this.id,
      storeId: storeId ?? this.storeId,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      status: status ?? this.status,
      statusFormatted: statusFormatted ?? this.statusFormatted,
      thumbUrl: thumbUrl ?? this.thumbUrl,
      largeThumbUrl: largeThumbUrl ?? this.largeThumbUrl,
      price: price ?? this.price,
      priceFormatted: priceFormatted ?? this.priceFormatted,
      fromPrice: fromPrice ?? this.fromPrice,
      toPrice: toPrice ?? this.toPrice,
      payWhatYouWant: payWhatYouWant ?? this.payWhatYouWant,
      buyNowUrl: buyNowUrl ?? this.buyNowUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      testMode: testMode ?? this.testMode,
      variants: variants ?? this.variants,
    );
  }

  @override
  List<Object?> get props => [
        ...super.props,
        storeId,
        name,
        slug,
        description,
        status,
        statusFormatted,
        thumbUrl,
        largeThumbUrl,
        price,
        priceFormatted,
        fromPrice,
        toPrice,
        payWhatYouWant,
        buyNowUrl,
        createdAt,
        updatedAt,
        testMode,
        variants,
      ];
}
