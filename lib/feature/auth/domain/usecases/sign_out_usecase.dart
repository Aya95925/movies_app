import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/feature/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignOutUseCase {
  final AuthRepo _authRepo;
  SignOutUseCase(this._authRepo);

  Future<ApiResult<void>> call() => _authRepo.signOut();
}
