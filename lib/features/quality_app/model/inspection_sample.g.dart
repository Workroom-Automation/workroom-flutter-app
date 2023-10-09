// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InspectionSample _$InspectionSampleFromJson(Map<String, dynamic> json) =>
    InspectionSample(
      qualityInspectionId: json['qualityInspectionId'] as String,
      title: json['title'] as String?,
      id: json['id'] as String,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$InspectionSampleToJson(InspectionSample instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'qualityInspectionId': instance.qualityInspectionId,
      'status': instance.status,
    };
