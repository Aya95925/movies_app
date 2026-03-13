import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/di/di.dart';
import 'package:flutter_application_new/feature/splash/presentaion/screens/custom_splash.dart';

void main() async {
  initDependcies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CustomSplashScreen(),

      // onGenerateRoute: (settings) {
      //   switch (settings.name) {
      //     case "/":
      //       return AppRoutes.splash3
      // 6();
      //     case "/onboarding":
      //       return AppRoutes.onboarding();
      //     case "/moviesHome":
      //       return AppRoutes.moviesHome();
      //     case "/login":
      //       return AppRoutes.login();
      //     case "/register":
      //       return AppRoutes.register();
      //     default:
      //       return AppRoutes.unDefinedRoute();
      //   }
      // },
    );
  }
}
