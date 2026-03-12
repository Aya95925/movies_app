import 'package:flutter_application_new/core/utils/resources.dart';
import 'package:flutter_application_new/feature/movies/domain/model/movie.dart';

class HomeState {
  late Resoueces<List<Movie>> moviesApi;

  HomeState({required this.moviesApi});

  HomeState.initial() {
    moviesApi = Resoueces.initial();
  }
}
