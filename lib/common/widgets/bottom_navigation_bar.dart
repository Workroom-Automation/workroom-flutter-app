import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/constants/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    this.currentIndex = 0,
    required this.onTabTap,
  });
  final int currentIndex;
  final Function onTabTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Shared.getIcon(AppAssets.homeIcon),
          label: 'Home',
          activeIcon: Shared.getColoredIcon(
            AppAssets.homeIcon,
            Shared.getColorFromGradient(AppColors.gradientColors, 0.5),
          ),
        ),
        BottomNavigationBarItem(
          icon: Shared.getIcon(AppAssets.unitIcon),
          label: 'Tasks',
          activeIcon: Shared.getColoredIcon(
            AppAssets.actionsIcon,
            Shared.getColorFromGradient(AppColors.gradientColors, 0.5),
          ),
        ),
        BottomNavigationBarItem(
          icon: Shared.getIcon(AppAssets.accessIcon),
          label: 'Access',
          activeIcon: Shared.getColoredIcon(
            AppAssets.accessIcon,
            Shared.getColorFromGradient(AppColors.gradientColors, 0.5),
          ),
        ),
        BottomNavigationBarItem(
          icon: Shared.getIcon(AppAssets.moreIcon),
          label: 'More',
          activeIcon: Shared.getColoredIcon(
            AppAssets.moreIcon,
            Shared.getColorFromGradient(AppColors.gradientColors, 0.5),
          ),
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Shared.getColorFromGradient(
        AppColors.gradientColors,
        0.5,
      ),
      unselectedItemColor: AppColors.greyColor,
      showUnselectedLabels: true,
      unselectedLabelStyle: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: AppColors.greyColor,
      ),
      selectedLabelStyle: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: AppColors.greyColor,
      ),
      onTap: (index) {
        onTabTap.call(index);
      },
    );
  }
}
