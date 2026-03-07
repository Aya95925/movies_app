import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/utils/app_assets.dart';
import 'package:flutter_application_new/ui/utils/app_colors.dart';
import 'package:flutter_application_new/ui/utils/app_routes.dart';
import 'package:flutter_application_new/ui/utils/extension/int_extensions.dart';
import 'package:flutter_application_new/ui/widgets/language_switch.dart';
import 'package:flutter_application_new/ui/widgets/main_button.dart';
import 'package:flutter_application_new/ui/widgets/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isLoading = false;

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
                  child: ClipOval(
                    child: Image.asset(
                      AppAssets.avatar,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                      // حماية ضد فقدان ملف الصورة
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.account_circle,
                        size: 100,
                        color: AppColors.white,
                      ),
                    ),
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
                CustomTextField(
                  controller: _nameController,
                  hint: "Name",
                  prefixIcon: Icons.badge_outlined,
                ),
                16.verticalSpace(),

                /// EMAIL FIELD
                CustomTextField(
                  controller: _emailController,
                  hint: "Email",
                  prefixIcon: Icons.email,
                ),
                16.verticalSpace(),

                /// PASSWORD FIELD
                CustomTextField(
                  controller: _passwordController,
                  hint: "Password",
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  initialObscure: obscurePassword,
                ),
                16.verticalSpace(),

                /// CONFIRM PASSWORD FIELD
                CustomTextField(
                  hint: "Confirm Password",
                  prefixIcon: Icons.lock,
                  isPassword: true,
                  initialObscure: obscureConfirmPassword,
                ),
                16.verticalSpace(),

                /// PHONE NUMBER FIELD
                CustomTextField(
                  controller: _phoneController,
                  hint: "Phone Number",
                  prefixIcon: Icons.phone,
                ),
                25.verticalSpace(),

                /// CREATE ACCOUNT BUTTON
                CustomMainButton(
                  text: "Create Account",
                  isLoading: _isLoading,
                  onTap: () async {
                    try {
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                      Navigator.pushReplacement(
                        context,
                        AppRoutes.moviesHome(),
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
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
                const LanguageSwitcherWidget(),
                20.verticalSpace(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
