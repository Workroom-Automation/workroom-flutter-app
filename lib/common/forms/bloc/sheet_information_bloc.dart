// ignore_for_file: cascade_invocations, avoid_equals_and_hash_code_on_mutable_classes, lines_longer_than_80_chars

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class SheetInformationModel {
  SheetInformationModel({
    required this.optionsForMultiSelect,
    required this.optionsForCheckBoxes,
    required this.optionsForSingleSelect,
    required this.selectedOptionsForMultiSelect,
    required this.selectedOptionsForCheckBoxes,
    required this.selectedOptionForSingleSelect,
    required this.textFields,
    required this.dateFields,
    required this.numberFields,
    required this.evidenceImages,
  });

  Map<String, List<String>> optionsForMultiSelect;
  Map<String, List<String>> optionsForCheckBoxes;
  Map<String, List<String>> optionsForSingleSelect;
  Map<String, BehaviorSubject<List<String>>> selectedOptionsForMultiSelect;
  Map<String, BehaviorSubject<List<String>>> selectedOptionsForCheckBoxes;
  Map<String, BehaviorSubject<String>> selectedOptionForSingleSelect;
  Map<String, BehaviorSubject<String>> textFields;
  Map<String, BehaviorSubject<DateTime>> dateFields;
  Map<String, BehaviorSubject<double>> numberFields;
  Map<String, BehaviorSubject<List<Uint8List>>> evidenceImages;

  SheetInformationModel copyWith({
    Map<String, List<String>>? optionsForMultiSelect,
    Map<String, List<String>>? optionsForCheckBoxes,
    Map<String, List<String>>? optionsForSingleSelect,
    Map<String, BehaviorSubject<List<String>>>? selectedOptionsForMultiSelect,
    Map<String, BehaviorSubject<List<String>>>? selectedOptionsForCheckBoxes,
    Map<String, BehaviorSubject<String>>? selectedOptionForSingleSelect,
    Map<String, BehaviorSubject<String>>? textFields,
    Map<String, BehaviorSubject<DateTime>>? dateFields,
    Map<String, BehaviorSubject<double>>? numberFields,
    Map<String, BehaviorSubject<List<Uint8List>>>? evidenceImages,
  }) {
    return SheetInformationModel(
      optionsForMultiSelect:
          optionsForMultiSelect ?? this.optionsForMultiSelect,
      optionsForCheckBoxes: optionsForCheckBoxes ?? this.optionsForCheckBoxes,
      optionsForSingleSelect:
          optionsForSingleSelect ?? this.optionsForSingleSelect,
      selectedOptionsForMultiSelect:
          selectedOptionsForMultiSelect ?? this.selectedOptionsForMultiSelect,
      selectedOptionsForCheckBoxes:
          selectedOptionsForCheckBoxes ?? this.selectedOptionsForCheckBoxes,
      selectedOptionForSingleSelect:
          selectedOptionForSingleSelect ?? this.selectedOptionForSingleSelect,
      textFields: textFields ?? this.textFields,
      dateFields: dateFields ?? this.dateFields,
      numberFields: numberFields ?? this.numberFields,
      evidenceImages: evidenceImages ?? this.evidenceImages,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'optionsForMultiSelect': optionsForMultiSelect});
    result.addAll({'optionsForCheckBoxes': optionsForCheckBoxes});
    result.addAll({'optionsForSingleSelect': optionsForSingleSelect});
    result.addAll(
      {'selectedOptionsForMultiSelect': selectedOptionsForMultiSelect},
    );
    result
        .addAll({'selectedOptionsForCheckBoxes': selectedOptionsForCheckBoxes});
    result.addAll(
      {'selectedOptionForSingleSelect': selectedOptionForSingleSelect},
    );
    result.addAll({'textFields': textFields});
    result.addAll({'dateFields': dateFields});
    result.addAll({'numberFields': numberFields});
    result.addAll({'evidenceImages': evidenceImages});

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'SheetInformationModel(optionsForMultiSelect: $optionsForMultiSelect, optionsForCheckBoxes: $optionsForCheckBoxes, optionsForSingleSelect: $optionsForSingleSelect, selectedOptionsForMultiSelect: $selectedOptionsForMultiSelect, selectedOptionsForCheckBoxes: $selectedOptionsForCheckBoxes, selectedOptionForSingleSelect: $selectedOptionForSingleSelect, textFields: $textFields, dateFields: $dateFields, numberFields: $numberFields, evidenceImages: $evidenceImages,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SheetInformationModel &&
        mapEquals(other.optionsForMultiSelect, optionsForMultiSelect) &&
        mapEquals(other.optionsForCheckBoxes, optionsForCheckBoxes) &&
        mapEquals(other.optionsForSingleSelect, optionsForSingleSelect) &&
        mapEquals(
          other.selectedOptionsForMultiSelect,
          selectedOptionsForMultiSelect,
        ) &&
        mapEquals(
          other.selectedOptionsForCheckBoxes,
          selectedOptionsForCheckBoxes,
        ) &&
        mapEquals(
          other.selectedOptionForSingleSelect,
          selectedOptionForSingleSelect,
        ) &&
        mapEquals(other.textFields, textFields) &&
        mapEquals(other.dateFields, dateFields) &&
        mapEquals(other.numberFields, numberFields) &&
        mapEquals(other.evidenceImages, evidenceImages);
  }

  @override
  int get hashCode {
    return optionsForMultiSelect.hashCode ^
        optionsForCheckBoxes.hashCode ^
        optionsForSingleSelect.hashCode ^
        selectedOptionsForMultiSelect.hashCode ^
        selectedOptionsForCheckBoxes.hashCode ^
        selectedOptionForSingleSelect.hashCode ^
        textFields.hashCode ^
        dateFields.hashCode ^
        numberFields.hashCode ^
        evidenceImages.hashCode;
  }
}
