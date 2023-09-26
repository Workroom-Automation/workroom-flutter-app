import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class SampleList extends StatefulWidget {
  const SampleList({super.key});

  @override
  State<SampleList> createState() => _SampleListState();
}

class _SampleListState extends State<SampleList> {
  bool isAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AppAssets.workRoomLogo,
          fit: BoxFit.fill,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: AppColors.gradientLeftToRight,
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.whiteColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Incoming QA',
                    style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                      fontSize: 20,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.greyBorderColor.withOpacity(0.1),
                border: Border.all(
                  color: AppColors.greyBorderColor,
                ),
              ),
              child: Row(
                children: [
                  Flexible(
                    flex: 8,
                    child: Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: AppColors.greyBorderColor,
                          ),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BoxWidget(
                            keyName: 'Ok',
                            value: '90',
                            color: AppColors.greenBorderColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          BoxWidget(
                            keyName: 'NOk',
                            value: '90',
                            color: AppColors.redBorderColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      height: 100,
                      color: AppColors.whiteColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BouncingAnimation(
                            onTap: () {},
                            widget: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  gradient: AppColors.gradientLeftToRight,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.done,
                                      color: AppColors.whiteColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Submit',
                                      style: CfTextStyles.getTextStyle(
                                        TStyle.h1_600,
                                      )?.copyWith(
                                        color: AppColors.whiteColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
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
            Container(
              height: 80,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.greyBorderColor,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Flexible(
                    flex: 8,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Inspection Queue',
                          style: CfTextStyles.getTextStyle(TStyle.h1_600)
                              ?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: CircleAvatar(
                              radius: 16,
                              child: Text(
                                '10',
                                style: CfTextStyles.getTextStyle(TStyle.h1_600)
                                    ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 100,
                        color: AppColors.whiteColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.add,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Add Sample',
                                    style: CfTextStyles.getTextStyle(
                                      TStyle.h1_600,
                                    )?.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 15,
              itemBuilder: (context, index) {
                isAccepted = !isAccepted;
                return StatusTileCard(index: index, isAccepted: isAccepted);
              },
            ),
          ],
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
      height: 35,
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
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: CircleAvatar(
                child: Text(
                  value,
                  style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatusTileCard extends StatelessWidget {
  const StatusTileCard({
    super.key,
    required this.index,
    required this.isAccepted,
  });
  final int index;
  final bool isAccepted;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.greyBorderColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: AppColors.greyBorderColor,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      (index + 1).toString(),
                      style: CfTextStyles.getTextStyle(
                        TStyle.h1_600,
                      )?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Sample ${index + 1}',
                  style: CfTextStyles.getTextStyle(
                    TStyle.h1_600,
                  )?.copyWith(),
                ),
              ],
            ),
            if (isAccepted)
              Container(
                height: 30,
                decoration: BoxDecoration(
                  color: AppColors.greenBorderColor,
                  border: Border.all(color: AppColors.greenColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Center(
                    child: Text(
                      'Accepted',
                      style: CfTextStyles.getTextStyle(
                        TStyle.h1_600,
                      )?.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              )
            else
              Container(
                height: 30,
                decoration: BoxDecoration(
                  color: AppColors.redBorderColor,
                  border: Border.all(color: AppColors.redColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Center(
                    child: Text(
                      'Rejected',
                      style: CfTextStyles.getTextStyle(
                        TStyle.h1_600,
                      )?.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
