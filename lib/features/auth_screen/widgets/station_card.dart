import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class StationCard extends StatelessWidget {
  const StationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.greyBorderColor,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.greyBorderColor,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(
              AppAssets.stationImage,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'Welding Station',
            style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
