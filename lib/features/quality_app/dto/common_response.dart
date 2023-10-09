import 'package:json_annotation/json_annotation.dart';

part 'common_response.g.dart';

@JsonSerializable()
class Status {

  Status({
    this.code,
    this.message,
    this.type,
    this.totalCount,
  });
  factory Status.fromJson(Map<String, dynamic> json)=> _$StatusFromJson(json);
  int? code;
  String? message;
  String? type;
  int? totalCount;

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
