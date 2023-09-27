import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/constants/constants.dart';
import 'package:workroom_flutter_app/common/services/api_service/dio_api_service.dart';
import 'package:workroom_flutter_app/common/services/logger_service/logger_service.dart';
import 'package:workroom_flutter_app/features/quality_app/quality_app_widgets/inspection_card.dart';

class InspectionQueueScreen extends StatefulWidget {
  const InspectionQueueScreen({super.key});

  @override
  State<InspectionQueueScreen> createState() => _InspectionQueueScreenState();
}

class _InspectionQueueScreenState extends State<InspectionQueueScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    final dio = DioApiService(inspectionListBaseUrl);
    final resp = await dio.get(
      '/incoming-quality-inspections/my?supplierId=&includeIncomingPart=false%27',
      {},
      {
        'CtxNamespaceKey': 'x-namespace',
        'x-namespace': 'workroom',
      },
    );
    AppLogger.printLog(resp);
  }

  String fromDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String toDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AppAssets.workRoomLogo,
          fit: BoxFit.fill,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: AppColors.gradientLeftToRight,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.whiteColor,
                  ),
                  Text(
                    'Incoming QA',
                    style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                      fontSize: 20,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.greyBorderColor,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 27,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DecoratedBox(
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: AppColors.greyBorderColor,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          child: Text(
                            'Status',
                            style: CfTextStyles.getTextStyle(
                              TStyle.h1_600,
                            )?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'All',
                              style: CfTextStyles.getTextStyle(
                                TStyle.h1_600,
                              )?.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                            DropdownButton<String>(
                              items: <String>[
                                'Option 1',
                                'Option 2',
                                'Option 3'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: CfTextStyles.getTextStyle(
                                      TStyle.h1_600,
                                    )?.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {},
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: AppColors.greyColor,
                              ),
                              underline: const SizedBox(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.greyBorderColor,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 27,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DecoratedBox(
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: AppColors.greyBorderColor,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                'From',
                                style: CfTextStyles.getTextStyle(
                                  TStyle.h1_600,
                                )?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100),
                              );
                              if (pickedDate != null) {
                                AppLogger.printLog(pickedDate);
                              }
                              setState(() {
                                fromDate = DateFormat('dd-MM-yyyy')
                                    .format(pickedDate!);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    fromDate,
                                    style: CfTextStyles.getTextStyle(
                                      TStyle.h1_600,
                                    )?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_down,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.greyBorderColor,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 27,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DecoratedBox(
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: AppColors.greyBorderColor,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                'To',
                                style: CfTextStyles.getTextStyle(
                                  TStyle.h1_600,
                                )?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100),
                              );
                              if (pickedDate != null) {
                                AppLogger.printLog(pickedDate);
                              }
                              setState(() {
                                toDate = DateFormat('dd-MM-yyyy')
                                    .format(pickedDate!);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    toDate,
                                    style: CfTextStyles.getTextStyle(
                                      TStyle.h1_600,
                                    )?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_down,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const InspectionCard(
            title: '21.5” Keypad Board PCB',
            quantity: '35',
            date: 'Start by 12 PM, Today',
            itemName: 'Supplier A Pvt. Ltd.',
            status: QualityStatus.start,
            color: AppColors.blueBorderColor,
          ),
          const SizedBox(
            height: 20,
          ),
          const InspectionCard(
            title: '21.5” Keypad Board PCB',
            quantity: '35',
            date: 'Start by 12 PM, Today',
            itemName: 'Supplier A Pvt. Ltd.',
            status: QualityStatus.ongoing,
            color: AppColors.reworkStatusColor,
          ),
          const SizedBox(
            height: 20,
          ),
          const InspectionCard(
            title: '21.5” Keypad Board PCB',
            quantity: '35',
            date: 'Start by 12 PM, Today',
            itemName: 'Supplier A Pvt. Ltd.',
            status: QualityStatus.accepted,
            color: AppColors.greenBorderColor,
          ),
        ],
      ),
    );
  }
}
