import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/constants/constants.dart';
import 'package:workroom_flutter_app/features/auth_screen/station_view_login.dart';
import 'package:workroom_flutter_app/features/auth_screen/workroom_login_detail.dart';

class WorkRoomLogin extends StatefulWidget {
  const WorkRoomLogin({super.key});

  @override
  State<WorkRoomLogin> createState() => _WorkRoomLoginState();
}

class _WorkRoomLoginState extends State<WorkRoomLogin> {
  bool workRoomLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AppAssets.workRoomLogo,
          fit: BoxFit.fill,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > mobileScreenSizeLimit &&
              constraints.maxWidth < tabletScreenSizeLimit) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 72,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.greyBorderColor,
                    ),
                  ),
                  child: Row(
                    children: [
                      BouncingAnimation(
                        onTap: () {
                          setState(() {
                            workRoomLogin = true;
                          });
                        },
                        widget: Container(
                          height: 72,
                          width: MediaQuery.of(context).size.width * 0.25,
                          decoration: workRoomLogin
                              ? BoxDecoration(
                                  gradient: AppColors.gradientLeftToRight,
                                )
                              : const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: AppColors.greyBorderColor,
                                    ),
                                  ),
                                ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                AppAssets.loginIcon,
                                color: workRoomLogin
                                    ? AppColors.whiteColor
                                    : AppColors.iconColor,
                              ),
                              Text(
                                'WorkRoom Login',
                                style: CfTextStyles.getTextStyle(TStyle.h1_600)
                                    ?.copyWith(
                                  color: workRoomLogin
                                      ? AppColors.whiteColor
                                      : AppColors.textColor,
                                  fontSize: 16,
                                  fontWeight: workRoomLogin
                                      ? FontWeight.bold
                                      : FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              BouncingAnimation(
                                onTap: () {
                                  setState(() {
                                    workRoomLogin = false;
                                  });
                                },
                                widget: Container(
                                  height: 40,
                                  width: 100,
                                  decoration: !workRoomLogin
                                      ? BoxDecoration(
                                          color: AppColors.greyColor
                                              .withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: AppColors.greyBorderColor,
                                          ),
                                        )
                                      : null,
                                  child: Center(
                                    child: Text(
                                      'Station View',
                                      style: CfTextStyles.getTextStyle(
                                              TStyle.h1_600)
                                          ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              TextButton.icon(
                                // style: ButtonStyle(
                                //   foregroundColor:
                                //       MaterialStateProperty.all(AppColors.greyColor),
                                //   overlayColor: MaterialStateProperty.all(
                                //     AppColors.transparent,
                                //   ),
                                //   textStyle: MaterialStateProperty.all(
                                //     CfTextStyles.getTextStyle(TStyle.h1_600)
                                //         ?.copyWith(
                                //       fontWeight: FontWeight.w400,
                                //     ),
                                //   ),
                                // ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
                                  color: AppColors.greyColor,
                                ),
                                label: Text(
                                  'Add View',
                                  style:
                                      CfTextStyles.getTextStyle(TStyle.h1_600)
                                          ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (workRoomLogin)
                  const WorkRoomLoginDetail()
                else
                  const StationViewLogin(),
              ],
            );
          }
          if (constraints.maxWidth < mobileScreenSizeLimit) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 72,
                  width: double.infinity,
                  decoration: workRoomLogin
                      ? BoxDecoration(
                          gradient: AppColors.gradientLeftToRight,
                        )
                      : const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: AppColors.greyBorderColor,
                            ),
                          ),
                        ),
                  child: BouncingAnimation(
                    onTap: () {
                      setState(() {
                        workRoomLogin = true;
                      });
                    },
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.loginIcon,
                          color: workRoomLogin
                              ? AppColors.whiteColor
                              : AppColors.iconColor,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'WorkRoom Login',
                          style: CfTextStyles.getTextStyle(TStyle.h1_600)
                              ?.copyWith(
                            color: workRoomLogin
                                ? AppColors.whiteColor
                                : AppColors.textColor,
                            fontSize: 16,
                            fontWeight: workRoomLogin
                                ? FontWeight.bold
                                : FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 70,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.greyBorderColor,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      BouncingAnimation(
                        onTap: () {
                          setState(() {
                            workRoomLogin = false;
                          });
                        },
                        widget: Container(
                          height: 40,
                          width: 100,
                          decoration: !workRoomLogin
                              ? BoxDecoration(
                                  color: AppColors.greyColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors.greyBorderColor,
                                  ),
                                )
                              : null,
                          child: Center(
                            child: Text(
                              'Station View',
                              style: CfTextStyles.getTextStyle(TStyle.h1_600)
                                  ?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      TextButton.icon(
                        // style: ButtonStyle(
                        //   foregroundColor:
                        //       MaterialStateProperty.all(AppColors.greyColor),
                        //   overlayColor: MaterialStateProperty.all(
                        //     AppColors.transparent,
                        //   ),
                        //   textStyle: MaterialStateProperty.all(
                        //     CfTextStyles.getTextStyle(TStyle.h1_600)
                        //         ?.copyWith(
                        //       fontWeight: FontWeight.w400,
                        //     ),
                        //   ),
                        // ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: AppColors.greyColor,
                        ),
                        label: Text(
                          'Add View',
                          style: CfTextStyles.getTextStyle(TStyle.h1_600)
                              ?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (workRoomLogin)
                  const WorkRoomLoginDetail()
                else
                  const StationViewLogin(),
              ],
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
