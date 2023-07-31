import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:workroom_flutter_app/common/animations/bouncing_animation.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class MultiValuedTextField extends StatefulWidget {
  const MultiValuedTextField({
    super.key,
    required this.isEnabled,
    required this.width,
    required this.fieldNo,
  });
  final bool isEnabled;
  final double width;
  final String fieldNo;

  @override
  State<MultiValuedTextField> createState() => _MultiValuedTextFieldState();
}

class _MultiValuedTextFieldState extends State<MultiValuedTextField> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          showDialog<AlertDialog>(
            context: context,
            builder: (context) {
              return AlertDialog(
                elevation: 0,
                actionsAlignment: MainAxisAlignment.spaceEvenly,
                actions: [
                  BouncingAnimation(
                    onTap: () {
                      // getIt<NavigationService>().pop();
                      FocusScope.of(context).unfocus();
                    },
                    widget: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                          gradient: true ? null : AppColors.disabledGradient,
                          border: Border.all(
                            color: AppColors.greyColor.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: CfTextStyles.getTextStyle(
                              TStyle.h1_600,
                            )?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  BouncingAnimation(
                    onTap: () {
                      // _formKey.currentState?.save();
                      // getIt<NavigationService>().pop();
                      FocusScope.of(context).unfocus();
                    },
                    widget: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(
                          gradient: true
                              ? AppColors.gradientLeftToRight
                              : AppColors.disabledGradient,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        child: Center(
                          child: Text(
                            'OK',
                            style: CfTextStyles.getTextStyle(
                              TStyle.h1_600,
                            )?.copyWith(
                              color: true
                                  ? AppColors.whiteColor
                                  : AppColors.textColor,
                              fontSize: 12,
                              fontWeight:
                                  true ? FontWeight.w700 : FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                title: Text(
                  'Select options',
                  style: CfTextStyles.getTextStyle(
                    TStyle.h1_600,
                  )?.copyWith(
                    fontSize: 18,
                  ),
                ),
                content: SizedBox(
                  height: 300,
                  width: 300,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FormBuilder(
                          child: Column(
                            children: [
                              FormBuilderCheckboxGroup(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                activeColor: AppColors.selectedButtonColor,
                                orientation: OptionsOrientation.vertical,
                                name: 'form',
                                options: ['Widget', 'Hello']
                                    .map(
                                      (option) => FormBuilderFieldOption(
                                        value: option,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          height: 50,
          width: widget.width * 0.8,
          decoration: BoxDecoration(
            color: widget.isEnabled
                ? AppColors.whiteColor
                : AppColors.greyBorderColor.withOpacity(0.5),
            border: Border.all(
              color: AppColors.greyBorderColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Row(
              children: [
                Text(
                  '${widget.fieldNo}.',
                  style: CfTextStyles.getTextStyle(
                    TStyle.h1_600,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                    // items: ['Hello', 'Bye'].map((String value) {
                    //   return DropdownMenuItem<String>(
                    //     value: value,
                    //     child: Text(value),
                    //   );
                    // }).toList(),
                    // alignment: Alignment.center,
                    // decoration: const InputDecoration(
                    //   border: InputBorder.none,
                    // ),
                    // enabled: widget.isEnabled,
                    // // controller: controller,
                    // name: 'form',
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
