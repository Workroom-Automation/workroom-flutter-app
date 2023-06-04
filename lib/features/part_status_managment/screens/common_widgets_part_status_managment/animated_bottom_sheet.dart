import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/bottom_sheet_detail.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/common_widgets_part_status_managment/display_sheet_tile.dart';

class AnimatedBottomSheet extends StatefulWidget {
  const AnimatedBottomSheet({
    super.key,
    required this.containerHeight,
    required this.isExpanded,
    required this.toggleContainer,
  });
  final double containerHeight;
  final bool isExpanded;
  final VoidCallback toggleContainer;

  @override
  State<AnimatedBottomSheet> createState() => _AnimatedBottomSheetState();
}

class _AnimatedBottomSheetState extends State<AnimatedBottomSheet> {
  bool showDetailModal = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // ignore: use_named_constants
      duration: const Duration(),
      height: widget.containerHeight,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        // border: Border.all(color: AppColors.greyBorderColor),
        borderRadius: BorderRadius.circular(11),
        boxShadow: const [
          BoxShadow(
            color: AppColors.pinnedSheetBoxShadowColor,
            offset: Offset(0, 5),
            blurRadius: 20,
          ),
        ],
      ),
      child: !widget.isExpanded
          ? InkWell(
              onTap: widget.toggleContainer,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  'Linked Sheets',
                                  overflow: TextOverflow.ellipsis,
                                  style: CfTextStyles.getTextStyle(
                                    TStyle.h1_600,
                                  )?.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  height: 31,
                                  width: 46,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.greyBorderColor,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '02',
                                      style: CfTextStyles.getTextStyle(
                                        TStyle.h1_600,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: widget.toggleContainer,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Image.asset(
                          widget.isExpanded
                              ? AppAssets.downArrowIcon
                              : AppAssets.upArrowIcon,
                          color: AppColors.iconColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : StatefulBuilder(
              builder: (
                BuildContext context,
                StateSetter setStateModal,
              ) {
                if (!showDetailModal) {
                  return Sheet(
                    callBack: () {
                      setStateModal(() {
                        showDetailModal = !showDetailModal;
                      });
                    },
                    scrollcontroller: ScrollController(),
                  );
                }
                return Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Scaffold(
                    body: SingleChildScrollView(
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
                            height: 8,
                          ),
                          InkWell(
                            onTap: widget.toggleContainer,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Text(
                                                'Linked Sheets',
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    CfTextStyles.getTextStyle(
                                                  TStyle.h1_600,
                                                )?.copyWith(
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Container(
                                                height: 31,
                                                width: 46,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: AppColors
                                                        .greyBorderColor,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(5),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '02',
                                                    style: CfTextStyles
                                                        .getTextStyle(
                                                      TStyle.h1_600,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: widget.toggleContainer,
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      child: Image.asset(
                                        widget.isExpanded
                                            ? AppAssets.downArrowIcon
                                            : AppAssets.upArrowIcon,
                                        color: AppColors.iconColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // const SizedBox(
                          //   height: 16,
                          // ),
                          const Divider(
                            thickness: 3,
                          ),
                          DisplaySheetTile(
                            title: 'Rejects Review Sheet',
                            status: 'Open',
                            statusColor: AppColors.blueBorderColor,
                            callback: () {
                              setStateModal(() {
                                showDetailModal = !showDetailModal;
                              });
                            },
                          ),
                          DisplaySheetTile(
                            title: 'Defects Evaluation Sheet',
                            status: 'Saved Progress',
                            statusColor: AppColors.counterBoxReworkColor,
                            callback: () {
                              setStateModal(() {
                                showDetailModal = !showDetailModal;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
