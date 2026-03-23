import 'package:equatable/equatable.dart';
import 'package:flutter_application_new/core/utils/resources.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';

class DetailsState extends Equatable {
  final Resources<MovieEntity> movieDetails;
  final Resources<List<MovieEntity>> similarMovies;

  const DetailsState({required this.movieDetails, required this.similarMovies});

  factory DetailsState.initial() {
    return DetailsState(
      movieDetails: Resources.initial(),
      similarMovies: Resources.initial(),
    );
  }

  @override
  List<Object> get props => [movieDetails, similarMovies];

  DetailsState copyWith({
    Resources<MovieEntity>? movieDetails,
    Resources<List<MovieEntity>>? similarMovies,
  }) {
    return DetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      similarMovies: similarMovies ?? this.similarMovies,
    );
  }
}
