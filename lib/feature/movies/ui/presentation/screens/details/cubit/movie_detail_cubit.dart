import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/utils/resources.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';
import 'package:flutter_application_new/feature/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:flutter_application_new/feature/movies/domain/usecase/get_movies_usecase.dart';
import 'package:flutter_application_new/feature/movies/domain/usecase/save_movie_to_firestore_usecase.dart';
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/details/cubit/details_state.dart';
import 'package:injectable/injectable.dart';

import 'package:url_launcher/url_launcher.dart';

@injectable
class DetailsCubit extends Cubit<DetailsState> {
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;
  final GetMoviesUseCase _getMoviesUseCase;
  final SaveMovieToFirestoreUseCase _saveMovieToFirestoreUseCase;

  DetailsCubit(
    this._getMovieDetailsUseCase,
    this._getMoviesUseCase,
    this._saveMovieToFirestoreUseCase,
  ) : super(DetailsState.initial());

  void loadMovieDetails(int movieId) async {
    emit(state.copyWith(movieDetails: Resources.loading()));
    final result = await _getMovieDetailsUseCase(movieId);

    if (result.isSuccess && result.data != null) {
      final movie = result.data!;
      emit(state.copyWith(movieDetails: Resources.success(movie)));
      loadSimilarMovies(
        movie.genres.isNotEmpty ? movie.genres.first : 'action',
      );
    } else {
      emit(
        state.copyWith(movieDetails: Resources.error(result.error?.message)),
      );
    }
  }

  // دالة المشاهدة: تفتح المتصفح وتسجل في الـ History
  Future<void> watchMovie(MovieEntity movie) async {
    if (movie.url.isEmpty) {
      return;
    }

    final Uri url = Uri.parse(movie.url);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
        // الحفظ في السجل (History)
        await _saveMovieToFirestoreUseCase(movie, 'history');
      } else {
        throw 'Could not launch ${movie.url}';
      }
    } catch (e) {
      debugPrint("Error launching URL: $e");
    }
  }

  Future<String> saveMovieToWatchlist() async {
    if (state.movieDetails.data != null) {
      final result = await _saveMovieToFirestoreUseCase(
        state.movieDetails.data!,
        'watchlist',
      );
      return result.isSuccess
          ? "Added to Watchlist!"
          : (result.error?.message ?? "Failed");
    }
    return "Data not ready";
  }

  void loadSimilarMovies(String? genre) async {
    emit(state.copyWith(similarMovies: Resources.loading()));
    final result = await _getMoviesUseCase(genre: genre ?? 'action', limit: 4);
    if (result.isSuccess) {
      emit(state.copyWith(similarMovies: Resources.success(result.data)));
    } else {
      emit(
        state.copyWith(similarMovies: Resources.error(result.error?.message)),
      );
    }
  }
}
