// ignore_for_file: must_be_immutable, avoid_dynamic_calls

import 'package:flutter/material.dart';

import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/part_status_managment/constants/mo_part_status.dart';

class BuildStatusTile extends StatelessWidget {
  BuildStatusTile({
    super.key,
    required this.title,
    required this.width,
    this.onTap,
  });
  final String title;
  final double width;
  Function? onTap;
  Map<String, MoPartStatus> statusMap = {
    'Completed': MoPartStatus.completed,
    'In Progress': MoPartStatus.inProgress,
    'On Hold': MoPartStatus.onHold,
    'Rework': MoPartStatus.rework,
    'Scrap': MoPartStatus.scrapped,
    'Reject': MoPartStatus.rejected,
  };
  Map<MoPartStatus, Color> colorMap = {
    MoPartStatus.completed: AppColors.completedStatusColor,
    MoPartStatus.inProgress: AppColors.inProgressStatusColor,
    MoPartStatus.onHold: AppColors.onHoldStatusColor,
    MoPartStatus.rework: AppColors.reworkStatusColor,
    MoPartStatus.scrapped: AppColors.scrappedStatusColor,
    MoPartStatus.rejected: AppColors.rejectedStatusColor,
  };

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.transparent,
      onTap: onTap == null ? null : () => onTap!(width: width),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 141,
          width: width / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            border: Border.all(
              color: colorMap[statusMap[title]]!,
            ),
            color: colorMap[statusMap[title]],
            boxShadow: [
              BoxShadow(
                color: AppColors.greyColor.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: Text(
              title.toUpperCase(),
              style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                color: AppColors.whiteColor,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
