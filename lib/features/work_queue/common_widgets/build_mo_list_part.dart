import 'package:flutter/material.dart';

import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/services/navigation_service/navigation_service.dart';
import 'package:workroom_flutter_app/core/di/injection.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/part_status_managment.dart';
import 'package:workroom_flutter_app/features/work_queue/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/features/work_queue/constants/mo_part_status.dart';
import 'package:workroom_flutter_app/features/work_queue/common_widgets/timeline_modal.dart';

class PartToAttributes {
  PartToAttributes({
    required this.color,
    required this.text,
  });
  Color color;
  String text;
}

class BuildMoListPart extends StatefulWidget {
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

  @override
  State<BuildMoListPart> createState() => _BuildMoListPartState();
}

class _BuildMoListPartState extends State<BuildMoListPart> {
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
    if (widget.status == MoPartStatus.completed ||
        widget.status == MoPartStatus.rejected) {
      return nonOpenStatusPartWidget();
    } else if (widget.status == MoPartStatus.open) {
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
            widget.title,
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
                    splashColor: AppColors.transparent,
                    onTap: () {
                      showDialog<AlertDialog>(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            elevation: 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: SizedBox(
                                width: 600,
                                height: 400,
                                child: Scaffold(
                                  body: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 32,
                                          vertical: 8,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Time Activity',
                                              style: CfTextStyles.getTextStyle(
                                                TStyle.h1_600,
                                              )?.copyWith(
                                                fontSize: 18,
                                              ),
                                            ),
                                            Container(
                                              height: 28,
                                              decoration: BoxDecoration(
                                                color:
                                                    AppColors.greenBorderColor,
                                                border: Border.all(
                                                  color: AppColors
                                                      .greenBorderColor,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'IN TIME',
                                                    style: CfTextStyles
                                                        .getTextStyle(
                                                      TStyle.h1_600,
                                                    )?.copyWith(
                                                      color:
                                                          AppColors.whiteColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 32,
                                          vertical: 12,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'MO1-S1',
                                              style: CfTextStyles.getTextStyle(
                                                TStyle.h1_600,
                                              )?.copyWith(
                                                fontSize: 18,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  AppAssets.runningClockIcon,
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            'Total Time Taken: ',
                                                        style: CfTextStyles
                                                            .getTextStyle(
                                                          TStyle.h1_600,
                                                        )?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .greyColor,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '21 minutes',
                                                        style: CfTextStyles
                                                            .getTextStyle(
                                                          TStyle.h1_600,
                                                        )?.copyWith(),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      const Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 32,
                                            vertical: 12,
                                          ),
                                          child: TimeLineModal(
                                            stauses: [
                                              MoPartStatus.open,
                                              MoPartStatus.inProgress,
                                              MoPartStatus.onHold,
                                              MoPartStatus.completed,
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
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
                    color: partToAttributeMapping[widget.status]!.color,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  color: widget.status == MoPartStatus.completed
                      ? AppColors.greenColor
                      : AppColors.redColor,
                ),
                child: Center(
                  child: Text(
                    partToAttributeMapping[widget.status]!.text,
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
                color: AppColors.iconColor,
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
          title: Text(
            widget.title,
            style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                splashColor: AppColors.transparent,
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
                          style: CfTextStyles.getTextStyle(TStyle.h1_600)
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
