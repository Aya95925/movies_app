part of 'home_cubit.dart';

class HomeState extends Equatable {
  final Resources<List<MovieEntity>> latestMovies;
  final Resources<List<MovieEntity>> actionMovies;

  const HomeState({required this.latestMovies, required this.actionMovies});

  factory HomeState.initial() {
    return HomeState(
      latestMovies: Resources.initial(),
      actionMovies: Resources.initial(),
    );
  }

  @override
  List<Object> get props => [latestMovies, actionMovies];

  HomeState copyWith({
    Resources<List<MovieEntity>>? latestMovies,
    Resources<List<MovieEntity>>? actionMovies,
  }) {
    return HomeState(
      latestMovies: latestMovies ?? this.latestMovies,
      actionMovies: actionMovies ?? this.actionMovies,
    );
  }
}
