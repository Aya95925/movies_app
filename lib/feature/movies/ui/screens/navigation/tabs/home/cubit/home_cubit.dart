import 'package:flutter_application_new/core/utils/resources.dart';
import 'package:flutter_application_new/feature/movies/domain/usecase/get_movies_use_case.dart';
import 'package:flutter_application_new/feature/movies/ui/screens/navigation/tabs/home/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetMoviesUseCase _getMoviesUseCase;
  HomeCubit(this._getMoviesUseCase) : super(HomeState.initial());
  void loadMovies() async {
    emit(HomeState(moviesApi: Resoueces.isLoading()));
    var apiResult = await _getMoviesUseCase();

    if (apiResult.isSuccess) {
      emit(HomeState(moviesApi: Resoueces.isSuccess(apiResult.data)));
    } else {
      emit(
        HomeState(moviesApi: Resoueces.iserror(apiResult.error?.error ?? '')),
      );
    }
  }
}
