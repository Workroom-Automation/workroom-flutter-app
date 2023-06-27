import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';
import 'package:workroom_flutter_app/common/constants/app_text_styles.dart';

class DropDown extends StatefulWidget {
  const DropDown({
    super.key,
    required this.hint,
    required this.options,
  });
  final String hint;
  final List<String> options;

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    String? selectedOption;
    return Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.greyBorderColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: Text(
              widget.hint,
              style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            underline: Container(),
            value: selectedOption,
            style: CfTextStyles.getTextStyle(TStyle.h1_600)?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue!;
              });
            },
            items: widget.options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
