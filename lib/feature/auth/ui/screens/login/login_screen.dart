import 'package:flutter_application_new/core/utils/app_assets.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/core/utils/app_routes.dart';
import 'package:flutter_application_new/core/utils/app_theme.dart';
import 'package:flutter_application_new/core/utils/extension/int_extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/feature/auth/ui/widgets/language_switch.dart';
import 'package:flutter_application_new/feature/auth/ui/widgets/main_button.dart';
import 'package:flutter_application_new/feature/auth/ui/widgets/text_field.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushAndRemoveUntil(
      context,
      AppRoutes.moviesHome(),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                30.verticalSpace(),
                Image.asset(AppAssets.logo, width: 121, height: 118),
                60.verticalSpace(),

                /// EMAIL FIELD
                CustomTextField(
                  controller: _emailController,
                  hint: "Email",
                  prefixIcon: Icons.email_sharp,
                ),

                16.verticalSpace(),

                /// PASSWORD FIELD
                CustomTextField(
                  controller: _passwordController,
                  hint: "Password",
                  prefixIcon: Icons.lock_sharp,
                  isPassword: true,
                ),

                10.verticalSpace(),

                /// FORGET PASSWORD
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () =>
                        Navigator.push(context, AppRoutes.forgetPassword()),
                    child: Text(
                      "Forget Password ?",
                      style: AppTheme.darkTheme.textTheme.labelMedium,
                    ),
                  ),
                ),

                24.verticalSpace(),

                /// LOGIN BUTTON
                CustomMainButton(
                  text: "Login",
                  isLoading: isLoading,
                  onTap: () async {
                    if (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("يرجى ملء جميع الحقول")),
                      );
                      return;
                    }

                    setState(() => isLoading = true);

                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      );

                      if (context.mounted) {
                        Navigator.pushReplacement(
                          context,
                          AppRoutes.moviesHome(),
                        );
                      }
                    } on FirebaseAuthException catch (e) {
                      String message = "حدث خطأ أثناء تسجيل الدخول";
                      if (e.code == 'user-not-found') {
                        message = "لا يوجد حساب بهذا البريد الإلكتروني.";
                      } else if (e.code == 'wrong-password') {
                        message = "كلمة المرور غير صحيحة.";
                      } else if (e.code == 'invalid-email') {
                        message = "صيغة البريد الإلكتروني غير صحيحة.";
                      }

                      if (context.mounted) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(message)));
                      }
                    } catch (e) {
                      print("Error: $e");
                    } finally {
                      if (context.mounted) {
                        setState(() => isLoading = false);
                      }
                    }
                  },
                ),

                16.verticalSpace(),

                /// CREATE ACCOUNT ROW
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have Account ? ",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        color: AppColors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () =>
                          Navigator.push(context, AppRoutes.register()),
                      child: Text(
                        "Create One",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: AppColors.goldenYellow,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                24.verticalSpace(),

                /// DIVIDER "OR"
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: AppColors.goldenYellow, indent: 38),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "OR",
                        style: TextStyle(color: AppColors.goldenYellow),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.goldenYellow,
                        endIndent: 38,
                      ),
                    ),
                  ],
                ),

                24.verticalSpace(),

                /// GOOGLE LOGIN BUTTON
                CustomMainButton(
                  text: "Login With Google",
                  backgroundColor: AppColors.goldenYellow,
                  icon: Image.asset(AppAssets.iconGoogle, width: 22),
                  onTap: () {
                    signInWithGoogle();
                  },
                ),

                30.verticalSpace(),
                const LanguageSwitcherWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
