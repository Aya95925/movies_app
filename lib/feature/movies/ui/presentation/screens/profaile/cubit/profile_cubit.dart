import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_new/core/utils/resources.dart';
import 'package:flutter_application_new/feature/auth/domain/usecases/sign_out_usecase.dart';
import 'package:flutter_application_new/feature/movies/domain/usecase/get_movies_from_firestore_usecase.dart';
import 'package:flutter_application_new/feature/movies/domain/usecase/get_user_profile_stats_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final SignOutUseCase _signOutUseCase;
  final GetUserProfileStatsUseCase _getUserProfileStatsUseCase;
  final GetMoviesFromFirestoreUseCase _getMoviesFromFirestoreUseCase;
  final FirebaseAuth _firebaseAuth;

  StreamSubscription? _watchlistSubscription;
  StreamSubscription? _historySubscription;

  ProfileCubit(
    this._signOutUseCase,
    this._getUserProfileStatsUseCase,
    this._getMoviesFromFirestoreUseCase,
    this._firebaseAuth,
  ) : super(ProfileState.initial());

  void loadProfileData() async {
    await _watchlistSubscription?.cancel();
    await _historySubscription?.cancel();

    _refreshUser();

    _watchlistSubscription = _getMoviesFromFirestoreUseCase('watchlist').listen(
      (result) {
        if (result.isSuccess) {
          final movies = result.data ?? [];
          emit(
            state.copyWith(
              watchlist: Resources.success(movies),
              userStats: Resources.success({
                ...state.userStats.data ?? {},
                'watchlistCount': movies.length,
              }),
            ),
          );
        }
      },
    );

    _historySubscription = _getMoviesFromFirestoreUseCase('history').listen((
      result,
    ) {
      if (result.isSuccess) {
        final movies = result.data ?? [];
        emit(
          state.copyWith(
            history: Resources.success(movies),
            userStats: Resources.success({
              ...state.userStats.data ?? {},
              'historyCount': movies.length,
            }),
          ),
        );
      }
    });
  }

  void _refreshUser() async {
    try {
      await _firebaseAuth.currentUser?.reload();
    } catch (_) {}
    emit(state.copyWith(currentUser: _firebaseAuth.currentUser));
  }

  Future<void> updateProfile({
    required String name,
    required String photoPath,
  }) async {
    emit(state.copyWith(updateStatus: Resources.loading()));
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.updateDisplayName(name);
        await user.updatePhotoURL(photoPath);
        await user.reload();
        emit(
          state.copyWith(
            currentUser: _firebaseAuth.currentUser,
            updateStatus: Resources.success(null),
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(updateStatus: Resources.error(e.toString())));
    }
  }

  Future<void> signOut() async => await _signOutUseCase();

  @override
  Future<void> close() {
    _watchlistSubscription?.cancel();
    _historySubscription?.cancel();
    return super.close();
  }
}
