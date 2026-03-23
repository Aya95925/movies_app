import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/di/di.dart';
import 'package:flutter_application_new/core/utils/app_assets.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/core/utils/app_routes.dart';
import 'package:flutter_application_new/feature/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({super.key});

  @override
  State<CustomSplashScreen> createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  final SplashCubit splashCubit = getIt<SplashCubit>();

  @override
  void initState() {
    super.initState();
    splashCubit.checkAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => splashCubit,
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state.authStatus == AuthStatus.authenticated) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.moviesHomeRoute,
              (route) => false,
            );
          } else if (state.authStatus == AuthStatus.unauthenticated) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.onboardingRoute,
              (route) => false,
            );
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.black,
          body: Stack(
            children: [
              Center(
                child: Image.asset(AppAssets.logo, width: 253, height: 253),
              ),
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset(AppAssets.routeLogo, height: 76, width: 180),
                    const SizedBox(height: 10),
                    const Text(
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
        ),
      ),
    );
  }
}
