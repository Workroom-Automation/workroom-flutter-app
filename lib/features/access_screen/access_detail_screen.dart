import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/access_screen/access_sceeen_widgets/alert_box.dart';
import 'package:workroom_flutter_app/features/access_screen/access_sceeen_widgets/animated_bottom_sheet.dart';
import 'package:workroom_flutter_app/features/access_screen/access_sceeen_widgets/dropdown.dart';
import 'package:workroom_flutter_app/features/access_screen/access_sceeen_widgets/search_box.dart';
import 'package:workroom_flutter_app/features/access_screen/access_sceeen_widgets/sheet_tile.dart';

class AccessDetailScreen extends StatefulWidget {
  const AccessDetailScreen(
      {super.key, required this.title, required this.backToaccessScreen});
  final String title;
  final VoidCallback backToaccessScreen;

  @override
  State<AccessDetailScreen> createState() => _AccessDetailScreenState();
}

class _AccessDetailScreenState extends State<AccessDetailScreen> {
  bool isVisible = false;
  double containerHeight = 0;
  bool isExpanded = false;

  void toggleContainer() {
    setState(() {
      if (isExpanded) {
        containerHeight = 0;
      } else {
        containerHeight = MediaQuery.of(context).size.height * 0.8;
      }
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                    child: Row(
                      children: [
                        BouncingAnimation(
                          widget: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.whiteColor,
                          ),
                          onTap: () {
                            widget.backToaccessScreen();
                          },
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Image.asset(
                          AppAssets.accessDetailStationIcon,
                          color: AppColors.whiteColor,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.title,
                            style: CfTextStyles.getTextStyle(TStyle.h1_600)
                                ?.copyWith(
                              fontSize: 20,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          SearchBox(),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                DropDown(
                                  hint: 'Select a Product',
                                  options: ['Option 1', 'Option 2'],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                DropDown(
                                  hint: 'Select a station',
                                  options: ['Option 1', 'Option 2'],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: AppColors.transparent,
                            highlightColor: AppColors.transparent,
                            onTap: toggleContainer,
                            onDoubleTap: () {
                              setState(() {
                                isVisible = !isVisible;
                              });

                              if (isVisible) {
                                Future.delayed(const Duration(seconds: 3), () {
                                  setState(() {
                                    isVisible = false;
                                  });
                                });
                              }
                            },
                            child: const SheetBox(
                              title: 'Safety & Regulatory Compliance ',
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
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
            bottom: 20,
            right: 20,
            left: 20,
            child: AnimatedOpacity(
              opacity: isVisible ? 1.0 : 0.0,
              duration: const Duration(
                seconds: 1,
              ),
              curve: Curves.easeInOut,
              child: Visibility(
                visible: isVisible,
                child: const AlertBox(),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: AnimatedBottomSheet(
              containerHeight: containerHeight,
              isExpanded: isExpanded,
              toggleContainer: toggleContainer,
            ),
          ),
        ],
      ),
    );
  }
}
