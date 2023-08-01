import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class CaptureEvidence extends StatefulWidget {
  const CaptureEvidence({
    super.key,
    required this.textFieldEnabled,
  });
  final bool textFieldEnabled;

  @override
  State<CaptureEvidence> createState() => _CaptureEvidenceState();
}

class _CaptureEvidenceState extends State<CaptureEvidence>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyBorderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: _toggleExpand,
            child: Container(
              padding: EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
                bottom: _isExpanded ? 0 : 16,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Add Evidence',
                      style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: Tween(begin: 0.0, end: 0.5).animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.easeInOut,
                      ),
                    ),
                    child: const Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
            ),
          ),
          SizeTransition(
            sizeFactor: _animationController,
            axisAlignment: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.greyBorderColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add_photo_alternate_rounded,
                            size: 50,
                            color: AppColors.greyColor.withOpacity(0.6),
                          ),
                        ),
                      ),
                      // ? work here with images
                      // Expanded(
                      //   child: Container(
                      //     height: 100,
                      //     child: ListView.builder(
                      //       scrollDirection: Axis.horizontal,
                      //       itemCount: 10,
                      //       itemBuilder: (context, index) {
                      //         return CircleAvatar();
                      //       },
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: TextField(
                    enabled: widget.textFieldEnabled,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Add Your Remarks here',
                      labelStyle: CfTextStyles.getTextStyle(
                        TStyle.h1_600,
                      )?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.greyBorderColor,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.greyBorderColor,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.greyBorderColor,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
