import 'package:flutter/material.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/movie_card.dart';
import 'package:flutter_application_new/feature/auth/ui/widgets/movie_card.dart';

class HistoryMovieSection extends StatelessWidget {
  final List<MovieModel> movies;

  const HistoryMovieSection({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieCard(movie: movies[index]);
      },
    );
  }
}
