import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/feature/movies/domain/model/movie.dart';

abstract class HomeRepo {
  Future<ApiResult<List<Movie>>> getMovies();
}
