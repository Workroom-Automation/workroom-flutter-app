import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class BuildStatusTile extends StatelessWidget {
  const BuildStatusTile({
    super.key,
    required this.width,
    required this.status,
    required this.count,
    required this.color,
    required this.ontapFunction,
    required this.isSelected,
  });

  final double width;
  final String status;
  final String count;
  final Color color;
  final Function ontapFunction;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontapFunction(status);
      },
      child: Container(
        height: 40,
        width: width / 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isSelected
                ? AppColors.blueBorderColor
                : AppColors.greyBorderColor,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Image.asset(
                      AppAssets.bigDotImage,
                      color: color,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      status,
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
            Expanded(
              flex: 3,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: AppColors.greyBorderColor,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: CircleAvatar(
                    backgroundColor: AppColors.statusCircleColor,
                    child: Text(
                      '23',
                      style: CfTextStyles.getTextStyle(
                        TStyle.h1_600,
                      )?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
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
