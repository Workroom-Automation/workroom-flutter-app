import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:workroom_flutter_app/common/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/forms/bloc/sheet_information_bloc.dart';
import 'package:workroom_flutter_app/common/forms/bloc/state.dart';
import 'package:workroom_flutter_app/common/services/navigation_service/navigation_service.dart';
import 'package:workroom_flutter_app/core/di/injection.dart';
import 'package:workroom_flutter_app/models/sheets/field_properties_model.dart';

class MultiSelectField extends StatefulWidget {
  const MultiSelectField({
    super.key,
    required this.fieldProperties,
    required this.fieldId,
    required this.sheetInformationModel,
    required this.snapshotOfSelectedOptions,
    required this.rxStateClass,
    required this.logginedStarted,
    required this.index,
    required this.evidenceImageModal,
    required this.noOfImages,
  });
  final FieldProperties fieldProperties;
  final String fieldId;
  final SheetInformationModel sheetInformationModel;
  final AsyncSnapshot<List<String>> snapshotOfSelectedOptions;
  final RxStateClass rxStateClass;
  final bool logginedStarted;
  final int index;
  final Function evidenceImageModal;
  final int noOfImages;

  @override
  State<MultiSelectField> createState() => _MultiSelectFieldState();
}

class _MultiSelectFieldState extends State<MultiSelectField> {
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
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  // width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${(widget.index).toString()}.  ${widget.fieldProperties.title}',
                        style: CfTextStyles.getTextStyle(
                          TStyle.h1_600,
                        )?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: widget.logginedStarted
                              ? AppColors.textColor
                              : AppColors.greyColor,
                        ),
                      ),
                      Text(
                        'Multi Select',
                        style: CfTextStyles.getTextStyle(
                          TStyle.h1_600,
                        )?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  // width: MediaQuery.of(context).size.width * 0.8,
                  child: InkWell(
                    splashColor: AppColors.transparent,
                    onTap: () {
                      showDialog<AlertDialog>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            elevation: 0,
                            actionsAlignment: MainAxisAlignment.spaceEvenly,
                            actions: [
                              BouncingAnimation(
                                onTap: () {
                                  getIt<NavigationService>().pop();
                                  FocusScope.of(context).unfocus();
                                },
                                widget: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Container(
                                    height: 40,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      gradient: widget.logginedStarted
                                          ? null
                                          : AppColors.disabledGradient,
                                      border: Border.all(
                                        color: AppColors.greyColor
                                            .withOpacity(0.4),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Cancel',
                                        style: CfTextStyles.getTextStyle(
                                          TStyle.h1_600,
                                        )?.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              BouncingAnimation(
                                onTap: () {
                                  _formKey.currentState?.save();
                                  getIt<NavigationService>().pop();
                                  FocusScope.of(context).unfocus();
                                },
                                widget: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Container(
                                    height: 40,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      gradient: widget.logginedStarted
                                          ? AppColors.gradientLeftToRight
                                          : AppColors.disabledGradient,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'OK',
                                        style: CfTextStyles.getTextStyle(
                                          TStyle.h1_600,
                                        )?.copyWith(
                                          color: widget.logginedStarted
                                              ? AppColors.whiteColor
                                              : AppColors.textColor,
                                          fontSize: 12,
                                          fontWeight: widget.logginedStarted
                                              ? FontWeight.w700
                                              : FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            title: Text(
                              'Select options',
                              style: CfTextStyles.getTextStyle(
                                TStyle.h1_600,
                              )?.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            content: SizedBox(
                              height: 300,
                              width: 300,
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FormBuilder(
                                      key: _formKey,
                                      child: Column(
                                        children: [
                                          FormBuilderCheckboxGroup(
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                            initialValue: widget
                                                .snapshotOfSelectedOptions.data,
                                            activeColor:
                                                AppColors.selectedButtonColor,
                                            orientation:
                                                OptionsOrientation.vertical,
                                            enabled: widget.logginedStarted,
                                            onSaved: (value) {
                                              final vals = <String>[];
                                              for (final i in value!) {
                                                vals.add(i.toString());
                                              }
                                              widget.rxStateClass
                                                  .onOptionSelectedMultiSelectField(
                                                widget.fieldId,
                                                vals,
                                              );
                                            },
                                            name: 'form',
                                            options: widget
                                                    .sheetInformationModel
                                                    .optionsForMultiSelect[
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
                                        ],
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
                        color: widget.logginedStarted
                            ? AppColors.whiteColor
                            : AppColors.greyBorderColor.withOpacity(0.5),
                        border: Border.all(
                          color: AppColors.greyBorderColor,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: widget.snapshotOfSelectedOptions.data?.map(
                              (option) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 4,
                                      ),
                                      child: Container(
                                        height: 36,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.greyColor,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            11,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          child: Center(
                                            child: Text(
                                              option,
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
                                );
                              },
                            ).toList() ??
                            [],
                      ),
                    ),
                  ),
                ),
              ),
              // Stack(
              //   children: [
              //     const SizedBox(
              //       height: 70,
              //       width: 70,
              //     ),
              //     Positioned(
              //       top: 10,
              //       bottom: 10,
              //       left: 10,
              //       right: 10,
              //       child: Container(
              //         height: 50,
              //         width: 50,
              //         decoration: BoxDecoration(
              //           color: widget.logginedStarted
              //               ? AppColors.whiteColor
              //               : AppColors.greyBorderColor.withOpacity(0.5),
              //           border: Border.all(
              //             color: AppColors.greyBorderColor,
              //           ),
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         child: BouncingAnimation(
              //           onTap: () {
              //             if (widget.logginedStarted) {
              //               widget.evidenceImageModal(fieldId: widget.fieldId);
              //             }
              //           },
              //           widget: Icon(
              //             Icons.add_a_photo,
              //             color: AppColors.greyColor.withOpacity(0.5),
              //           ),
              //         ),
              //       ),
              //     ),
              //     if (widget.noOfImages > 0)
              //       const Positioned(
              //         top: 5,
              //         right: 5,
              //         child: CircleAvatar(
              //           backgroundColor: AppColors.red,
              //           radius: 10,
              //         ),
              //       ),
              //   ],
              // ),
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
    //                   'Multi Select',
    //                   style: CfTextStyles.getTextStyle(
    //                     TStyle.h1_600,
    //                   )?.copyWith(
    //                     fontSize: 14,
    //                     fontWeight: FontWeight.w400,
    //                   ),
    //                 ),
    //                 if (widget.fieldProperties.is_required)
    //                   Text(
    //                     '*',
    //                     style: CfTextStyles.getTextStyle(
    //                       TStyle.h1_600,
    //                     )?.copyWith(
    //                       fontSize: 14,
    //                       color: AppColors.red,
    //                     ),
    //                   )
    //                 else
    //                   const SizedBox.shrink(),
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
    //                         children: widget.snapshotOfSelectedOptions.data
    //                                 ?.map((option) {
    //                               return Padding(
    //                                 padding: const EdgeInsets.only(left: 8),
    //                                 child: Center(
    //                                   child: Padding(
    //                                     padding: const EdgeInsets.only(
    //                                       left: 4,
    //                                     ),
    //                                     child: Container(
    //                                       height: 36,
    //                                       decoration: BoxDecoration(
    //                                         border: Border.all(),
    //                                         borderRadius: BorderRadius.circular(
    //                                           11,
    //                                         ),
    //                                       ),
    //                                       child: Padding(
    //                                         padding: const EdgeInsets.symmetric(
    //                                           horizontal: 8,
    //                                         ),
    //                                         child: Center(
    //                                           child: Text(
    //                                             option,
    //                                             style:
    //                                                 CfTextStyles.getTextStyle(
    //                                               TStyle.h1_600,
    //                                             )?.copyWith(
    //                                               fontSize: 14,
    //                                               fontWeight: FontWeight.w400,
    //                                             ),
    //                                           ),
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //                               );
    //                             }).toList() ??
    //                             [],
    //                       ),
    //                     ),
    //                   ),
    //                   PopupMenuButton<String>(
    //                     itemBuilder: (BuildContext context) {
    //                       // return widget.snapshotOfOptions.data
    //                       //         ?.map((String option) {
    //                       //       return PopupMenuItem<String>(
    //                       //         value: option,
    //                       //         child: Text(option),
    //                       //       );
    //                       //     }).toList() ??
    //                       //     [];
    //                       return widget.sheetInformationModel
    //                               .optionsForMultiSelect[widget.fieldId]
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
    //                     onSelected: (String value) {
    //                       final vals =
    //                           widget.snapshotOfSelectedOptions.data ?? [];
    //                       if (vals.contains(value)) {
    //                         vals.remove(value);
    //                       } else {
    //                         vals.add(value);
    //                       }
    //                       widget.rxStateClass.onOptionSelectedMultiSelectField(
    //                         widget.fieldId,
    //                         vals,
    //                       );
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
    //                 onPressed: () {
    //                   showDialog<AlertDialog>(
    //                     context: context,
    //                     builder: (context) {
    //                       return AlertDialog(
    //                         backgroundColor: Colors.white,
    //                         elevation: 0,
    //                         content: SizedBox(
    //                           height: 350,
    //                           width: 700,
    //                           child: Column(
    //                             children: [
    //                               Row(
    //                                 children: [
    //                                   OutlinedButton.icon(
    //                                     onPressed: () {},
    //                                     icon: const Icon(
    //                                       Icons.photo_camera_outlined,
    //                                       color: AppColors.greyColor,
    //                                     ),
    //                                     label: Text(
    //                                       'Add Evidence Image',
    //                                       style: CfTextStyles.getTextStyle(
    //                                         TStyle.h1_600,
    //                                       )?.copyWith(
    //                                         fontWeight: FontWeight.w400,
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                               const SizedBox(
    //                                 height: 8,
    //                               ),
    //                               SizedBox(
    //                                 height: 100,
    //                                 child: ListView.builder(
    //                                   scrollDirection: Axis.horizontal,
    //                                   itemCount: 5,
    //                                   itemBuilder: (context, index) {
    //                                     return const Padding(
    //                                       padding: EdgeInsets.all(8),
    //                                       child: Placeholder(
    //                                         fallbackHeight: 50,
    //                                         fallbackWidth: 100,
    //                                       ),
    //                                     );
    //                                   },
    //                                 ),
    //                               ),
    //                               const SizedBox(
    //                                 height: 8,
    //                               ),
    //                               TextField(
    //                                 maxLines: 5,
    //                                 decoration: InputDecoration(
    //                                   labelText: 'Add Your Remarks here',
    //                                   labelStyle: CfTextStyles.getTextStyle(
    //                                     TStyle.h1_600,
    //                                   )?.copyWith(
    //                                     fontSize: 14,
    //                                     fontWeight: FontWeight.w400,
    //                                     fontStyle: FontStyle.italic,
    //                                   ),
    //                                   border: const OutlineInputBorder(),
    //                                   alignLabelWithHint: true,
    //                                 ),
    //                               )
    //                             ],
    //                           ),
    //                         ),
    //                       );
    //                     },
    //                   );
    //                 },
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

  void showImageDialog() {
    showDialog<AlertDialog>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.photo_camera_outlined),
                label: const Text('Add Evidence Image'),
              )
            ],
          ),
        );
      },
    );
  }
}
