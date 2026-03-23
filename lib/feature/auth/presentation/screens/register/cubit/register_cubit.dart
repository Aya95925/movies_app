import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_new/feature/auth/domain/usecases/register_usecase.dart';
import 'package:injectable/injectable.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;
  RegisterCubit(this._registerUseCase) : super(const RegisterState());

  void nameChanged(String name) => emit(
    state.copyWith(
      name: name,
      status: RegisterStatus.initial,
      errorMessage: null,
    ),
  );
  void emailChanged(String email) => emit(
    state.copyWith(
      email: email,
      status: RegisterStatus.initial,
      errorMessage: null,
    ),
  );
  void passwordChanged(String password) => emit(
    state.copyWith(
      password: password,
      status: RegisterStatus.initial,
      errorMessage: null,
    ),
  );
  void confirmPasswordChanged(String confirmPassword) => emit(
    state.copyWith(
      confirmPassword: confirmPassword,
      status: RegisterStatus.initial,
      errorMessage: null,
    ),
  );
  void phoneChanged(String phone) => emit(
    state.copyWith(
      phone: phone,
      status: RegisterStatus.initial,
      errorMessage: null,
    ),
  );

  void registerWithCredentials() async {
    if (state.name.isEmpty ||
        state.email.isEmpty ||
        state.password.isEmpty ||
        state.confirmPassword.isEmpty ||
        state.phone.isEmpty) {
      emit(
        state.copyWith(
          status: RegisterStatus.error,
          errorMessage: 'Please fill in all fields.',
        ),
      );
      return;
    }

    if (state.password != state.confirmPassword) {
      emit(
        state.copyWith(
          status: RegisterStatus.error,
          errorMessage: 'Passwords do not match.',
        ),
      );
      return;
    }

    if (state.password.length < 6) {
      emit(
        state.copyWith(
          status: RegisterStatus.error,
          errorMessage: 'Password must be at least 6 characters.',
        ),
      );
      return;
    }

    emit(state.copyWith(status: RegisterStatus.loading));

    final result = await _registerUseCase(
      name: state.name.trim(),
      email: state.email.trim(),
      password: state.password.trim(),
    );

    if (result.isSuccess) {
      emit(state.copyWith(status: RegisterStatus.success));
    } else {
      emit(
        state.copyWith(
          status: RegisterStatus.error,
          errorMessage: result.error?.message ?? 'Registration failed.',
        ),
      );
    }
  }
}
