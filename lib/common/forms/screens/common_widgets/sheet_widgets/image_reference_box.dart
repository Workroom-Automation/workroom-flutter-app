import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/forms/screens/bottom_sheet_detail.dart';

class ImageReferenceBox extends StatelessWidget {
  const ImageReferenceBox({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog<ImagePreviewDialog>(
          context: context,
          builder: (
            BuildContext context,
          ) {
            return ImagePreviewDialog(
              imageUrl: imageUrl,
            );
          },
        );
      },
      child: Container(
        height: 28,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.greyBorderColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.image,
                color: Colors.grey,
              ),
              const SizedBox(width: 4),
              Text(
                'Image 01',
                style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
