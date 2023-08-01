import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/auth_screen/widgets/select_staff_dialog.dart';
import 'package:workroom_flutter_app/features/auth_screen/widgets/station_dialog.dart';

class StationViewLogin extends StatefulWidget {
  const StationViewLogin({super.key});

  @override
  State<StationViewLogin> createState() => _StationViewLoginState();
}

class _StationViewLoginState extends State<StationViewLogin> {
  bool stationSelected = false;
  void stationSelectedView() {
    setState(() {
      stationSelected = true;
    });
  }

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
          InkWell(
            splashColor: AppColors.transparent,
            highlightColor: AppColors.transparent,
            onTap: () {
              showDialog<Dialog>(
                context: context,
                builder: (context) {
                  return StationDialog(
                    onStationSelected: stationSelectedView,
                  );
                },
              );
            },
            child: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: AppColors.gradientLeftToRight,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      color: AppColors.whiteColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Select Station',
                      style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                        color: AppColors.whiteColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          if (stationSelected)
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColors.greyBorderColor,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColors.greyBorderColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColors.greyBorderColor,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 66,
                            width: 88,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: AppColors.greyBorderColor,
                              ),
                            ),
                            child: Image.asset(
                              AppAssets.stationImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Welding Station',
                            style: CfTextStyles.getTextStyle(TStyle.h1_600)
                                ?.copyWith(
                              color: AppColors.textColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: InkWell(
                      onTap: () {
                        showDialog<Dialog>(
                          context: context,
                          builder: (context) {
                            return SelectWorkForceDialog();
                          },
                        );
                      },
                      child: Container(
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: AppColors.greyBorderColor,
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.add),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Check-in-workforce'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
