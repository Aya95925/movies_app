import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';
import 'package:flutter_application_new/feature/movies/domain/repository/movies_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveMovieToFirestoreUseCase {
  final MoviesRepo _moviesRepo;
  SaveMovieToFirestoreUseCase(this._moviesRepo);

  Future<ApiResult<void>> call(MovieEntity movie, String collectionName) {
    return _moviesRepo.saveMovieToFirestore(movie, collectionName);
  }
}
