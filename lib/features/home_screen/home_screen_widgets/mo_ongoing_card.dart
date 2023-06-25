import 'package:flutter/material.dart';

import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/common/services/navigation_service/navigation_service.dart';
import 'package:workroom_flutter_app/core/di/injection.dart';
import 'package:workroom_flutter_app/features/work_queue/work_queue.dart';

class MoOngoingCard extends StatelessWidget {
  const MoOngoingCard({
    super.key,
    required this.title,
    required this.description,
    required this.companyName,
    required this.moNumber,
    required this.jobType,
    required this.quantity,
    required this.date,
    required this.quantityCompleted,
    required this.itemName,
  });
  final String title;
  final String description;
  final String itemName;
  final String companyName;
  final String moNumber;
  final String jobType;
  final String quantity;
  final String quantityCompleted;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(
            color: AppColors.greyBorderColor,
          ),
          borderRadius: BorderRadius.circular(5),
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style:
                            CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.greyBorderColor,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 27,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                          child: Row(
                            children: [
                              Text(
                                itemName,
                                style: CfTextStyles.getTextStyle(
                                  TStyle.h1_600,
                                )?.copyWith(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.greyBorderColor,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 27,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                      ),
                      child: Row(
                        children: [
                          Text(
                            moNumber,
                            style: CfTextStyles.getTextStyle(
                              TStyle.h1_600,
                            )?.copyWith(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      description,
                      style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyColor.withOpacity(0.8),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(AppAssets.buildingIcon),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        companyName,
                        style: CfTextStyles.getTextStyle(TStyle.h1_600)
                            ?.copyWith(),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Image.asset(AppAssets.saveIcon),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        jobType,
                        style: CfTextStyles.getTextStyle(TStyle.h1_600)
                            ?.copyWith(),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Image.asset(AppAssets.unitIcon),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '$quantityCompleted/$quantity units completed',
                        style: CfTextStyles.getTextStyle(TStyle.h1_600)
                            ?.copyWith(),
                      )
                    ],
                  ),
                  BouncingAnimation(
                    onTap: () {
                      getIt<NavigationService>().pushNamed(
                        WorkQueuePage.routeName,
                      );
                    },
                    widget: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        gradient: AppColors.gradientOngoingMo,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_outlined,
                              color: AppColors.whiteColor,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              date,
                              style: CfTextStyles.getTextStyle(
                                TStyle.h1_600,
                              )?.copyWith(
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
