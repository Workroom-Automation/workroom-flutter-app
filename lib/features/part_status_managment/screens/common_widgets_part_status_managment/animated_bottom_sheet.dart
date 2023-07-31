import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/forms/screens/bottom_sheet_detail.dart';
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

class _AnimatedBottomSheetState extends State<AnimatedBottomSheet>
    with TickerProviderStateMixin {
  bool showDetailModal = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: widget.containerHeight,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(11),
        boxShadow: const [
          BoxShadow(
            color: AppColors.pinnedSheetBoxShadowColor,
            offset: Offset(0, 5),
            blurRadius: 20,
          ),
        ],
      ),
      child: AnimatedCrossFade(
        firstChild: buildExpandedContent(),
        secondChild: buildCollapsedContent(),
        crossFadeState: widget.isExpanded
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 500),
      ),
    );
  }

  Widget buildExpandedContent() {
    if (!showDetailModal) {
      return Sheet(
        callBack: () {
          setState(() {
            showDetailModal = !showDetailModal;
          });
        },
        scrollcontroller: ScrollController(),
      );
    } else {
      return Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                buildCollapsedContent(),
                const Divider(
                  thickness: 3,
                ),
                DisplaySheetTile(
                  title: 'Rejects Review Sheet',
                  status: 'Open',
                  statusColor: AppColors.blueBorderColor,
                  callback: () {
                    setState(() {
                      showDetailModal = !showDetailModal;
                    });
                  },
                ),
                DisplaySheetTile(
                  title: 'Defects Evaluation Sheet',
                  status: 'Saved Progress',
                  statusColor: AppColors.counterBoxReworkColor,
                  callback: () {
                    setState(() {
                      showDetailModal = !showDetailModal;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget buildCollapsedContent() {
    return InkWell(
      splashColor: AppColors.transparent,
      onTap: widget.toggleContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: widget.isExpanded ? 70 : 100,
                child: Center(
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
              ),
            ),
            BouncingAnimation(
              onTap: widget.toggleContainer,
              widget: Container(
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
    );
  }
}
