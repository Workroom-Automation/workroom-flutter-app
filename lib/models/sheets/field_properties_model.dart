// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes, lines_longer_than_80_chars, non_constant_identifier_names

import 'dart:convert';

import 'package:workroom_flutter_app/models/sheets/field_data_model.dart';

class FieldProperties {
  FieldProperties({
    required this.type,
    required this.title,
    required this.description,
    required this.is_required,
    required this.require_observation,
    required this.require_attachment,
    required this.data,
  });

  factory FieldProperties.fromJson(String source) => FieldProperties.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  factory FieldProperties.fromMap(Map<String, dynamic> map) {
    return FieldProperties(
      type: map['type'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      is_required: map['is_required'] as bool,
      require_observation: map['require_observation'] as bool,
      require_attachment: map['require_attachment'] as bool,
      data: FieldData.fromMap(map['data'] as Map<String, dynamic>),
    );
  }
  String type;
  String title;
  String description;
  bool is_required;
  bool require_observation;
  bool require_attachment;
  FieldData data;

  FieldProperties copyWith({
    String? type,
    String? title,
    String? description,
    bool? is_required,
    bool? require_observation,
    bool? require_attachment,
    FieldData? data,
  }) {
    return FieldProperties(
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      is_required: is_required ?? this.is_required,
      require_observation: require_observation ?? this.require_observation,
      require_attachment: require_attachment ?? this.require_attachment,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'type': type});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'is_required': is_required});
    result.addAll({'require_observation': require_observation});
    result.addAll({'require_attachment': require_attachment});
    result.addAll({'data': data.toMap()});

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'FieldProperties(type: $type, title: $title, description: $description, is_required: $is_required, require_observation: $require_observation, require_attachment: $require_attachment, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FieldProperties &&
        other.type == type &&
        other.title == title &&
        other.description == description &&
        other.is_required == is_required &&
        other.require_observation == require_observation &&
        other.require_attachment == require_attachment &&
        other.data == data;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        title.hashCode ^
        description.hashCode ^
        is_required.hashCode ^
        require_observation.hashCode ^
        require_attachment.hashCode ^
        data.hashCode;
  }
}
