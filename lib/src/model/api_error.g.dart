// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LemonSqueezyError _$LemonSqueezyErrorFromJson(Map<String, dynamic> json) =>
    LemonSqueezyError(
      detail: json['detail'] as String,
      title: json['title'] as String,
      status: json['status'] as String,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$LemonSqueezyErrorToJson(LemonSqueezyError instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'title': instance.title,
      'status': instance.status,
      if (instance.code case final value?) 'code': value,
    };

LemonSqueezyApiError _$LemonSqueezyApiErrorFromJson(
        Map<String, dynamic> json) =>
    LemonSqueezyApiError(
      errors: (json['errors'] as List<dynamic>)
          .map((e) => LemonSqueezyError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LemonSqueezyApiErrorToJson(
        LemonSqueezyApiError instance) =>
    <String, dynamic>{
      'errors': instance.errors.map((e) => e.toJson()).toList(),
    };
