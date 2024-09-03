import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page.g.dart';

@JsonSerializable()
class Page with EquatableMixin {
  @JsonKey(name: 'currentPage')
  final int current;

  final int from;

  @JsonKey(name: 'lastPage')
  final int last;

  @JsonKey(name: 'perPage')
  final int perPage;

  final int to;

  final int total;

  Page({
    required this.current,
    required this.from,
    required this.last,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Page.fromJson(Map<String, dynamic> json) {
    if (json case {'meta': {'page': Map page}}) {
      json = {...json, ...page};
    } else if (json case {'page': Map page}) {
      json = {...json, ...page};
    }
    return _$PageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PageToJson(this);

  @override
  List<Object?> get props => [current, from, last, perPage, to, total];
}
