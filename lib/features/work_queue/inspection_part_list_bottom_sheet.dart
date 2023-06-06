import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/features/work_queue/animations/bouncing_animation.dart';

class InspectionPartListBottomSheet extends StatefulWidget {
  const InspectionPartListBottomSheet({
    super.key,
    required this.isRadioDisabled,
  });
  final bool isRadioDisabled;

  @override
  State<InspectionPartListBottomSheet> createState() =>
      _InspectionPartListBottomSheetState();
}

class _InspectionPartListBottomSheetState
    extends State<InspectionPartListBottomSheet> {
  int _selectedTileIndex = -1;

  final _tiles = [
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
    'MO-01-A-123-S1',
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      minChildSize: 0.8,
      maxChildSize: 0.8,
      initialChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              children: [
                Spacer(),
                Expanded(
                  child: Divider(
                    thickness: 3,
                  ),
                ),
                Spacer(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 16,
                bottom: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select part(s) to inspect',
                    style: CfTextStyles.getTextStyle(TStyle.h1_600)
                        ?.copyWith(fontSize: 16),
                  ),
                  BouncingAnimation(
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
                            const Icon(Icons.done, color: AppColors.whiteColor),
                            const SizedBox(width: 8),
                            Text(
                              'Select',
                              style: CfTextStyles.getTextStyle(TStyle.h1_600)
                                  ?.copyWith(
                                color: AppColors.whiteColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                shrinkWrap: true,
                itemCount: _tiles.length,
                itemBuilder: (context, index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border(
                        top: const BorderSide(color: AppColors.greyBorderColor),
                        bottom: index == _tiles.length - 1
                            ? const BorderSide(color: AppColors.greyBorderColor)
                            : const BorderSide(color: AppColors.transparent),
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        _tiles[index],
                        style:
                            CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                          color: widget.isRadioDisabled
                              ? AppColors.disabledTextColor
                              : AppColors.textColor,
                        ),
                      ),
                      leading: DecoratedBox(
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(color: AppColors.greyBorderColor),
                          ),
                        ),
                        child: Radio(
                          activeColor: AppColors.selectedRadioButtonColor,
                          value: index,
                          groupValue: widget.isRadioDisabled
                              ? null
                              : _selectedTileIndex,
                          onChanged: widget.isRadioDisabled
                              ? null
                              : (int? value) {
                                  setState(() {
                                    _selectedTileIndex = value!;
                                  });
                                },
                        ),
                      ),
                      trailing: Container(
                        width: 90,
                        height: 31,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: widget.isRadioDisabled
                                ? AppColors.disabledTextColor
                                : AppColors.greenBorderColor,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          color: widget.isRadioDisabled
                              ? AppColors.transparent
                              : AppColors.greenColor,
                        ),
                        child: Center(
                          child: Text(
                            'Completed',
                            style: CfTextStyles.getTextStyle(TStyle.h1_600)
                                ?.copyWith(fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      tileColor: _selectedTileIndex == index
                          ? AppColors.selectedRadioButtonTileColor
                          : null,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
