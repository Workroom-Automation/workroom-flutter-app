import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';
import 'package:workroom_flutter_app/common/constants/constants.dart';
import 'package:workroom_flutter_app/common/services/navigation_service/navigation_service.dart';
import 'package:workroom_flutter_app/core/di/injection.dart';

class MultiSelectDropdown extends StatefulWidget {
  final bool isDisabled;
  final int selectedIndex;

  const MultiSelectDropdown({
    Key? key,
    this.isDisabled = true,
    this.selectedIndex = 1,
  }) : super(key: key);

  @override
  _MultiSelectDropdownState createState() => _MultiSelectDropdownState();
}

class _MultiSelectDropdownState extends State<MultiSelectDropdown>
    with SingleTickerProviderStateMixin {
  bool _isDropdownOpen = false;
  List<String> selectedOptions = [];
  List<String> options = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 6',
    'Option 7',
    'Option 8',
    'Option 9',
    'Option 10',
    'Option 11',
  ];
  AnimationController? _animationController;
  Animation<double>? _fadeAnimation;
  Animation<Offset>? _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, -0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  void toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
      if (_isDropdownOpen) {
        _animationController!.forward();
      } else {
        _animationController!.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Field ${widget.selectedIndex + 1}:',
          style: CfTextStyles.getTextStyle(TStyle.h1_600),
        ),
        GestureDetector(
          onTap: toggleDropdown,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: AppColors.greyBorderColor,
              ),
              color: widget.isDisabled
                  ? AppColors.greyColor.withOpacity(0.2)
                  : AppColors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    selectedOptions.isEmpty
                        ? 'Select options'
                        : selectedOptions.join(', '),
                    style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: widget.isDisabled
                          ? AppColors.greyColor
                          : AppColors.textColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  _isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                ),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _isDropdownOpen ? 200 : 0,
          child: ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              child: SlideTransition(
                position: _slideAnimation!,
                child: FadeTransition(
                  opacity: _fadeAnimation!,
                  child: Container(
                    margin: const EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      // border: Border.all(
                      //   color: Colors.grey,
                      // ),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          for (String option in options)
                            ListTile(
                              onTap: widget.isDisabled
                                  ? () {
                                      getIt<NavigationService>().pop();
                                      Shared.toast(context,
                                          'The field is disabled. Click on start loggin to enable it.');
                                    }
                                  : () {
                                      setState(() {
                                        if (selectedOptions.contains(option)) {
                                          selectedOptions.remove(option);
                                        } else {
                                          selectedOptions.add(option);
                                        }
                                      });
                                    },
                              leading: selectedOptions.contains(option)
                                  ? const Icon(
                                      Icons.check_box,
                                      color: AppColors.selectedButtonColor,
                                    )
                                  : const Icon(
                                      Icons.check_box_outline_blank,
                                      color: AppColors.greyColor,
                                    ),
                              title: Text(
                                option,
                                style: CfTextStyles.getTextStyle(TStyle.h1_600)
                                    ?.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: widget.isDisabled
                                      ? AppColors.greyColor
                                      : AppColors.textColor,
                                ),
                              ),
                              // tileColor: selectedOptions.contains(option)
                              //     ? Colors.grey[200]
                              //     : null,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
