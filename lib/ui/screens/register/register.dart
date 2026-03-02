import 'package:flutter/material.dart';
import 'package:movies/ui/utils/app_colors.dart';
import 'package:movies/ui/utils/app_theme.dart';
import 'package:movies/ui/utils/extension/context_extension.dart';
import 'package:movies/ui/utils/extension/int_extensions.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black, // AppColors.black
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.goldenYellow,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Register", style: context.textTheme.bodyMedium),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                20.verticalSpace(),

                /// LOGO
                Image.asset(
                  "assets/images/main_logo.png",
                  width: 121,
                  height: 118,
                ),
                30.verticalSpace(),

                /// NAME FIELD
                _inputField(hint: "Name", icon: Icons.person_sharp),
                const SizedBox(height: 16),

                /// EMAIL FIELD
                _inputField(hint: "Email", icon: Icons.email_sharp),
                16.verticalSpace(),

                /// PASSWORD FIELD
                _inputField(
                  hint: "Password",
                  icon: Icons.lock_sharp,
                  isPassword: true,
                  suffix: IconButton(
                    icon: Icon(
                      obscure ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.white,
                    ),
                    onPressed: () => setState(() => obscure = !obscure),
                  ),
                ),
                16.verticalSpace(),

                /// CONFIRM PASSWORD FIELD
                _inputField(
                  hint: "Confirm Password",
                  icon: Icons.lock_sharp,
                  isPassword: true,
                ),

                16.verticalSpace(),

                /// PHONE FIELD
                _inputField(hint: "Phone Number", icon: Icons.phone_sharp),

                30.verticalSpace(),

                /// CREATE ACCOUNT BUTTON
                _mainButton(text: "Create Account", onTap: () {}),

                16.verticalSpace(),

                /// LOGIN REDIRECT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have Account? ",
                      style: AppTheme
                          .darkTheme
                          .textTheme
                          .headlineMedium, //??????????
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        "Login",
                        style: AppTheme
                            .darkTheme
                            .textTheme
                            .headlineMedium, //?????????
                      ),
                    ),
                  ],
                ),
                30.verticalSpace(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// نفس الـ Widgets المستخدمة في صفحة الـ Login لضمان تطابق التصميم
  Widget _inputField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
    Widget? suffix,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkBlack, // AppColors.lightBlack
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        obscureText: isPassword ? obscure : false,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTheme.darkTheme.inputDecorationTheme.hintStyle,
          prefixIcon: Icon(icon, color: AppColors.white),
          suffixIcon: suffix,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }

  Widget _mainButton({
    required String text,
    Widget? icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.goldenYellow, // goldenYellow
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[icon, const SizedBox(width: 12)],
            Text(
              text,
              style: AppTheme.darkTheme.textTheme.headlineMedium, //?????????
            ),
          ],
        ),
      ),
    );
  }
}
