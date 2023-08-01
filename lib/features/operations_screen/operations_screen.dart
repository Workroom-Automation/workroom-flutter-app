import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/services/navigation_service/navigation_service.dart';
import 'package:workroom_flutter_app/core/di/injection.dart';
import 'package:workroom_flutter_app/features/operations_screen/operation_screen_widgets/operation_card.dart';

class OperationsScreen extends StatelessWidget {
  const OperationsScreen({super.key});
  static const routeName = '/operations_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: Column(
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
                child: Row(
                  children: [
                    BouncingAnimation(
                      onTap: () {
                        getIt<NavigationService>().pop();
                      },
                      widget: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Linked Operations',
                      style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                        fontSize: 20,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const OperationCard(
            title: 'Operation name 1',
            desc: 'This is the operation description as part of the routing',
            stepNumber: '4',
            step: 'Production Step',
          ),
          const OperationCard(
            title: 'Operation name 2',
            desc: 'This is the operation description as part of the routing',
            stepNumber: '9',
            step: 'Production Step',
          ),
        ],
      ),
    );
  }
}
