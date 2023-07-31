import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/services/navigation_service/navigation_service.dart';
import 'package:workroom_flutter_app/core/di/injection.dart';
import 'package:workroom_flutter_app/features/work_queue/work_queue.dart';

class OperationCard extends StatelessWidget {
  const OperationCard({
    super.key,
    required this.title,
    required this.desc,
    required this.stepNumber,
    required this.step,
  });
  final String title;
  final String desc;
  final String stepNumber;
  final String step;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      onTap: () {
        getIt<NavigationService>().pushNamed(WorkQueuePage.routeName);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(
              color: AppColors.greyBorderColor,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyColor.withOpacity(0.5),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style: CfTextStyles.getTextStyle(TStyle.h1_600)
                                ?.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.greyBorderColor,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppAssets.stationIcon,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    step,
                                    style:
                                        CfTextStyles.getTextStyle(TStyle.h1_600)
                                            ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        desc,
                        style:
                            CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    height: 35,
                    width: 92,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyBorderColor),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        'Step $stepNumber',
                        style:
                            CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
