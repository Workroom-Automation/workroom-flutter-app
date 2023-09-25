import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/services/navigation_service/navigation_service.dart';
import 'package:workroom_flutter_app/core/di/injection.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppColors.gradientLeftToRight,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Text(
                //   'Part ID: ',
                //   style: CfTextStyles.getTextStyle(TStyle.h1_600),
                // ),
                BouncingAnimation(
                  widget: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.whiteColor,
                  ),
                  onTap: () {
                    getIt<NavigationService>().pop();
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                    color: AppColors.whiteColor,
                  ),
                )
              ],
            ),
            Container(
              height: 31,
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      AppColors.partStatusManagementHeaderStatusBoxBorderColor,
                ),
                borderRadius: BorderRadius.circular(5),
                color: AppColors.partStatusManagementHeaderStatusBoxColor,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'In-Progress',
                    style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
