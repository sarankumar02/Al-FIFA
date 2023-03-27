import 'package:al_fifa/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle customBRCobaneTextStyle(
    {double fontSize = 20,
    Color color = AppColor.secondaryColor,
    double lineHeight = 1,
    FontWeight fontWeight = FontWeight.w600}) {
  return TextStyle(
      fontWeight: fontWeight,
      color: color,
      height: lineHeight,
      fontSize: fontSize,
      fontFamily: "Tajawal-Regular");
}

TextStyle dropdownTextStyle() {
  return TextStyle(fontFamily: 'Tajawal-Regular', fontSize: 15);
}

TextStyle caseTitleStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
);

TextStyle caseIdStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
);
