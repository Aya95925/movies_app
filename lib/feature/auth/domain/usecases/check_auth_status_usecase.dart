import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_new/feature/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckAuthStatusUseCase {
  final AuthRepo _authRepo;
  CheckAuthStatusUseCase(this._authRepo);

  User? call() => _authRepo.checkAuthStatus();
}
