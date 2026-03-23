import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';
import 'package:flutter_application_new/feature/movies/domain/repository/movies_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMoviesFromFirestoreUseCase {
  final MoviesRepo _moviesRepo;
  GetMoviesFromFirestoreUseCase(this._moviesRepo);

  Stream<ApiResult<List<MovieEntity>>> call(String collectionName) {
    return _moviesRepo.getMoviesFromFirestore(collectionName);
  }
}
