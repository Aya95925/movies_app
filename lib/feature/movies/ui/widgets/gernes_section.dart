import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';

class GenresSection extends StatelessWidget {
  final List<String> genres;
  const GenresSection({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Genres",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: genres.map((genre) => _genreItem(genre)).toList(),
        ),
      ],
    );
  }

  Widget _genreItem(String genre) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.lightBlack,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        genre,
        style: const TextStyle(color: AppColors.white, fontSize: 14),
      ),
    );
  }
}
