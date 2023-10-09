import 'package:json_annotation/json_annotation.dart';
import 'package:workroom_flutter_app/features/quality_app/model/inspection_sample.dart';

part 'inspection.g.dart';

@JsonSerializable()
class QualityInspectionAssignee {
  QualityInspectionAssignee({
    this.qualityInspectionId,
    this.assigneeId,
  });

  factory QualityInspectionAssignee.fromJson(Map<String, dynamic> json) =>
      _$QualityInspectionAssigneeFromJson(json);
  String? qualityInspectionId;
  String? assigneeId;

  Map<String, dynamic> toJson() => _$QualityInspectionAssigneeToJson(this);
}

@JsonSerializable()
class SamplingDetails {
  SamplingDetails({
    this.number,
  });

  factory SamplingDetails.fromJson(Map<String, dynamic> json) =>
      _$SamplingDetailsFromJson(json);
  int? number;

  Map<String, dynamic> toJson() => _$SamplingDetailsToJson(this);
}

@JsonSerializable()
class Meta {
  Meta({
    this.deliveryStatus,
    this.linkedSheets,
    this.samplingDetails,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  String? deliveryStatus;
  List<String>? linkedSheets;
  SamplingDetails? samplingDetails;

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class Inspection {
  Inspection({
    required this.id,
    this.supplierId,
    this.incomingPartId,
    this.quantity,
    this.samplingType,
    this.qualityInspectionAssignees,
    this.inspectionSamples,
    this.dueDateTime,
    this.status,
    this.meta,
  });

  factory Inspection.fromJson(Map<String, dynamic> json) =>
      _$InspectionFromJson(json);
  String id;
  String? supplierId;
  String? incomingPartId;
  int? quantity;
  String? samplingType;
  List<QualityInspectionAssignee>? qualityInspectionAssignees;
  List<InspectionSample>? inspectionSamples;
  DateTime? dueDateTime;
  String? status;
  Meta? meta;

  Map<String, dynamic> toJson() => _$InspectionToJson(this);
}
