import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class BuildListTileOpenMO extends StatelessWidget {
  const BuildListTileOpenMO({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        textColor: AppColors.textColor,
        iconColor: AppColors.iconColor,
        tileColor: AppColors.tileColor,
        title: Row(
          children: [
            const Text(
              'Part ID: ',
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 14,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
              ),
            )
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                // Handle open button press
              },
              child: Container(
                width: 76,
                height: 31,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.blueBorderColor,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.blueColor,
                ),
                child: const Center(child: Text('Open')),
              ),
            ),
            const SizedBox(width: 8),
            InkWell(
              onTap: () {
                // Handle start button press
              },
              child: Container(
                width: 76,
                height: 31,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                  gradient: AppColors.gradientLeftToRight,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.play_arrow_outlined,
                        color: AppColors.tileIconColor,
                      ),
                      Text(
                        'Start',
                        style:
                            CfTextStyles.getTextStyle(TStyle.h1_700)?.copyWith(
                          color: AppColors.tileTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
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
    );
  }
}
