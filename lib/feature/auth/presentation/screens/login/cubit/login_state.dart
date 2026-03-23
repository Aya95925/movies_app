part of 'login_cubit.dart';

enum LoginStatus { initial, loadingCredentials, loadingGoogle, success, error }

class LoginState extends Equatable {
  final LoginStatus status;
  final String? errorMessage;
  final String email;
  final String password;

  const LoginState({
    this.status = LoginStatus.initial,
    this.errorMessage,
    this.email = '',
    this.password = '',
  });

  @override
  List<Object?> get props => [status, errorMessage, email, password];

  LoginState copyWith({
    LoginStatus? status,
    String? errorMessage,
    String? email,
    String? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
