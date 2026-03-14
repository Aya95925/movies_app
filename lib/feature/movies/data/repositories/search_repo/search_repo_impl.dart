import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/core/utils/app_error.dart';
import 'package:flutter_application_new/core/utils/extension/connectivity_extention.dart';
import 'package:flutter_application_new/feature/movies/data/mappers/movie_mapper.dart';
import 'package:flutter_application_new/feature/movies/data/repositories/search_repo/data_source/search_remote_data_source.dart';
import 'package:flutter_application_new/feature/movies/domain/model/movie.dart';
import 'package:flutter_application_new/feature/movies/domain/repositories/search_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SearchRepo)
class SearchRepoImpl implements SearchRepo {
  final Connectivity _connectivity;
  final SearchRemoteDataSource _searchRemoteDataSource;
  final MovieMapper _movieMapper;

  SearchRepoImpl(
    this._connectivity,
    this._searchRemoteDataSource,
    this._movieMapper,
  );

  @override
  Future<ApiResult<List<Movie>>> searchMovies(String query) async {

    if (await _connectivity.isConnected) {

      var apiResult = await _searchRemoteDataSource.searchMovies(query);

      if (apiResult.isSuccess) {

        var response = apiResult.data;

        return SuccessApiResult(
          _movieMapper.toMovies(
            response?.data?.movies ?? [],
          ),
        );

      } else {

        return ErrorApiResult(apiResult.error);

      }

    } else {

      return ErrorApiResult(ServerError());
    }
  }
}
