import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/forms/bloc/sheet_information_bloc.dart';
import 'package:workroom_flutter_app/common/forms/bloc/state.dart';
import 'package:workroom_flutter_app/common/forms/screens/common_widgets/sheet_widgets/collapsable_container.dart';
import 'package:workroom_flutter_app/common/forms/screens/common_widgets/sheet_widgets/evidence_capture_modal.dart';
import 'package:workroom_flutter_app/common/forms/screens/common_widgets/sheet_widgets/multi_select_dropdown.dart';
import 'package:workroom_flutter_app/common/forms/screens/common_widgets/sheet_widgets/single_select_dropdown.dart';
import 'package:workroom_flutter_app/models/sheets/field_properties_model.dart';

class TextSelectField extends StatefulWidget {
  const TextSelectField({
    super.key,
    required this.fieldProperties,
    required this.fieldId,
    required this.sheetInformationModel,
    required this.rxStateClass,
    required this.logginedStarted,
    required this.index,
    required this.evidenceImageModal,
    required this.noOfImages,
  });
  final FieldProperties fieldProperties;
  final String fieldId;
  final SheetInformationModel sheetInformationModel;
  final RxStateClass rxStateClass;
  final bool logginedStarted;
  final int index;
  final Function evidenceImageModal;
  final int noOfImages;

  @override
  State<TextSelectField> createState() => _TextSelectFieldState();
}

class _TextSelectFieldState extends State<TextSelectField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    if (widget.sheetInformationModel.textFields[widget.fieldId] == null) {
      _controller.text = '';
    } else {
      _controller.text =
          widget.sheetInformationModel.textFields[widget.fieldId]!.value;
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                  // width: width * 0.8,
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
                        'Text',
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
                child: InkWell(
                  onTap: () {
                    showDialog<AlertDialog>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          elevation: 0,
                          content: SizedBox(
                            height: 780,
                            width: 614,
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    height: 32,
                                    width: 86,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      border: Border.all(
                                        color: AppColors.greyBorderColor,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Section 1',
                                          style: CfTextStyles.getTextStyle(
                                            TStyle.h1_600,
                                          )?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.textColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    '01: Drum set (mm)',
                                    style: CfTextStyles.getTextStyle(
                                      TStyle.h1_600,
                                    )?.copyWith(),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const CollapsibleContainer(
                                    title: 'Field Desc & References',
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'Response(s)',
                                    style:
                                        CfTextStyles.getTextStyle(TStyle.h1_600)
                                            ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  SingleSelectDropdown(
                                    isDisabled: !widget.logginedStarted,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  MultiSelectDropdown(
                                    isDisabled: !widget.logginedStarted,
                                  ),
                                  // MultiValuedTextField(
                                  //   isEnabled: widget.logginedStarted,
                                  //   width: width,
                                  //   fieldNo: '3',
                                  // ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const Divider(),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'Controls',
                                    style:
                                        CfTextStyles.getTextStyle(TStyle.h1_600)
                                            ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const CollapsibleContainer(
                                    title: 'Control 1',
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const Divider(),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'Evidence',
                                    style:
                                        CfTextStyles.getTextStyle(TStyle.h1_600)
                                            ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  CaptureEvidence(
                                    textFieldEnabled: widget.logginedStarted,
                                  ),
                                  const SizedBox(
                                    height: 16,
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
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      color: widget.logginedStarted
                          ? AppColors.whiteColor
                          : AppColors.greyBorderColor.withOpacity(0.5),
                      border: Border.all(
                        color: AppColors.greyBorderColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
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
    //                   'Text',
    //                   style: CfTextStyles.getTextStyle(
    //                     TStyle.h1_600,
    //                   )?.copyWith(
    //                     fontSize: 14,
    //                     fontWeight: FontWeight.w400,
    //                   ),
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
    //               child: TextField(
    //                 controller: _controller,
    //                 keyboardType: TextInputType.text,
    //                 decoration: const InputDecoration(
    //                   border: InputBorder.none,
    //                   contentPadding: EdgeInsets.only(left: 8),
    //                 ),
    //                 onChanged: (String val) {
    //                   widget.rxStateClass.onTextEntered(widget.fieldId, val);
    //                 },
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
