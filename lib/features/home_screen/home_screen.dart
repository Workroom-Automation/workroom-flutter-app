import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_assets.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/home_screen/home_screen_widgets/build_status_tile_home.dart';
import 'package:workroom_flutter_app/features/home_screen/home_screen_widgets/mo_ongoing_card.dart';
import 'package:workroom_flutter_app/features/home_screen/home_screen_widgets/mo_open_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, bool> isSelected = {
    'Open': true,
    'Ongoing': false,
  };

  void onStatusTap(String status) {
    setState(() {
      if (isSelected[status] as bool) {
        isSelected[status] = !(isSelected[status] as bool);
        return;
      }
      isSelected = {
        'Open': false,
        'Ongoing': false,
      };
      isSelected[status] = !(isSelected[status] as bool);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: AppColors.gradientLeftToRight,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Manufacturing Orders',
                  style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                    fontSize: 20,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                BuildStatusTileHome(
                  count: '12',
                  isSelected: isSelected['Open'] as bool,
                  color: AppColors.openStatusColor,
                  status: 'Open',
                  ontapFunction: onStatusTap,
                ),
                const SizedBox(
                  width: 8,
                ),
                BuildStatusTileHome(
                  count: '12',
                  isSelected: isSelected['Ongoing'] as bool,
                  color: AppColors.reworkStatusColor,
                  status: 'Ongoing',
                  ontapFunction: onStatusTap,
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.greyBorderColor,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Image.asset(
                          AppAssets.bigDotImage,
                          color: AppColors.historyDotColor,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'History',
                          style: CfTextStyles.getTextStyle(TStyle.h1_600)
                              ?.copyWith(),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          if (isSelected['Open'] as bool)
            const Column(
              children: [
                MoOpenCard(
                  title: 'Shaft 0123 Production',
                  description:
                      'This manufacturing order is to make shaft 0123 using all process steps',
                  companyName: 'TATA Motors Private Limited',
                  moNumber: 'MO-01-236-A1',
                  jobType: 'Order',
                  quantity: '35',
                  date: 'Start by 12 PM, Today',
                  itemName: 'Propeller Shaft',
                ),
                MoOpenCard(
                  title: 'E-Axle 15mm Production ',
                  description:
                      'This manufacturing order is to make e-axle of the 15mm thickness specification using all process steps',
                  companyName: 'Daimler India Private Limited ',
                  moNumber: 'MO-01-236-A2',
                  jobType: 'Stock',
                  quantity: '18',
                  date: 'Start by 3 PM, Today',
                  itemName: 'E-Axle',
                ),
              ],
            )
          else
            const Column(
              children: [
                MoOngoingCard(
                  title: 'Shaft 0123 Production',
                  description:
                      'This manufacturing order is to make shaft 0123 using all process steps',
                  companyName: 'TATA Motors Private Limited',
                  moNumber: 'MO-01-236-A1',
                  jobType: 'Order',
                  quantity: '35',
                  date: 'End by 12 PM, Today',
                  quantityCompleted: '18',
                  itemName: 'Propeller Shaft',
                ),
                MoOngoingCard(
                  title: 'E-Axle 15mm Production ',
                  description:
                      'This manufacturing order is to make e-axle of the 15mm thickness specification using all process steps',
                  companyName: 'Daimler India Private Limited ',
                  moNumber: 'MO-01-236-A2',
                  jobType: 'Stock',
                  quantity: '18',
                  date: 'End by 3 PM, Today',
                  quantityCompleted: '18',
                  itemName: 'E-Axle',
                ),
              ],
            )
        ],
      ),
    );
  }
}
