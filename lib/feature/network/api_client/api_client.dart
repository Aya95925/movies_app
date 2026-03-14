import 'package:dio/dio.dart';
import 'package:flutter_application_new/feature/network/models/response/movies/remote_movies_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

@singleton
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;
  @GET('/api/v2/list_movies.json')
  Future<HttpResponse<RemoteMoviesResponse>> getMovies();
  @GET('/api/v2/list_movies.json')
  Future<HttpResponse<RemoteMoviesResponse>> searchMovies(@Query("query_term") String query,);
}
