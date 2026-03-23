import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_new/core/utils/resources.dart';
import 'package:flutter_application_new/feature/movies/domain/usecase/get_movies_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final GetMoviesUseCase _getMoviesUseCase;
  SearchCubit(this._getMoviesUseCase) : super(SearchState.initial());

  void searchMovies(String query) async {
    if (query.trim().isEmpty) {
      emit(state.copyWith(searchResults: Resources.initial()));
      return;
    }

    emit(state.copyWith(searchResults: Resources.loading()));

    final result = await _getMoviesUseCase(query: query.trim());

    if (result.isSuccess) {
      emit(state.copyWith(searchResults: Resources.success(result.data)));
    } else {
      emit(
        state.copyWith(searchResults: Resources.error(result.error?.message)),
      );
    }
  }
}
