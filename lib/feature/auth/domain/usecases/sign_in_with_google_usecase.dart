import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/feature/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInWithGoogleUseCase {
  final AuthRepo _authRepo;
  SignInWithGoogleUseCase(this._authRepo);

  Future<ApiResult<UserCredential>> call() => _authRepo.signInWithGoogle();
}
