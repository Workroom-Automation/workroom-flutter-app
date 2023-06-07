import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/part_status_managment/bloc/sheet_information_bloc.dart';
import 'package:workroom_flutter_app/features/part_status_managment/bloc/state.dart';
import 'package:workroom_flutter_app/features/work_queue/animations/bouncing_animation.dart';

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
  });
  final FieldProperties fieldProperties;
  final String fieldId;
  final SheetInformationModel sheetInformationModel;
  final RxStateClass rxStateClass;
  final bool logginedStarted;
  final int index;
  final VoidCallback evidenceImageModal;

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
                flex: 10,
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
                        color: AppColors.textColor,
                      ),
                    ),
                    Text(
                      'Text',
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
                flex: 10,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: widget.logginedStarted
                          ? AppColors.greyColor
                          : AppColors.formFieldDisabledColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: FormBuilderTextField(
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      enabled: widget.logginedStarted,
                      controller: _controller,
                      name: 'form',
                      onChanged: (String? val) {
                        widget.rxStateClass.onTextEntered(widget.fieldId, val!);
                      },
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
                      color: widget.logginedStarted
                          ? AppColors.greyColor
                          : AppColors.formFieldDisabledColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: BouncingAnimation(
                    onTap: () {
                      widget.evidenceImageModal();
                    },
                    widget: Icon(
                      Icons.add_a_photo,
                      color: AppColors.greyColor.withOpacity(0.5),
                    ),
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
