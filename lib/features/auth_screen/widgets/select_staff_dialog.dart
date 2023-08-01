import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/auth_screen/widgets/search_box.dart';
import 'package:workroom_flutter_app/features/auth_screen/widgets/worker_tile.dart';

class SelectWorkForceDialog extends StatefulWidget {
  const SelectWorkForceDialog({super.key});

  @override
  State<SelectWorkForceDialog> createState() => _SelectWorkForceDialogState();
}

class _SelectWorkForceDialogState extends State<SelectWorkForceDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyColor.withOpacity(0.5),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                children: [
                  Text(
                    'Select Workforce',
                    style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  BouncingAnimation(
                    widget: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: AppColors.gradientLeftToRight,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.done,
                              color: AppColors.whiteColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Add Workforce',
                              style: CfTextStyles.getTextStyle(TStyle.h1_600)
                                  ?.copyWith(
                                fontSize: 16,
                                color: AppColors.whiteColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: SearchBox(),
            ),
            const SizedBox(
              height: 20,
            ),
            WorkerTile(),
            WorkerTile(),
          ],
        ),
      ),
    );
  }
}
