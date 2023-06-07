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
import 'package:workroom_flutter_app/features/work_queue/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/models/sheets/field_model.dart';
import 'package:workroom_flutter_app/models/sheets/section_model.dart';
import 'package:workroom_flutter_app/models/sheets/sheet_model.dart';

class Sheet extends StatefulWidget {
  const Sheet({
    super.key,
    required this.callBack,
    required this.scrollcontroller,
  });
  final VoidCallback callBack;
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
      sheetModel!,
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
                      height: 20,
                    ),
                    ListTile(
                      leading: BouncingAnimation(
                        onTap: () {
                          widget.callBack();
                        },
                        widget: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                        ),
                      ),
                      title: Text(
                        '${sheetModel?.name}',
                        overflow: TextOverflow.ellipsis,
                        style: CfTextStyles.getTextStyle(
                          TStyle.h1_600,
                        )?.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        '${sheetModel?.description}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: CfTextStyles.getTextStyle(
                          TStyle.h1_600,
                        )?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.subtitleColor,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (logginedStarted)
                            Row(
                              children: [
                                BouncingAnimation(
                                  onTap: () {
                                    // what happens when sheet is submitted
                                  },
                                  widget: Container(
                                    height: 31,
                                    decoration: BoxDecoration(
                                      gradient: AppColors.gradientRightToLeft,
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
                                BouncingAnimation(
                                  onTap: () {
                                    // what happens when progress is saved
                                  },
                                  widget: Container(
                                    height: 31,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.greyBorderColor,
                                      ),
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
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          if (!logginedStarted)
                            BouncingAnimation(
                              onTap: () {
                                setState(() {
                                  logginedStarted = true;
                                });
                              },
                              widget: Container(
                                height: 31,
                                decoration: BoxDecoration(
                                  gradient: AppColors.gradientRightToLeft,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
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
                            ),
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
    var index = 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.greyBorderColor,
                ),
                top: BorderSide(
                  color: AppColors.greyBorderColor,
                ),
              ),
              color: AppColors.basicDetailTileColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    sectionModel.name,
                    style: CfTextStyles.getTextStyle(TStyle.h1_600),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...sectionModel.fields.map(
            (fieldModel) {
              index++;
              return field(fieldModel: fieldModel, index: index);
            },
          ),
        ],
      ),
    );
  }

  Widget field({required FieldModel fieldModel, required int index}) {
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
            logginedStarted: logginedStarted,
            index: index,
            evidenceImageModal: showImageDialog,
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
            logginedStarted: logginedStarted,
            index: index,
            evidenceImageModal: showImageDialog,
          );
        },
      );
    } else if (fieldModel.properties.type == Constants.text) {
      return TextSelectField(
        fieldProperties: fieldModel.properties,
        fieldId: fieldModel.id,
        sheetInformationModel: sheetInformationModel,
        rxStateClass: rxStateClass,
        logginedStarted: logginedStarted,
        index: index,
        evidenceImageModal: showImageDialog,
      );
    }
    return Container();
  }

  // show modal for image
  void showImageDialog() {
    showDialog<AlertDialog>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          elevation: 0,
          content: SizedBox(
            height: 350,
            width: 700,
            child: Column(
              children: [
                Row(
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.photo_camera_outlined,
                        color: AppColors.greyColor,
                      ),
                      label: Text(
                        'Add Evidence Image',
                        style: CfTextStyles.getTextStyle(
                          TStyle.h1_600,
                        )?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.all(8),
                        child: Placeholder(
                          fallbackHeight: 50,
                          fallbackWidth: 100,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Add Your Remarks here',
                    labelStyle: CfTextStyles.getTextStyle(
                      TStyle.h1_600,
                    )?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                    border: const OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
