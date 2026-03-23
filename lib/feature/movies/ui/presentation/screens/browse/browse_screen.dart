import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/di/di.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/core/utils/resources.dart';
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/browse/cubit/browse_cubit.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/movie_grid_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BrowseCubit>()..loadInitialMovies(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.black,

          body: Column(
            children: [
              const _GenreSelector(),
              Expanded(
                child: BlocBuilder<BrowseCubit, BrowseState>(
                  builder: (context, state) {
                    final status = state.moviesByGenre.status;
                    if (status == ApiStatus.loading ||
                        status == ApiStatus.initial) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.goldenYellow,
                        ),
                      );
                    }
                    if (status == ApiStatus.error ||
                        state.moviesByGenre.data == null) {
                      return Center(
                        child: Text(
                          state.moviesByGenre.errorMessage ??
                              "Failed to load movies",
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    if (state.moviesByGenre.data!.isEmpty) {
                      return const Center(
                        child: Text(
                          "No movies found for this genre.",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    return MovieGridSection(movies: state.moviesByGenre.data!);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GenreSelector extends StatelessWidget {
  const _GenreSelector();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowseCubit, BrowseState>(
      // إعادة البناء فقط عند تغير قائمة التصنيفات أو التصنيف المختار
      buildWhen: (previous, current) =>
          previous.selectedGenre != current.selectedGenre,
      builder: (context, state) {
        return SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            itemCount: state.genres.length,
            itemBuilder: (ctx, index) {
              final genre = state.genres[index];
              final isSelected = genre == state.selectedGenre;

              return GestureDetector(
                onTap: () {
                  // استدعاء الدالة في الـ Cubit لتغيير التصنيف
                  context.read<BrowseCubit>().loadMoviesByGenre(genre);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.goldenYellow
                        : AppColors.black,
                    borderRadius: BorderRadius.circular(12),
                    border: isSelected
                        ? null
                        : Border.all(color: AppColors.goldenYellow, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      genre,
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.black
                            : AppColors.goldenYellow,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
