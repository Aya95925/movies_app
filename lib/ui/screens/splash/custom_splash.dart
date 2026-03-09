import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/utils/app_assets.dart';
import 'dart:async';

import 'package:flutter_application_new/ui/utils/app_routes.dart';

class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({super.key});

  @override
  State<CustomSplashScreen> createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  @override
  void initState() {
    super.initState();

    // الانتقال للأونبوردينج بعد 3 ثواني
    Timer(const Duration(seconds: 3), () {
      // فحص حالة المستخدم الحالية
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // إذا كان مسجل دخول، اذهب للرئيسية مباشرة
        Navigator.pushReplacement(context, AppRoutes.moviesHome());
      } else {
        // إذا لم يكن مسجل، اذهب للأونبوردينج
        Navigator.pushReplacement(context, AppRoutes.onboarding());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(child: Image.asset(AppAssets.logo, width: 253, height: 253)),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(AppAssets.routeLogo, height: 76, width: 180),
                SizedBox(height: 10),
                Text(
                  "Supervised by Mohamed Nabil",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "Poppins",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
