import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/forms/screens/bottom_sheet_detail.dart';

class AnimatedBottomSheet extends StatefulWidget {
  const AnimatedBottomSheet({
    super.key,
    required this.containerHeight,
    required this.isExpanded,
    required this.toggleContainer,
  });

  final double containerHeight;
  final bool isExpanded;
  final VoidCallback toggleContainer;

  @override
  State<AnimatedBottomSheet> createState() => _AnimatedBottomSheetState();
}

class _AnimatedBottomSheetState extends State<AnimatedBottomSheet>
    with TickerProviderStateMixin {
  bool showDetailModal = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: widget.containerHeight,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(11),
        boxShadow: const [
          BoxShadow(
            color: AppColors.pinnedSheetBoxShadowColor,
            offset: Offset(0, 5),
            blurRadius: 20,
          ),
        ],
      ),
      child: widget.isExpanded
          ? Sheet(
              callBack: () {
                setState(() {
                  showDetailModal = !showDetailModal;
                });
              },
              scrollcontroller: ScrollController(),
            )
          : const SizedBox.shrink(),
    );
  }
}
