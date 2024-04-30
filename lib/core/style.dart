import 'package:flutter/material.dart';
import 'package:taskati/core/colors.dart';

TextStyle getHeadlineStyle({double fontSize = 18}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor);
}

TextStyle getTitleStyle({Color color = Colors.black, double fontSize = 18}) {
  return TextStyle(
      fontSize: fontSize, fontWeight: FontWeight.bold, color: color);
}

TextStyle getSubStyle({fontSize = 16, Color color = Colors.black}) {
  return TextStyle(color: color);
}

TextStyle getsmallStyle({fontSize = 14, Color color = Colors.grey}) {
  return TextStyle(color: color);
}
