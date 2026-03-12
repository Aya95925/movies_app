class AppError {
  final String? error;

  AppError({this.error});
}

class NetworkError extends AppError {
  NetworkError({String error = 'Server is down,please try again later'})
    : super(error: error);
}

class ServerError extends AppError {
  ServerError({String error = 'Please check your internet connection'})
    : super(error: error);
}

class IgnoredError extends AppError {
  IgnoredError({String error = ''}) : super(error: error);
}

class UnKnownError extends AppError {
  UnKnownError({String error = 'someThing went Wrong , please try again later'})
    : super(error: error);
}
