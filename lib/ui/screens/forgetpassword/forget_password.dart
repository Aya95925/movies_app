import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/utils/app_assets.dart';
import 'package:flutter_application_new/ui/utils/app_colors.dart';
import 'package:flutter_application_new/ui/utils/extension/int_extensions.dart';
import 'package:flutter_application_new/ui/widgets/main_button.dart';
import 'package:flutter_application_new/ui/widgets/text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.goldenYellow),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Forget Password",
          style: TextStyle(color: AppColors.goldenYellow, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                40.verticalSpace(),

                Center(
                  child: Image.asset(
                    AppAssets.forgotPassword,
                    height: 350,
                    fit: BoxFit.contain,
                  ),
                ),
                20.verticalSpace(),

                CustomTextField(
                  hint: "Email",
                  prefixIcon: Icons.email,
                  controller: emailController,
                ),
                24.verticalSpace(),

                /// VERIFY BUTTON
                CustomMainButton(
                  text: "Verify Email",
                  isLoading: isLoading,
                  onTap: () async {
                    if (emailController.text.isEmpty) {
                      // أظهر رسالة خطأ إذا كان الحقل فارغاً
                      return;
                    }

                    setState(() => isLoading = true);

                    try {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: emailController.text.trim(),
                      );

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "إذا كان هذا البريد مسجلاً لدينا، فستصلك رسالة قريباً.",
                            ),
                          ),
                        );
                      }
                    } on FirebaseAuthException catch (e) {
                      String message = "حدث خطأ: ${e.message}";
                      if (context.mounted) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(message)));
                      }
                    } finally {
                      if (context.mounted) {
                        setState(() => isLoading = false);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
