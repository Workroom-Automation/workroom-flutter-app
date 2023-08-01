import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 44,
        width: 222,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.greyBorderColor),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: AppColors.greyColor),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: 'Search...',
                  hintStyle: CfTextStyles.getTextStyle(TStyle.h1_400)?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
