import 'package:flutter/material.dart';
import 'package:movies_app/ui/utils/app_colors.dart';

abstract final class AppStyle {
  static TextStyle white20Regular = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static TextStyle yellow16Regular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.goldenYellow,
  );
  static TextStyle white24Bold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
   static TextStyle gray20Bold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.gray,
  );
}
