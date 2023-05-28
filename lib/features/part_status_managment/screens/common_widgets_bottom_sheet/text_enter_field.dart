import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/part_status_managment/bloc/sheet_information_bloc.dart';
import 'package:workroom_flutter_app/features/part_status_managment/bloc/state.dart';

import 'package:workroom_flutter_app/models/sheets/field_properties_model.dart';

class TextSelectField extends StatefulWidget {
  const TextSelectField({
    super.key,
    required this.fieldProperties,
    required this.fieldId,
    required this.sheetInformationModel,
    required this.rxStateClass,
  });
  final FieldProperties fieldProperties;
  final String fieldId;
  final SheetInformationModel sheetInformationModel;
  final RxStateClass rxStateClass;

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
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.fieldProperties.title,
                style: CfTextStyles.getTextStyle(
                  TStyle.h1_600,
                )?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Text',
                      style: CfTextStyles.getTextStyle(
                        TStyle.h1_600,
                      )?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const SizedBox(
                      width: 51,
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Flexible(
                child: Container(
                  height: 51,
                  // width: width * 0.75,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 8),
                    ),
                    onChanged: (String val) {
                      widget.rxStateClass.onTextEntered(widget.fieldId, val);
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                height: 51,
                width: 51,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
