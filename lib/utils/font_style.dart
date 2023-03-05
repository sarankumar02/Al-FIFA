import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


TextStyle customBRCobaneTextStyle(
    {double fontSize = 20,
    Color color = Colors.black,
    double lineHeight = 1,
    FontWeight fontWeight = FontWeight.w600}) {
  return TextStyle(
      fontWeight: fontWeight,
      color: color,
      height: lineHeight,
      fontSize: fontSize,
      fontFamily: "Tajawal-ExtraBold");
}

TextStyle caseTitleStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
);

TextStyle caseIdStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
);
