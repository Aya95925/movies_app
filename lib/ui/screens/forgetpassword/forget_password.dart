import 'package:flutter/material.dart';
import 'package:movies/ui/utils/app_assets.dart';
import 'package:movies/ui/utils/app_colors.dart';
import 'package:movies/ui/utils/extension/int_extensions.dart';

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

                /// IMAGE SECTION (الالتزام بالمرفق)
                Center(
                  child: Image.asset(
                    AppAssets.forgotPassword, // تأكد من المسار
                    height: 350,
                    fit: BoxFit.contain,
                  ),
                ),
                20.verticalSpace(),

                /// EMAIL FIELD (بنفس ستايل حقول الـ Register)
                _inputField(hint: "Email", icon: Icons.email),
                24.verticalSpace(),

                /// VERIFY BUTTON
                _mainButton(
                  text: "Verify Email",
                  onTap: () {
                    // منطق التحقق من الإيميل
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// INPUT FIELD (Reusable Style)
  Widget _inputField({required String hint, required IconData icon}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF212121), // الرمادي الغامق المتفق عليه
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        style: const TextStyle(color: AppColors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.white, fontSize: 14),
          prefixIcon: Icon(icon, color: AppColors.white),
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
          color: AppColors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
