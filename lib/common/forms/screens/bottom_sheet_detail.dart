import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workroom_flutter_app/common/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/constants/constants.dart';
import 'package:workroom_flutter_app/common/forms/bloc/sheet_information_bloc.dart';
import 'package:workroom_flutter_app/common/forms/bloc/state.dart';
import 'package:workroom_flutter_app/common/forms/screens/common_widgets/multi_select_field.dart';
import 'package:workroom_flutter_app/common/forms/screens/common_widgets/single_select_field.dart';
import 'package:workroom_flutter_app/common/forms/screens/common_widgets/text_enter_field.dart';
import 'package:workroom_flutter_app/common/services/logger_service/logger_service.dart';
import 'package:workroom_flutter_app/common/services/navigation_service/navigation_service.dart';
import 'package:workroom_flutter_app/core/di/injection.dart';
import 'package:workroom_flutter_app/features/part_status_managment/constants/constants.dart';
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

  bool isExpanded = false;
  bool showFullDescription = false;

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
            : Column(
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
                  // ListTile(
                  //   leading: BouncingAnimation(
                  //     onTap: () {
                  //       widget.callBack();
                  //     },
                  //     widget: const Icon(
                  //       Icons.arrow_back_ios_new_rounded,
                  //     ),
                  //   ),
                  //   title: Text(
                  //     '${sheetModel?.name}',
                  //     overflow: TextOverflow.ellipsis,
                  //     style: CfTextStyles.getTextStyle(
                  //       TStyle.h1_600,
                  //     )?.copyWith(
                  //       fontSize: 18,
                  //     ),
                  //   ),
                  //   subtitle: Text(
                  //     '${sheetModel?.description}',
                  //     maxLines: 1,
                  //     overflow: TextOverflow.ellipsis,
                  //     style: CfTextStyles.getTextStyle(
                  //       TStyle.h1_600,
                  //     )?.copyWith(
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.w400,
                  //       color: AppColors.subtitleColor,
                  //     ),
                  //   ),
                  //   trailing: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       if (logginedStarted)
                  //         Row(
                  //           children: [
                  //             BouncingAnimation(
                  //               onTap: () {
                  //                 // what happens when progress is saved
                  //               },
                  //               widget: Container(
                  //                 height: 31,
                  //                 decoration: BoxDecoration(
                  //                   border: Border.all(
                  //                     color: AppColors.greyBorderColor,
                  //                   ),
                  //                   borderRadius: BorderRadius.circular(5),
                  //                 ),
                  //                 child: Padding(
                  //                   padding: const EdgeInsets.symmetric(
                  //                     horizontal: 8,
                  //                   ),
                  //                   child: Center(
                  //                     child: Text(
                  //                       'Save Progress',
                  //                       style: CfTextStyles.getTextStyle(
                  //                         TStyle.h1_600,
                  //                       )?.copyWith(
                  //                         fontSize: 14,
                  //                         fontWeight: FontWeight.w400,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             const SizedBox(
                  //               width: 8,
                  //             ),
                  //             BouncingAnimation(
                  //               onTap: () {
                  //                 // what happens when sheet is submitted
                  //               },
                  //               widget: Container(
                  //                 height: 31,
                  //                 decoration: BoxDecoration(
                  //                   gradient: AppColors.gradientLeftToRight,
                  //                   borderRadius: BorderRadius.circular(5),
                  //                 ),
                  //                 child: Padding(
                  //                   padding: const EdgeInsets.symmetric(
                  //                     horizontal: 8,
                  //                   ),
                  //                   child: Center(
                  //                     child: Text(
                  //                       'Submit Sheet',
                  //                       style: CfTextStyles.getTextStyle(
                  //                         TStyle.h1_600,
                  //                       )?.copyWith(
                  //                         fontSize: 14,
                  //                         color: AppColors.whiteColor,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       if (!logginedStarted)
                  //         BouncingAnimation(
                  //           onTap: () {
                  //             setState(() {
                  //               logginedStarted = true;
                  //             });
                  //           },
                  //           widget: Container(
                  //             height: 31,
                  //             decoration: BoxDecoration(
                  //               gradient: AppColors.gradientLeftToRight,
                  //               borderRadius: BorderRadius.circular(5),
                  //             ),
                  //             child: Padding(
                  //               padding: const EdgeInsets.symmetric(
                  //                 horizontal: 8,
                  //               ),
                  //               child: Center(
                  //                 child: Text(
                  //                   'Start Logging',
                  //                   style: CfTextStyles.getTextStyle(
                  //                     TStyle.h1_600,
                  //                   )?.copyWith(
                  //                     fontSize: 14,
                  //                     color: AppColors.whiteColor,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //     ],
                  //   ),
                  // ),

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
                    subtitle: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showFullDescription = !showFullDescription;
                                  });
                                },
                                child: Text(
                                  showFullDescription
                                      ? '${sheetModel?.description}'
                                      : '${sheetModel?.description.substring(0, sheetModel!.description.length ~/ 4)}...',
                                  style: CfTextStyles.getTextStyle(
                                    TStyle.h1_600,
                                  )?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.subtitleColor,
                                  ),
                                ),
                              ),
                              if ((sheetModel?.description.length ?? 0) >
                                  50) // Adjust the length as needed
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showFullDescription =
                                          !showFullDescription;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      showFullDescription
                                          ? 'Read Less'
                                          : 'Read More',
                                      style: CfTextStyles.getTextStyle(
                                        TStyle.h1_600,
                                      )?.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox.shrink()),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (logginedStarted)
                          Row(
                            children: [
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
                              const SizedBox(
                                width: 8,
                              ),
                              BouncingAnimation(
                                onTap: () {
                                  // what happens when sheet is submitted
                                },
                                widget: Container(
                                  height: 31,
                                  decoration: BoxDecoration(
                                    gradient: AppColors.gradientLeftToRight,
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
                                gradient: AppColors.gradientLeftToRight,
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

                  Expanded(
                    child: SingleChildScrollView(
                      controller: widget.scrollcontroller,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: sheetModel?.sections.length,
                        itemBuilder: (context, index) {
                          return section(
                            sectionModel: (sheetModel?.sections[index])!,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget section({required SectionModel sectionModel}) {
    var index = 0;
    return Column(
      children: [
        const SizedBox(
          height: 18,
        ),
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            border: const Border(
              bottom: BorderSide(
                color: AppColors.greyBorderColor,
              ),
              top: BorderSide(
                color: AppColors.greyBorderColor,
              ),
            ),
            color: logginedStarted
                ? AppColors.basicDetailTileColor
                : AppColors.greyColor.withOpacity(0.15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  sectionModel.name,
                  style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              ...sectionModel.fields.map(
                (fieldModel) {
                  index++;
                  return field(fieldModel: fieldModel, index: index);
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget field({required FieldModel fieldModel, required int index}) {
    if (fieldModel.properties.type == Constants.multiSelect) {
      return StreamBuilder<List<String>>(
        stream: sheetInformationModel
            .selectedOptionsForMultiSelect[fieldModel.id]?.stream,
        builder: (context, snapshotOfSelectedOptions) {
          return StreamBuilder<List<Uint8List>>(
            stream: sheetInformationModel.evidenceImages[fieldModel.id]?.stream,
            builder: (context, snapshotOfimages) {
              return MultiSelectField(
                fieldProperties: fieldModel.properties,
                fieldId: fieldModel.id,
                sheetInformationModel: sheetInformationModel,
                snapshotOfSelectedOptions: snapshotOfSelectedOptions,
                rxStateClass: rxStateClass,
                logginedStarted: logginedStarted,
                index: index,
                evidenceImageModal: showImageDialog,
                noOfImages: snapshotOfimages.data?.length ?? 0,
              );
            },
          );
        },
      );
    } else if (fieldModel.properties.type == Constants.singleSelect) {
      return StreamBuilder<String>(
        stream: sheetInformationModel
            .selectedOptionForSingleSelect[fieldModel.id]?.stream,
        builder: (context, snapshotOfSelectedOption) {
          return StreamBuilder<List<Uint8List>>(
            stream: sheetInformationModel.evidenceImages[fieldModel.id]?.stream,
            builder: (context, snapshotOfimages) {
              return SingleSelectField(
                fieldProperties: fieldModel.properties,
                fieldId: fieldModel.id,
                sheetInformationModel: sheetInformationModel,
                snapshotOfSelectedOption: snapshotOfSelectedOption,
                rxStateClass: rxStateClass,
                logginedStarted: logginedStarted,
                index: index,
                evidenceImageModal: showImageDialog,
                noOfImages: snapshotOfimages.data?.length ?? 0,
              );
            },
          );
        },
      );
    } else if (fieldModel.properties.type == Constants.text) {
      return StreamBuilder<List<Uint8List>>(
        stream: sheetInformationModel.evidenceImages[fieldModel.id]?.stream,
        builder: (context, snapshotOfimages) {
          return TextSelectField(
            fieldProperties: fieldModel.properties,
            fieldId: fieldModel.id,
            sheetInformationModel: sheetInformationModel,
            rxStateClass: rxStateClass,
            logginedStarted: logginedStarted,
            index: index,
            evidenceImageModal: showImageDialog,
            noOfImages: snapshotOfimages.data?.length ?? 0,
          );
        },
      );
    }
    return Container();
  }

  // show modal for image
  void showImageDialog({required String fieldId}) {
    var isEditable = false;
    showDialog<StreamBuilder<List<Uint8List>>>(
      context: context,
      builder: (context) {
        return StreamBuilder<List<Uint8List>>(
          stream: sheetInformationModel.evidenceImages[fieldId]?.stream,
          builder: (context, snapshot) {
            final images =
                sheetInformationModel.evidenceImages[fieldId]?.value ?? [];
            return StatefulBuilder(
              builder: (context, setStateModal) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  actions: [
                    if (!isEditable)
                      OutlinedButton.icon(
                        onPressed: () {
                          if ((snapshot.data?.length ?? 0) > 0) {
                            isEditable = !isEditable;
                            setStateModal(() {});
                          }
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: AppColors.greyColor,
                        ),
                        label: Text(
                          'Edit',
                          style: CfTextStyles.getTextStyle(
                            TStyle.h1_600,
                          )?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    if (isEditable)
                      OutlinedButton.icon(
                        onPressed: () {
                          if ((snapshot.data?.length ?? 0) > 0) {
                            isEditable = !isEditable;
                            setStateModal(() {});
                          }
                        },
                        icon: const Icon(
                          Icons.save,
                          color: AppColors.greyColor,
                        ),
                        label: Text(
                          'Save',
                          style: CfTextStyles.getTextStyle(
                            TStyle.h1_600,
                          )?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                  ],
                  content: SizedBox(
                    height: (snapshot.data?.length ?? 0) == 0 ? 230 : 350,
                    width: 500,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            if ((snapshot.data?.length ?? 0) == 0)
                              OutlinedButton.icon(
                                onPressed: () async {
                                  if (!kIsWeb) {
                                    addImage(images, fieldId);
                                  } else {
                                    final image = await Shared.imagepicker(
                                      ImageSource.gallery,
                                    );
                                    if (image != null) {
                                      images.add(image);
                                      rxStateClass.onImageSelected(
                                        fieldId,
                                        images,
                                      );
                                    }
                                  }
                                },
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
                        if (snapshot.hasData &&
                            (snapshot.data?.isNotEmpty ?? false))
                          SizedBox(
                            height: 150,
                            child: Row(
                              children: [
                                BouncingAnimation(
                                  onTap: () async {
                                    if (!kIsWeb) {
                                      addImage(images, fieldId);
                                    } else {
                                      final image = await Shared.imagepicker(
                                        ImageSource.gallery,
                                      );
                                      if (image != null) {
                                        images.add(image);
                                        rxStateClass.onImageSelected(
                                          fieldId,
                                          images,
                                        );
                                      }
                                    }
                                  },
                                  widget: Image.asset(
                                    'assets/images/add_image_asset.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      return Stack(
                                        children: [
                                          const SizedBox(
                                            height: 150,
                                            width: 150,
                                          ),
                                          Positioned(
                                            top: 15,
                                            bottom: 15,
                                            left: 15,
                                            right: 15,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: SizedBox(
                                                height: 100,
                                                width: 100,
                                                child: BouncingAnimation(
                                                  onTap: () {
                                                    if (isEditable) {
                                                      return;
                                                    }
                                                    showDialog<
                                                        ImagePreviewDialog>(
                                                      context: context,
                                                      builder: (
                                                        BuildContext context,
                                                      ) {
                                                        return ImagePreviewDialog(
                                                          imageUrl: snapshot
                                                              .data![index],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  widget: Image.memory(
                                                    snapshot.data![index],
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (isEditable)
                                            Positioned(
                                              top: 7.5,
                                              right: 7.5,
                                              child: BouncingAnimation(
                                                onTap: () {
                                                  images.removeAt(index);
                                                  rxStateClass.onImageSelected(
                                                    fieldId,
                                                    images,
                                                  );
                                                },
                                                widget: const CircleAvatar(
                                                  radius: 15,
                                                  child: Icon(
                                                    Icons.close_outlined,
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
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
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
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
        );
      },
    );
  }

  void addImage(List<Uint8List> images, String fieldId) {
    showCupertinoModalPopup<AlertDialog>(
      context: context,
      builder: (contex) {
        return AlertDialog(
          title: Text(
            'Select Image',
            style: CfTextStyles.getTextStyle(
              TStyle.h1_600,
            )?.copyWith(
              fontSize: 18,
            ),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BouncingAnimation(
                onTap: () async {
                  getIt<NavigationService>().pop();
                  final image = await Shared.imagepicker(
                    ImageSource.camera,
                  );
                  if (image != null) {
                    images.add(image);
                    rxStateClass.onImageSelected(
                      fieldId,
                      images,
                    );
                  }
                  if (context.mounted) {
                    FocusScope.of(context).unfocus();
                  }
                },
                widget: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    gradient: AppColors.gradientLeftToRight,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              BouncingAnimation(
                onTap: () async {
                  getIt<NavigationService>().pop();
                  final image = await Shared.imagepicker(
                    ImageSource.gallery,
                  );
                  if (image != null) {
                    images.add(image);
                    rxStateClass.onImageSelected(
                      fieldId,
                      images,
                    );
                  }
                  if (context.mounted) {
                    FocusScope.of(context).unfocus();
                  }
                },
                widget: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    gradient: AppColors.gradientLeftToRight,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.photo_library_outlined,
                    color: AppColors.whiteColor,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class ImagePreviewDialog extends StatelessWidget {
  const ImagePreviewDialog({super.key, required this.imageUrl});
  final Uint8List imageUrl;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: GestureDetector(
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.memory(
            imageUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
