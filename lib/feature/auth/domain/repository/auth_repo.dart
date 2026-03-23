import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_new/core/utils/api_result.dart';

abstract class AuthRepo {
  // UseCases for Auth
  Future<ApiResult<UserCredential>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<ApiResult<UserCredential>> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  );
  Future<ApiResult<UserCredential>> signInWithGoogle();
  Future<ApiResult<void>> signOut();
  Future<ApiResult<void>> sendPasswordResetEmail(String email);

  // UseCase for Splash Screen
  User? checkAuthStatus();
}
