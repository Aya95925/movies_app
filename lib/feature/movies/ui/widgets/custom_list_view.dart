import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/utils/app_routes.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/movie_card.dart';

class CustomListView extends StatelessWidget {
  final List<MovieEntity> movies;
  const CustomListView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: MovieCard(
              movie: movie,
              width: MediaQuery.of(context).size.width * .4,
              onTap: () {
                AppRoutes.navigateToMovieDetails(context, movie.id);
              },
            ),
          );
        },
      ),
    );
  }
}
