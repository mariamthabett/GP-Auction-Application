import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color? color, double? height) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontManager.fontFamily,
      color: color,
      fontWeight: fontWeight,
      height: height ?? 1.h);
}

// regular style

TextStyle getRegularStyle({double fontSize = 12, Color? color, double? height}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color, height);
}

// medium style

TextStyle getMediumStyle({double fontSize = 12, Color? color, double? height}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color, height);
}

// light style

TextStyle getLightStyle({double fontSize = 12, Color? color, double? height}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color, height);
}

// bold style

TextStyle getBoldStyle({double fontSize = 12, Color? color, double? height}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color, height);
}

// semibold style

TextStyle getSemiBoldStyle({double fontSize = 12, Color? color, double? height}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color, height);
}
//extra bold style

