import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String? hint;
  final bool isPassword; // هل هو حقل كلمة مرور (يظهر أيقونة العين)
  final bool initialObscure; // التحكم في حالة التشفير الأولية
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.prefixIcon,
    this.suffixIcon,
    this.hint,
    this.isPassword = false,
    this.initialObscure = false, // اختيارية، والقيمة الافتراضية غير مشفر
    this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscure;

  @override
  void initState() {
    super.initState();
    // إذا كان حقل كلمة مرور، يبدأ مشفراً تلقائياً، وإلا يأخذ القيمة الممررة
    obscure = widget.isPassword ? true : widget.initialObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2B2B2B),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: widget.controller,
        // يستخدم الحالة المحلية obscure التي نتحكم بها
        obscureText: obscure,
        style: const TextStyle(color: AppColors.white, fontFamily: "Roboto"),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: const TextStyle(
            color: AppColors.white,
            fontFamily: "Roboto",
          ),
          prefixIcon: Icon(widget.prefixIcon, color: AppColors.white),

          // منطق أيقونة الـ Suffix
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    obscure ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.white,
                  ),
                  onPressed: () => setState(() => obscure = !obscure),
                )
              : (widget.suffixIcon != null
                    ? Icon(widget.suffixIcon, color: AppColors.white)
                    : null),

          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 12,
          ),
        ),
      ),
    );
  }
}
