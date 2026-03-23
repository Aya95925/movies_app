part of 'register_cubit.dart';

enum RegisterStatus { initial, loading, success, error }

class RegisterState extends Equatable {
  final RegisterStatus status;
  final String? errorMessage;
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;

  const RegisterState({
    this.status = RegisterStatus.initial,
    this.errorMessage,
    this.name = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.phone = '',
  });

  @override
  List<Object?> get props => [
    status,
    errorMessage,
    name,
    email,
    password,
    confirmPassword,
    phone,
  ];

  RegisterState copyWith({
    RegisterStatus? status,
    String? errorMessage,
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    String? phone,
  }) {
    return RegisterState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      phone: phone ?? this.phone,
    );
  }
}
