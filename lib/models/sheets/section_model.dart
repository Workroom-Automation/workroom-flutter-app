// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes, lines_longer_than_80_chars, cascade_invocations

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:workroom_flutter_app/models/sheets/field_model.dart';

class SectionModel {
  SectionModel({
    required this.id,
    required this.name,
    required this.description,
    required this.fields,
    required this.isActive,
    required this.isDeleted,
  });

  factory SectionModel.fromJson(String source) => SectionModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  factory SectionModel.fromMap(Map<String, dynamic> map) {
    return SectionModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      fields: List<FieldModel>.from(
        (map['fields'] as List<FieldModel>).map(
          (x) => FieldModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      isActive: map['isActive'] as bool,
      isDeleted: map['isDeleted'] as bool,
    );
  }
  String id;
  String name;
  String description;
  List<FieldModel> fields;
  bool isActive;
  bool isDeleted;

  SectionModel copyWith({
    String? id,
    String? name,
    String? description,
    List<FieldModel>? fields,
    bool? isActive,
    bool? isDeleted,
  }) {
    return SectionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      fields: fields ?? this.fields,
      isActive: isActive ?? this.isActive,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'fields': fields.map((x) => x.toMap()).toList()});
    result.addAll({'isActive': isActive});
    result.addAll({'isDeleted': isDeleted});

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'SectionModel(id: $id, name: $name, description: $description, fields: $fields, isActive: $isActive, isDeleted: $isDeleted,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SectionModel &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        listEquals(other.fields, fields) &&
        other.isActive == isActive &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        fields.hashCode ^
        isActive.hashCode ^
        isDeleted.hashCode;
  }
}
