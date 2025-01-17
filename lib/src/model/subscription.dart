import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../lemon_squeezy.dart';
import '../utils.dart';
import 'interval.dart';

part 'subscription.g.dart';

@JsonSerializable()
class SubscriptionList extends ResourceList<Subscription> {
  SubscriptionList({
    required super.meta,
    super.links,
    required super.data,
    super.included,
  });

  factory SubscriptionList.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SubscriptionListToJson(this);
}

enum SubscriptionStatus {
  @JsonValue('on_trial')
  onTrial,
  active,
  paused,
  @JsonValue('past_due')
  pastDue,
  unpaid,
  cancelled,
  expired;
}

@JsonSerializable()
class Subscription extends ResourceData {
  @JsonKey(name: 'store_id')
  final int storeId;

  @JsonKey(name: 'customer_id')
  final int customerId;

  @JsonKey(name: 'order_id')
  final int orderId;

  @JsonKey(name: 'product_id')
  final int productId;

  @JsonKey(name: 'variant_id')
  final int variantId;

  @JsonKey(name: 'product_name')
  final String productName;

  @JsonKey(name: 'variant_name')
  final String variantName;

  @JsonKey(name: 'user_name')
  final String userName;

  @JsonKey(name: 'user_email')
  final String userEmail;

  final SubscriptionStatus status;

  @JsonKey(name: 'status_formatted')
  final String statusFormatted;

  @JsonKey(name: 'card_brand')
  final String cardBrand;

  @JsonKey(name: 'card_last_four')
  final String cardLast4Digits;

  final dynamic pause;

  final bool cancelled;

  @JsonKey(name: 'trial_ends_at')
  @DateTimeISO8601NullableConverter()
  final DateTime? trialEndsAt;

  @JsonKey(name: 'billing_anchor')
  final int billingAnchor;

  @JsonKey(name: 'renews_at')
  @DateTimeISO8601Converter()
  final DateTime renewsAt;

  @JsonKey(name: 'ends_at')
  @DateTimeISO8601NullableConverter()
  final DateTime? endsAt;

  @JsonKey(name: 'updated_at')
  @DateTimeISO8601Converter()
  final DateTime updatedAt;

  @JsonKey(name: 'test_mode')
  final bool testMode;

  final SubscriptionUrls? urls;

  @JsonKey(name: 'first_subscription_item')
  final SubscriptionItem firstSubscriptionItem;

  Subscription({
    required super.id,
    required this.storeId,
    required this.customerId,
    required this.orderId,
    required this.productId,
    required this.variantId,
    required this.productName,
    required this.variantName,
    required this.userName,
    required this.userEmail,
    required this.status,
    required this.statusFormatted,
    required this.cardBrand,
    required this.cardLast4Digits,
    required this.pause,
    required this.cancelled,
    this.trialEndsAt,
    required this.billingAnchor,
    required this.renewsAt,
    this.endsAt,
    required this.updatedAt,
    required this.testMode,
    this.urls,
    required this.firstSubscriptionItem,
  }) : super(type: ResourceType.subscriptions);

  factory Subscription.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('attributes')) {
      json = {
        ...json,
        ...json['attributes'],
      };
    }
    return _$SubscriptionFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);

  @override
  List<Object?> get props => [
        ...super.props,
        storeId,
        customerId,
        orderId,
        productId,
        variantId,
        productName,
        variantName,
        userName,
        userEmail,
        status,
        statusFormatted,
        cardBrand,
        cardLast4Digits,
        pause,
        cancelled,
        trialEndsAt,
        billingAnchor,
        renewsAt,
        endsAt,
        updatedAt,
        testMode,
        urls,
        firstSubscriptionItem,
      ];
}

@JsonSerializable()
class SubscriptionUrls with EquatableMixin {
  final String? updatePaymentMethod;

  final String? customerPortal;

  final String? customerPortalUpdateSubscription;

  SubscriptionUrls({
    required this.updatePaymentMethod,
    required this.customerPortal,
    required this.customerPortalUpdateSubscription,
  });

  factory SubscriptionUrls.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionUrlsFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionUrlsToJson(this);

  @override
  List<Object?> get props => [
        updatePaymentMethod,
        customerPortal,
        customerPortalUpdateSubscription,
      ];
}

@JsonSerializable()
class SubscriptionItemList extends ResourceList<SubscriptionItem> {
  SubscriptionItemList({
    required super.meta,
    required super.links,
    required super.data,
    required super.included,
  });

  factory SubscriptionItemList.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionItemListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SubscriptionItemListToJson(this);
}

@JsonSerializable()
class SubscriptionItem extends ResourceData {
  @JsonKey(name: 'subscription_id')
  final int subscriptionId;

  @JsonKey(name: 'price_id')
  final int priceId;

  final int quantity;

  @JsonKey(name: 'created_at')
  @DateTimeISO8601Converter()
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  @DateTimeISO8601Converter()
  final DateTime updatedAt;

  SubscriptionItem({
    required super.id,
    required this.subscriptionId,
    required this.priceId,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
  }) : super(type: ResourceType.subscriptionItems);

  factory SubscriptionItem.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('attributes')) {
      json = {
        ...json,
        ...json['attributes'],
      };
    }
    return _$SubscriptionItemFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$SubscriptionItemToJson(this);

  @override
  List<Object?> get props => [
        ...super.props,
        subscriptionId,
        priceId,
        quantity,
        createdAt,
        updatedAt,
      ];
}

/// REF: https://docs.lemonsqueezy.com/api/subscription-items#update-a-subscription-item
@JsonSerializable(
    createToJson: false, createFieldMap: true, createPerFieldToJson: true)
class SubscriptionItemUpdate with EquatableMixin {
  final String id;

  final int quantity;

  @JsonKey(name: 'invoice_immediately')
  final bool invoiceImmediately;

  @JsonKey(name: 'disable_proration')
  final bool disableProration;

  SubscriptionItemUpdate({
    required this.id,
    required this.quantity,
    this.invoiceImmediately = false,
    this.disableProration = false,
  });

  factory SubscriptionItemUpdate.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionItemUpdateFromJson(json);

  Map<String, dynamic> toJson() {
    return {
      'data': {
        "type": "subscription-items",
        "id": _$SubscriptionItemUpdatePerFieldToJson.id(id),
        "attributes": {
          "quantity": _$SubscriptionItemUpdatePerFieldToJson.quantity(quantity),
          _$SubscriptionItemUpdateFieldMap["invoiceImmediately"]:
              _$SubscriptionItemUpdatePerFieldToJson
                  .invoiceImmediately(invoiceImmediately),
          _$SubscriptionItemUpdateFieldMap["disableProration"]:
              _$SubscriptionItemUpdatePerFieldToJson
                  .disableProration(disableProration),
        }
      },
    };
  }

  @override
  List<Object?> get props =>
      [id, quantity, invoiceImmediately, disableProration];
}

@JsonSerializable()
class SubscriptionItemUsage with EquatableMixin {
  @JsonKey(name: 'period_start')
  @DateTimeISO8601Converter()
  final DateTime periodStart;

  @JsonKey(name: 'period_end')
  @DateTimeISO8601Converter()
  final DateTime periodEnd;

  final int quantity;

  @JsonKey(name: 'interval_unit')
  final Interval intervalUnit;

  @JsonKey(name: 'interval_quantity')
  final int intervalQuantity;

  SubscriptionItemUsage({
    required this.periodStart,
    required this.periodEnd,
    required this.quantity,
    required this.intervalUnit,
    required this.intervalQuantity,
  });

  factory SubscriptionItemUsage.fromJson(Map<String, dynamic> json) {
    if (json case {'meta': Map meta}) {
      json = {...json, ...meta};
    }
    return _$SubscriptionItemUsageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubscriptionItemUsageToJson(this);

  @override
  List<Object?> get props => [
        periodStart,
        periodEnd,
        quantity,
        intervalUnit,
        intervalQuantity,
      ];
}

/// REF: https://docs.lemonsqueezy.com/api/subscriptions#update-a-subscription
@JsonSerializable()
class SubscriptionUpdate with EquatableMixin {
  final String subscriptionId;

  final String? variantId;

  /// Represents the day of the month when the payments are collected.
  ///
  ///     - Use an integer representing a day of the month (21 equals 21st
  ///       day of the month) to change the day on which subscription
  ///       invoice payments are collected.
  ///
  ///     - Use null or 0 to reset the billing anchor to the current date.
  ///       Doing this will also remove an active trial.
  ///
  /// Setting this value to a valid integer (1-31) will set
  /// the billing anchor to the next occurrence of that day. For example,
  /// if on the 21st of January you set the subscription billing anchor
  /// to the 1st, the next occurrence of that day is February 1st.
  /// All invoices from that point on will be generated on the
  /// 1st of the month.
  ///
  /// If the current month doesn’t contain the day that matches your
  /// [billingAnchor] (for example, if the billing_anchor is 31 and the
  /// month is November), the customer will be charged on the last day
  /// of the month.
  ///
  /// When setting a new billing anchor day, we calculate the next
  /// occurrence and issue a paid, prorated trial which ends on the
  /// next occurrence date. When the trial ends, the customer is charged
  /// for the full prorated amount.
  @JsonKey(name: 'billing_anchor')
  final int? billingAnchor;

  /// An ISO 8601 formatted date-time string indicating when the
  /// subscription's free trial should end.
  @JsonKey(name: 'trial_ends_at')
  @DateTimeISO8601NullableConverter()
  final DateTime? trialEndsAt;

  /// If true, any updates to the subscription will be charged immediately.
  /// A new prorated invoice will be generated and payment attempted.
  /// Defaults to false. Note that this will be overridden by the
  /// [disableProration] option if used.
  ///
  /// Learn more about proration:
  /// https://docs.lemonsqueezy.com/guides/developer-guide/managing-subscriptions#handling-proration
  @JsonKey(name: 'invoice_immediately')
  final bool? invoiceImmediately;

  /// If true, no proration will be charged and the customer will simply be
  /// charged the new price at the next renewal. Defaults to false.
  /// Note that this will override the [invoiceImmediately] option if used.
  ///
  /// Learn more about proration:
  /// https://docs.lemonsqueezy.com/guides/developer-guide/managing-subscriptions#handling-proration
  @JsonKey(name: 'disable_proration')
  final bool? disableProration;

  /// Set as true to cancel the subscription. You can resume a subscription
  /// (before the ends_at date) by setting this to false.
  final bool? cancelled;

  SubscriptionUpdate({
    required this.subscriptionId,
    this.variantId,
    this.billingAnchor,
    this.trialEndsAt,
    this.invoiceImmediately,
    this.disableProration,
    this.cancelled,
  });

  factory SubscriptionUpdate.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionUpdateFromJson(json);

  Map<String, dynamic> toJson() => {
        'data': _$SubscriptionUpdateToJson(this),
      };

  @override
  List<Object?> get props => [
        subscriptionId,
        variantId,
        billingAnchor,
        trialEndsAt,
        invoiceImmediately,
        disableProration,
        cancelled,
      ];
}
