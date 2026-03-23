import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';
import 'package:flutter_application_new/feature/movies/domain/repository/movies_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMovieDetailsUseCase {
  final MoviesRepo _moviesRepo;
  GetMovieDetailsUseCase(this._moviesRepo);

  Future<ApiResult<MovieEntity>> call(int movieId) {
    return _moviesRepo.getMovieDetails(movieId);
  }
}
