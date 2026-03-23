import 'package:flutter/material.dart';
import 'package:flutter_application_new/model/movies_model.dart';

class SimilarMovieCard extends StatelessWidget {
  const SimilarMovieCard({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            movie.mediumCoverImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (c, e, s) => const Icon(Icons.error),
          ),
        ),

        /// Rating
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Text(
                  movie.rating.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.star, color: Colors.yellow, size: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
