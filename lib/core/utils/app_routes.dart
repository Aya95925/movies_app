import 'package:flutter/material.dart';
import 'package:flutter_application_new/feature/auth/presentation/screens/forget_password/forget_password.dart';
import 'package:flutter_application_new/feature/auth/presentation/screens/login/login_screen.dart';
import 'package:flutter_application_new/feature/auth/presentation/screens/register/register.dart';
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/details/movie_details.dart';
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/home/movies_home.dart';
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/onboarding/custom_onboarding.dart';
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/profaile/update_profile.dart';
import 'package:flutter_application_new/feature/splash/presentation/cubit/screens/custom_splash.dart';

abstract final class AppRoutes {
  // Route names as constants
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgetPasswordRoute = '/forget-password';
  static const String moviesHomeRoute = '/movies-home';
  static const String movieDetailsRoute = '/movie-details';
  static const String updateProfileRoute = '/update-profile';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const CustomSplashScreen());
      case onboardingRoute:
        return MaterialPageRoute(builder: (_) => const MovieOnboarding());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case moviesHomeRoute:
        return MaterialPageRoute(builder: (_) => const MoviesHome());

      case movieDetailsRoute:
        final args = settings.arguments;
        if (args is int) {
          return MaterialPageRoute(
            builder: (_) => MoviesDetails(movieId: args),
          );
        }
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('خطأ: لم يتم العثور على معرف الفيلم')),
          ),
        );

      case updateProfileRoute:
        return MaterialPageRoute(builder: (_) => const UpdateProfaile());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No route defined'))),
        );
    }
  }

  static Future<T?>? navigateToMovieDetails<T>(
    BuildContext context,
    int movieId,
  ) {
    return Navigator.pushNamed(context, movieDetailsRoute, arguments: movieId);
  }
}
