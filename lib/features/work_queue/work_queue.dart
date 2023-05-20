import 'package:flutter/material.dart';
// import 'package:workroom_flutter_app/app/app.dart';
import 'package:workroom_flutter_app/common/constants/all_status.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/constants/constants.dart';
import 'package:workroom_flutter_app/common/services/navigation_service/navigation_service.dart';
import 'package:workroom_flutter_app/core/di/injection.dart';
import 'package:workroom_flutter_app/features/work_queue/common_widgets/build_list_tile_completed_or_rejected_mo.dart';
import 'package:workroom_flutter_app/features/work_queue/common_widgets/build_list_tile_open_mo.dart';
import 'package:workroom_flutter_app/features/work_queue/common_widgets/build_mo_header.dart';
import 'package:workroom_flutter_app/features/work_queue/common_widgets/build_status_tile.dart';

class WorkQueuePage extends StatefulWidget {
  const WorkQueuePage({super.key});

  @override
  State<WorkQueuePage> createState() => _WorkQueuePagePageState();
}

class _WorkQueuePagePageState extends State<WorkQueuePage> {
  void pop() {
    getIt<NavigationService>().pop();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: pop,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Work Queue'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const BuildMOHeader(title: 'MO Title & Details'),
                const SizedBox(
                  height: 16,
                ),
                if (constraints.maxWidth >= mobileScreenSizeLimit)
                  SizedBox(
                    height: 54,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BuildStatusTile(
                          width: width,
                          status: 'Completed',
                          count: '0',
                          color: AppColors.counterBoxCompletedColor,
                        ),
                        BuildStatusTile(
                          width: width,
                          status: 'Open',
                          count: '0',
                          color: AppColors.counterBoxOpenColor,
                        ),
                        BuildStatusTile(
                          width: width,
                          status: 'Reject',
                          count: '0',
                          color: AppColors.counterBoxRejectedColor,
                        ),
                        BuildStatusTile(
                          width: width,
                          status: 'Rework',
                          count: '0',
                          color: AppColors.counterBoxReworkColor,
                        ),
                      ],
                    ),
                  )
                else
                  SizedBox(
                    height: 116,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BuildStatusTile(
                              width: width,
                              status: 'Completed',
                              count: '0',
                              color: AppColors.counterBoxCompletedColor,
                            ),
                            BuildStatusTile(
                              width: width,
                              status: 'Open',
                              count: '0',
                              color: AppColors.counterBoxOpenColor,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BuildStatusTile(
                              width: width,
                              status: 'Reject',
                              count: '0',
                              color: AppColors.counterBoxRejectedColor,
                            ),
                            BuildStatusTile(
                              width: width,
                              status: 'Rework',
                              count: '0',
                              color: AppColors.counterBoxReworkColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 37,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        'Manufacturing Order Que ',
                        style:
                            CfTextStyles.getTextStyle(TStyle.h1_700)?.copyWith(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '(10)',
                        style:
                            CfTextStyles.getTextStyle(TStyle.h1_700)?.copyWith(
                          color: AppColors.subtitleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                if (constraints.maxWidth >= mobileScreenSizeLimit)
                  const BuildListTileCompletedOrRejectedMo(
                    status: MOStatus.completed,
                    isMobile: false,
                    title: 'MO-S2',
                    startTime: '11:45 AM',
                    endTime: '12:15 PM',
                  )
                else
                  const BuildListTileCompletedOrRejectedMo(
                    status: MOStatus.completed,
                    isMobile: true,
                    title: 'MO-S2',
                    startTime: '11:45 AM',
                    endTime: '12:15 PM',
                  ),
                if (constraints.maxWidth >= mobileScreenSizeLimit)
                  const BuildListTileCompletedOrRejectedMo(
                    status: MOStatus.rejected,
                    isMobile: false,
                    title: 'MO-S2',
                    startTime: '11:45 AM',
                    endTime: '12:15 PM',
                  )
                else
                  const BuildListTileCompletedOrRejectedMo(
                    status: MOStatus.rejected,
                    isMobile: true,
                    title: 'MO-S2',
                    startTime: '11:45 AM',
                    endTime: '12:15 PM',
                  ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const BuildListTileOpenMO(title: 'MO-S3');
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
