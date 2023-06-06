import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/bottom_sheet_detail.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/common_widgets_bottom_sheet/timer.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/common_widgets_part_status_managment/animated_bottom_sheet.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/common_widgets_part_status_managment/build_header.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/common_widgets_part_status_managment/build_status_tile.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/common_widgets_part_status_managment/input_list_tile.dart';

class PartStatusManagment extends StatefulWidget {
  const PartStatusManagment({super.key});
  static const routeName = '/part_status_managment';

  @override
  State<PartStatusManagment> createState() => _PartStatusManagmentState();
}

class _PartStatusManagmentState extends State<PartStatusManagment> {
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
  bool showDetailModal = true;

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

  // void onNumberChanged(String val) {
  //   setState(() {
  //     value = double.tryParse(val) ?? 0.0;
  //   });
  // }

  // void changleModalState() {
  //   setState(() {
  //     showDetailModal = !showDetailModal;
  //   });
  // }

  double containerHeight = 100;
  bool isExpanded = false;

  void toggleContainer() {
    setState(() {
      if (isExpanded) {
        containerHeight = 100.0;
      } else {
        containerHeight = MediaQuery.of(context).size.height * 0.8;
      }
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Part Status Managment',
      //   ),
      // ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const BuildHeader(
                  title: 'MO-01-A-123-S2',
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTimer(),
                      Container(
                        height: 42,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.greyBorderColor,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            showDialog<dynamic>(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      15,
                                    ), // Set your desired border radius here
                                  ),
                                  backgroundColor: AppColors.whiteColor,
                                  elevation: 0,
                                  child: SizedBox(
                                    height: 300,
                                    width: 700,
                                    // color: AppColors.whiteColor,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: 8,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Input(s) Checker',
                                                    style: CfTextStyles
                                                        .getTextStyle(
                                                      TStyle.h1_600,
                                                    )?.copyWith(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  DecoratedBox(
                                                    decoration: BoxDecoration(
                                                      gradient: AppColors
                                                          .gradientRightToLeft,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5,
                                                      ),
                                                    ),
                                                    child: IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.done,
                                                        color: AppColors
                                                            .whiteColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Divider(),
                                            const InputListTile(
                                              status: 'External',
                                              statusBoxColor: AppColors
                                                  .inputsModalExternalcolor,
                                              title: 'Battery 40kwh',
                                            ),
                                            const Divider(),
                                            const InputListTile(
                                              status: 'External',
                                              statusBoxColor: AppColors
                                                  .inputsModalExternalcolor,
                                              title: 'Lubricant',
                                            ),
                                            const Divider(),
                                            const InputListTile(
                                              status: 'Routing',
                                              statusBoxColor: AppColors
                                                  .inputsModalRoutingcolor,
                                              title: 'Soft Trim Body',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                                // return AlertDialog(
                                //   title: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       const Text('Input(s) checker'),
                                //       Container(
                                //         decoration: BoxDecoration(
                                //           gradient:
                                //               AppColors.gradientRightToLeft,
                                //           borderRadius:
                                //               BorderRadius.circular(5),
                                //         ),
                                //         child: IconButton(
                                //           // style: ButtonStyle(
                                //           //   backgroundColor:
                                //           //       MaterialStateProperty.all(
                                //           //     getColorFromGradient(
                                //           //       AppColors.gradientColors,
                                //           //       0.5,
                                //           //     ),
                                //           //   ),
                                //           //   padding: MaterialStateProperty.all(
                                //           //     EdgeInsets.zero,
                                //           //   ),
                                //           // ),
                                //           onPressed: () {},
                                //           icon: const Icon(
                                //             Icons.done,
                                //             color: AppColors.whiteColor,
                                //           ),
                                //         ),
                                //       )
                                //     ],
                                //   ),
                                //   content: SingleChildScrollView(
                                //     child: Column(
                                //       children: [
                                //         Card(
                                //           child: Padding(
                                //             padding: const EdgeInsets.all(8),
                                //             child: ListTile(
                                //               title: Row(
                                //                 mainAxisAlignment:
                                //                     MainAxisAlignment
                                //                         .spaceBetween,
                                //                 children: [
                                //                   Expanded(
                                //                     child: Text(
                                //                       'Battery 40kWh',
                                //                       style: CfTextStyles
                                //                           .getTextStyle(
                                //                         TStyle.h1_400,
                                //                       )?.copyWith(
                                //                         fontSize: 14,
                                //                         fontWeight:
                                //                             FontWeight.w400,
                                //                         color:
                                //                             AppColors.textColor,
                                //                       ),
                                //                     ),
                                //                   ),
                                //                   Row(
                                //                     children: [
                                //                       IconButton(
                                //                         onPressed: () {},
                                //                         icon: const Icon(
                                //                           Icons.done,
                                //                         ),
                                //                       ),
                                //                       IconButton(
                                //                         onPressed: () {},
                                //                         icon: const Icon(
                                //                           Icons.close,
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ],
                                //               ),
                                //               subtitle: const Text(
                                //                 'External',
                                //                 style: TextStyle(
                                //                   color: Colors.purple,
                                //                 ),
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //         Card(
                                //           child: Padding(
                                //             padding: const EdgeInsets.all(8.0),
                                //             child: ListTile(
                                //                 title: Row(
                                //                   mainAxisAlignment:
                                //                       MainAxisAlignment
                                //                           .spaceBetween,
                                //                   children: [
                                //                     Expanded(
                                //                       child: Text(
                                //                         'Lubricant',
                                //                         style: CfTextStyles
                                //                                 .getTextStyle(
                                //                                     TStyle
                                //                                         .h1_400)
                                //                             ?.copyWith(
                                //                           fontSize: 14,
                                //                           fontWeight:
                                //                               FontWeight.w400,
                                //                           color: AppColors
                                //                               .textColor,
                                //                         ),
                                //                       ),
                                //                     ),
                                //                     Row(
                                //                       children: [
                                //                         IconButton(
                                //                           onPressed: () {},
                                //                           icon:
                                //                               Icon(Icons.done),
                                //                         ),
                                //                         IconButton(
                                //                           onPressed: () {},
                                //                           icon:
                                //                               Icon(Icons.close),
                                //                         ),
                                //                       ],
                                //                     ),
                                //                   ],
                                //                 ),
                                //                 subtitle: Text(
                                //                   'External',
                                //                   style: TextStyle(
                                //                     color: Colors.purple,
                                //                   ),
                                //                 )),
                                //           ),
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                // );
                              },
                            );
                          },
                          icon: Image.asset(
                            AppAssets.inputIcon,
                          ),
                          label: Text(
                            'Inputs',
                            style: CfTextStyles.getTextStyle(TStyle.h1_600)
                                ?.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
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
                BuildStatusTile(title: 'Completed', width: width),
                const SizedBox(
                  height: 141,
                ),
              ],
            ),
          ),
          if (isExpanded)
            InkWell(
              splashColor: AppColors.transparent,
              onTap: toggleContainer,
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            // top: 0,
            child: AnimatedBottomSheet(
              containerHeight: containerHeight,
              isExpanded: isExpanded,
              toggleContainer: toggleContainer,
            ),
          ),

          // DraggableScrollableSheet(
          //   initialChildSize: 0.4,
          //   // maxChildSize: 0.8,
          //   minChildSize: 0.1,
          //   builder: (context, scrollontroller) {
          //     return SingleChildScrollView(
          //       controller: scrollontroller,
          //       child: ColoredBox(
          //         color: AppColors.whiteColor,
          //         child:
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }

  Widget _buildTimer() {
    return Container(
      height: 42,
      width: 92,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.greyBorderColor,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton.icon(
        onPressed: () {},
        icon: Image.asset(AppAssets.timerIcon),
        label: const TimerClass(),
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
                scrollcontroller: ScrollController(),
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
                                  InkWell(
                                    splashColor: AppColors.transparent,
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
