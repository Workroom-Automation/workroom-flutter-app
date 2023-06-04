import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/work_queue/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/features/work_queue/bottom_sheet_work_queue.dart';

class StartOrCompletedInspectionTile extends StatefulWidget {
  const StartOrCompletedInspectionTile({
    super.key,
    required this.isStartInspection,
  });
  final bool isStartInspection;

  @override
  State<StartOrCompletedInspectionTile> createState() =>
      _StartOrCompletedInspectionTileState();
}

class _StartOrCompletedInspectionTileState
    extends State<StartOrCompletedInspectionTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.greyBorderColor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListTile(
          leading: Text(
            'MO-01-A-123-S1',
            style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(),
          ),
          trailing: widget.isStartInspection
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BouncingAnimation(
                      widget: Container(
                        // width: 76,
                        height: 33,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: AppColors.gradientLeftToRight,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.play_arrow_outlined,
                                color: AppColors.tileIconColor,
                              ),
                              Text(
                                'Start Inspection',
                                style: CfTextStyles.getTextStyle(TStyle.h1_700)
                                    ?.copyWith(
                                  color: AppColors.tileTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyBorderColor),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(AppAssets.sheetIcon),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 117,
                      height: 31,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.greenBorderColor,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.greenColor,
                      ),
                      child: Center(
                        child: Text(
                          'QA Passed',
                          style: CfTextStyles.getTextStyle(
                            TStyle.h1_600,
                          )?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
