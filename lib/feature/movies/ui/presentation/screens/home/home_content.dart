import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/di/di.dart';
import 'package:flutter_application_new/core/utils/app_assets.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/core/utils/app_routes.dart';
import 'package:flutter_application_new/core/utils/extension/int_extensions.dart';
import 'package:flutter_application_new/core/utils/resources.dart';
import 'package:flutter_application_new/feature/movies/ui/presentation/screens/home/cubit/home_cubit.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/custom_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..loadHomePageMovies(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const _LatestMoviesSlider(),
            _buildSectionHeader('Actions'),
            const _ActionMoviesList(),
            80.verticalSpace(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Row(
            children: [
              Text(
                'See More',
                style: TextStyle(color: AppColors.goldenYellow, fontSize: 16),
              ),
              5.horizontalSpace(),
              Icon(
                Icons.arrow_forward,
                size: 15,
                color: AppColors.goldenYellow,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LatestMoviesSlider extends StatefulWidget {
  const _LatestMoviesSlider();

  @override
  State<_LatestMoviesSlider> createState() => _LatestMoviesSliderState();
}

class _LatestMoviesSliderState extends State<_LatestMoviesSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final movies = state.latestMovies.data ?? [];

        if (state.latestMovies.status == ApiStatus.loading) {
          return const SizedBox(
            height: 600,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (movies.isEmpty) {
          return const SizedBox(
            height: 600,
            child: Center(
              child: Text(
                "No Movies Found",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }

        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: movies.isNotEmpty
                  ? NetworkImage(movies[_currentIndex].largeCoverImage)
                        as ImageProvider
                  : AssetImage(AppAssets.backgroundHome),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.3),
                  AppColors.black,
                ],
                stops: const [0.0, 0.7, 1.0],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.availableNow, height: 100),
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 350,
                    viewportFraction: 0.6,
                    enlargeCenterPage: true,
                    onPageChanged: (index, _) =>
                        setState(() => _currentIndex = index),
                  ),
                  itemCount: movies.length,
                  itemBuilder: (context, index, _) {
                    final movie = movies[index];
                    return InkWell(
                      onTap: () {
                        AppRoutes.navigateToMovieDetails(context, movie.id);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // صورة الفيلم
                            Image.network(
                              movie.largeCoverImage,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                    color: AppColors.lightBlack,
                                    child: const Icon(
                                      Icons.broken_image,
                                      color: AppColors.white,
                                    ),
                                  ),
                            ),
                            // كارد التقييم (نفس تصميم MovieCard الخاص بك)
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      movie.rating.toStringAsFixed(1),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Icon(
                                      Icons.star,
                                      color: AppColors.goldenYellow,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Image.asset(AppAssets.watchNow, height: 130),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ActionMoviesList extends StatelessWidget {
  const _ActionMoviesList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.actionMovies.status == ApiStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return CustomListView(movies: state.actionMovies.data ?? []);
        },
      ),
    );
  }
}
