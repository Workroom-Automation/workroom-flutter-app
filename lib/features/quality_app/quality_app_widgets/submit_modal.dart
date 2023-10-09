import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class SubmitModal extends StatefulWidget {
  const SubmitModal({super.key});

  @override
  State<SubmitModal> createState() => _SubmitModalState();
}

class _SubmitModalState extends State<SubmitModal> {
  String selectedValue = 'Accpeted';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: SizedBox(
          width: 500,
          height: 450,
          child: Scaffold(
            body: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Confirm Connection Status',
                    style: CfTextStyles.getTextStyle(
                      TStyle.h1_600,
                    )?.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const InspectionDataRow(
                  quantity: '100',
                  title: 'Total order quantity',
                ),
                const InspectionDataRow(
                  quantity: '100',
                  title: 'Sampling Size',
                ),
                const InspectionDataRow(
                  quantity: '100',
                  title: 'Total Ok',
                ),
                const InspectionDataRow(
                  quantity: '100',
                  title: 'Total Not Ok',
                ),
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.greyBorderColor),
                      top: BorderSide(color: AppColors.greyBorderColor),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lot Quality Status',
                          style: CfTextStyles.getTextStyle(
                            TStyle.h1_600,
                          )?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.greenBorderColor,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: AppColors.greenColor,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Text(
                                    //   'Accepted',
                                    //   style: CfTextStyles.getTextStyle(
                                    //     TStyle.h1_600,
                                    //   )?.copyWith(
                                    //     fontSize: 18,
                                    //     color: AppColors.whiteColor,
                                    //   ),
                                    // ),
                                    // const Icon(
                                    //   Icons.arrow_drop_down,
                                    //   color: AppColors.whiteColor,
                                    // ),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton2<String>(
                                        hint: Text(
                                          selectedValue,
                                          style: CfTextStyles.getTextStyle(
                                            TStyle.h1_600,
                                          )?.copyWith(
                                            fontSize: 18,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                        items: ['Accpeted', 'Rejected']
                                            .map(
                                              (String item) =>
                                                  DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style:
                                                      CfTextStyles.getTextStyle(
                                                    TStyle.h1_600,
                                                  )?.copyWith(
                                                    fontSize: 18,
                                                    // color: item == selectedValue
                                                    //     ? AppColors.whiteColor
                                                    //     : AppColors.textColor,
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        value: selectedValue,
                                        onChanged: (String? value) {
                                          setState(() {
                                            selectedValue = value!;
                                          });
                                        },
                                        menuItemStyleData:
                                            const MenuItemStyleData(
                                          height: 40,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 200),
                  child: BouncingAnimation(
                    onTap: () async {},
                    widget: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        gradient: AppColors.gradientLeftToRight,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.greyBorderColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: CfTextStyles.getTextStyle(TStyle.h1_600)
                              ?.copyWith(
                            color: AppColors.whiteColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InspectionDataRow extends StatelessWidget {
  const InspectionDataRow({
    super.key,
    required this.title,
    required this.quantity,
  });
  final String title;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.greyBorderColor),
          top: BorderSide(color: AppColors.greyBorderColor),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: CfTextStyles.getTextStyle(
                TStyle.h1_600,
              )?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            Container(
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.greyBorderColor,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  quantity,
                  style: CfTextStyles.getTextStyle(
                    TStyle.h1_600,
                  )?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
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
