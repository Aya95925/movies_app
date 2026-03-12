import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/feature/network/models/response/movies/remote_movies_response.dart';

abstract class HomeRemoteDataSource {
  Future<ApiResult<RemoteMoviesResponse>> getMovies();
}
