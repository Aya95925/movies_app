import 'package:flutter_application_new/feature/watchlist/data/repository/watchlist_repo_impl.dart';
import 'package:flutter_application_new/model/movies_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

abstract class WatchlistState {}

class WatchlistInitial extends WatchlistState {}

class WatchlistLoading extends WatchlistState {}

class WatchlistSuccess extends WatchlistState {
  final List<Movie> movies;
  WatchlistSuccess(this.movies);
}

class WatchlistError extends WatchlistState {
  final String message;
  WatchlistError(this.message);
}

@injectable
class WatchlistCubit extends Cubit<WatchlistState> {
  final WatchlistRepo _watchlistRepo;
  WatchlistCubit(this._watchlistRepo) : super(WatchlistInitial());

  void fetchWatchlist() async {
    emit(WatchlistLoading());
    try {
      final movies = await _watchlistRepo.getWatchlist();
      emit(WatchlistSuccess(movies));
    } catch (e) {
      emit(WatchlistError("Failed to fetch list"));
    }
  }

  void toggleWatchlist(Movie movie, bool isCurrentlyFavorite) async {
    try {
      if (isCurrentlyFavorite) {
        await _watchlistRepo.removeFromWatchlist(movie.id);
      } else {
        await _watchlistRepo.addToWatchlist(movie);
      }
    } catch (e) {
      emit(WatchlistError("Operation failed"));
    }
  }
}
