import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class BuildStatusTile extends StatelessWidget {
  const BuildStatusTile({
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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          width: width / 4,
          height: 54,
          decoration: BoxDecoration(
            color: AppColors.tileColor,
            border: Border.all(),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text(
                    '$status: ',
                    style: CfTextStyles.getTextStyle(TStyle.h1_400)?.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
                countBox(count: count, color: color),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget countBox({required String count, required Color color}) {
    return Container(
      height: 32,
      width: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          count,
          style: const TextStyle(
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
