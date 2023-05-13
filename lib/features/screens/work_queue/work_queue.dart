import 'package:flutter/material.dart';
// import 'package:workroom_flutter_app/app/app.dart';
import 'package:workroom_flutter_app/common/constants/all_status.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/constants/constants.dart';
import 'package:workroom_flutter_app/common/services/navigation_service/navigation_service.dart';
import 'package:workroom_flutter_app/core/di/injection.dart';

class WorkQueuePage extends StatefulWidget {
  const WorkQueuePage({super.key});

  @override
  State<WorkQueuePage> createState() => _WorkQueuePagePageState();
}

class _WorkQueuePagePageState extends State<WorkQueuePage> {
  void pop() {
    getIt<NavigationService>().pop();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: pop,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Work Que'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                _buildMOHeader(title: 'MO Title & Details'),
                const SizedBox(
                  height: 16,
                ),
                if (constraints.maxWidth >= mobileScreenSizeLimit)
                  SizedBox(
                    height: 54,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatusTile(
                          width: width,
                          status: 'Completed',
                          count: '0',
                        ),
                        _buildStatusTile(
                          width: width,
                          status: 'In Process',
                          count: '0',
                        ),
                        _buildStatusTile(
                          width: width,
                          status: 'Reject',
                          count: '0',
                        ),
                        _buildStatusTile(
                          width: width,
                          status: 'Rework',
                          count: '0',
                        ),
                      ],
                    ),
                  )
                else
                  SizedBox(
                    height: 116,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildStatusTile(
                              width: width,
                              status: 'Completed',
                              count: '0',
                            ),
                            _buildStatusTile(
                              width: width,
                              status: 'In Process',
                              count: '0',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildStatusTile(
                              width: width,
                              status: 'Reject',
                              count: '0',
                            ),
                            _buildStatusTile(
                              width: width,
                              status: 'Rework',
                              count: '0',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 37,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        'Manufacturing Order Que ',
                        style:
                            CfTextStyles.getTextStyle(TStyle.h1_700)?.copyWith(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '(10)',
                        style:
                            CfTextStyles.getTextStyle(TStyle.h1_700)?.copyWith(
                          color: AppColors.subtitleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                if (constraints.maxWidth >= mobileScreenSizeLimit)
                  _buildListTileCompletedOrRejectedMO(
                    status: MOStatus.completed,
                    isMobile: false,
                    title: 'Part ID: MO-S2',
                    startTime: '11:45 AM',
                    endTime: '12:15 PM',
                  )
                else
                  _buildListTileCompletedOrRejectedMO(
                    status: MOStatus.completed,
                    isMobile: true,
                    title: 'Part ID: MO-S2',
                    startTime: '11:45 AM',
                    endTime: '12:15 PM',
                  ),
                if (constraints.maxWidth >= mobileScreenSizeLimit)
                  _buildListTileCompletedOrRejectedMO(
                    status: MOStatus.rejected,
                    isMobile: false,
                    title: 'Part ID: MO-S2',
                    startTime: '11:45 AM',
                    endTime: '12:15 PM',
                  )
                else
                  _buildListTileCompletedOrRejectedMO(
                    status: MOStatus.rejected,
                    isMobile: true,
                    title: 'Part ID: MO-S2',
                    startTime: '11:45 AM',
                    endTime: '12:15 PM',
                  ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return _buildListTileOpenMO(title: 'Part ID: MO-S3');
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMOHeader({required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        textColor: AppColors.textColor,
        iconColor: AppColors.iconColor,
        tileColor: AppColors.tileColor,
        title: Text(
          title,
          style: CfTextStyles.getTextStyle(TStyle.h1_400)?.copyWith(
            color: AppColors.textColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        trailing: const Icon(Icons.arrow_drop_down),
        onTap: () {
          // Handle tile tap event here
        },
      ),
    );
  }

  Widget _buildListTileOpenMO({
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        textColor: AppColors.textColor,
        iconColor: AppColors.iconColor,
        tileColor: AppColors.tileColor,
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                // Handle open button press
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Container(
                  width: 79,
                  height: 28,
                  color: AppColors.blueColor,
                  child: const Center(child: Text('Open')),
                ),
              ),
            ),
            const SizedBox(width: 14),
            InkWell(
              onTap: () {
                // Handle start button press
              },
              child: Container(
                width: 79,
                height: 28,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(90),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.play_arrow_rounded),
                      Text('Start'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusTile({
    required double width,
    required String status,
    required String count,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          width: width / 4,
          height: 54,
          decoration: BoxDecoration(
            color: AppColors.tileColor,
            border: Border.all(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$status: '),
              Text(count),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTileCompletedOrRejectedMO({
    required MOStatus status,
    required bool isMobile,
    required String title,
    required String startTime,
    required String endTime,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        textColor: AppColors.textColor,
        iconColor: AppColors.iconColor,
        tileColor: AppColors.tileColor,
        title: isMobile
            ? Text(title)
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Text(title)),
                  Expanded(child: Text('Start: $startTime')),
                  Expanded(child: Text('End: $endTime')),
                ],
              ),
        subtitle: isMobile
            ? const Text(
                'Start: 11:45 AM\nEnd:   12:15 PM',
                overflow: TextOverflow.ellipsis,
              )
            : null,
        trailing: InkWell(
          onTap: () {
            // Handle open button press
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: Container(
              width: 110,
              height: 28,
              color: status == MOStatus.completed
                  ? AppColors.greenColor
                  : AppColors.redColor,
              child: status == MOStatus.completed
                  ? const Center(child: Text('Completed'))
                  : Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.access_time, size: 20),
                          Text('Rejected'),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
