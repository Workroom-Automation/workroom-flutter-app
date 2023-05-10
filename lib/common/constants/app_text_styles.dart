import 'package:flutter/material.dart';
import 'package:workroom_flutter_app/common/constants/app_colors.dart';

enum TStyle {
  h1_700,
  h1_600,
  h1_400,
  h2_700,
  h2_600,
  h2_400,
  h3_700,
  h3_600,
  h3_400,
  h4_700,
  h4_600,
  h4_400,
  h5_700,
  h5_600,
  h5_400,
  b1_700,
  b1_600,
  b1_400,
  b2_700,
  b2_600,
  b2_400,
  b3_700,
  b3_600,
  b3_400
}

class CfTextStyles {
  static late Map<TStyle, TextStyle> textStyleMap;
  static const font = 'RobotoRegular';

  static TextStyle? getTextStyle(
    TStyle style, {
    TextStyle? customStyle,
  }) {
    textStyleMap = CfTextStyles.mobTextStyle;
    return customStyle != null
        ? textStyleMap[style]!.merge(customStyle)
        : textStyleMap[style];
  }

  static final Map<TStyle, TextStyle> mobTextStyle = {
    TStyle.h1_700: const TextStyle(
      fontFamily: font,
      fontSize: 28,
      fontWeight: FontWeight.w900,
      color: AppColors.red,
    ),
  };
}
