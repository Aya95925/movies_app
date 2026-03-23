part of 'browse_cubit.dart';

class BrowseState extends Equatable {
  final Resources<List<MovieEntity>> moviesByGenre;
  final String selectedGenre;
  final List<String> genres;

  const BrowseState({
    required this.moviesByGenre,
    required this.selectedGenre,
    required this.genres,
  });

  factory BrowseState.initial() {
    // قائمة التصنيفات
    final List<String> genres = [
      'Action',
      'Comedy',
      'Drama',
      'Horror',
      'Sci-Fi',
      'Romance',
      'Thriller',
      'Animation',
    ];
    return BrowseState(
      moviesByGenre: Resources.initial(),
      selectedGenre: genres.first,
      genres: genres,
    );
  }

  @override
  List<Object> get props => [moviesByGenre, selectedGenre, genres];

  BrowseState copyWith({
    Resources<List<MovieEntity>>? moviesByGenre,
    String? selectedGenre,
    List<String>? genres,
  }) {
    return BrowseState(
      moviesByGenre: moviesByGenre ?? this.moviesByGenre,
      selectedGenre: selectedGenre ?? this.selectedGenre,
      genres: genres ?? this.genres,
    );
  }
}
