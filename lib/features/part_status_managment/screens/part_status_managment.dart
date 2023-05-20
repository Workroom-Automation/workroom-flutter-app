// ignore_for_file: avoid_dynamic_calls, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/bottom_sheet_detail.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/common_widgets_bottom_sheet/timer.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/common_widgets_part_status_managment/build_header.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/common_widgets_part_status_managment/build_status_tile.dart';

class PartStatusManagment extends StatefulWidget {
  const PartStatusManagment({super.key});

  @override
  State<PartStatusManagment> createState() => _PartStatusManagmentState();
}

class _PartStatusManagmentState extends State<PartStatusManagment> {
  Color getColorFromGradient(List<Color> colors, double position) {
    if (colors.isEmpty) return Colors.transparent;
    if (position <= 0) return colors.first;
    if (position >= 1) return colors.last;

    final segment = 1 / (colors.length - 1);
    final index = (position / segment).floor();
    final t = (position - index * segment) / segment;

    return Color.lerp(colors[index], colors[index + 1], t)!;
  }

  // String _selectedItem = 'Completed';
  // final List<String> options = [
  //   'Oil Leakage',
  //   'Option 2',
  //   'Option 3',
  //   'option 4',
  // ];

  List<String> selectedOptions = [];
  List<String> selectedOptionSingle = [];
  double value = 0;
  bool showDetailModal = false;

  // SheetModel? sheetModel;
  // SheetInformationModel? sheetInformationModel;
  // RxStateClass rxStateClass = getIt<RxStateClass>();

  @override
  void initState() {
    // AppLogger.printLog(
    //   rxStateClass.getInformationModel.toString(),
    //   tag: 'Part Status Managment Init',
    // );
    // rxStateClass.updateStream();
    // rxStateClass.sheetModelStream.listen((event) {
    //   setState(() {
    // sheetModel = event;
    //   });
    // });
    // sheetInformationModel = rxStateClass.getInformationModel;
    super.initState();
  }

  void onNumberChanged(String val) {
    setState(() {
      value = double.tryParse(val) ?? 0.0;
    });
  }

  void changleModalState() {
    setState(() {
      showDetailModal = !showDetailModal;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Part Status Managment'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BuildHeader(
              title: 'MO-S1',
            ),
            const SizedBox(
              height: 20,
            ),
            _buildTimer(),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: BuildStatusTile(title: 'On Hold', width: width),
                ),
                Expanded(
                  child: BuildStatusTile(
                    title: 'Reject',
                    width: width,
                    onTap: showBottomSheetWidget,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: BuildStatusTile(title: 'Rework', width: width),
                ),
                Expanded(
                  child: BuildStatusTile(title: 'Scrap', width: width),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            BuildStatusTile(title: 'Completed', width: width)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded),
            label: 'Actions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pageview_outlined),
            label: 'Access',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            label: 'More',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: getColorFromGradient(AppColors.gradientColors, 0.5),
        unselectedItemColor: AppColors.greyColor,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        onTap: (index) {},
      ),
    );
  }

  Widget _buildTimer() {
    return Container(
      height: 42,
      width: 125,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.timerBorderColor,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(
            Icons.timer,
            color: AppColors.timericonColor,
          ),
          TimerClass(),
        ],
      ),
    );
  }

  void showBottomSheetWidget({required double width}) {
    showModalBottomSheet<dynamic>(
      // isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (
            BuildContext context,
            StateSetter setStateModal,
          ) {
            if (!showDetailModal) {
              return Sheet(
                callBack: () {
                  setStateModal(() {
                    showDetailModal = !showDetailModal;
                  });
                },
              );
            }
            return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: Scaffold(
                backgroundColor: AppColors.transparent,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Spacer(),
                          Expanded(
                            child: Divider(
                              thickness: 3,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.notes,
                                      size: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Rejects Review Sheet (Now we will expand this to capture all the rejects)',
                                      overflow: TextOverflow.ellipsis,
                                      style: CfTextStyles.getTextStyle(
                                        TStyle.h1_700,
                                      )?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textColor,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Purpose of this sheet is to capture the reasons for rejecting a shaft for future reviews & RCA.',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.greyColor,
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          title: const Text(
                            'This is a Title',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text(
                              'loggined resumed',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
