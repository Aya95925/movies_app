import 'package:flutter/material.dart';
import 'package:movies/ui/screens/login/login_screen.dart';
import 'package:movies/ui/screens/navigation/tabs/moveis/movies_home.dart';
import 'package:movies/ui/screens/onboarding/custom_onboarding.dart';
import 'package:movies/ui/screens/register/register.dart';
import 'package:movies/ui/screens/splash/custom_splash.dart';

abstract final class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String moviesHome = '/movies_home';
  static const String login = '/login';
  static const String register = '/register';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const CustomSplashScreen());
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const MovieOnboarding());
      case AppRoutes.moviesHome:
        return MaterialPageRoute(builder: (_) => const MoviesHome());
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ); // شاشة تسجيل الدخول
      // case AppRoutes.register:
      //   return MaterialPageRoute(
      //     builder: (_) => const RegisterScreen(),
      //   ); // شاشة التسجيل
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
