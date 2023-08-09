import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workroom_flutter_app/common/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class WorkerTileWorkRoomLogin extends StatelessWidget {
  const WorkerTileWorkRoomLogin({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.greyBorderColor,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(
                  AppAssets.profilePic,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                name,
                style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              BouncingAnimation(
                widget: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: AppColors.gradientLeftToRight,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Go to Station',
                        style:
                            CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                          color: AppColors.whiteColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              PopupMenuButton<String>(
                shadowColor: AppColors.transparent,
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.greyColor,
                ),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      value: 'logout',
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.logout),
                        label: Text(
                          'Logout',
                          style: CfTextStyles.getTextStyle(TStyle.h1_600)
                              ?.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                onSelected: (String value) {
                  if (value == 'logout') {
                    // Perform logout action here
                    // For example, you can call a function to handle the logout process.
                    // Example: AuthService.logout();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
