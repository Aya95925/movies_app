import 'package:flutter/material.dart';
import 'package:movies/ui/utils/app_colors.dart';

abstract final class AppTheme {
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.goldenYellow,
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.goldenYellow,
      secondary: AppColors.white,
    ),

    // إعدادات النصوص الموحدة (Inter & Roboto)
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w500,
        fontFamily: "Inter",
        color: AppColors.white,
        height: 1.2,
      ),
      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        fontFamily: "Inter",
        color: AppColors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: "Inter",
        color: AppColors.white,
      ),
      titleSmall: TextStyle(
        color: Color.fromARGB(97, 255, 255, 255),
        fontSize: 20,
        // height: 1.3,
        fontFamily: "Inter",
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        height: 1.3,
        // fontWeight: FontWeight.w400,
        fontFamily: "Inter",
        color: AppColors.white, // أبيض بشفافية 60% كما طلبت
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "Inter",
        color: AppColors.goldenYellow, // أبيض بشفافية 60% كما طلبت
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: "Roboto",
        color: AppColors.white,
      ),
      labelLarge: TextStyle(
        fontSize: 18,
        color: AppColors.goldenYellow,
        fontWeight: FontWeight.bold,
        fontFamily: "Inter",
      ),
      labelMedium: TextStyle(
        fontSize: 13,
        color: AppColors.goldenYellow,
        fontFamily: "Inter",
      ),
    ),

    // إعدادات الحقول (تستخدم lightBlack)
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.darkBlack,
      hintStyle: const TextStyle(
        color: AppColors.white,
        fontFamily: "Roboto",
        fontSize: 15,
      ),
    ),
  );
}
