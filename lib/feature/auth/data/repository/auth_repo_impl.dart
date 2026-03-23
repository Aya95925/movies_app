import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/core/utils/app_error.dart';
import 'package:flutter_application_new/core/utils/extension/connectivity_extension.dart';
import 'package:flutter_application_new/feature/auth/data/datasource/auth_remote_data_source.dart';
import 'package:flutter_application_new/feature/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _dataSource;
  final Connectivity _connectivity;

  AuthRepoImpl(this._dataSource, this._connectivity);

  // Helper function to handle API calls with error handling
  Future<ApiResult<T>> _handleAuthRequest<T>(
    Future<T> Function() request,
  ) async {
    if (!await _connectivity.isConnected) {
      return ErrorApiResult(NetworkError());
    }
    try {
      final result = await request();
      return SuccessApiResult(result);
    } on FirebaseAuthException catch (e) {
      return ErrorApiResult(AuthError(message: e.message));
    } catch (e) {
      return ErrorApiResult(UnknownError(message: e.toString()));
    }
  }

  @override
  User? checkAuthStatus() {
    return _dataSource.checkAuthStatus();
  }

  @override
  Future<ApiResult<UserCredential>> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) {
    return _handleAuthRequest(
      () => _dataSource.createUserWithEmailAndPassword(name, email, password),
    );
  }

  @override
  Future<ApiResult<void>> sendPasswordResetEmail(String email) {
    return _handleAuthRequest(() => _dataSource.sendPasswordResetEmail(email));
  }

  @override
  Future<ApiResult<UserCredential>> signInWithEmailAndPassword(
    String email,
    String password,
  ) {
    return _handleAuthRequest(
      () => _dataSource.signInWithEmailAndPassword(email, password),
    );
  }

  @override
  Future<ApiResult<UserCredential>> signInWithGoogle() {
    return _handleAuthRequest(() => _dataSource.signInWithGoogle());
  }

  @override
  Future<ApiResult<void>> signOut() {
    return _handleAuthRequest(() => _dataSource.signOut());
  }
}
