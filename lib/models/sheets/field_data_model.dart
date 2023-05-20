// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes, lines_longer_than_80_chars,
import 'dart:convert';

import 'package:flutter/foundation.dart';

class FieldData {
  FieldData({
    required this.options,
  });

  factory FieldData.fromJson(String source) => FieldData.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  factory FieldData.fromMap(Map<String, dynamic> map) {
    return FieldData(
      options: List<String>.from(map['options'] as Iterable<dynamic>),
    );
  }
  List<String> options;

  FieldData copyWith({
    List<String>? options,
  }) {
    return FieldData(
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'options': options});

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'FieldData(options: $options)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FieldData && listEquals(other.options, options);
  }

  @override
  int get hashCode => options.hashCode;
}
