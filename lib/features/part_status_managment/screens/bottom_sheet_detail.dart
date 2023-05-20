// ignore_for_file: avoid_dynamic_calls, cast_nullable_to_non_nullable

import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/services/logger_service/logger_service.dart';
import 'package:workroom_flutter_app/core/di/injection.dart';
import 'package:workroom_flutter_app/features/part_status_managment/bloc/sheet_information_bloc.dart';

import 'package:workroom_flutter_app/features/part_status_managment/bloc/state.dart';
import 'package:workroom_flutter_app/features/part_status_managment/constants/constants.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/common_widgets_bottom_sheet/multi_select_field.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/common_widgets_bottom_sheet/single_select_field.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/common_widgets_bottom_sheet/text_enter_field.dart';
import 'package:workroom_flutter_app/models/sheets/field_model.dart';
import 'package:workroom_flutter_app/models/sheets/section_model.dart';
import 'package:workroom_flutter_app/models/sheets/sheet_model.dart';

class Sheet extends StatefulWidget {
  const Sheet({
    super.key,
    required this.callBack,
  });
  final Function callBack;

  @override
  State<Sheet> createState() => _SheetState();
}

class _SheetState extends State<Sheet> {
  SheetModel? sheetModel;
  late SheetInformationModel sheetInformationModel;
  RxStateClass rxStateClass = getIt<RxStateClass>();
  @override
  void initState() {
    rxStateClass.updateStream();
    sheetModel = rxStateClass.getSheetModel;
    AppLogger.printLog(
      sheetModel as Object,
      tag: 'BottomSheetDetail.dart/init state',
    );
    sheetInformationModel = rxStateClass.getInformationModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => widget.callBack(),
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        backgroundColor: AppColors.transparent,
        body: sheetModel == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: sheetModel?.sections.length,
                itemBuilder: (context, index) {
                  return section(sectionModel: (sheetModel?.sections[index])!);
                },
              ),
      ),
    );
  }

  Widget section({required SectionModel sectionModel}) {
    // return ListView.builder(
    //   physics: const NeverScrollableScrollPhysics(),
    //   shrinkWrap: true,
    //   itemCount: sectionModel.fields.length,
    //   itemBuilder: (context, index) {
    //     return Field(fieldModel: sectionModel.fields[index]);
    //   },
    // );
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Text('section: ${sectionModel.name}'),
              ],
            ),
            ...sectionModel.fields.map(
              (fieldModel) {
                return field(fieldModel: fieldModel);
              },
            ),
            // const Divider(),
          ],
        ),
      ),
    );
  }

  Widget field({required FieldModel fieldModel}) {
    if (fieldModel.properties.type == Constants.multiSelect) {
      // widget.informationModel.optionsForMultiSelect.addAll({
      //   fieldModel.id: fieldModel.properties.data.options,
      // });
      // widget.informationModel.selectedOptionsForMultiSelect.addAll({
      //   fieldModel.id: [],
      // });
      return StreamBuilder<List<String>>(
        stream: sheetInformationModel
            .selectedOptionsForMultiSelect[fieldModel.id]?.stream,
        builder: (context, snapshotOfSelectedOptions) {
          return MultiSelectField(
            fieldProperties: fieldModel.properties,
            fieldId: fieldModel.id,
            sheetInformationModel: sheetInformationModel,
            snapshotOfSelectedOptions: snapshotOfSelectedOptions,
            rxStateClass: rxStateClass,
          );
        },
      );
    } else if (fieldModel.properties.type == Constants.singleSelect) {
      return StreamBuilder<String>(
        stream: sheetInformationModel
            .selectedOptionForSingleSelect[fieldModel.id]?.stream,
        builder: (context, snapshotOfSelectedOption) {
          return SingleSelectField(
            fieldProperties: fieldModel.properties,
            fieldId: fieldModel.id,
            sheetInformationModel: sheetInformationModel,
            snapshotOfSelectedOption: snapshotOfSelectedOption,
            rxStateClass: rxStateClass,
          );
        },
      );
    } else if (fieldModel.properties.type == Constants.text) {
      return TextSelectField(
        fieldProperties: fieldModel.properties,
        fieldId: fieldModel.id,
        sheetInformationModel: sheetInformationModel,
        rxStateClass: rxStateClass,
      );
    }
    return Container();
  }
}
