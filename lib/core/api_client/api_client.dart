import 'package:dio/dio.dart';
import 'package:flutter_application_new/feature/movies/data/models/remote_movie_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
@lazySingleton
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET('list_movies.json')
  Future<RemoteMovieResponse> getMovies({
    @Query("genre") String? genre,
    @Query("limit") int? limit,
    @Query("sort_by") String? sortBy,
    @Query("query_term") String? query,
  });

  @GET('movie_details.json')
  Future<RemoteMovieResponse> getMovieDetails({
    @Query("movie_id") required int movieId,
    @Query("with_cast") bool withCast = true,
  });
}
