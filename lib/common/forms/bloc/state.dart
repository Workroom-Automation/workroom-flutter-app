// ignore_for_file: cast_nullable_to_non_nullable

import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'package:workroom_flutter_app/common/forms/bloc/sheet_information_bloc.dart';
import 'package:workroom_flutter_app/common/services/logger_service/logger_service.dart';
import 'package:workroom_flutter_app/models/sheets/field_data_model.dart';
import 'package:workroom_flutter_app/models/sheets/field_model.dart';
import 'package:workroom_flutter_app/models/sheets/field_properties_model.dart';
import 'package:workroom_flutter_app/models/sheets/section_model.dart';
import 'package:workroom_flutter_app/models/sheets/sheet_model.dart';

@lazySingleton
class RxStateClass {
  late SheetModel _sheetModel;
  final _sheetinformationModel = SheetInformationModel(
    optionsForMultiSelect: {},
    optionsForCheckBoxes: {},
    optionsForSingleSelect: {},
    selectedOptionsForMultiSelect: {},
    selectedOptionsForCheckBoxes: {},
    selectedOptionForSingleSelect: {},
    textFields: {},
    dateFields: {},
    numberFields: {},
    evidenceImages: {},
  );

  SheetModel get getSheetModel => _sheetModel;
  SheetInformationModel get getInformationModel => _sheetinformationModel;

  void updateStream() {
    // fetch data from api and store in sheetModel
    _sheetModel = SheetModel(
      id: '6461ee4606a1fe5ec7dfas7b5d69',
      name: 'Rejects Review Sheet',
      description:
          'Rejects Review SheeRejects Review SheeRejects Review SheeRejects Review SheeRejects Review SheeRejects Review SheeRejects Review Shee',
      externalCode: 'Kuch bh',
      applicationId: 1,
      assetId: 1,
      processId: 2,
      stationId: 0,
      sections: [
        SectionModel(
          id: '6461ee5006a1fe5gfgec77b5d6b',
          name: 'name',
          description: 'description',
          fields: [
            FieldModel(
              id: '6461ee5306afda1fe5ec77b5d6c',
              properties: FieldProperties(
                type: 'MULTI_SELECTION',
                title: 'Multi select Field1',
                description: 'description1',
                is_required: true,
                require_observation: false,
                require_attachment: false,
                data: FieldData(
                  options: [
                    'Field 1',
                    'Field 2',
                    'Field 5678rgf',
                    'Field 567fgd8',
                    'Field 567fgs8d',
                    'Field 5678db',
                    'Field 56hgh78',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                  ],
                ),
              ),
              triggers: [],
              isActive: true,
              isDeleted: false,
            ),
            FieldModel(
              id: '6461ee5306a1fdfgaae5ec77b5d6c333',
              properties: FieldProperties(
                type: 'SINGLE_SELECTION',
                title: 'single select Field1232',
                description: 'description122',
                is_required: false,
                require_observation: false,
                require_attachment: false,
                data: FieldData(
                  options: ['Fiel2d 1', 'Field4 2', 'Field 56728'],
                ),
              ),
              triggers: [],
              isActive: true,
              isDeleted: false,
            ),
            FieldModel(
              id: '6461ee5306a1fegfagf5ec77b5d6c33ff3dffd',
              properties: FieldProperties(
                type: 'TEXT',
                title: 'text Field1232',
                description: 'description122ew',
                is_required: false,
                require_observation: false,
                require_attachment: false,
                data: FieldData(
                  options: [],
                ),
              ),
              triggers: [],
              isActive: true,
              isDeleted: false,
            ),
          ],
          isActive: false,
          isDeleted: false,
        ),
        SectionModel(
          id: '6461ee5006a1fe5gfgejjjjc77b5d6b',
          name: 'name',
          description: 'description',
          fields: [
            FieldModel(
              id: '6461ee5306afjghda1fe5ec77b5d6c',
              properties: FieldProperties(
                type: 'MULTI_SELECTION',
                title: 'Multi select Field1',
                description: 'description1',
                is_required: true,
                require_observation: false,
                require_attachment: false,
                data: FieldData(
                  options: ['Field 1', 'Field 2', 'Field 5678'],
                ),
              ),
              triggers: [],
              isActive: true,
              isDeleted: false,
            ),
            FieldModel(
              id: '6461ee5306a1fyuhgtyudfgaae5ec77b5d6c333',
              properties: FieldProperties(
                type: 'SINGLE_SELECTION',
                title: 'single select Field1232',
                description: 'description122',
                is_required: false,
                require_observation: false,
                require_attachment: false,
                data: FieldData(
                  options: ['Fiel2d 1', 'Field4 2', 'Field 56728'],
                ),
              ),
              triggers: [],
              isActive: true,
              isDeleted: false,
            ),
            FieldModel(
              id: '6461ee5ygu306a1fegfagf5ec77b5d6c33ff3dffd',
              properties: FieldProperties(
                type: 'TEXT',
                title: 'text Field1232',
                description: 'description122ew',
                is_required: false,
                require_observation: false,
                require_attachment: false,
                data: FieldData(
                  options: [],
                ),
              ),
              triggers: [],
              isActive: true,
              isDeleted: false,
            ),
          ],
          isActive: false,
          isDeleted: false,
        ),
        SectionModel(
          id: '6461ee5006a1fedfad5ec77b5d6b11',
          name: 'name1',
          description: 'description1',
          fields: [
            FieldModel(
              id: '6461ee5306a1daffe5ec77b5d6c22',
              properties: FieldProperties(
                type: 'MULTI_SELECTION',
                title: 'Multi select Field11',
                description: 'description11',
                is_required: true,
                require_observation: false,
                require_attachment: false,
                data: FieldData(
                  options: ['Field 111', 'Field 222', 'Field 562278'],
                ),
              ),
              triggers: [],
              isActive: true,
              isDeleted: false,
            ),
            FieldModel(
              id: '6461ee5306a1dfsfe5ec77b5d6c22444',
              properties: FieldProperties(
                type: 'SINGLE_SELECTION',
                title: 'singleee select Field13341',
                description: 'description13ff431',
                is_required: false,
                require_observation: false,
                require_attachment: false,
                data: FieldData(
                  options: ['Field 113431', 'Field 222343', 'Field 56227338'],
                ),
              ),
              triggers: [],
              isActive: true,
              isDeleted: false,
            ),
            FieldModel(
              id: '6461ee5306a1fe5dsddec77bdff5d6c33ff3',
              properties: FieldProperties(
                type: 'TEXT',
                title: 'text Field1sdf232',
                description: 'description122ew',
                is_required: false,
                require_observation: false,
                require_attachment: false,
                data: FieldData(
                  options: [],
                ),
              ),
              triggers: [],
              isActive: true,
              isDeleted: false,
            ),
          ],
          isActive: false,
          isDeleted: false,
        ),
        SectionModel(
          id: '6461ee5006a1fe5gfgec77b5d6b',
          name: 'name',
          description: 'description',
          fields: [
            FieldModel(
              id: '6461ee5306afda1fe5ec77b5d6c',
              properties: FieldProperties(
                type: 'MULTI_SELECTION',
                title: 'Multi select Field1',
                description: 'description1',
                is_required: true,
                require_observation: false,
                require_attachment: false,
                data: FieldData(
                  options: [
                    'Field 1',
                    'Field 2',
                    'Field 5678rgf',
                    'Field 567fgd8',
                    'Field 567fgs8d',
                    'Field 5678db',
                    'Field 56hgh78',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                    'Field 567fgd8',
                  ],
                ),
              ),
              triggers: [],
              isActive: true,
              isDeleted: false,
            ),
            FieldModel(
              id: '6461ee5306a1fdfgaae5ec77b5d6c333',
              properties: FieldProperties(
                type: 'SINGLE_SELECTION',
                title: 'single select Field1232',
                description: 'description122',
                is_required: false,
                require_observation: false,
                require_attachment: false,
                data: FieldData(
                  options: ['Fiel2d 1', 'Field4 2', 'Field 56728'],
                ),
              ),
              triggers: [],
              isActive: true,
              isDeleted: false,
            ),
            FieldModel(
              id: '6461ee5306a1fegfagf5ec77b5d6c33ff3dffd',
              properties: FieldProperties(
                type: 'TEXT',
                title: 'text Field1232',
                description: 'description122ew',
                is_required: false,
                require_observation: false,
                require_attachment: false,
                data: FieldData(
                  options: [],
                ),
              ),
              triggers: [],
              isActive: true,
              isDeleted: false,
            ),
          ],
          isActive: false,
          isDeleted: false,
        ),
        SectionModel(
          id: '6461ee5006ssdsa1fe5gfgejjjjc77b5d6b',
          name: 'name',
          description: 'description',
          fields: [
            FieldModel(
              id: '6461ee53dsds06afjghda1fe5ec77b5d6c',
              properties: FieldProperties(
                type: 'MULTI_SELECTION',
                title: 'Multi select Field1',
                description: 'description1',
                is_required: true,
                require_observation: false,
                require_attachment: false,
                data: FieldData(
                  options: ['Field 1', 'Field 2', 'Field 5678'],
                ),
              ),
              triggers: [],
              isActive: true,
              isDeleted: false,
            ),
            FieldModel(
              id: '6461ee5dsdss306a1fyuhgtyudfgaae5ec77b5d6c333',
              properties: FieldProperties(
                type: 'SINGLE_SELECTION',
                title: 'single select Field1232',
                description: 'description122',
                is_required: false,
                require_observation: false,
                require_attachment: false,
                data: FieldData(
                  options: ['Fiel2d 1', 'Field4 2', 'Field 56728'],
                ),
              ),
              triggers: [],
              isActive: true,
              isDeleted: false,
            ),
            FieldModel(
              id: '6461ee5ygu306a1fegfagdsdf5ec77b5d6c33ff3dffd',
              properties: FieldProperties(
                type: 'TEXT',
                title: 'text Field1232',
                description: 'description122ew',
                is_required: false,
                require_observation: false,
                require_attachment: false,
                data: FieldData(
                  options: [],
                ),
              ),
              triggers: [],
              isActive: true,
              isDeleted: false,
            ),
          ],
          isActive: false,
          isDeleted: false,
        ),
      ],
      status: 'INACTIVE',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      deletedAt: DateTime.now(),
      createdBy: 'auth0|63d10e2eb495640a8f2c7299',
      updatedBy: 'auth0|63d10e2eb495640a8f2c7299',
      deletedBy: '',
      namespace: 'workroom',
    );

    for (final i in _sheetModel.sections) {
      for (final j in i.fields) {
        if (j.properties.type == 'MULTI_SELECTION') {
          _sheetinformationModel.optionsForMultiSelect.addAll(
            {
              j.id: j.properties.data.options,
            },
          );
          _sheetinformationModel.selectedOptionsForMultiSelect.addAll(
            {
              j.id: BehaviorSubject<List<String>>.seeded([]),
            },
          );
          _sheetinformationModel.evidenceImages.addAll({
            j.id: BehaviorSubject<List<Uint8List>>.seeded([]),
          });
        }
        if (j.properties.type == 'CHECKBOX') {
          _sheetinformationModel.optionsForCheckBoxes.addAll(
            {
              j.id: j.properties.data.options,
            },
          );
          _sheetinformationModel.selectedOptionsForCheckBoxes.addAll(
            {
              j.id: BehaviorSubject<List<String>>.seeded([]),
            },
          );
          _sheetinformationModel.evidenceImages.addAll({
            j.id: BehaviorSubject<List<Uint8List>>.seeded([]),
          });
        }
        if (j.properties.type == 'SINGLE_SELECTION') {
          _sheetinformationModel.optionsForSingleSelect.addAll(
            {
              j.id: j.properties.data.options,
            },
          );
          _sheetinformationModel.selectedOptionForSingleSelect.addAll(
            {
              j.id: BehaviorSubject<String>.seeded(''),
            },
          );
          _sheetinformationModel.evidenceImages.addAll({
            j.id: BehaviorSubject<List<Uint8List>>.seeded([]),
          });
        }
        if (j.properties.type == 'TEXT') {
          _sheetinformationModel.textFields.addAll(
            {
              j.id: BehaviorSubject<String>.seeded(''),
            },
          );
          _sheetinformationModel.evidenceImages.addAll({
            j.id: BehaviorSubject<List<Uint8List>>.seeded([]),
          });
        }
        if (j.properties.type == 'DATE') {
          _sheetinformationModel.dateFields.addAll(
            {
              j.id: BehaviorSubject<DateTime>.seeded(DateTime.now()),
            },
          );
          _sheetinformationModel.evidenceImages.addAll({
            j.id: BehaviorSubject<List<Uint8List>>.seeded([]),
          });
        }
        if (j.properties.type == 'NUMBER') {
          _sheetinformationModel.numberFields.addAll(
            {
              j.id: BehaviorSubject<double>.seeded(0),
            },
          );
          _sheetinformationModel.evidenceImages.addAll({
            j.id: BehaviorSubject<List<Uint8List>>.seeded([]),
          });
        }
      }
    }
    AppLogger.printLog(
      _sheetinformationModel,
      tag: 'SheetInfo.dart/sheetinformationModel',
    );
  }

  // functions
  void onOptionSelectedMultiSelectField(String fieldId, List<String> values) {
    _sheetinformationModel.selectedOptionsForMultiSelect[fieldId]?.sink
        .add(values);
    AppLogger.printLog(
      _sheetinformationModel.selectedOptionsForMultiSelect[fieldId]?.value
          as Object,
      tag: 'Sheet.dart/selectedOptionsForMultiSelect',
    );
  }

  void onOptionSelectedSingleSelectField(String fieldId, String value) {
    _sheetinformationModel.selectedOptionForSingleSelect[fieldId]?.sink
        .add(value);
    AppLogger.printLog(
      _sheetinformationModel.selectedOptionForSingleSelect[fieldId]?.value
          as Object,
      tag: 'Sheet.dart/selectedOptionForSingleSelect',
    );
  }

  void onTextEntered(String fieldId, String value) {
    _sheetinformationModel.textFields[fieldId]?.sink.add(value);
    AppLogger.printLog(
      _sheetinformationModel.textFields[fieldId]?.value as Object,
      tag: 'Sheet.dart/textFields',
    );
  }

  void onImageSelected(String fieldId, List<Uint8List> value) {
    AppLogger.printLog(
      value.length,
      tag: 'length of image selected',
    );
    _sheetinformationModel.evidenceImages[fieldId]?.sink.add(value);
    // AppLogger.printLog(
    //   _sheetinformationModel.evidenceImages[fieldId]?.value as Object,
    //   tag: 'Sheet.dart/evidenceImages',
    // );
  }
}
