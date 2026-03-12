import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/core/utils/app_error.dart';
import 'package:flutter_application_new/feature/movies/data/repositories/home_repo/data_source/home_remote_data_source.dart';
import 'package:flutter_application_new/feature/network/api_client/api_client.dart';
import 'package:flutter_application_new/feature/network/models/response/movies/remote_movies_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiClient _apiClient;

  HomeRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<RemoteMoviesResponse>> getMovies() async {
    try {
      var response = await _apiClient.getMovies();

      // var movies = response.data.data?.movies ?? [];

      return SuccessApiResult(response.data);
    } catch (e) {
      return ErrorApiResult(AppError(error: e.toString()));
    }
  }
}
