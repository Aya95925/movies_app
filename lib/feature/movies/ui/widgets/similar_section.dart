import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/core/utils/resources.dart';
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/details/cubit/details_state.dart';
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/details/cubit/movie_detail_cubit.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/movie_grid_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),

        BlocBuilder<DetailsCubit, DetailsState>(
          buildWhen: (previous, current) =>
              previous.similarMovies != current.similarMovies,
          builder: (context, state) {
            final similarMoviesStatus = state.similarMovies.status;
            final similarMoviesData = state.similarMovies.data;
            final similarMoviesError = state.similarMovies.errorMessage;

            switch (similarMoviesStatus) {
              case ApiStatus.loading:
              case ApiStatus.initial:
                return const SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.goldenYellow,
                    ),
                  ),
                );

              case ApiStatus.error:
                return SizedBox(
                  height: 200,
                  child: Center(
                    child: Text(
                      similarMoviesError ?? "Failed to load movies",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );

              case ApiStatus.success:
                if (similarMoviesData == null || similarMoviesData.isEmpty) {
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: Text(
                        "No similar movies found",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }
                return MovieGridSection(movies: similarMoviesData);
            }
          },
        ),
      ],
    );
  }
}
