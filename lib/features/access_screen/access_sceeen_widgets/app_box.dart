import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class AppBox extends StatelessWidget {
  const AppBox({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () async {},
          hoverColor: AppColors.textColor.withOpacity(0.1),
          child: Container(
            height: 115,
            width: 138,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.greyBorderColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(
                  AppAssets.gradientSheetIcon,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 70,
          width: 120,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
