import 'package:flutter/material.dart';
import 'package:movies/ui/utils/app_colors.dart';

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
                const SizedBox(height: 30),

                /// LOGO
                Image.asset(
                  "assets/images/main_logo.png",
                  width: 121,
                  height: 118,
                ),
                SizedBox(height: 30),

                /// EMAIL
                _inputField(hint: "Email", icon: Icons.email_sharp),

                const SizedBox(height: 16),

                /// PASSWORD
                _inputField(
                  hint: "Password",
                  icon: Icons.lock_sharp,
                  isPassword: true,
                  suffix: IconButton(
                    icon: Icon(
                      obscure ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.white,
                    ),
                    onPressed: () {
                      setState(() => obscure = !obscure);
                    },
                  ),
                ),

                const SizedBox(height: 10),

                /// FORGET PASSWORD
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forget Password ?",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      color: AppColors.goldenYellow,
                      fontSize: 13,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                /// LOGIN BUTTON
                _mainButton(text: "Login", onTap: () {}),

                const SizedBox(height: 16),

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
                    Text(
                      "Create One",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        color: AppColors.goldenYellow,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

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

                const SizedBox(height: 24),

                /// GOOGLE LOGIN
                _mainButton(
                  text: "Login With Google",
                  icon: Image.asset("assets/images/icon_google.png", width: 22),
                  onTap: () {},
                ),

                const SizedBox(height: 30),

                /// LANGUAGE SWITCH
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColors.goldenYellow),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage("assets/images/usa.png"),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage("assets/images/egypt.png"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// INPUT FIELD
  Widget _inputField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
    Widget? suffix,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkRed,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        obscureText: isPassword ? obscure : false,
        style: const TextStyle(color: AppColors.white, fontFamily: "Roboto"),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: AppColors.white,
            fontFamily: "Roboto",
          ),
          prefixIcon: Icon(icon, color: AppColors.white),
          suffixIcon: suffix,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }

  /// MAIN BUTTON
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
          color: AppColors.goldenYellow,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[icon, const SizedBox(width: 12)],
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: "Roboto",
                color: AppColors.darkRed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
