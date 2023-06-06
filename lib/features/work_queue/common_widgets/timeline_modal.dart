import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/work_queue/constants/mo_part_status.dart';

class PartToAttributes {
  PartToAttributes({
    required this.color,
    required this.text,
  });
  Color color;
  String text;
}

class TimeLineModal extends StatefulWidget {
  const TimeLineModal({super.key, required this.stauses});
  final List<MoPartStatus> stauses;

  @override
  State<TimeLineModal> createState() => _TimeLineModalState();
}

class _TimeLineModalState extends State<TimeLineModal> {
  @override
  Widget build(BuildContext context) {
    final partToAttributeMapping = {
      MoPartStatus.completed: PartToAttributes(
        color: AppColors.completedStatusColor,
        text: 'Completed',
      ),
      MoPartStatus.inProgress: PartToAttributes(
        color: AppColors.inProgressStatusColor,
        text: 'Started',
      ),
      MoPartStatus.onHold: PartToAttributes(
        color: AppColors.onHoldStatusColor,
        text: 'On-Hold',
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
      MoPartStatus.open: PartToAttributes(
        color: AppColors.openStatusColor,
        text: 'Open',
      ),
    };
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TimelineTheme(
          data: TimelineThemeData(),
          child: Timeline.tileBuilder(
            builder: TimelineTileBuilder.connected(
              nodePositionBuilder: (context, index) => 0,
              connectionDirection: ConnectionDirection.before,
              connectorBuilder: (context, index, type) {
                return const DashedLineConnector(
                  color: AppColors.greyBorderColor,
                );
              },
              indicatorBuilder: (context, index) {
                return DotIndicator(
                  color: partToAttributeMapping[widget.stauses[index]]!.color,
                );
              },
              contentsBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        partToAttributeMapping[widget.stauses[index]]!.text,
                        style: CfTextStyles.getTextStyle(TStyle.h1_600),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.greyBorderColor,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'At: ',
                                  style:
                                      CfTextStyles.getTextStyle(TStyle.h1_600)
                                          ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                                TextSpan(
                                  text: '10:58 AM ; 03/03/23',
                                  style:
                                      CfTextStyles.getTextStyle(TStyle.h1_600)
                                          ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: widget.stauses.length,
            ),
          ),
        ),
      ),
    );
  }
}
