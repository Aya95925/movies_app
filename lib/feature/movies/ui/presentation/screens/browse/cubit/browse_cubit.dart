import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_new/core/utils/resources.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';
import 'package:flutter_application_new/feature/movies/domain/usecase/get_movies_usecase.dart';
import 'package:injectable/injectable.dart';

part 'browse_state.dart';

@injectable
class BrowseCubit extends Cubit<BrowseState> {
  final GetMoviesUseCase _getMoviesUseCase;

  BrowseCubit(this._getMoviesUseCase) : super(BrowseState.initial());

  // دالة لجلب الأفلام عند بدء تشغيل الشاشة
  void loadInitialMovies() {
    loadMoviesByGenre(state.selectedGenre);
  }

  // دالة لجلب الأفلام بناءً على التصنيف المختار
  void loadMoviesByGenre(String genre) async {
    emit(
      state.copyWith(selectedGenre: genre, moviesByGenre: Resources.loading()),
    );

    final result = await _getMoviesUseCase(genre: genre, limit: 20);

    if (result.isSuccess) {
      emit(state.copyWith(moviesByGenre: Resources.success(result.data)));
    } else {
      emit(
        state.copyWith(moviesByGenre: Resources.error(result.error?.message)),
      );
    }
  }
}
