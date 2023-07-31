import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rxdart/rxdart.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/constants/constants.dart';
import 'package:workroom_flutter_app/common/services/logger_service/logger_service.dart';
import 'package:workroom_flutter_app/features/access_screen/access_detail_screen.dart';
import 'package:workroom_flutter_app/features/access_screen/access_sceeen_widgets/app_box.dart';
import 'package:workroom_flutter_app/features/access_screen/bloc/models/workroom_mappings.dart';
import 'package:workroom_flutter_app/features/access_screen/bloc/state/workroom_application_mapping_state.dart';

import 'access_sceeen_widgets/search_box.dart';

class AccessScreen extends StatefulWidget {
  const AccessScreen({super.key});

  @override
  State<AccessScreen> createState() => _AccessScreenState();
}

class _AccessScreenState extends State<AccessScreen> {
  final workRoomAppLicationMappingState = WorkRoomAppLicationMappingState();
  bool showAccessDetail = false;
  bool isLoading = true;
  bool dataFetched = false;
  late Map<String, List<Application>> workRoomAppLicationMap;

  void backToaccessScreen() {
    setState(() {
      showAccessDetail = false;
    });
  }

  @override
  void didChangeDependencies() {
    if (dataFetched) {
      return;
    }
    dataFetched = true;
    setState(() {
      isLoading = true;
    });
    getData();

    super.didChangeDependencies();
  }

  Future<void> getData() async {
    await workRoomAppLicationMappingState.fetchDataFromApi().then((value) {
      workRoomAppLicationMap =
          workRoomAppLicationMappingState.workRoomAppLicationMap;
      Future.delayed(const Duration(seconds: 1)).then((value) {
        setState(() {
          isLoading = false;
        });
      });
    });

    AppLogger.printLog(workRoomAppLicationMap.keys);
  }

  @override
  Widget build(BuildContext context) {
    return !showAccessDetail
        ? Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: AppColors.gradientLeftToRight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Apps',
                          style: CfTextStyles.getTextStyle(TStyle.h1_600)
                              ?.copyWith(
                            fontSize: 20,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SearchBox(),
                  const SizedBox(height: 20),
                  if (isLoading)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Center(
                        child: Shared.loading(),
                      ),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: workRoomAppLicationMap.length,
                      itemBuilder: (context, index) {
                        final workRoomId =
                            workRoomAppLicationMap.keys.elementAt(index);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                workRoomAppLicationMap[workRoomId]![index]
                                    .workroom
                                    .name,
                                style: CfTextStyles.getTextStyle(
                                  TStyle.h1_600,
                                )?.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.greyColor,
                                ),
                              ),
                              const SizedBox(height: 20),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  var columns =
                                      (constraints.maxWidth / 180).floor();
                                  columns = columns > 0 ? columns : 1;
                                  return MasonryGridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: columns,
                                    ),
                                    itemCount:
                                        workRoomAppLicationMap[workRoomId]!
                                            .length,
                                    itemBuilder: (context, indexOfApp) {
                                      return AppBox(
                                        title: workRoomAppLicationMap[
                                                workRoomId]![indexOfApp]
                                            .name,
                                      );
                                    },
                                  );
                                },
                              ),
                              const Divider(
                                color: AppColors.greyBorderColor,
                              ),
                            ],
                          ),
                        );
                      },
                    )

                  // StreamBuilder<WorkroomApplicationMappings>(
                  //   stream: workRoomAppLicationMappingState
                  //       .workroomApplicationMappingsStream,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState ==
                  //         ConnectionState.waiting) {
                  //       return Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           SizedBox(
                  //             height:
                  //                 MediaQuery.of(context).size.height * 0.8,
                  //             child: Center(
                  //               child: Shared.loading(),
                  //             ),
                  //           ),
                  //         ],
                  //       );
                  //     }
                  //     if (snapshot.hasError) {
                  //       return const Center(
                  //         child: Text('Something went wrong'),
                  //       );
                  //     }
                  //     final data = snapshot.data;
                  //     return Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 24),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           const SizedBox(height: 10),
                  //           const SearchBox(),
                  //           ListView.builder(
                  //             shrinkWrap: true,
                  //             physics: const NeverScrollableScrollPhysics(),
                  //             itemCount: data!.mappings.length,
                  //             itemBuilder: (context, indexOfMapping) {
                  //               return Column(
                  //                 crossAxisAlignment:
                  //                     CrossAxisAlignment.start,
                  //                 children: [
                  //                   const SizedBox(height: 20),
                  //                   Text(
                  //                     data.mappings[0].workroom.name,
                  //                     style: CfTextStyles.getTextStyle(
                  //                       TStyle.h1_600,
                  //                     )?.copyWith(
                  //                       fontSize: 14,
                  //                       fontWeight: FontWeight.w400,
                  //                       color: AppColors.greyColor,
                  //                     ),
                  //                   ),
                  //                   const SizedBox(height: 10),
                  //                   MasonryGridView.builder(
                  //                     shrinkWrap: true,
                  //                     physics:
                  //                         const NeverScrollableScrollPhysics(),
                  //                     itemCount: data
                  //                         .mappings[indexOfMapping]
                  //                         .applications
                  //                         .length,
                  //                     gridDelegate:
                  //                         const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  //                       crossAxisCount: 4,
                  //                     ),
                  //                     itemBuilder: (context, indexOfApp) {
                  //                       return AppBox(
                  //                         title: data
                  //                             .mappings[indexOfMapping]
                  //                             .applications[indexOfApp]
                  //                             .name,
                  //                       );
                  //                     },
                  //                   ),
                  //                   const Divider(
                  //                     color: AppColors.greyBorderColor,
                  //                   ),
                  //                 ],
                  //               );
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          )
        : AccessDetailScreen(
            title: 'Incoming Mo',
            backToaccessScreen: backToaccessScreen,
          );
  }
}
