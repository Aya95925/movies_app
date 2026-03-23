import 'package:flutter/material.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart';

class ScreenShotsSection extends StatelessWidget {
  final MovieEntity movie;
  const ScreenShotsSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final screens = [
      movie.screenshot1,
      movie.screenshot2,
      movie.screenshot3,
    ].where((url) => url.isNotEmpty).toList();

    if (screens.isEmpty) {
      screens.add(movie.largeCoverImage);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Screen Shots',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 14),
        ...screens
            .map(
              (url) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    url,
                    width: double.infinity,
                    height: 200,
                    cacheHeight: 400,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stack) => Container(
                      height: 100,
                      color: Colors.grey,
                      child: const Icon(
                        Icons.broken_image,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
