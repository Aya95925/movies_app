import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/core/utils/app_error.dart';
import 'package:flutter_application_new/core/utils/extension/connectivity_extension.dart';
import 'package:flutter_application_new/feature/movies/data/datasource/movies_remote_datasource.dart';
import 'package:flutter_application_new/feature/movies/data/mappers/movie_mapper.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';
import 'package:flutter_application_new/feature/movies/domain/repository/movies_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MoviesRepo)
class MoviesRepoImpl implements MoviesRepo {
  final MoviesRemoteDataSource _dataSource;
  final MovieMapper _mapper;
  final Connectivity _connectivity;

  MoviesRepoImpl(this._dataSource, this._mapper, this._connectivity);

  @override
  Future<ApiResult<MovieEntity>> getMovieDetails(int movieId) async {
    if (!await _connectivity.isConnected) return ErrorApiResult(NetworkError());
    try {
      final response = await _dataSource.getMovieDetails(movieId);
      if (response.data?.movie != null) {
        final movieEntity = _mapper.fromRemote(response.data!.movie!);
        return SuccessApiResult(movieEntity);
      }
      return ErrorApiResult(UnknownError(message: 'Movie not found'));
    } catch (e) {
      return ErrorApiResult(ServerError(message: e.toString()));
    }
  }

  @override
  Future<ApiResult<List<MovieEntity>>> getMovies({
    String? genre,
    int? limit,
    String? sortBy,
    String? query,
  }) async {
    if (!await _connectivity.isConnected) return ErrorApiResult(NetworkError());
    try {
      final response = await _dataSource.getMovies(
        genre: genre,
        limit: limit,
        sortBy: sortBy,
        query: query,
      );
      if (response.data?.movies != null) {
        final movieEntities = _mapper.listFromRemote(response.data!.movies!);
        return SuccessApiResult(movieEntities);
      }
      return SuccessApiResult([]);
    } catch (e) {
      return ErrorApiResult(ServerError(message: e.toString()));
    }
  }

  @override
  Stream<ApiResult<List<MovieEntity>>> getMoviesFromFirestore(
    String collectionName,
  ) {
    try {
      return _dataSource.getMoviesFromFirestore(collectionName).map((docs) {
        // الآن MovieEntity.fromJson ستعمل بدون مشاكل
        final movies = docs.map((doc) => MovieEntity.fromJson(doc)).toList();
        return SuccessApiResult(movies);
      });
    } catch (e) {
      return Stream.value(ErrorApiResult(UnknownError(message: e.toString())));
    }
  }

  @override
  Future<ApiResult<void>> saveMovieToFirestore(
    MovieEntity movie,
    String collectionName,
  ) async {
    try {
      await _dataSource.saveMovieToFirestore(movie, collectionName);
      return SuccessApiResult(null);
    } catch (e) {
      return ErrorApiResult(UnknownError(message: e.toString()));
    }
  }

  @override
  Future<ApiResult<Map<String, int>>> getUserProfileStats() async {
    try {
      final stats = await _dataSource.getUserProfileStats();
      return SuccessApiResult(stats);
    } catch (e) {
      return ErrorApiResult(UnknownError(message: e.toString()));
    }
  }
}
