import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/utils/app_routes.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/movie_card.dart';

class MovieGridSection extends StatelessWidget {
  final List<MovieEntity> movies;
  final int crossAxisCount;
  final bool shrinkWrap;

  const MovieGridSection({
    super.key,
    required this.movies,
    this.crossAxisCount = 2,
    this.shrinkWrap = true,
  });

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return const Center(
        child: Text("No Movies Found", style: TextStyle(color: Colors.white)),
      );
    }
    return GridView.builder(
      shrinkWrap: shrinkWrap,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 0.7,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return MovieCard(
          movie: movie,
          onTap: () {
            AppRoutes.navigateToMovieDetails(context, movie.id);
          },
        );
      },
    );
  }
}
