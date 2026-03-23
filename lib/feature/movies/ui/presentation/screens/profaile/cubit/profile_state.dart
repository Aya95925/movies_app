part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final User? currentUser;
  final Resources<Map<String, int>> userStats;
  final Resources<List<MovieEntity>> watchlist;
  final Resources<List<MovieEntity>> history;
  final Resources<void> updateStatus;
  final Resources<void> deleteStatus;
  final Resources<String> resetPasswordStatus;

  const ProfileState({
    this.currentUser,
    required this.userStats,
    required this.watchlist,
    required this.history,
    required this.updateStatus,
    required this.deleteStatus,
    required this.resetPasswordStatus,
  });

  factory ProfileState.initial() {
    return ProfileState(
      currentUser: FirebaseAuth.instance.currentUser,
      userStats: Resources.initial(),
      watchlist: Resources.initial(),
      history: Resources.initial(),
      updateStatus: Resources.initial(),
      deleteStatus: Resources.initial(),
      resetPasswordStatus: Resources.initial(),
    );
  }

  @override
  List<Object?> get props => [
    currentUser,
    userStats,
    watchlist,
    history,
    updateStatus,
    deleteStatus,
    resetPasswordStatus,
  ];

  ProfileState copyWith({
    User? currentUser,
    Resources<Map<String, int>>? userStats,
    Resources<List<MovieEntity>>? watchlist,
    Resources<List<MovieEntity>>? history,
    Resources<void>? updateStatus,
    Resources<void>? deleteStatus,
    Resources<String>? resetPasswordStatus,
  }) {
    return ProfileState(
      currentUser: currentUser ?? this.currentUser,
      userStats: userStats ?? this.userStats,
      watchlist: watchlist ?? this.watchlist,
      history: history ?? this.history,
      updateStatus: updateStatus ?? this.updateStatus,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      resetPasswordStatus: resetPasswordStatus ?? this.resetPasswordStatus,
    );
  }
}
