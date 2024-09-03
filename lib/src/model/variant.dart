import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils.dart';
import 'models.dart';

part 'variant.g.dart';

@JsonSerializable()
class ProductVariantList extends ResourceList<ProductVariant> {
  ProductVariantList({
    required super.meta,
    super.links,
    required super.data,
    super.included,
  });

  factory ProductVariantList.fromJson(Map<String, dynamic> json) {
    final ProductVariantList result = _$ProductVariantListFromJson(json);
    final Iterable<Price> allVariants = result.included.whereType<Price>();
    List<ProductVariant> variants = [];
    for (final variant in result.data) {
      final Price? variantPrice = allVariants
          .firstWhereOrNull((item) => item.variantId.toString() == variant.id);
      variants.add(variant.copyWith(priceModel: variantPrice));
    }
    return result.copyWith(data: variants);
  }

  /// copyWith
  @override
  ProductVariantList copyWith({
    ResourceMeta? meta,
    Map<String, dynamic>? links,
    List<ProductVariant>? data,
    List<ResourceData>? included,
  }) {
    return ProductVariantList(
      meta: meta ?? this.meta,
      links: links ?? this.links,
      data: data ?? this.data,
      included: included ?? this.included,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$ProductVariantListToJson(this);
}

enum ProductVariantStatus {
  pending,
  draft,
  published;
}

@JsonSerializable()
class ProductVariant extends ResourceData {
  @JsonKey(name: 'product_id')
  final int productId;

  final String name;

  final String slug;

  final String description;

  /// Price of the product variant in cents. This is deprecated in
  /// lemon squeezy API. Use [priceModel] instead.
  final double price;

  @JsonKey(name: 'is_subscription')
  final bool isSubscription;

  final Interval interval;

  @JsonKey(name: 'interval_count')
  final int? intervalCount;

  @JsonKey(name: 'trial_interval')
  final String trialInterval;

  @JsonKey(name: 'trial_interval_count')
  final int? trialIntervalCount;

  @JsonKey(name: 'pay_what_you_want')
  final bool payWhatYouWant;

  @JsonKey(name: 'min_price')
  final double minPrice;

  @JsonKey(name: 'suggested_price')
  final double suggestedPrice;

  @JsonKey(name: 'has_license_keys')
  final bool hasLicenseKeys;

  @JsonKey(name: 'license_activation_limit')
  final int licenseActivationLimit;

  @JsonKey(name: 'is_license_limit_unlimited')
  final bool isLicenseLimitUnlimited;

  @JsonKey(name: 'license_length_value')
  final int licenseLengthValue;

  @JsonKey(name: 'license_length_unit')
  final String licenseLengthUnit;

  @JsonKey(name: 'is_license_length_unlimited')
  final bool isLicenseLengthUnlimited;

  @JsonKey(name: 'sort')
  final int sort;

  final ProductVariantStatus status;

  @JsonKey(name: 'status_formatted')
  final String statusFormatted;

  @JsonKey(name: 'created_at')
  @DateTimeISO8601Converter()
  final String createdAt;

  @JsonKey(name: 'updated_at')
  @DateTimeISO8601Converter()
  final String updatedAt;

  @JsonKey(name: 'test_mode')
  final bool testMode;

  @JsonKey(name: 'price_model')
  final Price? priceModel;

  ProductVariant({
    required super.id,
    required this.productId,
    required this.name,
    required this.slug,
    required this.description,
    required this.price,
    required this.isSubscription,
    required this.interval,
    this.intervalCount,
    required this.trialInterval,
    this.trialIntervalCount,
    required this.payWhatYouWant,
    required this.minPrice,
    required this.suggestedPrice,
    required this.hasLicenseKeys,
    required this.licenseActivationLimit,
    required this.isLicenseLimitUnlimited,
    required this.licenseLengthValue,
    required this.licenseLengthUnit,
    required this.isLicenseLengthUnlimited,
    required this.sort,
    required this.status,
    required this.statusFormatted,
    required this.createdAt,
    required this.updatedAt,
    required this.testMode,
    this.priceModel,
  }) : super(type: ResourceType.variants);

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('attributes')) {
      json = {
        ...json,
        ...json['attributes'],
      };
    }
    return _$ProductVariantFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$ProductVariantToJson(this);

  ProductVariant copyWith({
    String? id,
    int? productId,
    String? name,
    String? slug,
    String? description,
    double? price,
    bool? isSubscription,
    Interval? interval,
    int? intervalCount,
    String? trialInterval,
    int? trialIntervalCount,
    bool? payWhatYouWant,
    double? minPrice,
    double? suggestedPrice,
    bool? hasLicenseKeys,
    int? licenseActivationLimit,
    bool? isLicenseLimitUnlimited,
    int? licenseLengthValue,
    String? licenseLengthUnit,
    bool? isLicenseLengthUnlimited,
    int? sort,
    ProductVariantStatus? status,
    String? statusFormatted,
    String? createdAt,
    String? updatedAt,
    bool? testMode,
    Price? priceModel,
  }) {
    return ProductVariant(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      price: price ?? this.price,
      isSubscription: isSubscription ?? this.isSubscription,
      interval: interval ?? this.interval,
      intervalCount: intervalCount ?? this.intervalCount,
      trialInterval: trialInterval ?? this.trialInterval,
      trialIntervalCount: trialIntervalCount ?? this.trialIntervalCount,
      payWhatYouWant: payWhatYouWant ?? this.payWhatYouWant,
      minPrice: minPrice ?? this.minPrice,
      suggestedPrice: suggestedPrice ?? this.suggestedPrice,
      hasLicenseKeys: hasLicenseKeys ?? this.hasLicenseKeys,
      licenseActivationLimit:
          licenseActivationLimit ?? this.licenseActivationLimit,
      isLicenseLimitUnlimited:
          isLicenseLimitUnlimited ?? this.isLicenseLimitUnlimited,
      licenseLengthValue: licenseLengthValue ?? this.licenseLengthValue,
      licenseLengthUnit: licenseLengthUnit ?? this.licenseLengthUnit,
      isLicenseLengthUnlimited:
          isLicenseLengthUnlimited ?? this.isLicenseLengthUnlimited,
      sort: sort ?? this.sort,
      status: status ?? this.status,
      statusFormatted: statusFormatted ?? this.statusFormatted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      testMode: testMode ?? this.testMode,
      priceModel: priceModel ?? this.priceModel,
    );
  }

  @override
  List<Object?> get props => [
        ...super.props,
        productId,
        name,
        slug,
        description,
        price,
        isSubscription,
        interval,
        intervalCount,
        trialInterval,
        trialIntervalCount,
        payWhatYouWant,
        minPrice,
        suggestedPrice,
        hasLicenseKeys,
        licenseActivationLimit,
        isLicenseLimitUnlimited,
        licenseLengthValue,
        licenseLengthUnit,
        isLicenseLengthUnlimited,
        sort,
        status,
        statusFormatted,
        createdAt,
        updatedAt,
        testMode,
        priceModel,
      ];
}
