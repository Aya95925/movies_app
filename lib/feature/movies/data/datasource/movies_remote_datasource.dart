import 'package:flutter_application_new/feature/movies/data/models/remote_movie_response.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';

abstract class MoviesRemoteDataSource {
  // API
  Future<RemoteMovieResponse> getMovies({
    String? genre,
    int? limit,
    String? sortBy,
    String? query,
  });
  Future<RemoteMovieResponse> getMovieDetails(int movieId);

  // Firestore
  Future<void> saveMovieToFirestore(MovieEntity movie, String collectionName);
  Stream<List<Map<String, dynamic>>> getMoviesFromFirestore(
    String collectionName,
  );
  Future<Map<String, int>> getUserProfileStats();
}
