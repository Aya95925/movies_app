import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_new/core/utils/resources.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';
import 'package:flutter_application_new/feature/movies/domain/usecase/get_movies_usecase.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetMoviesUseCase _getMoviesUseCase;

  HomeCubit(this._getMoviesUseCase) : super(HomeState.initial());

  void loadHomePageMovies() async {
    emit(
      state.copyWith(
        latestMovies: Resources.loading(),
        actionMovies: Resources.loading(),
      ),
    );

    // جلب أفلام السلايدر (الأحدث)
    final latestResult = await _getMoviesUseCase(sortBy: 'year', limit: 10);
    if (latestResult.isSuccess) {
      emit(state.copyWith(latestMovies: Resources.success(latestResult.data)));
    } else {
      emit(
        state.copyWith(
          latestMovies: Resources.error(latestResult.error?.message),
        ),
      );
    }

    // جلب أفلام الأكشن
    final actionResult = await _getMoviesUseCase(genre: 'Action', limit: 10);
    if (actionResult.isSuccess) {
      emit(state.copyWith(actionMovies: Resources.success(actionResult.data)));
    } else {
      emit(
        state.copyWith(
          actionMovies: Resources.error(actionResult.error?.message),
        ),
      );
    }
  }
}
