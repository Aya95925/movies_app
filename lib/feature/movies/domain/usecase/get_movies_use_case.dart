
import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/feature/movies/domain/model/movie.dart';
import 'package:flutter_application_new/feature/movies/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMoviesUseCase {
  final HomeRepo _homeRepo;
  GetMoviesUseCase(this._homeRepo);
 Future<ApiResult<List<Movie>>> call() => _homeRepo.getMovies();
}
