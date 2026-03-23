import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';
import 'package:flutter_application_new/feature/movies/domain/repository/movies_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMoviesUseCase {
  final MoviesRepo _moviesRepo;
  GetMoviesUseCase(this._moviesRepo);

  Future<ApiResult<List<MovieEntity>>> call({
    String? genre,
    int? limit,
    String? sortBy,
    String? query,
  }) {
    return _moviesRepo.getMovies(
      genre: genre,
      limit: limit,
      sortBy: sortBy,
      query: query,
    );
  }
}
