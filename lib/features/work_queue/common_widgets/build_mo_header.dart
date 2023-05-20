import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class BuildMOHeader extends StatelessWidget {
  const BuildMOHeader({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        textColor: AppColors.textColor,
        iconColor: AppColors.iconColor,
        tileColor: AppColors.tileColor,
        title: Text(
          title,
          style: CfTextStyles.getTextStyle(TStyle.h1_400)?.copyWith(
            color: AppColors.textColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        trailing: const Icon(Icons.arrow_drop_down),
        onTap: () {
          // Handle tile tap event here
        },
      ),
    );
  }
}
