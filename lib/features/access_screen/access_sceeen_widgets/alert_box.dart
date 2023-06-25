import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class AlertBox extends StatefulWidget {
  const AlertBox({super.key});

  @override
  State<AlertBox> createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 131,
      width: 624,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.greenBorderColor,
        ),
        color: AppColors.greenColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Image.asset(AppAssets.successIcon),
            const SizedBox(
              width: 20,
            ),
            Text(
              'Incoming QA inspection submitted!',
              style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
