part of 'splash_cubit.dart';

enum AuthStatus { initial, authenticated, unauthenticated }

class SplashState extends Equatable {
  final AuthStatus authStatus;
  const SplashState({this.authStatus = AuthStatus.initial});
  @override
  List<Object> get props => [authStatus];
  SplashState copyWith({AuthStatus? authStatus}) {
    return SplashState(authStatus: authStatus ?? this.authStatus);
  }
}
