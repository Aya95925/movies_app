import 'package:flutter/material.dart';
import 'package:flutter_application_new/core/utils/app_colors.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/custom_movie_bottom.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/movie_details_section.dart';
import 'package:flutter_application_new/feature/movies/ui/widgets/movie_header.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key, required this.image});
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
              child: CustomMovieBottom(text: 'Watch', color: AppColors.red),
            ),

            const MovieDetailsSection(),
          ],
        ),
      ),
    );
  }
}
