import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class PendingOrSubmittedStatusTile extends StatelessWidget {
  const PendingOrSubmittedStatusTile({
    super.key,
    required this.width,
    required this.status,
    required this.count,
    required this.color,
  });
  final double width;
  final String status;
  final String count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColors.greyBorderColor,
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
                    AppAssets.sheetIcon,
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
                    count,
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
    );
  }
}
