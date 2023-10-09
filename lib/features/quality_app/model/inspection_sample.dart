import 'package:json_annotation/json_annotation.dart';

part 'inspection_sample.g.dart';

@JsonSerializable()
class InspectionSample {

  InspectionSample({
    required this.qualityInspectionId,
    this.title,
    required this.id,
    this.status,
  });

  factory InspectionSample.fromJson(Map<String, dynamic> json)=> _$InspectionSampleFromJson(json);
  String id;
  String? title;
  String qualityInspectionId;
  String? status;
  Map<String, dynamic> toJson() => _$InspectionSampleToJson(this);

}
