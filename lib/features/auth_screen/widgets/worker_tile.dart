import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class WorkerTile extends StatefulWidget {
  const WorkerTile({super.key});

  @override
  State<WorkerTile> createState() => _WorkerTileState();
}

class _WorkerTileState extends State<WorkerTile> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.selectedWorkForceTileColor
              : AppColors.whiteColor,
          border: Border(
            top: BorderSide(
              color: isSelected
                  ? AppColors.blueBorderColor
                  : AppColors.greyBorderColor,
            ),
            bottom: BorderSide(
              color: isSelected
                  ? AppColors.blueBorderColor
                  : AppColors.greyBorderColor,
            ),
          ),
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
                'Chaitanya Kumar',
                style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              if (isSelected)
                const Icon(
                  Icons.done,
                  color: AppColors.blueBorderColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
