class AppError {
  final String? message;
  AppError({this.message});
}

class NetworkError extends AppError {
  NetworkError({String message = 'Please check your internet connection'})
    : super(message: message);
}

class ServerError extends AppError {
  ServerError({String message = 'Server is down, please try again later'})
    : super(message: message);
}

class AuthError extends AppError {
  AuthError({String? message})
    : super(message: message ?? 'An authentication error occurred.');
}

class UnknownError extends AppError {
  UnknownError({
    String message = 'Something went wrong, please try again later',
  }) : super(message: message);
}
