import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/auth_screen/widgets/login_dialog.dart';

class WorkRoomLoginDetail extends StatelessWidget {
  const WorkRoomLoginDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          BouncingAnimation(
            onTap: () {
              showDialog<Dialog>(
                context: context,
                builder: (context) {
                  return const LoginDialog();
                },
              );
            },
            widget: Container(
              height: 45,
              width: 100,
              decoration: BoxDecoration(
                gradient: AppColors.gradientLeftToRight,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.greyBorderColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.add,
                    color: AppColors.whiteColor,
                  ),
                  Text(
                    'Login',
                    style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
