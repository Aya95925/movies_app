import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_native_splash/flutter_native_splash.dart';

class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({super.key});

  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  @override
  void initState() {
    super.initState();

    FlutterNativeSplash.remove();

    // الانتقال للأونبوردينج بعد 3 ثواني
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // اللوجو في المنتصف
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: 253,
              height: 253,
            ),
          ),
          // الجزء السفلي
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/route_logo.png',
                  height: 76,
                  width: 180,
                ),
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
