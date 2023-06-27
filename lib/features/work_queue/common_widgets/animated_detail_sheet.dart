import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class AnimatedMoDetail extends StatefulWidget {
  const AnimatedMoDetail({
    super.key,
    required this.height,
    required this.isExpanded,
  });
  final double height;
  final bool isExpanded;

  @override
  State<AnimatedMoDetail> createState() => _AnimatedMoDetailState();
}

class _AnimatedMoDetailState extends State<AnimatedMoDetail> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1),
        height: widget.height,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.greyBorderColor,
            ),
          ),
        ),
        child: widget.isExpanded
            ? SizedBox(
                height: 120,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Shaft 0123 Production',
                                    style: CfTextStyles.getTextStyle(
                                      TStyle.h1_600,
                                    )?.copyWith(
                                      fontSize: 16,
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
                                            'Propeller Shaft',
                                            style: CfTextStyles.getTextStyle(
                                              TStyle.h1_600,
                                            )?.copyWith(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
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
                                            'Target Quantity',
                                            style: CfTextStyles.getTextStyle(
                                              TStyle.h1_600,
                                            )?.copyWith(
                                              color: AppColors.headerTextColor,
                                            ),
                                          ),
                                          const VerticalDivider(),
                                          Text(
                                            '35',
                                            style: CfTextStyles.getTextStyle(
                                              TStyle.h1_600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: AppColors.greyBorderColor,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: DecoratedBox(
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                            color: AppColors.greyBorderColor,
                                          ),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: DecoratedBox(
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                    color: AppColors
                                                        .greyBorderColor,
                                                  ),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Start At',
                                                  style:
                                                      CfTextStyles.getTextStyle(
                                                    TStyle.h1_600,
                                                  )?.copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors
                                                        .headerTextColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                '11 AM; 03/05/23',
                                                style:
                                                    CfTextStyles.getTextStyle(
                                                  TStyle.h1_600,
                                                )?.copyWith(
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: AppColors.greyBorderColor,
                            ),
                            bottom: BorderSide(
                              color: AppColors.greyBorderColor,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'B01234A',
                                        textAlign: TextAlign.center,
                                        style: CfTextStyles.getTextStyle(
                                          TStyle.h1_600,
                                        )?.copyWith(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Image.asset(AppAssets.dotImage),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'TATA Motors Private Limited',
                                      textAlign: TextAlign.center,
                                      style: CfTextStyles.getTextStyle(
                                        TStyle.h1_600,
                                      )?.copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Image.asset(AppAssets.dotImage),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: Text(
                                        'Order',
                                        textAlign: TextAlign.center,
                                        style: CfTextStyles.getTextStyle(
                                          TStyle.h1_600,
                                        )?.copyWith(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: DecoratedBox(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: AppColors.greyBorderColor,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: DecoratedBox(
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: AppColors.greyBorderColor,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Due At',
                                            style: CfTextStyles.getTextStyle(
                                              TStyle.h1_600,
                                            )?.copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.headerTextColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          '3 PM; 03/05/23',
                                          style: CfTextStyles.getTextStyle(
                                            TStyle.h1_600,
                                          )?.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
