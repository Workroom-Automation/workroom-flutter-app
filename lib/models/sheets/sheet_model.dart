// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes, lines_longer_than_80_chars, avoid_dynamic_calls, cascade_invocations

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:workroom_flutter_app/models/sheets/section_model.dart';

class SheetModel {
  SheetModel({
    required this.id,
    required this.name,
    required this.description,
    required this.externalCode,
    required this.applicationId,
    required this.assetId,
    required this.processId,
    required this.stationId,
    required this.sections,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedBy,
    required this.namespace,
  });
  factory SheetModel.fromJson(String source) =>
      SheetModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory SheetModel.fromMap(Map<String, dynamic> map) {
    return SheetModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      externalCode: map['externalCode'] as String,
      applicationId: map['applicationId']?.toInt() as int,
      assetId: map['assetId']?.toInt() as int,
      processId: map['processId']?.toInt() as int,
      stationId: map['stationId']?.toInt() as int,
      sections: List<SectionModel>.from(
        (map['sections'] as List<SectionModel>).map(
          (x) => SectionModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      status: map['status'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
      deletedAt: DateTime.parse(map['deletedAt'] as String),
      createdBy: map['createdBy'] as String,
      updatedBy: map['updatedBy'] as String,
      deletedBy: map['deletedBy'] as String,
      namespace: map['namespace'] as String,
    );
  }
  String id;
  String name;
  String description;
  String externalCode;
  int applicationId;
  int assetId;
  int processId;
  int stationId;
  List<SectionModel> sections;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String createdBy;
  String updatedBy;
  String deletedBy;
  String namespace;

  SheetModel copyWith({
    String? id,
    String? name,
    String? description,
    String? externalCode,
    int? applicationId,
    int? assetId,
    int? processId,
    int? stationId,
    List<SectionModel>? sections,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    String? createdBy,
    String? updatedBy,
    String? deletedBy,
    String? namespace,
  }) {
    return SheetModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      externalCode: externalCode ?? this.externalCode,
      applicationId: applicationId ?? this.applicationId,
      assetId: assetId ?? this.assetId,
      processId: processId ?? this.processId,
      stationId: stationId ?? this.stationId,
      sections: sections ?? this.sections,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      deletedBy: deletedBy ?? this.deletedBy,
      namespace: namespace ?? this.namespace,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'externalCode': externalCode});
    result.addAll({'applicationId': applicationId});
    result.addAll({'assetId': assetId});
    result.addAll({'processId': processId});
    result.addAll({'stationId': stationId});
    result.addAll({'sections': sections.map((x) => x.toMap()).toList()});
    result.addAll({'status': status});
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});
    result.addAll({'updatedAt': updatedAt.millisecondsSinceEpoch});
    result.addAll({'deletedAt': deletedAt.millisecondsSinceEpoch});
    result.addAll({'createdBy': createdBy});
    result.addAll({'updatedBy': updatedBy});
    result.addAll({'deletedBy': deletedBy});
    result.addAll({'namespace': namespace});

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'SheetModel(id: $id, name: $name, description: $description, externalCode: $externalCode, applicationId: $applicationId, assetId: $assetId, processId: $processId, stationId: $stationId, sections: $sections, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, createdBy: $createdBy, updatedBy: $updatedBy, deletedBy: $deletedBy, namespace: $namespace)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SheetModel &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.externalCode == externalCode &&
        other.applicationId == applicationId &&
        other.assetId == assetId &&
        other.processId == processId &&
        other.stationId == stationId &&
        listEquals(other.sections, sections) &&
        other.status == status &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt &&
        other.createdBy == createdBy &&
        other.updatedBy == updatedBy &&
        other.deletedBy == deletedBy &&
        other.namespace == namespace;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        externalCode.hashCode ^
        applicationId.hashCode ^
        assetId.hashCode ^
        processId.hashCode ^
        stationId.hashCode ^
        sections.hashCode ^
        status.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode ^
        createdBy.hashCode ^
        updatedBy.hashCode ^
        deletedBy.hashCode ^
        namespace.hashCode;
  }
}
