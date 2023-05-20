// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/constants.dart';
import 'package:workroom_flutter_app/features/part_status_managment/bloc/sheet_information_bloc.dart';
import 'package:workroom_flutter_app/features/part_status_managment/bloc/state.dart';
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(widget.fieldProperties.title),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('Single Select'),
                    SizedBox(
                      width: 8,
                    ),
                    SizedBox(
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
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 51,
                          // width: width * 0.75,
                          child: ListView(
                            // shrinkWrap: true,
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
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                            )
                                          : const BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        child: Center(
                                          child: Text(
                                            widget.snapshotOfSelectedOption
                                                    .data ??
                                                '',
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
                      PopupMenuButton<String>(
                        itemBuilder: (BuildContext context) {
                          return widget.sheetInformationModel
                                  .optionsForSingleSelect[widget.fieldId]
                                  ?.map((String option) {
                                return PopupMenuItem<String>(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList() ??
                              [];
                        },
                        onSelected: (String newValue) {
                          setState(() {
                            if (widget
                                    .sheetInformationModel
                                    .selectedOptionForSingleSelect[
                                        widget.fieldId]!
                                    .value ==
                                newValue) {
                              Shared.toast(context, 'Already Selected');
                            } else {
                              widget.rxStateClass
                                  .onOptionSelectedSingleSelectField(
                                widget.fieldId,
                                newValue,
                              );
                            }
                          });
                        },
                        child: const Icon(
                          Icons.arrow_drop_down,
                        ),
                      ),
                    ],
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
