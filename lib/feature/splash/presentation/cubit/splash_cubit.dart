import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_new/feature/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:injectable/injectable.dart';

part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final CheckAuthStatusUseCase _checkAuthStatusUseCase;

  SplashCubit(this._checkAuthStatusUseCase) : super(const SplashState());

  void checkAuthentication() async {
    // تأخير بسيط لإعطاء فرصة لظهور شاشة البداية
    await Future.delayed(const Duration(seconds: 3));

    final user = _checkAuthStatusUseCase();
    if (user != null) {
      emit(state.copyWith(authStatus: AuthStatus.authenticated));
    } else {
      emit(state.copyWith(authStatus: AuthStatus.unauthenticated));
    }
  }
}
