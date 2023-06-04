import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class BuildMOHeader extends StatelessWidget {
  const BuildMOHeader({
    super.key,
    required this.title,
    required this.toggleContainer,
    required this.isExpanded,
  });
  final String title;
  final VoidCallback toggleContainer;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        gradient: AppColors.gradientLeftToRight,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // what happens when you click the back button
                      },
                      child: Image.asset(
                        AppAssets.backArrowIcon,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Text(
                      title,
                      style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '3:30 hrs',
                      style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    GestureDetector(
                      onTap: toggleContainer,
                      child: isExpanded
                          ? Image.asset(
                              AppAssets.upArrowIcon,
                              color: AppColors.whiteColor,
                            )
                          : Image.asset(
                              AppAssets.downArrowIcon,
                              color: AppColors.whiteColor,
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
