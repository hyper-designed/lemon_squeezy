import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import '../utils.dart';
import 'resource.dart';

part 'usage_record.g.dart';

@JsonSerializable()
class UsageRecordList extends ResourceList<UsageRecord> {
  UsageRecordList({
    required super.meta,
    super.links,
    required super.data,
    super.included,
  });

  factory UsageRecordList.fromJson(Map<String, dynamic> json) =>
      _$UsageRecordListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UsageRecordListToJson(this);
}

enum UsageAction { increment, set }

/// REF: https://docs.lemonsqueezy.com/api/usage-records#the-usage-record-object
@JsonSerializable()
class UsageRecord extends ResourceData {
  @JsonKey(name: 'subscription_item_id')
  final int subscriptionItemId;

  final int quantity;

  final UsageAction? action;

  @JsonKey(name: 'created_at')
  @DateTimeISO8601Converter()
  final DateTime createdAt;

  @JsonKey(name: 'updated_at')
  @DateTimeISO8601Converter()
  final DateTime updatedAt;

  UsageRecord({
    required super.id,
    required this.subscriptionItemId,
    required this.quantity,
    this.action,
    required this.createdAt,
    required this.updatedAt,
  }) : super(type: ResourceType.usageRecords);

  factory UsageRecord.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('attributes')) {
      json = {
        ...json,
        ...json['attributes'],
      };
    }
    return _$UsageRecordFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$UsageRecordToJson(this);

  @override
  List<Object?> get props => [
        ...super.props,
        subscriptionItemId,
        quantity,
        action,
        createdAt,
        updatedAt,
      ];
}

@JsonSerializable(createToJson: false)
class UsageRecordCreate with EquatableMixin {
  final int quantity;

  final String subscriptionItemId;

  final UsageAction action;

  UsageRecordCreate({
    required this.quantity,
    required this.subscriptionItemId,
    required this.action,
  });

  factory UsageRecordCreate.fromJson(Map<String, dynamic> json) =>
      _$UsageRecordCreateFromJson(json);

  Map<String, dynamic> toJson() {
    return {
      'data': {
        'type': 'usage-records',
        'attributes': {
          'quantity': quantity,
          'action': _$UsageActionEnumMap[action],
        },
        'relationships': {
          'subscription-item': {
            'data': {
              'type': 'subscription-items',
              'id': subscriptionItemId,
            },
          },
        },
      },
    };
  }

  @override
  List<Object?> get props => [quantity, subscriptionItemId];
}
