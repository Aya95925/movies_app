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
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isLoading = false; // متغير حالة التحميل

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

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
                    AppAssets.avatar9,
                    height: 130,
                    width: double.infinity,
                    fit: BoxFit.cover,
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
                ),
                16.verticalSpace(),

                /// CONFIRM PASSWORD FIELD
                CustomTextField(
                  controller: _confirmPasswordController,
                  hint: "Confirm Password",
                  prefixIcon: Icons.lock,
                  isPassword: true,
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
                  isLoading: _isLoading, // ربط حالة التحميل بالزر
                  onTap: () async {
                    if (_nameController.text.isEmpty ||
                        _emailController.text.isEmpty ||
                        _passwordController.text.isEmpty ||
                        _confirmPasswordController.text.isEmpty ||
                        _phoneController.text.isEmpty) {
                      _showSnackBar("يرجى ملء جميع الحقول");
                      return;
                    }

                    // 2. التحقق من تطابق كلمة المرور
                    if (_passwordController.text !=
                        _confirmPasswordController.text) {
                      _showSnackBar("كلمات المرور غير متطابقة");
                      return;
                    }

                    // 3. التحقق من طول كلمة المرور
                    if (_passwordController.text.length < 6) {
                      _showSnackBar("كلمة المرور يجب أن تكون 6 أحرف على الأقل");
                      return;
                    }

                    setState(() => _isLoading = true); // بدء التحميل

                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );

                      if (mounted) {
                        Navigator.pushReplacement(
                          context,
                          AppRoutes.moviesHome(),
                        );
                      }
                    } on FirebaseAuthException catch (e) {
                      String message = "حدث خطأ أثناء إنشاء الحساب";
                      if (e.code == 'weak-password') {
                        message = "كلمة المرور ضعيفة جداً.";
                      } else if (e.code == 'email-already-in-use') {
                        message = "هذا البريد الإلكتروني مستخدم بالفعل.";
                      } else if (e.code == 'invalid-email') {
                        message = "صيغة البريد الإلكتروني غير صحيحة.";
                      }
                      _showSnackBar(message);
                    } catch (e) {
                      _showSnackBar("خطأ غير متوقع: $e");
                    } finally {
                      if (mounted) {
                        setState(() => _isLoading = false); // إيقاف التحميل
                      }
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

                /// LANGUAGE SWITCH
                const LanguageSwitcherWidget(),
                20.verticalSpace(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message, style: const TextStyle(fontFamily: "Roboto")),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }
}
