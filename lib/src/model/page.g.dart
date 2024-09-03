// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Page _$PageFromJson(Map<String, dynamic> json) => Page(
      current: (json['currentPage'] as num).toInt(),
      from: (json['from'] as num).toInt(),
      last: (json['lastPage'] as num).toInt(),
      perPage: (json['perPage'] as num).toInt(),
      to: (json['to'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'currentPage': instance.current,
      'from': instance.from,
      'lastPage': instance.last,
      'perPage': instance.perPage,
      'to': instance.to,
      'total': instance.total,
    };
