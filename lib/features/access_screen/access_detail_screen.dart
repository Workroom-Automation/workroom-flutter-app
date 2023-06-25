import 'dart:async';
import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/access_screen/access_sceeen_widgets/alert_box.dart';
import 'package:workroom_flutter_app/features/access_screen/access_sceeen_widgets/dropdown.dart';
import 'package:workroom_flutter_app/features/access_screen/access_sceeen_widgets/search_box.dart';
import 'package:workroom_flutter_app/features/access_screen/access_sceeen_widgets/sheet_tile.dart';

class AccessDetailScreen extends StatefulWidget {
  const AccessDetailScreen({super.key, required this.title});
  final String title;

  @override
  State<AccessDetailScreen> createState() => _AccessDetailScreenState();
}

class _AccessDetailScreenState extends State<AccessDetailScreen> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: AppColors.gradientLeftToRight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Row(
                      children: [
                        Image.asset(
                          AppAssets.accessDetailStationIcon,
                          color: AppColors.whiteColor,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.title,
                            style: CfTextStyles.getTextStyle(TStyle.h1_600)
                                ?.copyWith(
                              fontSize: 20,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          SearchBox(),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                DropDown(
                                  hint: 'Select a Product',
                                  options: ['Option 1', 'Option 2'],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                DropDown(
                                  hint: 'Select a station',
                                  options: ['Option 1', 'Option 2'],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: AppColors.transparent,
                            highlightColor: AppColors.transparent,
                            onTap: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });

                              if (_isVisible) {
                                Future.delayed(const Duration(seconds: 3), () {
                                  setState(() {
                                    _isVisible = false;
                                  });
                                });
                              }
                            },
                            child: SheetBox(
                              title: 'Safety & Regulatory Compliance ',
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            left: 20,
            child: AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(
                seconds: 1,
              ),
              curve: Curves.easeInOut,
              child: Visibility(
                visible: _isVisible,
                child: const AlertBox(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
