import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/feature/movies/domain/model/movie.dart';

abstract class SearchRepo {
  Future<ApiResult<List<Movie>>>searchMovies(String query);
}