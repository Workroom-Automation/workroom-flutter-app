import 'package:flutter/material.dart';

import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/services/navigation_service/navigation_service.dart';
import 'package:workroom_flutter_app/core/di/injection.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/part_status_managment.dart';
import 'package:workroom_flutter_app/features/work_queue/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/features/work_queue/constants/mo_part_status.dart';

class PartToAttributes {
  PartToAttributes({
    required this.color,
    required this.text,
  });
  Color color;
  String text;
}

class BuildMoListPart extends StatelessWidget {
  BuildMoListPart({
    super.key,
    required this.status,
    required this.isMobile,
    required this.title,
    required this.startTime,
    required this.endTime,
  });
  final MoPartStatus status;
  final bool isMobile;
  final String title;
  final String startTime;
  final String endTime;

  final partToAttributeMapping = {
    MoPartStatus.completed: PartToAttributes(
      color: AppColors.completedStatusColor,
      text: 'Completed',
    ),
    MoPartStatus.inProgress: PartToAttributes(
      color: AppColors.inProgressStatusColor,
      text: 'In Progress',
    ),
    MoPartStatus.onHold: PartToAttributes(
      color: AppColors.onHoldStatusColor,
      text: 'On Hold',
    ),
    MoPartStatus.rework: PartToAttributes(
      color: AppColors.reworkStatusColor,
      text: 'Rework',
    ),
    MoPartStatus.scrapped: PartToAttributes(
      color: AppColors.scrappedStatusColor,
      text: 'Scrap',
    ),
    MoPartStatus.rejected: PartToAttributes(
      color: AppColors.rejectedStatusColor,
      text: 'Reject',
    ),
  };

  @override
  Widget build(BuildContext context) {
    if (status == MoPartStatus.completed || status == MoPartStatus.rejected) {
      return nonOpenStatusPartWidget();
    } else if (status == MoPartStatus.open) {
      return openStatusPartWidget();
    }
    return Container();
  }

  Widget nonOpenStatusPartWidget() {
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
          textColor: AppColors.textColor,
          iconColor: AppColors.iconColor,
          tileColor: AppColors.whiteColor,
          leading: Text(
            title,
            style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greenBorderColor),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Image.asset(AppAssets.qaPassedIcon),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'QA Passed',
                      style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          trailing: Row(
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
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset(AppAssets.timerIcon),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 117,
                height: 31,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: partToAttributeMapping[status]!.color,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  color: status == MoPartStatus.completed
                      ? AppColors.greenColor
                      : AppColors.redColor,
                ),
                child: Center(
                  child: Text(
                    partToAttributeMapping[status]!.text,
                    style: CfTextStyles.getTextStyle(
                      TStyle.h1_600,
                    )?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget openStatusPartWidget() {
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
          textColor: AppColors.textColor,
          iconColor: AppColors.iconColor,
          tileColor: AppColors.whiteColor,
          title: Row(
            children: [
              const Text(
                'Part ID: ',
                style: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 14,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                ),
              )
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  // Handle open button press
                },
                child: Container(
                  width: 76,
                  height: 31,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.blueBorderColor,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.blueColor,
                  ),
                  child: const Center(child: Text('Open')),
                ),
              ),
              const SizedBox(width: 8),
              BouncingAnimation(
                onTap: () {
                  getIt<NavigationService>().pushNamed(
                    PartStatusManagment.routeName,
                  );
                },
                widget: Container(
                  // width: 76,
                  height: 31,
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
                          'Start',
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
              const SizedBox(width: 8),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
      ),
    );
  }
}
