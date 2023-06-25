import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class BuildStatusTileHome extends StatelessWidget {
  const BuildStatusTileHome({
    super.key,
    required this.status,
    required this.count,
    required this.color,
    required this.ontapFunction,
    required this.isSelected,
  });
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isSelected
                ? AppColors.blueBorderColor
                : AppColors.greyBorderColor,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 5,
            ),
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
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: CircleAvatar(
                backgroundColor: AppColors.statusCircleColor,
                child: Text(
                  '23',
                  style: CfTextStyles.getTextStyle(
                    TStyle.h1_600,
                  )?.copyWith(
                    fontSize: 12,
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
