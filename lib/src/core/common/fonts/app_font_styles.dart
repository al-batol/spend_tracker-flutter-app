import 'package:flutter/material.dart';
import 'package:spend_tracker/src/core/common/constants/colors.dart';
import 'package:spend_tracker/src/core/common/fonts/app_font_sizes.dart';

class AppFontStyles {
  static const TextStyle heading = TextStyle(
    fontSize: AppFontSizes.lg,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: AppFontSizes.sm,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle body = TextStyle(
    fontSize: AppFontSizes.sm,
    fontWeight: FontWeight.normal,
    color: AppColors.light20,
  );

  static const TextStyle button = TextStyle(
    fontSize: AppFontSizes.sm,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static const TextStyle caption = TextStyle(
    fontSize: AppFontSizes.xs,
    color: Colors.grey,
  );

  static const TextStyle display = TextStyle(
    fontSize: AppFontSizes.xxl,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
