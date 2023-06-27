import 'package:flutter/material.dart';

import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class InputListTile extends StatelessWidget {
  const InputListTile({
    super.key,
    required this.title,
    required this.status,
    required this.statusBoxColor,
  });
  final String title;
  final String status;
  final Color statusBoxColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CfTextStyles.getTextStyle(
                      TStyle.h1_600,
                    )?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  // width: 60,
                  height: 22,
                  decoration: BoxDecoration(
                    color: statusBoxColor,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: Text(
                        status,
                        style: CfTextStyles.getTextStyle(
                          TStyle.h1_600,
                        )?.copyWith(
                          color: AppColors.whiteColor,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  // width: 99,
                  height: 31,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.inputsModalAvailabilityBordercolor,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: Text(
                        'Available',
                        style: CfTextStyles.getTextStyle(
                          TStyle.h1_600,
                        )?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  // width: 114,
                  height: 31,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.greyBorderColor,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: Text(
                        'Not Available',
                        style: CfTextStyles.getTextStyle(
                          TStyle.h1_600,
                        )?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
