import 'package:flutter/material.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/cusom_movies_video.dart';
import 'package:flutter_application_new/feature/movies/domain/entities/movie_entity.dart'; // التعديل هنا لـ Entity

class MovieHeader extends StatelessWidget {
  final MovieEntity movie;
  final VoidCallback onBookmarkPressed;

  const MovieHeader({
    super.key,
    required this.movie,
    required this.onBookmarkPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
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
              Colors.black.withOpacity(0.5),
              Colors.black,
            ],
            stops: const [0.4, 0.8, 1.0],
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
            const CustomMoviesVideo(),
            const Spacer(),
            Text(
              movie.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            // Text(
            //   movie.year.toString(),
            //   style: const TextStyle(color: Colors.white70, fontSize: 16),
            // ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
