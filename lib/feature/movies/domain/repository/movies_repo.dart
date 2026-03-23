import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';

abstract class MoviesRepo {
  // From API
  Future<ApiResult<List<MovieEntity>>> getMovies({
    String? genre,
    int? limit,
    String? sortBy,
    String? query,
  });

  Future<ApiResult<MovieEntity>> getMovieDetails(int movieId);

  // From Firebase
  Future<ApiResult<void>> saveMovieToFirestore(
    MovieEntity movie,
    String collectionName,
  );
  Stream<ApiResult<List<MovieEntity>>> getMoviesFromFirestore(
    String collectionName,
  );
  Future<ApiResult<Map<String, int>>> getUserProfileStats();
}
