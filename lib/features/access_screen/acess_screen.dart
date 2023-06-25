import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/access_screen/access_detail_screen.dart';
import 'package:workroom_flutter_app/features/access_screen/access_sceeen_widgets/app_box.dart';
import 'package:workroom_flutter_app/features/access_screen/access_sceeen_widgets/search_box.dart';

class AccessScreen extends StatefulWidget {
  const AccessScreen({super.key});

  @override
  State<AccessScreen> createState() => _AccessScreenState();
}

class _AccessScreenState extends State<AccessScreen> {
  bool showAccessDetail = false;
  @override
  Widget build(BuildContext context) {
    return !showAccessDetail
        ? Scaffold(
            body: SingleChildScrollView(
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
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Apps',
                          style: CfTextStyles.getTextStyle(TStyle.h1_600)
                              ?.copyWith(
                            fontSize: 20,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        const SearchBox(),
                        const SizedBox(height: 20),
                        Text(
                          'Incoming QA WorkRoom',
                          style: CfTextStyles.getTextStyle(TStyle.h1_600)
                              ?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  showAccessDetail = !showAccessDetail;
                                });
                              },
                              child: const AppBox(title: 'Incoming QA'),
                            ),
                            const SizedBox(width: 20),
                            const AppBox(title: 'SCARs'),
                            const SizedBox(width: 20),
                            const AppBox(title: 'Supplier PDI'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(
                          color: AppColors.greyBorderColor,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'In-process QA Workroom',
                          style: CfTextStyles.getTextStyle(TStyle.h1_600)
                              ?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            AppBox(title: 'Incidents'),
                            SizedBox(width: 20),
                            AppBox(title: 'Batch Inspections'),
                            SizedBox(width: 20),
                            AppBox(title: 'NCRs'),
                            SizedBox(width: 20),
                            AppBox(title: 'CAPA'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(
                          color: AppColors.greyBorderColor,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Post-Production QA Workroom',
                          style: CfTextStyles.getTextStyle(TStyle.h1_600)
                              ?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            AppBox(title: 'Complaints'),
                            SizedBox(width: 20),
                            AppBox(title: 'Surveys & Feedback '),
                            SizedBox(width: 20),
                            AppBox(title: 'Final Inspections'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(
                          color: AppColors.greyBorderColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : const AccessDetailScreen(
            title: 'Incoming Mo',
          );
  }
}
