import 'package:flutter/material.dart';
import 'package:movies/ui/utils/app_assets.dart';
import 'package:movies/ui/utils/app_colors.dart';
import 'package:movies/ui/utils/extension/int_extensions.dart';
import 'package:movies/ui/widgets/main_button.dart';
import 'package:movies/ui/widgets/text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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

                CustomTextField(hint: "Email", prefixIcon: Icons.email),
                24.verticalSpace(),

                /// VERIFY BUTTON
                CustomMainButton(text: "Verify Email", onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
