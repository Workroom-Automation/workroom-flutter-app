import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/services/navigation_service/navigation_service.dart';
import 'package:workroom_flutter_app/core/di/injection.dart';
import 'package:workroom_flutter_app/features/part_status_managment/screens/part_status_managment.dart';
import 'package:workroom_flutter_app/features/work_queue/animations/bouncing_animation.dart';

class BuildListTileOpenMO extends StatefulWidget {
  const BuildListTileOpenMO({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<BuildListTileOpenMO> createState() => _BuildListTileOpenMOState();
}

class _BuildListTileOpenMOState extends State<BuildListTileOpenMO> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.greyBorderColor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListTile(
          textColor: AppColors.textColor,
          iconColor: AppColors.iconColor,
          tileColor: AppColors.whiteColor,
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
                widget.title,
                style: const TextStyle(
                  fontSize: 14,
                ),
              )
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
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
              BouncingAnimation(
                onTap: () {
                  getIt<NavigationService>().pushNamed(
                    PartStatusManagment.routeName,
                  );
                },
                widget: Container(
                  // width: 76,
                  height: 31,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: AppColors.gradientLeftToRight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.play_arrow_outlined,
                          color: AppColors.tileIconColor,
                        ),
                        Text(
                          'Start',
                          style: CfTextStyles.getTextStyle(TStyle.h1_700)
                              ?.copyWith(
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
              const SizedBox(width: 8),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
      ),
    );
  }
}
