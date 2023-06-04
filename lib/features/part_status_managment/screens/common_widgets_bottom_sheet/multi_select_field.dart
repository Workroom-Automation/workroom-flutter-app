import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

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
                      'Multi Select',
                      style: CfTextStyles.getTextStyle(
                        TStyle.h1_600,
                      )?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (widget.fieldProperties.is_required)
                      Text(
                        '*',
                        style: CfTextStyles.getTextStyle(
                          TStyle.h1_600,
                        )?.copyWith(
                          fontSize: 14,
                          color: AppColors.red,
                        ),
                      )
                    else
                      const SizedBox.shrink(),
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
                                              child: Text(
                                                option,
                                                style:
                                                    CfTextStyles.getTextStyle(
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
                                  child: Text(
                                    option,
                                    style: CfTextStyles.getTextStyle(
                                      TStyle.h1_600,
                                    )?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
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
                    onPressed: () {
                      showDialog<dynamic>(
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
                                          color: AppColors.iconColor,
                                        ),
                                        label: Text(
                                          'Add Evidence Image',
                                          style: CfTextStyles.getTextStyle(
                                            TStyle.h1_600,
                                          )?.copyWith(
                                            fontSize: 14,
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
                    },
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
