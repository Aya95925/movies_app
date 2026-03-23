// 1. Add To Watchlist UseCase
import 'package:flutter_application_new/core/utils/api_result.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';
import 'package:flutter_application_new/feature/movies/domain/usecase/save_movie_to_firestore_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToWatchlistUseCase {
  final SaveMovieToFirestoreUseCase _saveMovieUseCase;
  AddToWatchlistUseCase(this._saveMovieUseCase);

  Future<ApiResult<void>> call(MovieEntity movie) {
    return _saveMovieUseCase(movie, 'watchlist');
  }
}

// 2. Add To History UseCase
@injectable
class AddToHistoryUseCase {
  final SaveMovieToFirestoreUseCase _saveMovieUseCase;
  AddToHistoryUseCase(this._saveMovieUseCase);

  Future<ApiResult<void>> call(MovieEntity movie) {
    return _saveMovieUseCase(movie, 'history');
  }
}
