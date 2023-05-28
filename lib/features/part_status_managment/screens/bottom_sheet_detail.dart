// ignore_for_file: avoid_dynamic_calls, cast_nullable_to_non_nullable

import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
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
    required this.scrollcontroller,
  });
  final Function callBack;
  final ScrollController scrollcontroller;

  @override
  State<Sheet> createState() => _SheetState();
}

class _SheetState extends State<Sheet> {
  SheetModel? sheetModel;
  late SheetInformationModel sheetInformationModel;
  RxStateClass rxStateClass = getIt<RxStateClass>();
  bool logginedStarted = false;
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
        backgroundColor: AppColors.transparent,
        body: sheetModel == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                controller: widget.scrollcontroller,
                child: Column(
                  children: [
                    // Row(
                    //   children: const [
                    //     Spacer(),
                    //     Expanded(
                    //       child: Divider(
                    //         thickness: 3,
                    //       ),
                    //     ),
                    //     Spacer(),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 16,
                            child: IconButton(
                              onPressed: () {
                                widget.callBack();
                              },
                              icon: const Icon(Icons.arrow_back),
                            ),
                          ),
                          // const Icon(Icons.edit_note),
                          const SizedBox(
                            width: 18,
                          ),
                          Expanded(
                            child: Text(
                              '${sheetModel?.name}',
                              overflow: TextOverflow.ellipsis,
                              style: CfTextStyles.getTextStyle(
                                TStyle.h1_600,
                              )?.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          if (!logginedStarted)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  logginedStarted = true;
                                });
                              },
                              child: Container(
                                height: 31,
                                decoration: BoxDecoration(
                                  gradient: AppColors.gradientRightToLeft,
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Center(
                                    child: Text(
                                      'Start Logging',
                                      style: CfTextStyles.getTextStyle(
                                        TStyle.h1_600,
                                      )?.copyWith(
                                        fontSize: 14,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          else
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // what happens when sheet is submitted
                                  },
                                  child: Container(
                                    height: 31,
                                    decoration: BoxDecoration(
                                      gradient: AppColors.gradientRightToLeft,
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Submit Sheet',
                                          style: CfTextStyles.getTextStyle(
                                            TStyle.h1_600,
                                          )?.copyWith(
                                            fontSize: 14,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // what happens when progress is saved
                                  },
                                  child: Container(
                                    height: 31,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Save Progress',
                                          style: CfTextStyles.getTextStyle(
                                            TStyle.h1_600,
                                          )?.copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            width: 34,
                          ),
                          Expanded(
                            child: Text(
                              '${sheetModel?.description}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CfTextStyles.getTextStyle(
                                TStyle.h1_600,
                              )?.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.subtitleColor,
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: sheetModel?.sections.length,
                      itemBuilder: (context, index) {
                        return section(
                          sectionModel: (sheetModel?.sections[index])!,
                        );
                      },
                    ),
                  ],
                ),
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
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Section: ${sectionModel.name}',
                style: CfTextStyles.getTextStyle(
                  TStyle.h1_600,
                )?.copyWith(
                  fontSize: 18,
                ),
              ),
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

  // show modal for image
  void showImageDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.photo_camera_outlined),
                    label: Text('Add Evidence Image'))
              ],
            ),
          );
        });
  }
}
