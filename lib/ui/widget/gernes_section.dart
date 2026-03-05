import 'package:flutter/material.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/utils/app_style.dart';

class GenresSection extends StatelessWidget {
  const GenresSection({super.key});

  final List<String> genres = const [
    "Action",
    "Sci-Fi",
    "Adventure",
    "Fantasy",
    "Horror",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        const Text(
          "Genres",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 20),

        /// Chips List
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: genres.map((genre) => _genreItem(genre)).toList(),
        ),
      ],
    );
  }

  /// Genre Chip Design
  Widget _genreItem(String genre) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.lightBlack,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(genre, style: AppStyle.white20Regular),
    );
  }
}
