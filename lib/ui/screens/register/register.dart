import 'package:flutter/material.dart';
import 'package:movies/ui/utils/app_assets.dart';
import 'package:movies/ui/utils/app_colors.dart';
import 'package:movies/ui/utils/app_routes.dart';
import 'package:movies/ui/utils/extension/int_extensions.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Register",
          style: TextStyle(fontFamily: "Roboto", color: AppColors.goldenYellow),
        ),
        backgroundColor: AppColors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.goldenYellow),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                10.verticalSpace(),

                /// AVATAR SELECTION SECTION
                Center(
                  child: Image.asset(
                    AppAssets.avatar, // تأكد من اسم الملف الصحيح
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                const Text(
                  "Avatar",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontFamily: "Roboto",
                  ),
                ),
                12.verticalSpace(),

                /// NAME FIELD
                _inputField(hint: "Name", icon: Icons.badge_outlined),
                16.verticalSpace(),

                /// EMAIL FIELD
                _inputField(hint: "Email", icon: Icons.email),
                16.verticalSpace(),

                /// PASSWORD FIELD
                _inputField(
                  hint: "Password",
                  icon: Icons.lock,
                  isPassword: true,
                  obscure: obscurePassword,
                  suffix: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.white,
                    ),
                    onPressed: () =>
                        setState(() => obscurePassword = !obscurePassword),
                  ),
                ),
                16.verticalSpace(),

                /// CONFIRM PASSWORD FIELD
                _inputField(
                  hint: "Confirm Password",
                  icon: Icons.lock,
                  isPassword: true,
                  obscure: obscureConfirmPassword,
                  suffix: IconButton(
                    icon: Icon(
                      obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.white,
                    ),
                    onPressed: () => setState(
                      () => obscureConfirmPassword = !obscureConfirmPassword,
                    ),
                  ),
                ),
                16.verticalSpace(),

                /// PHONE NUMBER FIELD
                _inputField(hint: "Phone Number", icon: Icons.phone),
                16.verticalSpace(),

                /// CREATE ACCOUNT BUTTON
                _mainButton(
                  text: "Create Account",
                  onTap: () {
                    Navigator.pushReplacement(context, AppRoutes.moviesHome());
                  },
                ),
                17.verticalSpace(),

                /// LOGIN REDIRECT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already Have Account ? ",
                      style: TextStyle(color: AppColors.white),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: AppColors.goldenYellow,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                18.verticalSpace(),

                /// LANGUAGE SWITCH (Same as Login)
                _languageSwitcher(),
                20.verticalSpace(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// INPUT FIELD (Customized to match Login Style)
  Widget _inputField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool obscure = false,
    Widget? suffix,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF212121), // لون رمادي غامق جداً مثل الصورة
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        obscureText: isPassword ? obscure : false,
        style: const TextStyle(color: AppColors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.white, fontSize: 14),
          prefixIcon: Icon(icon, color: AppColors.white),
          suffixIcon: suffix,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }

  /// MAIN BUTTON
  Widget _mainButton({required String text, required VoidCallback onTap}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.goldenYellow,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.black, // النص بلون غامق على الزر الأصفر
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// LANGUAGE SWITCHER WIDGET
  Widget _languageSwitcher() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.goldenYellow),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AppAssets.usaFlag, width: 30),
          const SizedBox(width: 10),
          Image.asset(AppAssets.egyptFlag, width: 30),
        ],
      ),
    );
  }
}
