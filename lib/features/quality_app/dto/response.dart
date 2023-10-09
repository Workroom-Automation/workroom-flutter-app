import 'package:json_annotation/json_annotation.dart';
import 'package:workroom_flutter_app/features/quality_app/model/inspection.dart';
import 'package:workroom_flutter_app/features/quality_app/model/inspection_sample.dart';

part 'response.g.dart';

@JsonSerializable()
class Status {
  Status({
    this.code,
    this.message,
    this.type,
    this.totalCount,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
  int? code;
  String? message;
  String? type;
  int? totalCount;

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable()
class GetInspectionResponse {
  GetInspectionResponse({
    required this.status,
    required this.data,
  });

  factory GetInspectionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetInspectionResponseFromJson(json);
  Status status;
  Inspection data;

  Map<String, dynamic> toJson() => _$GetInspectionResponseToJson(this);
}

@JsonSerializable()
class GetInspectionListResponse {
  GetInspectionListResponse({
    required this.status,
    required this.data,
  });

  factory GetInspectionListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetInspectionListResponseFromJson(json);
  Status status;
  List<Inspection> data;

  Map<String, dynamic> toJson() => _$GetInspectionListResponseToJson(this);
}

@JsonSerializable()
class StartInspectionResponse {
  StartInspectionResponse({
    required this.status,
  });

  factory StartInspectionResponse.fromJson(Map<String, dynamic> json) =>
      _$StartInspectionResponseFromJson(json);
  Status status;

  Map<String, dynamic> toJson() => _$StartInspectionResponseToJson(this);
}

@JsonSerializable()
class CreateInspectionSampleResponse {
  CreateInspectionSampleResponse({
    required this.status,
    required this.data,
  });

  factory CreateInspectionSampleResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateInspectionSampleResponseFromJson(json);
  Status status;
  InspectionSample data;

  Map<String, dynamic> toJson() => _$CreateInspectionSampleResponseToJson(this);
}

@JsonSerializable()
class GetInspectionSampleResponse {
  GetInspectionSampleResponse({
    required this.status,
    required this.data,
  });

  factory GetInspectionSampleResponse.fromJson(Map<String, dynamic> json) =>
      _$GetInspectionSampleResponseFromJson(json);
  Status status;
  InspectionSample data;

  Map<String, dynamic> toJson() => _$GetInspectionSampleResponseToJson(this);
}

@JsonSerializable()
class UpdateInspectionSampleResponse {
  UpdateInspectionSampleResponse({
    required this.status,
  });

  factory UpdateInspectionSampleResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateInspectionSampleResponseFromJson(json);
  Status status;

  Map<String, dynamic> toJson() => _$UpdateInspectionSampleResponseToJson(this);
}

@JsonSerializable()
class DeleteInspectionSampleResponse {
  DeleteInspectionSampleResponse({
    required this.status,
  });

  factory DeleteInspectionSampleResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteInspectionSampleResponseFromJson(json);
  Status status;

  Map<String, dynamic> toJson() => _$DeleteInspectionSampleResponseToJson(this);
}
