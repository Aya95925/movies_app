import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/di/di.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/core/utils/resources.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/details/cubit/details_state.dart';
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/details/cubit/movie_detail_cubit.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/cast_section.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/cusom_movies_video.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/custom_movie_bottom.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/gernes_section.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/movie_grid_section.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/movie_status_row.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/summary_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesDetails extends StatelessWidget {
  final int movieId;
  const MoviesDetails({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DetailsCubit>()..loadMovieDetails(movieId),
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: BlocBuilder<DetailsCubit, DetailsState>(
          builder: (context, state) {
            final status = state.movieDetails.status;

            if (status == ApiStatus.loading || status == ApiStatus.initial) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.goldenYellow),
              );
            }

            if (status == ApiStatus.error || state.movieDetails.data == null) {
              return Center(
                child: Text(
                  state.movieDetails.errorMessage ?? "Error loading movie",
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }

            final movie = state.movieDetails.data!;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. الجزء العلوي (صورة الغطاء والعنوان)
                  _MovieHeader(
                    movie: movie,
                    onBookmarkPressed: () async {
                      final message = await context
                          .read<DetailsCubit>()
                          .saveMovieToWatchlist();
                      if (context.mounted) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(message)));
                      }
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),

                        // 2. زر المشاهدة (يفتح المتصفح ويسجل في الـ History)
                        GestureDetector(
                          onTap: () =>
                              context.read<DetailsCubit>().watchMovie(movie),
                          child: const CustomMovieBottom(
                            text: 'Watch',
                            color: AppColors.red,
                          ),
                        ),

                        // 3. صف الإحصائيات (Rating, Runtime, Likes)
                        MovieStatsRow(movie: movie),

                        // 4. بقية الأقسام (Similar, Summary, Cast, Genres)
                        _MovieDetailsSection(movie: movie),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _MovieHeader extends StatelessWidget {
  final MovieEntity movie;
  final VoidCallback onBookmarkPressed;

  const _MovieHeader({required this.movie, required this.onBookmarkPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(movie.largeCoverImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.7),
              Colors.black,
            ],
            stops: const [0.4, 0.85, 1.0],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    onPressed: onBookmarkPressed,
                    icon: const Icon(
                      Icons.bookmark,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Center(child: CustomMoviesVideo()),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                movie.title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              movie.year.toString(),
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _MovieDetailsSection extends StatelessWidget {
  final MovieEntity movie;
  const _MovieDetailsSection({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ScreenShotsSection(movie: movie,),
        const _SimilarMoviesSection(),
        const SizedBox(height: 25),

        const SizedBox(height: 25),
        SummarySection(summary: movie.summary),
        const SizedBox(height: 25),
        if (movie.cast != null && movie.cast!.isNotEmpty)
          CastSection(castList: movie.cast!),
        const SizedBox(height: 25),
        GenresSection(genres: movie.genres),
        const SizedBox(height: 30),
      ],
    );
  }
}

class _SimilarMoviesSection extends StatelessWidget {
  const _SimilarMoviesSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Similar",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        BlocBuilder<DetailsCubit, DetailsState>(
          builder: (context, state) {
            final status = state.similarMovies.status;
            if (status == ApiStatus.loading || status == ApiStatus.initial) {
              return const SizedBox(
                height: 150,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.goldenYellow,
                  ),
                ),
              );
            }
            if (status == ApiStatus.error ||
                state.similarMovies.data == null ||
                state.similarMovies.data!.isEmpty) {
              return const Text(
                "No similar movies",
                style: TextStyle(color: Colors.white54),
              );
            }
            return MovieGridSection(movies: state.similarMovies.data!);
          },
        ),
      ],
    );
  }
}
