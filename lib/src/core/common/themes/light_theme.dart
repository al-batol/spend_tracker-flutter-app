import 'package:flutter/material.dart';
import 'package:spend_tracker/src/core/common/constants/colors.dart';
import 'package:spend_tracker/src/core/common/fonts/app_font_styles.dart';

class LightTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.bgColor,
    primaryColor: AppColors.primaryColor,
    fontFamily: 'Inter',
    useMaterial3: true,
    disabledColor: AppColors.light20,
    textTheme: TextTheme(
      displayLarge: AppFontStyles.display,
      headlineMedium: AppFontStyles.heading,
      titleMedium: AppFontStyles.subtitle,
      bodySmall: AppFontStyles.caption,
      labelMedium: AppFontStyles.labelMedium,
      bodyMedium: AppFontStyles.button,
      displaySmall: AppFontStyles.displaySmall,
      displayMedium: AppFontStyles.titleMedium,
    ),
    // checkboxTheme: CheckboxThemeData(
    //
    // ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: AppFontStyles.displaySmall,
      suffixIconColor: AppColors.light20,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        // borderSide: BorderSide(color: AppColors.inputBg),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.inputBg),
      ),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.inputBg),
      ),
    ),
  );
}
