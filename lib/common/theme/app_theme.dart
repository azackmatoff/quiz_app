import 'package:flutter/material.dart';
import 'package:quiz_app/common/constants/colors/app_colors.dart';

class AppTheme {
  static final theme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.seedColor,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: AppColors.white),
      titleLarge: TextStyle(
        color: AppColors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(
            color: AppColors.white,
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          AppColors.red,
        ), // Primary button color
        foregroundColor: WidgetStateProperty.all<Color>(AppColors.white),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.white),
  );
}
