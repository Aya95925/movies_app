import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/feature/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgotPasswordUseCase {
  final AuthRepo _authRepo;
  ForgotPasswordUseCase(this._authRepo);

  Future<ApiResult<void>> call(String email) =>
      _authRepo.sendPasswordResetEmail(email);
}
