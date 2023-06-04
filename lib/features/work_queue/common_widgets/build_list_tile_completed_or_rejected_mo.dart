import 'package:flutter/material.dart';

import 'package:workroom_flutter_app/common/constants/all_status.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/work_queue/test.dart';

class BuildListTileCompletedOrRejectedMo extends StatelessWidget {
  const BuildListTileCompletedOrRejectedMo({
    super.key,
    required this.status,
    required this.isMobile,
    required this.title,
    required this.startTime,
    required this.endTime,
  });
  final MOStatus status;
  final bool isMobile;
  final String title;
  final String startTime;
  final String endTime;

  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8),
  //     child: ListTile(
  //       textColor: AppColors.textColor,
  //       iconColor: AppColors.iconColor,
  //       tileColor: AppColors.tileColor,
  //       title: isMobile
  //           ? Row(
  //               children: [
  //                 const Text(
  //                   'Part ID: ',
  //                   style: TextStyle(
  //                     color: AppColors.greyColor,
  //                     fontSize: 14,
  //                   ),
  //                 ),
  //                 Text(
  //                   title,
  //                   style: const TextStyle(
  //                     fontSize: 14,
  //                   ),
  //                 )
  //               ],
  //             )
  //           : Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               children: [
  //                 Expanded(
  //                   child: Row(
  //                     children: [
  //                       const Text(
  //                         'Part ID: ',
  //                         style: TextStyle(
  //                           color: AppColors.greyColor,
  //                           fontSize: 14,
  //                         ),
  //                       ),
  //                       Text(
  //                         title,
  //                         style: const TextStyle(
  //                           fontSize: 14,
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //                 Expanded(
  //                   child: Row(
  //                     children: [
  //                       const Text(
  //                         'Start: ',
  //                         style: TextStyle(
  //                           color: AppColors.greyColor,
  //                           fontSize: 14,
  //                         ),
  //                       ),
  //                       Text(
  //                         startTime,
  //                         style: const TextStyle(
  //                           fontSize: 14,
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //                 Expanded(
  //                   child: Row(
  //                     children: [
  //                       const Text(
  //                         'End: ',
  //                         style: TextStyle(
  //                           color: AppColors.greyColor,
  //                           fontSize: 14,
  //                         ),
  //                       ),
  //                       Text(
  //                         startTime,
  //                         style: const TextStyle(
  //                           fontSize: 14,
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //       subtitle: isMobile
  //           ? Column(
  //               children: [
  //                 Row(
  //                   children: [
  //                     const Text(
  //                       'Start: ',
  //                       style: TextStyle(
  //                         color: AppColors.greyColor,
  //                       ),
  //                     ),
  //                     Text(startTime)
  //                   ],
  //                 ),
  //                 Row(
  //                   children: [
  //                     const Text(
  //                       'End:   ',
  //                       style: TextStyle(
  //                         color: AppColors.greyColor,
  //                       ),
  //                     ),
  //                     Text(endTime)
  //                   ],
  //                 ),
  //               ],
  //             )
  //           : null,
  //       trailing: InkWell(
  //         onTap: () {
  //           // Handle open button press
  //         },
  //         child: Container(
  //           width: 117,
  //           height: 31,
  //           decoration: BoxDecoration(
  //             border: Border.all(
  //               color: status == MOStatus.completed
  //                   ? AppColors.greenBorderColor
  //                   : AppColors.redBorderColor,
  //             ),
  //             borderRadius: BorderRadius.circular(5),
  //             color: status == MOStatus.completed
  //                 ? AppColors.greenColor
  //                 : AppColors.redColor,
  //           ),
  //           child: status == MOStatus.completed
  //               ? const Center(child: Text('Completed'))
  //               : Center(
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: const [
  //                       Icon(
  //                         Icons.access_time,
  //                         size: 20,
  //                       ),
  //                       Text('Rejected'),
  //                     ],
  //                   ),
  //                 ),
  //         ),
  //       ),
  //     ),
  //   );
// }

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
          textColor: AppColors.textColor,
          iconColor: AppColors.iconColor,
          tileColor: AppColors.whiteColor,
          leading: Text(
            'MO-01-A-123-S1',
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
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => SizedBox(
                          height: 500,
                          width: 500,
                          child: CustomAlertDialog(),
                        ),
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
                    color: status == MOStatus.completed
                        ? AppColors.greenBorderColor
                        : AppColors.redBorderColor,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  color: status == MOStatus.completed
                      ? AppColors.greenColor
                      : AppColors.redColor,
                ),
                child: status == MOStatus.completed
                    ? Center(
                        child: Text(
                          'Completed',
                          style: CfTextStyles.getTextStyle(
                            TStyle.h1_600,
                          )?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          'Rejected',
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
}
