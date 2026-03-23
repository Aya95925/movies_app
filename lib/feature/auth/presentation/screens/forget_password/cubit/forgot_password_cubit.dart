import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_new/feature/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:injectable/injectable.dart';

part 'forgot_password_state.dart';

@injectable
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordCubit(this._forgotPasswordUseCase)
    : super(const ForgotPasswordState());

  // دالة تحديث الإيميل أثناء الكتابة
  void emailChanged(String email) {
    emit(state.copyWith(email: email, status: ForgotPasswordStatus.initial));
  }

  void sendPasswordResetEmail() async {
    if (state.email.trim().isEmpty) {
      emit(
        state.copyWith(
          status: ForgotPasswordStatus.error,
          errorMessage: 'Please enter your email address.',
        ),
      );
      return;
    }

    emit(state.copyWith(status: ForgotPasswordStatus.loading));

    final result = await _forgotPasswordUseCase(state.email.trim());

    if (result.isSuccess) {
      emit(state.copyWith(status: ForgotPasswordStatus.success));
    } else {
      emit(
        state.copyWith(
          status: ForgotPasswordStatus.error,
          errorMessage: result.error?.message ?? 'An unknown error occurred.',
        ),
      );
    }
  }
}
