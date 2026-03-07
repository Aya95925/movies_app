import 'package:flutter/material.dart';
import 'package:flutter_application_new/ui/screens/navigation/tabs/moveis/movies_details/movie_card.dart';
import 'package:flutter_application_new/ui/utils/app_colors.dart';

class HistoryMovieCard extends StatelessWidget {
  final MovieModel movie;

  const HistoryMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          // صورة الفيلم
          Image.asset(
            movie.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // التقييم
          Positioned(
            top: 5,
            left: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xCC121312),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    movie.rating.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.star,
                    color: AppColors.goldenYellow,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
