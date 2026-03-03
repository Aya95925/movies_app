import 'package:flutter/material.dart';
import 'package:movies/ui/utils/app_assets.dart';
import 'package:movies/ui/utils/app_colors.dart';
import 'package:movies/ui/utils/app_routes.dart';
import 'package:movies/ui/utils/app_theme.dart';
import 'package:movies/ui/utils/extension/int_extensions.dart';
import 'package:movies/ui/widgets/language_switch.dart';
import 'package:movies/ui/widgets/main_button.dart';
import 'package:movies/ui/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscure = true;

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

                /// LOGO
                Image.asset(AppAssets.logo, width: 121, height: 118),
                30.verticalSpace(),

                30.verticalSpace(),

                /// EMAIL
                CustomTextField(hint: "Email", prefixIcon: Icons.email_sharp),

                16.verticalSpace(),

                /// PASSWORD
                CustomTextField(
                  hint: "Password",
                  prefixIcon: Icons.lock_sharp,
                  isPassword: true,
                  initialObscure: obscure,
                ),

                10.verticalSpace(),

                /// FORGET PASSWORD
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, AppRoutes.forgetPassword());
                    },
                    child: Text(
                      "Forget Password ?",
                      style: AppTheme.darkTheme.textTheme.labelMedium,
                    ),
                  ),
                ),

                24.verticalSpace(),

                /// LOGIN BUTTON
                CustomMainButton(text: "Login", onTap: () {}),

                16.verticalSpace(),

                /// CREATE ACCOUNT
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
                      onTap: () {
                        Navigator.push(context, AppRoutes.register());
                      },
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

                /// OR
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.goldenYellow,
                        indent: 38.0,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "OR",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: AppColors.goldenYellow,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.goldenYellow,
                        endIndent: 38.0,
                      ),
                    ),
                  ],
                ),

                24.verticalSpace(),

                /// GOOGLE LOGIN
                CustomMainButton(
                  text: "Login With Google",
                  icon: Image.asset(AppAssets.iconGoogle, width: 22),
                  onTap: () {},
                ),

                30.verticalSpace(),

                /// LANGUAGE SWITCH
                const LanguageSwitcherWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
