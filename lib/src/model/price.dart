import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils.dart';
import 'models.dart';

part 'price.g.dart';

@JsonSerializable()
class PriceList extends ResourceList<Price> {
  PriceList({
    required super.meta,
    super.links,
    required super.data,
    super.included,
  });

  factory PriceList.fromJson(Map<String, dynamic> json) =>
      _$PriceListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PriceListToJson(this);
}

/// Ref: https://docs.lemonsqueezy.com/api/prices#the-price-object
enum PriceCategory {
  @JsonValue('one_time')
  oneTime,
  subscription,
  @JsonValue('lead_magnet')
  leadMagnet,
  @JsonValue('pay_what_you_want')
  payWhatYouWant,
}

/// Ref: https://docs.lemonsqueezy.com/api/prices#the-price-object
enum PriceScheme {
  standard,
  package,
  graduated,
  volume,
}

/// Ref: https://docs.lemonsqueezy.com/api/prices#the-price-object
enum UsageAggregation {
  @JsonValue('sum')
  sum,
  @JsonValue('last_during_period')
  lastDuringPeriod,
  @JsonValue('last_ever')
  lastEver,
  @JsonValue('max')
  max,
}

/// Ref: https://docs.lemonsqueezy.com/api/prices#the-price-object
@JsonSerializable()
class Price extends ResourceData {
  @JsonKey(name: 'variant_id')
  final int variantId;

  final PriceCategory category;

  final PriceScheme scheme;

  /// Will be null if usage-based billing is not activated on this price's
  /// variant.
  final UsageAggregation? usageAggregation;

  /// In cents
  /// If usage_aggregation is enabled for this price, unit_price will be
  /// null and unit_price_decimal will be used instead.
  @JsonKey(name: 'unit_price')
  final double? unitPrice;

  /// If usage_aggregation is not enabled for this price, unit_price_decimal
  /// will be null and unit_price will be used instead.
  @JsonKey(name: 'unit_price_decimal', readValue: convertToString)
  final String? unitPriceDecimal;

  /// A boolean indicating if the price has a setup fee.
  /// Will be null for non-subscription pricing.
  @JsonKey(name: 'setup_fee_enabled')
  final bool? setupFeeEnabled;

  /// A positive integer in cents representing the setup fee.
  /// Will be null for non-subscription pricing.
  @JsonKey(name: 'setup_fee')
  final int? setupFee;

  /// The number of units included in each package when using package pricing.
  /// Will be 1 for standard, graduated and volume pricing.
  @JsonKey(name: 'package_size')
  final int packageSize;

  final List<PriceTier>? tiers;

  double? get unitPriceInDollars => unitPrice != null ? unitPrice! / 100 : null;

  @JsonKey(name: 'renewal_interval_unit')
  final Interval? renewalInterval;

  @JsonKey(name: 'renewal_interval_quantity')
  final int? renewalIntervalQuantity;

  @JsonKey(name: 'trial_interval_unit')
  final Interval? trialInterval;

  @JsonKey(name: 'trial_interval_quantity')
  final int? trialIntervalQuantity;

  @JsonKey(name: 'min_price')
  final double? minPrice;

  @JsonKey(name: 'suggested_price')
  final double? suggestedPrice;

  @JsonKey(name: 'tax_code')
  final String taxCode;

  @JsonKey(name: 'created_at')
  @DateTimeISO8601Converter()
  final String createdAt;

  @JsonKey(name: 'updated_at')
  @DateTimeISO8601Converter()
  final String updatedAt;

  Price({
    required super.id,
    required this.variantId,
    required this.category,
    required this.scheme,
    this.usageAggregation,
    this.unitPrice,
    this.unitPriceDecimal,
    this.setupFeeEnabled,
    this.setupFee,
    this.packageSize = 1,
    this.tiers,
    this.renewalInterval,
    this.renewalIntervalQuantity,
    this.trialInterval,
    this.trialIntervalQuantity,
    this.minPrice,
    this.suggestedPrice,
    required this.taxCode,
    required this.createdAt,
    required this.updatedAt,
  }) : super(type: ResourceType.prices);

  factory Price.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('attributes')) {
      json = {
        ...json,
        ...json['attributes'],
      };
    }
    return _$PriceFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$PriceToJson(this);

  @override
  List<Object?> get props =>
      [
        ...super.props,
        category,
        scheme,
        usageAggregation,
        unitPrice,
        unitPriceDecimal,
        setupFeeEnabled,
        setupFee,
        packageSize,
        tiers,
        renewalInterval,
        renewalIntervalQuantity,
        trialInterval,
        trialIntervalQuantity,
        minPrice,
        suggestedPrice,
        taxCode,
        createdAt,
        updatedAt,
      ];
}

@JsonSerializable()
class PriceTier with EquatableMixin {
  @JsonKey(name: 'last_unit', readValue: _readLastUnit)
  final int? lastUnit;

  @JsonKey(name: 'unit_price')
  final double? unitPrice;

  @JsonKey(name: 'unit_price_decimal')
  final String? unitPriceDecimal;

  @JsonKey(name: 'fixed_fee')
  final double? fixedFee;

  double? get unitPriceInDollars => unitPrice! / 100;

  static Object? _readLastUnit(Map json, String key) {
    if (json[key] == 'inf') {
      return null;
    } else {
      return json[key];
    }
  }

  PriceTier({
    required this.lastUnit,
    required this.unitPrice,
    required this.unitPriceDecimal,
    required this.fixedFee,
  });

  factory PriceTier.fromJson(Map<String, dynamic> json) =>
      _$PriceTierFromJson(json);

  Map<String, dynamic> toJson() => _$PriceTierToJson(this);

  @override
  List<Object?> get props => [lastUnit, unitPrice, unitPriceDecimal, fixedFee];
}
