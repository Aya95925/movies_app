import 'package:flutter/material.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/movie_card.dart';
import 'package:flutter_application_new/core/utils/app_assets.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/similar_card.dart';

class SimilarMoviesSection extends StatelessWidget {
  SimilarMoviesSection({super.key});

  final List<MovieModel> movies = [
    MovieModel(image: AppAssets.groub13, rating: 7.7),
    MovieModel(image: AppAssets.groub14, rating: 7.7),
    MovieModel(image: AppAssets.groub13, rating: 7.7),
    MovieModel(image: AppAssets.groub14, rating: 7.7),
  ];

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

        /// Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: movies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            return SimilarMovieCard(movie: movies[index]);
          },
        ),
      ],
    );
  }
}
