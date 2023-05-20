import 'package:flutter/material.dart';

import 'package:workroom_flutter_app/features/part_status_managment/bloc/sheet_information_bloc.dart';
import 'package:workroom_flutter_app/features/part_status_managment/bloc/state.dart';
import 'package:workroom_flutter_app/models/sheets/field_properties_model.dart';

class MultiSelectField extends StatefulWidget {
  const MultiSelectField({
    super.key,
    required this.fieldProperties,
    required this.fieldId,
    required this.sheetInformationModel,
    required this.snapshotOfSelectedOptions,
    required this.rxStateClass,
  });
  final FieldProperties fieldProperties;
  final String fieldId;
  final SheetInformationModel sheetInformationModel;
  final AsyncSnapshot<List<String>> snapshotOfSelectedOptions;
  final RxStateClass rxStateClass;

  @override
  State<MultiSelectField> createState() => _MultiSelectFieldState();
}

class _MultiSelectFieldState extends State<MultiSelectField> {
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
                    Text('Multi Select'),
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
                            children: widget.snapshotOfSelectedOptions.data
                                    ?.map((option) {
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
                                            border: Border.all(),
                                            borderRadius: BorderRadius.circular(
                                              11,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                            ),
                                            child: Center(
                                              child: Text(option),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList() ??
                                [],
                          ),
                        ),
                      ),
                      PopupMenuButton<String>(
                        itemBuilder: (BuildContext context) {
                          // return widget.snapshotOfOptions.data
                          //         ?.map((String option) {
                          //       return PopupMenuItem<String>(
                          //         value: option,
                          //         child: Text(option),
                          //       );
                          //     }).toList() ??
                          //     [];
                          return widget.sheetInformationModel
                                  .optionsForMultiSelect[widget.fieldId]
                                  ?.map((String option) {
                                return PopupMenuItem<String>(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList() ??
                              [];
                        },
                        onSelected: (String value) {
                          final vals =
                              widget.snapshotOfSelectedOptions.data ?? [];
                          if (vals.contains(value)) {
                            vals.remove(value);
                          } else {
                            vals.add(value);
                          }
                          widget.rxStateClass.onOptionSelectedMultiSelectField(
                            widget.fieldId,
                            vals,
                          );
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
