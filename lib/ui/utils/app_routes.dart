import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/screens/forgetpassword/forget_password.dart';
import 'package:flutter_application_new/ui/screens/login/login_screen.dart';
import 'package:flutter_application_new/ui/screens/navigation/tabs/moveis/movies_details/movie_details.dart';
import 'package:flutter_application_new/ui/screens/navigation/tabs/moveis/movies_home.dart';
import 'package:flutter_application_new/ui/screens/navigation/tabs/moveis/profaile/update_profaile.dart';
import 'package:flutter_application_new/ui/screens/onboarding/custom_onboarding.dart';
import 'package:flutter_application_new/ui/screens/register/register.dart';
import 'package:flutter_application_new/ui/screens/splash/custom_splash.dart';

abstract final class AppRoutes {
  static Route splash() =>
      MaterialPageRoute(builder: (_) => const CustomSplashScreen());

  static Route onboarding() =>
      MaterialPageRoute(builder: (_) => const MovieOnboarding());

  static Route moviesHome() =>
      MaterialPageRoute(builder: (_) => const MoviesHome());

  static Route login() =>
      MaterialPageRoute(builder: (_) => const LoginScreen());

  static Route register() =>
      MaterialPageRoute(builder: (_) => const RegisterScreen());

  static Route forgetPassword() =>
      MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

  static Route updateScreen() =>
      MaterialPageRoute(builder: (_) => const UpdateProfaile());

  static Route movieDetails(String image) =>
      MaterialPageRoute(builder: (_) => MoviesDetails(image: image));

  /// ويدجيت افتراضية في حال حدوث خطأ في التوجيه
  static Route unDefinedRoute() => MaterialPageRoute(
    builder: (_) =>
        const Scaffold(body: Center(child: Text('No route defined'))),
  );
}
