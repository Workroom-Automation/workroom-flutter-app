import 'package:flutter/material.dart';

import 'package:workroom_flutter_app/features/work_queue/common_widgets/build_mo_list_part.dart';
import 'package:workroom_flutter_app/features/work_queue/constants/mo_part_status.dart';

class ProductionWorkQueue extends StatefulWidget {
  const ProductionWorkQueue({super.key});

  @override
  State<ProductionWorkQueue> createState() => _ProductionWorkQueueState();
}

class _ProductionWorkQueueState extends State<ProductionWorkQueue> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildMoListPart(
          status: MoPartStatus.completed,
          isMobile: false,
          title: 'MO-S2',
          startTime: '11:45 AM',
          endTime: '12:15 PM',
        ),
        BuildMoListPart(
          status: MoPartStatus.rejected,
          isMobile: false,
          title: 'MO-S2',
          startTime: '11:45 AM',
          endTime: '12:15 PM',
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return BuildMoListPart(
              title: 'MO-S3',
              status: MoPartStatus.open,
              isMobile: false,
              startTime: '11:45 AM',
              endTime: '12:15 PM',
            );
          },
        ),
      ],
    );
  }
}
