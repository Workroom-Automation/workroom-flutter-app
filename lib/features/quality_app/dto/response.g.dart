// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      code: json['code'] as int?,
      message: json['message'] as String?,
      type: json['type'] as String?,
      totalCount: json['totalCount'] as int?,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'type': instance.type,
      'totalCount': instance.totalCount,
    };

GetInspectionResponse _$GetInspectionResponseFromJson(
        Map<String, dynamic> json) =>
    GetInspectionResponse(
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      data: Inspection.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetInspectionResponseToJson(
        GetInspectionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

GetInspectionListResponse _$GetInspectionListResponseFromJson(
        Map<String, dynamic> json) =>
    GetInspectionListResponse(
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Inspection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetInspectionListResponseToJson(
        GetInspectionListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

StartInspectionResponse _$StartInspectionResponseFromJson(
        Map<String, dynamic> json) =>
    StartInspectionResponse(
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StartInspectionResponseToJson(
        StartInspectionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

CreateInspectionSampleResponse _$CreateInspectionSampleResponseFromJson(
        Map<String, dynamic> json) =>
    CreateInspectionSampleResponse(
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      data: InspectionSample.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateInspectionSampleResponseToJson(
        CreateInspectionSampleResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

GetInspectionSampleResponse _$GetInspectionSampleResponseFromJson(
        Map<String, dynamic> json) =>
    GetInspectionSampleResponse(
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      data: InspectionSample.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetInspectionSampleResponseToJson(
        GetInspectionSampleResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

UpdateInspectionSampleResponse _$UpdateInspectionSampleResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateInspectionSampleResponse(
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateInspectionSampleResponseToJson(
        UpdateInspectionSampleResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

DeleteInspectionSampleResponse _$DeleteInspectionSampleResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteInspectionSampleResponse(
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeleteInspectionSampleResponseToJson(
        DeleteInspectionSampleResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
