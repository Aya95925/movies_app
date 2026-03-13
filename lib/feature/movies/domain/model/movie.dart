// Movie.dart
import 'package:flutter_application_new/feature/network/models/response/movies/remote_movies.dart';

class Movie {
  final String? id;
  final String? title;
  final int? year;
  final double? rating;
  final String? image;
  final List<String>? genres;
  final String? summary;
  final String? backgroundImage;

  const Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.image,
    required this.genres,
    required this.summary, this.backgroundImage,
  });

  factory Movie.fromRemote(RemoteMovies remote) {
    return Movie(
      id: remote.id,
      title: remote.title,
      year: remote.year,
      rating: remote.rating,
      image: remote.mediumCoverImage,
      genres: remote.genres,
      summary: remote.summary,
      backgroundImage: remote.backgroundImage
    );
  }
}
