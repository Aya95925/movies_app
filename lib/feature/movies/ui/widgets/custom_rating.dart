import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/core/utils/extension/int_extensions.dart';

class CustomRating extends StatelessWidget {
  final String rating;
  const CustomRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      left: 8,
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.black.withAlpha(200),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              rating,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            2.horizontalSpace(),
            Icon(Icons.star, color: AppColors.goldenYellow, size: 20),
          ],
        ),
      ),
    );
  }
}
