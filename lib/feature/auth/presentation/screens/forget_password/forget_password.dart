import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_new/core/di/di.dart';
import 'package:flutter_application_new/core/utils/app_assets.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/feature/auth/presentation/screens/forget_password/cubit/forgot_password_cubit.dart';
import 'package:flutter_application_new/feature/auth/ui/widgets/main_button.dart';
import 'package:flutter_application_new/feature/auth/ui/widgets/text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // جلب الـ Cubit باستخدام Dependency Injection
      create: (context) => getIt<ForgotPasswordCubit>(),
      child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        // الاستماع لتغيرات الحالة لإظهار الرسائل أو التنقل
        listener: (context, state) {
          if (state.status == ForgotPasswordStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "If this email is registered, you will receive a reset link shortly.",
                ),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context); // العودة لشاشة تسجيل الدخول بعد النجاح
          }

          if (state.status == ForgotPasswordStatus.error &&
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
          appBar: _buildAppBar(context),
          body: const SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ), // استخدام 40.verticalSpace() إذا كانت مضافة
                    _ImageSection(),
                    SizedBox(height: 20),
                    _EmailField(),
                    SizedBox(height: 24),
                    _VerifyButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // بناء الـ AppBar بشكل منفصل لنظافة الكود
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.goldenYellow),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        "Forget Password",
        style: TextStyle(color: AppColors.goldenYellow, fontSize: 18),
      ),
      centerTitle: true,
    );
  }
}

// قسم الصورة
class _ImageSection extends StatelessWidget {
  const _ImageSection();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppAssets.forgotPassword,
        height: 350,
        fit: BoxFit.contain,
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "Email",
      prefixIcon: Icons.email,
      onChanged: (email) =>
          context.read<ForgotPasswordCubit>().emailChanged(email),
    );
  }
}

// زر التحقق الذي يستمع لحالة التحميل (Loading)
class _VerifyButton extends StatelessWidget {
  const _VerifyButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      // إعادة بناء الزر فقط عند تغير الحالة (status)
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return CustomMainButton(
          text: "Verify Email",
          isLoading: state.status == ForgotPasswordStatus.loading,
          onTap: () {
            // إغلاق الكيبورد قبل الإرسال
            FocusScope.of(context).unfocus();
            context.read<ForgotPasswordCubit>().sendPasswordResetEmail();
          },
        );
      },
    );
  }
}
