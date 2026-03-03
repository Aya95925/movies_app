import 'package:flutter/material.dart';
import 'package:movies/ui/utils/app_colors.dart';

class CustomMainButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final VoidCallback onTap;
  final Image? image;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomMainButton({
    super.key,
    required this.text,
    this.icon,
    this.image,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.goldenYellow,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[icon!, const SizedBox(width: 12)],
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                color: textColor ?? AppColors.darkRed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
