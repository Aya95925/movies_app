import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/core/utils/app_error.dart';
import 'package:flutter_application_new/core/utils/extension/connectivity_extention.dart';
import 'package:flutter_application_new/feature/movies/data/mappers/movie_mapper.dart';
import 'package:flutter_application_new/feature/movies/data/repositories/home_repo/data_source/home_remote_data_source.dart';
import 'package:flutter_application_new/feature/movies/domain/model/movie.dart';
import 'package:flutter_application_new/feature/movies/domain/repositories/home_repo.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final Connectivity _connectivity;
  final MovieMapper _movieMapper;
  HomeRepoImpl(
    this._homeRemoteDataSource,
    this._connectivity,
    this._movieMapper,
  );
  Future<ApiResult<List<Movie>>> getMovies() async {
    if (await _connectivity.isConnected) {
      var apiResult = await _homeRemoteDataSource.getMovies();
      if (apiResult.isSuccess) {
        var response = apiResult.data;

        return SuccessApiResult(_movieMapper.toMovies(response?.data?.movies??[]));
      } else {
        return ErrorApiResult(apiResult.error);
      }
    } else {
      return ErrorApiResult(ServerError());
    }
  }
}
