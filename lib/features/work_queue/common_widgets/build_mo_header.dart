import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/work_queue/animations/bouncing_animation.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    BouncingAnimation(
                      widget: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.whiteColor,
                      ),
                      onTap: () {
                        // getIt<NavigationService>().pop();
                      },
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
                    InkWell(
                      splashColor: AppColors.transparent,
                      child: isExpanded
                          ? BouncingAnimation(
                              onTap: toggleContainer,
                              widget: Image.asset(
                                AppAssets.upArrowIcon,
                                color: AppColors.whiteColor,
                              ),
                            )
                          : BouncingAnimation(
                              onTap: toggleContainer,
                              widget: Image.asset(
                                AppAssets.downArrowIcon,
                                color: AppColors.whiteColor,
                              ),
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
