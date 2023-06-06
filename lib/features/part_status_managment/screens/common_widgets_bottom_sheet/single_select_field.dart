import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/services/navigation_service/navigation_service.dart';
import 'package:workroom_flutter_app/core/di/injection.dart';
import 'package:workroom_flutter_app/features/part_status_managment/bloc/sheet_information_bloc.dart';
import 'package:workroom_flutter_app/features/part_status_managment/bloc/state.dart';
import 'package:workroom_flutter_app/features/work_queue/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/models/sheets/field_properties_model.dart';

class SingleSelectField extends StatefulWidget {
  const SingleSelectField({
    super.key,
    required this.fieldProperties,
    required this.fieldId,
    required this.sheetInformationModel,
    required this.snapshotOfSelectedOption,
    required this.rxStateClass,
  });
  final FieldProperties fieldProperties;
  final String fieldId;
  final SheetInformationModel sheetInformationModel;

  final AsyncSnapshot<String> snapshotOfSelectedOption;
  final RxStateClass rxStateClass;

  @override
  State<SingleSelectField> createState() => _SingleSelectFieldState();
}

class _SingleSelectFieldState extends State<SingleSelectField> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 8,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.fieldProperties.title,
                      style: CfTextStyles.getTextStyle(
                        TStyle.h1_600,
                      )?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                    ),
                    Text(
                      'Single Select',
                      style: CfTextStyles.getTextStyle(
                        TStyle.h1_600,
                      )?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(child: Container())
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 9,
                child: InkWell(
                  splashColor: AppColors.transparent,
                  onTap: () {
                    showDialog<Dialog>(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          elevation: 0,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: SingleChildScrollView(
                              child: Column(
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 8,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Select options',
                                              style: CfTextStyles.getTextStyle(
                                                TStyle.h1_600,
                                              )?.copyWith(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                BouncingAnimation(
                                                  onTap: () {
                                                    getIt<NavigationService>()
                                                        .pop();
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                  },
                                                  widget: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 16,
                                                    ),
                                                    child: Container(
                                                      height: 40,
                                                      // width: 60,
                                                      decoration: BoxDecoration(
                                                        gradient: AppColors
                                                            .gradientLeftToRight,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 12,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Cancel',
                                                          style: CfTextStyles
                                                              .getTextStyle(
                                                            TStyle.h1_600,
                                                          )?.copyWith(
                                                            color: AppColors
                                                                .whiteColor,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                BouncingAnimation(
                                                  onTap: () {
                                                    _formKey.currentState
                                                        ?.save();
                                                    getIt<NavigationService>()
                                                        .pop();
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                  },
                                                  widget: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 16,
                                                    ),
                                                    child: Container(
                                                      height: 40,
                                                      width: 60,
                                                      decoration: BoxDecoration(
                                                        gradient: AppColors
                                                            .gradientLeftToRight,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 12,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'OK',
                                                          style: CfTextStyles
                                                              .getTextStyle(
                                                            TStyle.h1_600,
                                                          )?.copyWith(
                                                            color: AppColors
                                                                .whiteColor,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  FormBuilder(
                                    key: _formKey,
                                    child: FormBuilderRadioGroup(
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      initialValue:
                                          widget.snapshotOfSelectedOption.data,
                                      // enabled: false,
                                      activeColor:
                                          AppColors.selectedRadioButtonColor,
                                      orientation: OptionsOrientation.vertical,
                                      onSaved: (value) {
                                        widget.rxStateClass
                                            .onOptionSelectedSingleSelectField(
                                          widget.fieldId,
                                          value.toString(),
                                        );
                                      },
                                      name: 'form',
                                      options: widget
                                              .sheetInformationModel
                                              .optionsForSingleSelect[
                                                  widget.fieldId]
                                              ?.map(
                                                (option) =>
                                                    FormBuilderFieldOption(
                                                  value: option,
                                                ),
                                              )
                                              .toList() ??
                                          [],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.greyColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Container(
                                height: 36,
                                decoration: widget
                                            .sheetInformationModel
                                            .selectedOptionForSingleSelect[
                                                widget.fieldId]!
                                            .value !=
                                        ''
                                    ? BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(11),
                                      )
                                    : const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.snapshotOfSelectedOption.data ??
                                          '',
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.greyColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.all(8),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Row(
    //         children: [
    //           Text(
    //             widget.fieldProperties.title,
    //             style: CfTextStyles.getTextStyle(
    //               TStyle.h1_600,
    //             )?.copyWith(
    //               fontSize: 14,
    //               fontWeight: FontWeight.w400,
    //             ),
    //           ),
    //           Expanded(
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.end,
    //               children: [
    //                 Text(
    //                   'Single Select',
    //                   style: CfTextStyles.getTextStyle(
    //                     TStyle.h1_600,
    //                   )?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
    //                 ),
    //                 const SizedBox(
    //                   width: 8,
    //                 ),
    //                 const SizedBox(
    //                   width: 51,
    //                 )
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //       Row(
    //         children: [
    //           Flexible(
    //             child: Container(
    //               height: 51,
    //               // width: width * 0.75,
    //               decoration: BoxDecoration(
    //                 border: Border.all(),
    //                 borderRadius: BorderRadius.circular(5),
    //               ),
    //               child: Row(
    //                 children: [
    //                   Expanded(
    //                     child: SizedBox(
    //                       height: 51,
    //                       // width: width * 0.75,
    //                       child: ListView(
    //                         // shrinkWrap: true,
    //                         scrollDirection: Axis.horizontal,
    //                         children: [
    //                           Padding(
    //                             padding: const EdgeInsets.only(left: 8),
    //                             child: Center(
    //                               child: Padding(
    //                                 padding: const EdgeInsets.only(left: 4),
    //                                 child: Container(
    //                                   height: 36,
    //                                   decoration: widget
    //                                               .sheetInformationModel
    //                                               .selectedOptionForSingleSelect[
    //                                                   widget.fieldId]!
    //                                               .value !=
    //                                           ''
    //                                       ? BoxDecoration(
    //                                           border: Border.all(),
    //                                           borderRadius:
    //                                               BorderRadius.circular(11),
    //                                         )
    //                                       : const BoxDecoration(),
    //                                   child: Padding(
    //                                     padding: const EdgeInsets.symmetric(
    //                                       horizontal: 8,
    //                                     ),
    //                                     child: Center(
    //                                       child: Text(
    //                                         widget.snapshotOfSelectedOption
    //                                                 .data ??
    //                                             '',
    //                                         style: CfTextStyles.getTextStyle(
    //                                           TStyle.h1_600,
    //                                         )?.copyWith(
    //                                           fontSize: 14,
    //                                           fontWeight: FontWeight.w400,
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                   PopupMenuButton<String>(
    //                     itemBuilder: (BuildContext context) {
    //                       return widget.sheetInformationModel
    //                               .optionsForSingleSelect[widget.fieldId]
    //                               ?.map((String option) {
    //                             return PopupMenuItem<String>(
    //                               value: option,
    //                               child: Text(
    //                                 option,
    //                                 style: CfTextStyles.getTextStyle(
    //                                   TStyle.h1_600,
    //                                 )?.copyWith(
    //                                   fontSize: 14,
    //                                   fontWeight: FontWeight.w400,
    //                                 ),
    //                               ),
    //                             );
    //                           }).toList() ??
    //                           [];
    //                     },
    //                     onSelected: (String newValue) {
    //                       setState(() {
    //                         if (widget
    //                                 .sheetInformationModel
    //                                 .selectedOptionForSingleSelect[
    //                                     widget.fieldId]!
    //                                 .value ==
    //                             newValue) {
    //                           Shared.toast(context, 'Already Selected');
    //                         } else {
    //                           widget.rxStateClass
    //                               .onOptionSelectedSingleSelectField(
    //                             widget.fieldId,
    //                             newValue,
    //                           );
    //                         }
    //                       });
    //                     },
    //                     child: const Icon(
    //                       Icons.arrow_drop_down,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           const SizedBox(
    //             width: 8,
    //           ),
    //           Container(
    //             height: 51,
    //             width: 51,
    //             decoration: BoxDecoration(
    //               border: Border.all(),
    //               borderRadius: BorderRadius.circular(5),
    //             ),
    //             child: Center(
    //               child: IconButton(
    //                 onPressed: () {},
    //                 icon: const Icon(
    //                   Icons.edit,
    //                 ),
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
