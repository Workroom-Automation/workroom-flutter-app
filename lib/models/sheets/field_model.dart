// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes, lines_longer_than_80_chars, cascade_invocations

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:workroom_flutter_app/models/sheets/field_properties_model.dart';

class FieldModel {
  FieldModel({
    required this.id,
    required this.properties,
    required this.triggers,
    required this.isActive,
    required this.isDeleted,
  });

  factory FieldModel.fromJson(String source) =>
      FieldModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory FieldModel.fromMap(Map<String, dynamic> map) {
    return FieldModel(
      id: map['id'] as String,
      properties:
          FieldProperties.fromMap(map['properties'] as Map<String, dynamic>),
      triggers: List<dynamic>.from(map['triggers'] as List<dynamic>),
      isActive: map['isActive'] as bool,
      isDeleted: map['isDeleted'] as bool,
    );
  }
  String id;
  FieldProperties properties;
  List<dynamic> triggers;
  bool isActive;
  bool isDeleted;

  FieldModel copyWith({
    String? id,
    FieldProperties? properties,
    List<dynamic>? triggers,
    bool? isActive,
    bool? isDeleted,
  }) {
    return FieldModel(
      id: id ?? this.id,
      properties: properties ?? this.properties,
      triggers: triggers ?? this.triggers,
      isActive: isActive ?? this.isActive,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'properties': properties.toMap()});
    result.addAll({'triggers': triggers});
    result.addAll({'isActive': isActive});
    result.addAll({'isDeleted': isDeleted});

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'FieldModel(id: $id, properties: $properties, triggers: $triggers, isActive: $isActive, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FieldModel &&
        other.id == id &&
        other.properties == properties &&
        listEquals(other.triggers, triggers) &&
        other.isActive == isActive &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        properties.hashCode ^
        triggers.hashCode ^
        isActive.hashCode ^
        isDeleted.hashCode;
  }
}
