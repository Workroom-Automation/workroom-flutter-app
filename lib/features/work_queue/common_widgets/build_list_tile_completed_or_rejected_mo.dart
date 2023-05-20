import 'package:flutter/material.dart';

import 'package:workroom_flutter_app/common/constants/all_status.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';

class BuildListTileCompletedOrRejectedMo extends StatelessWidget {
  const BuildListTileCompletedOrRejectedMo({
    super.key,
    required this.status,
    required this.isMobile,
    required this.title,
    required this.startTime,
    required this.endTime,
  });
  final MOStatus status;
  final bool isMobile;
  final String title;
  final String startTime;
  final String endTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        textColor: AppColors.textColor,
        iconColor: AppColors.iconColor,
        tileColor: AppColors.tileColor,
        title: isMobile
            ? Row(
                children: [
                  const Text(
                    'Part ID: ',
                    style: TextStyle(
                      color: AppColors.greyColor,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          'Part ID: ',
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          'Start: ',
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          startTime,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          'End: ',
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          startTime,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
        subtitle: isMobile
            ? Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Start: ',
                        style: TextStyle(
                          color: AppColors.greyColor,
                        ),
                      ),
                      Text(startTime)
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'End:   ',
                        style: TextStyle(
                          color: AppColors.greyColor,
                        ),
                      ),
                      Text(endTime)
                    ],
                  ),
                ],
              )
            : null,
        trailing: InkWell(
          onTap: () {
            // Handle open button press
          },
          child: Container(
            width: 117,
            height: 31,
            decoration: BoxDecoration(
              border: Border.all(
                color: status == MOStatus.completed
                    ? AppColors.greenBorderColor
                    : AppColors.redBorderColor,
              ),
              borderRadius: BorderRadius.circular(5),
              color: status == MOStatus.completed
                  ? AppColors.greenColor
                  : AppColors.redColor,
            ),
            child: status == MOStatus.completed
                ? const Center(child: Text('Completed'))
                : Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.access_time,
                          size: 20,
                        ),
                        Text('Rejected'),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
