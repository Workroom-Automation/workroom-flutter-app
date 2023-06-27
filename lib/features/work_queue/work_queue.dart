import 'package:flutter/material.dart';
// import 'package:workroom_flutter_app/app/app.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/constants/constants.dart';
import 'package:workroom_flutter_app/common/services/navigation_service/navigation_service.dart';
import 'package:workroom_flutter_app/core/di/injection.dart';
import 'package:workroom_flutter_app/features/work_queue/common_widgets/animated_detail_sheet.dart';
import 'package:workroom_flutter_app/features/work_queue/common_widgets/build_mo_header.dart';
import 'package:workroom_flutter_app/features/work_queue/common_widgets/build_status_tile.dart';
import 'package:workroom_flutter_app/features/work_queue/common_widgets/pending_or_submitted_status_tile.dart';
import 'package:workroom_flutter_app/features/work_queue/inspection_part_list_bottom_sheet.dart';
import 'package:workroom_flutter_app/features/work_queue/inspection_work_queue.dart';
import 'package:workroom_flutter_app/features/work_queue/production_work_queue.dart';

class WorkQueuePage extends StatefulWidget {
  const WorkQueuePage({super.key});
  static const routeName = '/work_queue';

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

  Map<String, bool> isSelected = {
    'Completed': false,
    'Open': false,
    'Reject': false,
    'Pending': false,
    'Submitted': false,
    'Rework': false,
  };

  void onStatusTap(String status) {
    setState(() {
      isSelected = {
        'Completed': false,
        'Open': false,
        'Reject': false,
        'Pending': false,
        'Submitted': false,
        'Rework': false,
      };
      isSelected[status] = !(isSelected[status] as bool);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   leading: IconButton(
      //     onPressed: pop,
      //     icon: const Icon(Icons.arrow_back_ios),
      //   ),
      //   title: const Text('Work Queue'),
      // ),
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
                                    ontapFunction: onStatusTap,
                                    isSelected: isSelected['Completed']!,
                                  ),
                                  BuildStatusTile(
                                    width: width,
                                    status: 'Open',
                                    count: '0',
                                    color: AppColors.counterBoxOpenColor,
                                    ontapFunction: onStatusTap,
                                    isSelected: isSelected['Open']!,
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
                                    ontapFunction: onStatusTap,
                                    isSelected: isSelected['Reject']!,
                                  ),
                                  BuildStatusTile(
                                    width: width,
                                    status: 'Rework',
                                    count: '0',
                                    color: AppColors.counterBoxReworkColor,
                                    ontapFunction: onStatusTap,
                                    isSelected: isSelected['Rework']!,
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
                              ontapFunction: onStatusTap,
                              isSelected: isSelected['Completed']!,
                            ),
                            BuildStatusTile(
                              width: width,
                              status: 'Open',
                              count: '0',
                              color: AppColors.counterBoxOpenColor,
                              ontapFunction: onStatusTap,
                              isSelected: isSelected['Open']!,
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
                              ontapFunction: onStatusTap,
                              isSelected: isSelected['Reject']!,
                            ),
                            BuildStatusTile(
                              width: width,
                              status: 'Rework',
                              count: '0',
                              color: AppColors.counterBoxReworkColor,
                              ontapFunction: onStatusTap,
                              isSelected: isSelected['Rework']!,
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
                      InkWell(
                        splashColor: AppColors.transparent,
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
                      InkWell(
                        splashColor: AppColors.transparent,
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
                  const ProductionWorkQueue()
                else
                  const InspectionWorkQueue(),
              ],
            ),
          );
        },
      ),
      // bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: !isProductionQueueSelected
          ? DecoratedBox(
              decoration: BoxDecoration(
                gradient: AppColors.gradientLeftToRight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: FloatingActionButton.extended(
                elevation: 0,
                splashColor: AppColors.transparent,
                focusColor: AppColors.transparent,
                hoverColor: AppColors.transparent,
                foregroundColor: AppColors.transparent,
                onPressed: () {
                  showModalBottomSheet<dynamic>(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => const InspectionPartListBottomSheet(
                      isRadioDisabled: false,
                    ),
                  );
                },
                label: Text(
                  'Select Part',
                  style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                backgroundColor: AppColors.transparent,
              ),
            )
          : const SizedBox.shrink(),

      // floatingActionButton: !isProductionQueueSelected
      //     ? DecoratedBox(

      //         decoration: BoxDecoration(
      //           gradient: AppColors.gradientLeftToRight,
      //           shape: BoxShape.circle,
      //         ),
      //         child: FloatingActionButton(
      //           splashColor: AppColors.transparent,
      //           focusColor: AppColors.transparent,
      //           foregroundColor: AppColors.transparent,
      //           onPressed: () {
      //             showModalBottomSheet<dynamic>(
      //               context: context,
      //               isScrollControlled: true,
      //               builder: (context) => const InspectionPartListBottomSheet(
      //                 isRadioDisabled: false,
      //               ),
      //             );
      //           },
      //           backgroundColor: Colors.transparent,
      //           elevation: 0,
      //           child: const Icon(
      //             Icons.add,
      //             color: AppColors.whiteColor,
      //           ),
      //         ),
      //       )
      //     : const SizedBox.shrink(),
    );
  }
}
