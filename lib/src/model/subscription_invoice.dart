import 'package:json_annotation/json_annotation.dart';

import '../utils.dart';
import 'resource.dart';

part 'subscription_invoice.g.dart';

@JsonSerializable()
class SubscriptionInvoiceList extends ResourceList<SubscriptionInvoice> {
  SubscriptionInvoiceList({
    required super.meta,
    super.links,
    required super.data,
    super.included,
  });

  factory SubscriptionInvoiceList.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionInvoiceListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SubscriptionInvoiceListToJson(this);
}

enum SubscriptionInvoiceStatus {
  pending,
  paid,
  @JsonValue('void')
  voided,
  refunded,
  @JsonValue('partially_refunded')
  partiallyRefunded,
}

@JsonSerializable()
class SubscriptionInvoice extends ResourceData {
  @JsonKey(name: 'store_id')
  final int storeId;

  @JsonKey(name: 'subscription_id')
  final int subscriptionId;

  @JsonKey(name: 'customer_id')
  final int customerId;

  @JsonKey(name: 'user_name')
  final String userName;

  @JsonKey(name: 'user_email')
  final String userEmail;

  @JsonKey(name: 'billing_reason')
  final String billingReason;

  @JsonKey(name: 'card_brand')
  final String cardBrand;

  @JsonKey(name: 'card_last_four')
  final String cardLast4Digits;

  final String currency;

  @JsonKey(name: 'currency_rate')
  final String currencyRate;

  final SubscriptionInvoiceStatus status;

  @JsonKey(name: 'status_formatted')
  final String statusFormatted;

  final bool refunded;

  @JsonKey(name: 'refunded_at')
  @DateTimeISO8601NullableConverter()
  final DateTime? refundedAt;

  final double subtotal;

  @JsonKey(name: 'discount_total')
  final double discountTotal;

  final double tax;

  @JsonKey(name: 'tax_inclusive')
  final bool taxInclusive;

  final double total;

  @JsonKey(name: 'refunded_amount')
  final double refundedAmount;

  @JsonKey(name: 'subtotal_usd')
  final double subtotalUsd;

  @JsonKey(name: 'discount_total_usd')
  final double discountTotalUsd;

  @JsonKey(name: 'tax_usd')
  final double taxUsd;

  @JsonKey(name: 'total_usd')
  final double totalUsd;

  @JsonKey(name: 'refunded_amount_usd')
  final double refundedAmountUsd;

  @JsonKey(name: 'subtotal_formatted')
  final String subtotalFormatted;

  @JsonKey(name: 'discount_total_formatted')
  final String discountTotalFormatted;

  @JsonKey(name: 'tax_formatted')
  final String taxFormatted;

  @JsonKey(name: 'refunded_amount_formatted')
  final String refundedAmountFormatted;

  final Map<String, dynamic> urls;

  @JsonKey(name: 'created_at')
  @DateTimeISO8601Converter()
  final String createdAt;

  @JsonKey(name: 'updated_at')
  @DateTimeISO8601Converter()
  final String updatedAt;

  @JsonKey(name: 'test_mode')
  final bool testMode;

  SubscriptionInvoice({
    required super.id,
    required this.storeId,
    required this.subscriptionId,
    required this.customerId,
    required this.userName,
    required this.userEmail,
    required this.billingReason,
    required this.cardBrand,
    required this.cardLast4Digits,
    required this.currency,
    required this.currencyRate,
    required this.status,
    required this.statusFormatted,
    required this.refunded,
    required this.refundedAt,
    required this.subtotal,
    required this.discountTotal,
    required this.tax,
    required this.taxInclusive,
    required this.total,
    required this.refundedAmount,
    required this.subtotalUsd,
    required this.discountTotalUsd,
    required this.taxUsd,
    required this.totalUsd,
    required this.refundedAmountUsd,
    required this.subtotalFormatted,
    required this.discountTotalFormatted,
    required this.taxFormatted,
    required this.refundedAmountFormatted,
    required this.urls,
    required this.createdAt,
    required this.updatedAt,
    required this.testMode,
  }) : super(type: ResourceType.subscriptionInvoices);

  factory SubscriptionInvoice.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('attributes')) {
      json = {
        ...json,
        ...json['attributes'],
      };
    }
    return _$SubscriptionInvoiceFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$SubscriptionInvoiceToJson(this);

  @override
  List<Object?> get props => [
        ...super.props,
        storeId,
        subscriptionId,
        customerId,
        userName,
        userEmail,
        billingReason,
        cardBrand,
        cardLast4Digits,
        currency,
        currencyRate,
        status,
        statusFormatted,
        refunded,
        refundedAt,
        subtotal,
        discountTotal,
        tax,
        taxInclusive,
        total,
        refundedAmount,
        subtotalUsd,
        discountTotalUsd,
        taxUsd,
        totalUsd,
        refundedAmountUsd,
        subtotalFormatted,
        discountTotalFormatted,
        taxFormatted,
        refundedAmountFormatted,
        urls,
        createdAt,
        updatedAt,
        testMode,
      ];
}
