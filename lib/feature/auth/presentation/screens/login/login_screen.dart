import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/di/di.dart';
import 'package:flutter_application_new/core/utils/app_assets.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/core/utils/app_routes.dart';
import 'package:flutter_application_new/core/utils/app_theme.dart';
import 'package:flutter_application_new/core/utils/extension/int_extensions.dart';
import 'package:flutter_application_new/feature/auth/presentation/screens/login/cubit/login_cubit.dart';
import 'package:flutter_application_new/feature/auth/ui/widgets/language_switch.dart';
import 'package:flutter_application_new/feature/auth/ui/widgets/main_button.dart';
import 'package:flutter_application_new/feature/auth/ui/widgets/text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.success) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.moviesHomeRoute,
              (route) => false,
            );
          }
          if (state.status == LoginStatus.error && state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.black,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    30.verticalSpace(),
                    Image.asset(AppAssets.logo, width: 121, height: 118),
                    60.verticalSpace(),
                    _EmailField(),
                    16.verticalSpace(),
                    _PasswordField(),
                    10.verticalSpace(),
                    _ForgetPasswordButton(),
                    24.verticalSpace(),
                    _LoginButton(),
                    16.verticalSpace(),
                    _CreateAccountRow(),
                    24.verticalSpace(),
                    _Divider(),
                    24.verticalSpace(),
                    _GoogleLoginButton(),
                    30.verticalSpace(),
                    const LanguageSwitcherWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "Email",
      prefixIcon: Icons.email_sharp,
      onChanged: (val) => context.read<LoginCubit>().emailChanged(val),
    );
  }
}

class _PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "Password",
      prefixIcon: Icons.lock_sharp,
      isPassword: true,
      onChanged: (password) =>
          context.read<LoginCubit>().passwordChanged(password),
    );
  }
}

class _ForgetPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, AppRoutes.forgetPasswordRoute),
        child: Text(
          "Forget Password ?",
          style: AppTheme.darkTheme.textTheme.labelMedium,
        ),
      ),
    );
  }
}

// زر تسجيل الدخول العادي
class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomMainButton(
          text: "Login",
          // يعمل فقط إذا كانت الحالة loadingCredentials
          isLoading: state.status == LoginStatus.loadingCredentials,
          onTap: () => context.read<LoginCubit>().loginWithCredentials(),
        );
      },
    );
  }
}

// زر جوجل
class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomMainButton(
          text: "Login With Google",
          backgroundColor: AppColors.goldenYellow,
          icon: Image.asset(AppAssets.iconGoogle, width: 22),
          // يعمل فقط إذا كانت الحالة loadingGoogle
          isLoading: state.status == LoginStatus.loadingGoogle,
          onTap: () => context.read<LoginCubit>().loginWithGoogle(),
        );
      },
    );
  }
}

class _CreateAccountRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't Have Account ? ",
          style: TextStyle(
            fontSize: 14,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
        InkWell(
          onTap: () => Navigator.pushNamed(context, AppRoutes.registerRoute),
          child: Text(
            "Create One",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 14,
              color: AppColors.goldenYellow,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.goldenYellow, indent: 38)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text("OR", style: TextStyle(color: AppColors.goldenYellow)),
        ),
        Expanded(child: Divider(color: AppColors.goldenYellow, endIndent: 38)),
      ],
    );
  }
}
