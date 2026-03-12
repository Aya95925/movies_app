// import 'package:equatable/equatable.dart';

import 'remote_movies.dart';

class RemoteData {
  final int? movieCount;
  final int? limit;
  final int? pageNumber;
  final List<RemoteMovies>? movies;

  const RemoteData({this.movieCount, this.limit, this.pageNumber, this.movies});

  factory RemoteData.fromJson(Map<String, dynamic> json) => RemoteData(
    movieCount: json['movie_count'] as int?,
    limit: json['limit'] as int?,
    pageNumber: json['page_number'] as int?,
    movies: (json['movies'] as List<dynamic>?)
        ?.map((e) => RemoteMovies.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'movie_count': movieCount,
    'limit': limit,
    'page_number': pageNumber,
    'movies': movies?.map((e) => e.toJson()).toList(),
  };
}
