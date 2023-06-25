import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/work_queue/common_widgets/build_mo_list_inspection_part.dart';

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
        // const Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 16),
        //   child: Divider(),
        // ),
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
