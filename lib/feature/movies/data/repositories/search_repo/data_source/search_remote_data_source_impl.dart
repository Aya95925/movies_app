import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/core/utils/app_error.dart';
import 'package:flutter_application_new/feature/movies/data/repositories/search_repo/data_source/search_remote_data_source.dart';
import 'package:flutter_application_new/feature/network/api_client/api_client.dart';
import 'package:flutter_application_new/feature/network/models/response/movies/remote_movies_response.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: SearchRemoteDataSource)
class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiClient _apiClient;
  SearchRemoteDataSourceImpl(this._apiClient);
  @override
  Future<ApiResult<RemoteMoviesResponse>> searchMovies(String query) async {
    try {
      var response = await _apiClient.searchMovies(query);
      return SuccessApiResult(response.data);
    } catch (e) {
      return ErrorApiResult(AppError(error: e.toString()));
    }
  }
}
