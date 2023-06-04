import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/work_queue/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/features/work_queue/common_widgets/build_mo_list_inspection_part.dart';
import 'package:workroom_flutter_app/features/work_queue/inspection_part_list_bottom_sheet.dart';

class InspectionWorkQueue extends StatefulWidget {
  const InspectionWorkQueue({super.key});

  @override
  State<InspectionWorkQueue> createState() => _InspectionWorkQueueState();
}

class _InspectionWorkQueueState extends State<InspectionWorkQueue> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(),
        ),
        const SizedBox(
          height: 8,
        ),
        BouncingAnimation(
          onTap: () {
            showModalBottomSheet<dynamic>(
              context: context,
              isScrollControlled: true,
              builder: (context) => const InspectionPartListBottomSheet(),
            );
          },
          widget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                gradient: AppColors.gradientLeftToRight,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Select Part',
                    style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                      color: AppColors.whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'No parts inspected. Select a part and start inspection.',
            style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
              fontStyle: FontStyle.italic,
              color: AppColors.greyColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const BuildMoListInspectionPart(
          isStartInspection: true,
        ),
        const BuildMoListInspectionPart(
          isStartInspection: false,
        ),
      ],
    );
  }
}
