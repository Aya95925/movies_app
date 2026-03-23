import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/feature/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  final AuthRepo _authRepo;
  RegisterUseCase(this._authRepo);

  Future<ApiResult<UserCredential>> call({
    required String name,
    required String email,
    required String password,
  }) => _authRepo.createUserWithEmailAndPassword(name, email, password);
}
