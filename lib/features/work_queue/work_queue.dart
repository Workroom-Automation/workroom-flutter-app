import 'package:flutter/material.dart';
// import 'package:workroom_flutter_app/app/app.dart';
import 'package:workroom_flutter_app/common/constants/all_status.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/constants/constants.dart';
import 'package:workroom_flutter_app/common/services/navigation_service/navigation_service.dart';
import 'package:workroom_flutter_app/common/widgets/bottom_navigation_bar.dart';
import 'package:workroom_flutter_app/core/di/injection.dart';
import 'package:workroom_flutter_app/features/work_queue/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/features/work_queue/bottom_sheet_work_queue.dart';
import 'package:workroom_flutter_app/features/work_queue/common_widgets/animated_detail_sheet.dart';
import 'package:workroom_flutter_app/features/work_queue/common_widgets/build_list_tile_completed_or_rejected_mo.dart';
import 'package:workroom_flutter_app/features/work_queue/common_widgets/build_list_tile_open_mo.dart';
import 'package:workroom_flutter_app/features/work_queue/common_widgets/build_mo_header.dart';
import 'package:workroom_flutter_app/features/work_queue/common_widgets/build_status_tile.dart';
import 'package:workroom_flutter_app/features/work_queue/common_widgets/inspection%20queue%20widgets/start__or_completed_inspection_tile.dart';
import 'package:workroom_flutter_app/features/work_queue/common_widgets/pending_or_submitted_status_tile.dart';

class WorkQueuePage extends StatefulWidget {
  const WorkQueuePage({super.key});

  @override
  State<WorkQueuePage> createState() => _WorkQueuePagePageState();
}

class _WorkQueuePagePageState extends State<WorkQueuePage> {
  void pop() {
    getIt<NavigationService>().pop();
  }

  double containerHeight = 0;
  bool isExpanded = false;
  bool isProductionQueueSelected = true;

  void toggleContainer() {
    setState(() {
      if (isExpanded) {
        containerHeight = 0;
      } else {
        containerHeight = 120;
      }
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
                BuildMOHeader(
                  title: 'MO Title & Details',
                  toggleContainer: toggleContainer,
                  isExpanded: isExpanded,
                ),
                AnimatedMoDetail(
                  height: containerHeight,
                  isExpanded: isExpanded,
                ),
                if (constraints.maxWidth >= mobileScreenSizeLimit)
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.statusTileBackgroundContainerColor,
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.greyBorderColor,
                        ),
                      ),
                    ),
                    height: 136,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                        Expanded(
                          flex: 4,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: AppColors.greyBorderColor,
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                PendingOrSubmittedStatusTile(
                                  color: AppColors.red,
                                  count: '02',
                                  status: 'Pending Sheets',
                                  width: width,
                                ),
                                PendingOrSubmittedStatusTile(
                                  color: AppColors.greyColor,
                                  count: '02',
                                  status: 'Submitted Sheets',
                                  width: width,
                                )
                              ],
                            ),
                          ),
                        )
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
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isProductionQueueSelected = true;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut, // Apply a curve animation
                          decoration: BoxDecoration(
                            color: isProductionQueueSelected
                                ? const Color.fromRGBO(217, 217, 217, 0.38)
                                : Colors.transparent,
                            border: Border.all(
                              color: isProductionQueueSelected
                                  ? AppColors.greyBorderColor
                                  : Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              'Production Queue',
                              style: CfTextStyles.getTextStyle(TStyle.h1_600)
                                  ?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isProductionQueueSelected = false;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                            color: !isProductionQueueSelected
                                ? const Color.fromRGBO(217, 217, 217, 0.38)
                                : Colors.transparent,
                            border: Border.all(
                              color: !isProductionQueueSelected
                                  ? AppColors.greyBorderColor
                                  : Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              'Inspection Queue',
                              style: CfTextStyles.getTextStyle(TStyle.h1_600)
                                  ?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                if (isProductionQueueSelected)
                  Column(
                    children: [
                      const BuildListTileCompletedOrRejectedMo(
                        status: MOStatus.completed,
                        isMobile: false,
                        title: 'MO-S2',
                        startTime: '11:45 AM',
                        endTime: '12:15 PM',
                      ),
                      const BuildListTileCompletedOrRejectedMo(
                        status: MOStatus.rejected,
                        isMobile: false,
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
                if (!isProductionQueueSelected)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Divider(),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      BouncingAnimation(
                        onTap: () {
                          showModalBottomSheet<dynamic>(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => const BottomSheetWorkQueue(),
                          );
                        },
                        widget: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: AppColors.gradientLeftToRight,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Select Part',
                                  style:
                                      CfTextStyles.getTextStyle(TStyle.h1_600)
                                          ?.copyWith(
                                    color: AppColors.whiteColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'No parts inspected. Select a part and start inspection.',
                          style: CfTextStyles.getTextStyle(TStyle.h1_600)
                              ?.copyWith(
                            fontStyle: FontStyle.italic,
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const StartOrCompletedInspectionTile(
                        isStartInspection: true,
                      ),
                      const StartOrCompletedInspectionTile(
                        isStartInspection: false,
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
