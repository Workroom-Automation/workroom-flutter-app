import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/widgets/bottom_navigation_bar.dart';
import 'package:workroom_flutter_app/features/access_screen/acess_screen.dart';
import 'package:workroom_flutter_app/features/home_screen/home_screen.dart';
import 'package:workroom_flutter_app/features/work_queue/work_queue.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  void onTabTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AppAssets.workRoomLogo,
          fit: BoxFit.fill,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 33,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.greyBorderColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Image.asset(AppAssets.stationIcon),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Sheet Cutting Station',
                          style: CfTextStyles.getTextStyle(TStyle.h1_600)
                              ?.copyWith(),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 33,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.greyBorderColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Image.asset(AppAssets.bigDotImage),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Running',
                          style: CfTextStyles.getTextStyle(TStyle.h1_600)
                              ?.copyWith(
                            color: AppColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: selectedIndex == 0
          ? const HomeScreen()
          : selectedIndex == 1
              ? const WorkQueuePage()
              : const AccessScreen(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: selectedIndex,
        onTabTap: onTabTap,
      ),
    );
  }
}
