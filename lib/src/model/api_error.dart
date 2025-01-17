import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

@JsonSerializable()
class LemonSqueezyError extends Error with EquatableMixin {
  final String detail;
  final String title;
  final String status;
  final String? code;

  LemonSqueezyError({
    required this.detail,
    required this.title,
    required this.status,
    this.code,
  });

  factory LemonSqueezyError.fromJson(Map<String, dynamic> json) =>
      _$LemonSqueezyErrorFromJson(json);

  Map<String, dynamic> toJson() => _$LemonSqueezyErrorToJson(this);

  @override
  List<Object?> get props => [detail, title, status, code];
}

@JsonSerializable()
class LemonSqueezyApiError extends Error with EquatableMixin {
  final List<LemonSqueezyError> errors;

  LemonSqueezyApiError({required this.errors});

  factory LemonSqueezyApiError.fromJson(Map<String, dynamic> json) =>
      _$LemonSqueezyApiErrorFromJson(json);

  Map<String, dynamic> toJson() => _$LemonSqueezyApiErrorToJson(this);

  @override
  List<Object?> get props => [errors];
}
