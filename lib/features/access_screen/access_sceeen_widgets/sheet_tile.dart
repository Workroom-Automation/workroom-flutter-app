import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class SheetBox extends StatefulWidget {
  const SheetBox({super.key, required this.title});
  final String title;

  @override
  State<SheetBox> createState() => _SheetBoxState();
}

class _SheetBoxState extends State<SheetBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 2,
        vertical: 4,
      ),
      child: Container(
        height: 105,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.greyBorderColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Image.asset(AppAssets.largeSheetIcon),
              const SizedBox(width: 8),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return Container(
    //   height: 140,
    //   width: 272,
    //   decoration: BoxDecoration(
    //     border: Border.all(
    //       color: AppColors.greyBorderColor,
    //     ),
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.all(12),
    //     child: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Image.asset(
    //             AppAssets.largeSheetIcon,
    //           ),
    //           const SizedBox(height: 20),
    //           SizedBox(
    //             height: 30,
    //             width: 200,
    //             child: widget.title.length > 25
    //                 ? Marquee(
    //                     text: widget.title,
    //                     style:
    //                         CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
    //                       fontSize: 14,
    //                       fontWeight: FontWeight.w400,
    //                     ),
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     blankSpace: 20,
    //                     pauseAfterRound: const Duration(seconds: 1),
    //                   )
    //                 : Text(
    //                     widget.title,
    //                     textAlign: TextAlign.center,
    //                     style:
    //                         CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
    //                       fontSize: 14,
    //                       fontWeight: FontWeight.w400,
    //                     ),
    //                   ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
