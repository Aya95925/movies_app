import 'package:flutter/material.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/widget/custom_movie_bottom.dart';
import 'package:movies_app/ui/widget/movie_details_section.dart';
import 'package:movies_app/ui/widget/movie_header.dart';

class MoviesDetails extends StatelessWidget {
  const MoviesDetails({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieHeader(image: image),
      
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomMovieBottom(
                text: 'Watch',
                color: AppColors.red,
              ),
            ),
      
            const MovieDetailsSection(),
          ],
        ),
      ),
    );
  }
}
