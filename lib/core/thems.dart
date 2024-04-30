import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati/core/colors.dart';
import 'package:taskati/core/style.dart';

final ligthThem = ThemeData(
  primaryColor: Colors.black,
  textTheme: TextTheme(
    displayLarge: getTitleStyle(color: Colors.black),
    displayMedium: getSubStyle(color: Colors.black),
    displaySmall: getsmallStyle(color: Colors.black),
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      titleTextStyle: getHeadlineStyle(),
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      backgroundColor: Colors.transparent,
      elevation: 0.0),
  inputDecorationTheme: InputDecorationTheme(
      hintStyle: getsmallStyle(),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(15)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(15)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(15)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(15))),
);

//------------------- Dark Mode ---------------------------------

final darkThem = ThemeData(
  primaryColor: Colors.white,
  textTheme: TextTheme(
    displayLarge: getTitleStyle(color: Colors.black),
    displayMedium: getSubStyle(color: Colors.black),
    displaySmall: getsmallStyle(color: Colors.black),
  ),
  scaffoldBackgroundColor: AppColors.darkBG,
  appBarTheme: AppBarTheme(
      titleTextStyle: getHeadlineStyle(),
      iconTheme: IconThemeData(color: AppColors.primaryColor),
      backgroundColor: Colors.transparent,
      elevation: 0.0),
  inputDecorationTheme: InputDecorationTheme(
      hintStyle: getsmallStyle(),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(15)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(15)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(15)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(15))),
);

mixin primaryColorDark {}
