// ignore_for_file: must_be_immutable, avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/all_status.dart';

import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

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
  Map<String, MOStatus> statusMap = {
    'Completed': MOStatus.completed,
    'In Progress': MOStatus.inProgress,
    'On Hold': MOStatus.onHold,
    'Rework': MOStatus.rework,
    'Scrap': MOStatus.scrapped,
    'Reject': MOStatus.rejected,
  };
  Map<MOStatus, Color> colorMap = {
    MOStatus.completed: AppColors.completedStatusColor,
    MOStatus.inProgress: AppColors.inProgressStatusColor,
    MOStatus.onHold: AppColors.onHoldStatusColor,
    MOStatus.rework: AppColors.reworkStatusColor,
    MOStatus.scrapped: AppColors.scrappedStatusColor,
    MOStatus.rejected: AppColors.rejectedStatusColor,
  };

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                offset: const Offset(0, 5), // horizontal, vertical offset
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
