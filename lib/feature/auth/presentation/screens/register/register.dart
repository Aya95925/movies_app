import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/di/di.dart';
import 'package:flutter_application_new/core/utils/app_assets.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/core/utils/app_routes.dart';
import 'package:flutter_application_new/core/utils/extension/int_extensions.dart';
import 'package:flutter_application_new/feature/auth/presentation/screens/register/cubit/register_cubit.dart';
import 'package:flutter_application_new/feature/auth/ui/widgets/language_switch.dart';
import 'package:flutter_application_new/feature/auth/ui/widgets/main_button.dart';
import 'package:flutter_application_new/feature/auth/ui/widgets/text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.status == RegisterStatus.success) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.moviesHomeRoute,
              (route) => false,
            );
          }
          if (state.status == RegisterStatus.error &&
              state.errorMessage != null) {
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
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            title: const Text(
              "Register",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontFamily: "Roboto",
                color: AppColors.goldenYellow,
              ),
            ),
            backgroundColor: AppColors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.goldenYellow),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    10.verticalSpace(),
                    Center(
                      child: Image.asset(
                        AppAssets.avatar9,
                        height: 130,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text(
                      "Avatar",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontFamily: "Roboto",
                      ),
                    ),
                    12.verticalSpace(),
                    _NameField(),
                    16.verticalSpace(),
                    _EmailField(),
                    16.verticalSpace(),
                    _PasswordField(),
                    16.verticalSpace(),
                    _ConfirmPasswordField(),
                    16.verticalSpace(),
                    _PhoneField(),
                    25.verticalSpace(),
                    _CreateAccountButton(),
                    17.verticalSpace(),
                    _LoginRedirect(),
                    18.verticalSpace(),
                    const LanguageSwitcherWidget(),
                    20.verticalSpace(),
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

// Widgets for each field to keep the build method clean

class _NameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "Name",
      prefixIcon: Icons.badge_outlined,
      onChanged: (name) => context.read<RegisterCubit>().nameChanged(name),
    );
  }
}

class _EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "Email",
      prefixIcon: Icons.email,
      onChanged: (email) => context.read<RegisterCubit>().emailChanged(email),
    );
  }
}

class _PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "Password",
      prefixIcon: Icons.lock,
      isPassword: true,
      onChanged: (password) =>
          context.read<RegisterCubit>().passwordChanged(password),
    );
  }
}

class _ConfirmPasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "Confirm Password",
      prefixIcon: Icons.lock,
      isPassword: true,
      onChanged: (confirmPassword) =>
          context.read<RegisterCubit>().confirmPasswordChanged(confirmPassword),
    );
  }
}

class _PhoneField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "Phone Number",
      prefixIcon: Icons.phone,
      onChanged: (phone) => context.read<RegisterCubit>().phoneChanged(phone),
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return CustomMainButton(
          text: "Create Account",
          isLoading: state.status == RegisterStatus.loading,
          onTap: () => context.read<RegisterCubit>().registerWithCredentials(),
        );
      },
    );
  }
}

class _LoginRedirect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already Have Account ? ",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: "Roboto",
            color: AppColors.white,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Text(
            "Login",
            style: TextStyle(
              fontSize: 14,
              fontFamily: "Roboto",
              color: AppColors.goldenYellow,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
