import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_new/feature/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_application_new/feature/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;

  LoginCubit(this._loginUseCase, this._signInWithGoogleUseCase)
    : super(const LoginState());

  void emailChanged(String email) {
    emit(
      state.copyWith(
        email: email,
        status: LoginStatus.initial,
        errorMessage: null,
      ),
    );
  }

  void passwordChanged(String password) {
    emit(
      state.copyWith(
        password: password,
        status: LoginStatus.initial,
        errorMessage: null,
      ),
    );
  }

  void loginWithCredentials() async {
    // التأكد من وجود بيانات قبل البدء
    if (state.email.trim().isEmpty || state.password.trim().isEmpty) {
      emit(
        state.copyWith(
          status: LoginStatus.error,
          errorMessage: "يرجى ملء جميع الحقول",
        ),
      );
      return;
    }

    emit(
      state.copyWith(status: LoginStatus.loadingCredentials),
    ); // تحميل خاص بهذا الزر فقط

    final result = await _loginUseCase(
      state.email.trim(),
      state.password.trim(),
    );

    if (result.isSuccess) {
      emit(state.copyWith(status: LoginStatus.success));
    } else {
      emit(
        state.copyWith(
          status: LoginStatus.error,
          errorMessage: result.error?.message ?? "خطأ في تسجيل الدخول",
        ),
      );
    }
  }

  void loginWithGoogle() async {
    emit(
      state.copyWith(status: LoginStatus.loadingGoogle),
    ); // تحميل خاص بزر جوجل فقط
    final result = await _signInWithGoogleUseCase();

    if (result.isSuccess) {
      emit(state.copyWith(status: LoginStatus.success));
    } else {
      emit(
        state.copyWith(
          status: LoginStatus.error,
          errorMessage: result.error?.message,
        ),
      );
    }
  }
}
