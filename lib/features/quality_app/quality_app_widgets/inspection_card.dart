import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/constants/constants.dart';
import 'package:workroom_flutter_app/common/services/navigation_service/navigation_service.dart';
import 'package:workroom_flutter_app/core/di/injection.dart';
import 'package:workroom_flutter_app/features/quality_app/sample_list.dart';

class InspectionCard extends StatelessWidget {
  const InspectionCard({
    super.key,
    required this.title,
    required this.quantity,
    required this.date,
    required this.status,
    required this.itemName,
    required this.color,
  });
  final String title;
  final String quantity;
  final String date;
  final String itemName;
  final QualityStatus status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getIt<NavigationService>().pushNamed(
          SampleList.routeName,
        )?.then((value) => print('something'));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 8,
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
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
          child: Row(
            children: [
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    border: Border.all(
                      color: AppColors.greyBorderColor,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    title,
                                    style:
                                        CfTextStyles.getTextStyle(TStyle.h1_600)
                                            ?.copyWith(
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
                              Row(
                                children: [
                                  Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: color,
                                      border: Border.all(
                                        color: AppColors.greyBorderColor,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: status == QualityStatus.start
                                          ? Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(
                                                  Icons.play_arrow_rounded,
                                                  color: AppColors.whiteColor,
                                                ),
                                                Text(
                                                  'START',
                                                  style:
                                                      CfTextStyles.getTextStyle(
                                                    TStyle.h1_600,
                                                  )?.copyWith(
                                                    color: AppColors.whiteColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                )
                                              ],
                                            )
                                          : status == QualityStatus.ongoing
                                              ? Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      'ONGOING',
                                                      style: CfTextStyles
                                                          .getTextStyle(
                                                        TStyle.h1_600,
                                                      )?.copyWith(
                                                        color: AppColors
                                                            .whiteColor,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      'LOT ACCEPTED',
                                                      style: CfTextStyles
                                                          .getTextStyle(
                                                        TStyle.h1_600,
                                                      )?.copyWith(
                                                        color: AppColors
                                                            .whiteColor,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
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
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const BoxWidget(
                                    keyName: 'Qty',
                                    value: '100',
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const BoxWidget(
                                    keyName: 'Ok',
                                    value: '100',
                                    color: AppColors.greenBorderColor,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const BoxWidget(
                                    keyName: 'Nok',
                                    value: '100',
                                    color: AppColors.redBorderColor,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Due By: ',
                                    style:
                                        CfTextStyles.getTextStyle(TStyle.h1_600)
                                            ?.copyWith(
                                      color: AppColors.greyBorderColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    '26/08/25 ; 10:00 AM',
                                    style:
                                        CfTextStyles.getTextStyle(TStyle.h1_600)
                                            ?.copyWith(
                                      color: AppColors.greyBorderColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BoxWidget extends StatelessWidget {
  const BoxWidget({
    super.key,
    required this.keyName,
    this.color,
    required this.value,
  });
  final String keyName;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.greyBorderColor,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 27,
      child: Row(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: AppColors.greyBorderColor,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Text(
                keyName,
                style: CfTextStyles.getTextStyle(
                  TStyle.h1_600,
                )?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: color ?? AppColors.greyColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
