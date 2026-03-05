import 'package:flutter/material.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/utils/app_style.dart';

class CustomMovieBottom extends StatelessWidget {
  const CustomMovieBottom({
    super.key,
    required this.text,
    required this.color,
    this.textColor = AppColors.white,
  });
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: AppStyle.white20Regular.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
