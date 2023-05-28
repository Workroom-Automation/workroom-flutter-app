import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';

import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class DisplaySheetTile extends StatelessWidget {
  const DisplaySheetTile({
    super.key,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.callback,
  });
  final String title;
  final String status;
  final Color statusColor;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              height: 59,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          AppAssets.sheetIcon,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: CfTextStyles.getTextStyle(
                              TStyle.h1_600,
                            )?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RawChip(
                    label: Text(
                      status,
                      style: CfTextStyles.getTextStyle(
                        TStyle.h1_600,
                      )?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    backgroundColor: statusColor,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}
