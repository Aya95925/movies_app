import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/utils/app_colors.dart';

class CustomMainButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final VoidCallback onTap;
  final Image? image;
  final Color? backgroundColor;
  final Color? textColor;

  final bool isLoading; // متغير حالة التحميل

  const CustomMainButton({
    super.key,
    required this.text,
    this.isLoading = false, // القيمة الافتراضية هي "لا يوجد تحميل"

    this.icon,
    this.image,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // إذا كان يحمل، نعطل الضغط
      onTap: isLoading ? null : onTap,
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: (isLoading)
              ? Colors
                    .grey // تغيير اللون عند التحميل
              : (backgroundColor ?? AppColors.goldenYellow),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: AppColors.black,
                    strokeWidth: 2,
                  ),
                )
              : Row(
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
      ),
    );
  }
}
