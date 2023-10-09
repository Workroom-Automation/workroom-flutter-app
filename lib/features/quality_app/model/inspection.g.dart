// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QualityInspectionAssignee _$QualityInspectionAssigneeFromJson(
        Map<String, dynamic> json) =>
    QualityInspectionAssignee(
      qualityInspectionId: json['qualityInspectionId'] as String?,
      assigneeId: json['assigneeId'] as String?,
    );

Map<String, dynamic> _$QualityInspectionAssigneeToJson(
        QualityInspectionAssignee instance) =>
    <String, dynamic>{
      'qualityInspectionId': instance.qualityInspectionId,
      'assigneeId': instance.assigneeId,
    };

SamplingDetails _$SamplingDetailsFromJson(Map<String, dynamic> json) =>
    SamplingDetails(
      number: json['number'] as int?,
    );

Map<String, dynamic> _$SamplingDetailsToJson(SamplingDetails instance) =>
    <String, dynamic>{
      'number': instance.number,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      deliveryStatus: json['deliveryStatus'] as String?,
      linkedSheets: (json['linkedSheets'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      samplingDetails: json['samplingDetails'] == null
          ? null
          : SamplingDetails.fromJson(
              json['samplingDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'deliveryStatus': instance.deliveryStatus,
      'linkedSheets': instance.linkedSheets,
      'samplingDetails': instance.samplingDetails,
    };

Inspection _$InspectionFromJson(Map<String, dynamic> json) => Inspection(
      id: json['id'] as String,
      supplierId: json['supplierId'] as String?,
      incomingPartId: json['incomingPartId'] as String?,
      quantity: json['quantity'] as int?,
      samplingType: json['samplingType'] as String?,
      qualityInspectionAssignees:
          (json['qualityInspectionAssignees'] as List<dynamic>?)
              ?.map((e) =>
                  QualityInspectionAssignee.fromJson(e as Map<String, dynamic>))
              .toList(),
      inspectionSamples: (json['inspectionSamples'] as List<dynamic>?)
          ?.map((e) => InspectionSample.fromJson(e as Map<String, dynamic>))
          .toList(),
      dueDateTime: json['dueDateTime'] == null
          ? null
          : DateTime.parse(json['dueDateTime'] as String),
      status: json['status'] as String?,
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InspectionToJson(Inspection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'supplierId': instance.supplierId,
      'incomingPartId': instance.incomingPartId,
      'quantity': instance.quantity,
      'samplingType': instance.samplingType,
      'qualityInspectionAssignees': instance.qualityInspectionAssignees,
      'inspectionSamples': instance.inspectionSamples,
      'dueDateTime': instance.dueDateTime?.toIso8601String(),
      'status': instance.status,
      'meta': instance.meta,
    };
